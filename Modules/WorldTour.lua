local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class WorldTour
local WorldTour = AddOn.WorldTour

---@param type "Mount"|"Toy"|"Pet"|"Decor"
---@return boolean
function WorldTour.IsTypeInScope(type)
    local scope = AddOn.db.global.worldTour.scope
    if scope.mode == "specific" then
        -- TODO: Implement route for tracking specific collectibles
    end
    return scope.types[type] == true
end

---@param instanceID number
---@return ICHHelperItem[]
function WorldTour:GetInScopeCollectiblesForInstance(instanceID)
    local filtered = {}
    for _, entry in ipairs(AddOn.GetCollectiblesForInstance(instanceID)) do
        if self.IsTypeInScope(entry.Type) then
            tinsert(filtered, entry)
        end
    end
    return filtered
end

---@param instanceID number
---@return boolean
function WorldTour:CanLootSomethingFromInstance(instanceID)
    for _, entry in ipairs(self:GetInScopeCollectiblesForInstance(instanceID)) do
        if not entry.Owned and entry.CanBeLooted then return true end
    end
    return false
end

---@param instanceIDs number[]
---@return boolean
function WorldTour:CanLootSomethingFromInstances(instanceIDs)
    for _, instanceID in ipairs(instanceIDs) do
        if self:CanLootSomethingFromInstance(instanceID) then return true end
    end
    return false
end

---@return WorldTourStep? step
---@return number? index
function WorldTour:GetCurrentStep()
    ---@type number?
    local index = AddOn.db.global.worldTour.currentStep
    return index and self.Route[index], index
end

---@return number? displayIndex
---@return number? displayTotal
function WorldTour:GetProgress()
    local _, index = self:GetCurrentStep()
    if not index then return nil, nil end

    local displayIndex, displayTotal = 0, 0
    for i, step in ipairs(self.Route) do
        if i == index or not self:IsStepCompleted(step, i) then
            displayTotal = displayTotal + 1
            if i <= index then displayIndex = displayTotal end
        end
    end
    return displayIndex, displayTotal
end

---@param step WorldTourStep
---@param index number
---@return boolean
function WorldTour:IsStepCompleted(step, index)
    local isInitialCapitalCityStep = tContains(self.factionCapitalMapIDs, step.DestinationID) and step.RelatedInstances and #step.RelatedInstances == 0
    if isInitialCapitalCityStep then
        -- Informative step, not a navigation target
        -- Never filter from steps list and never auto-skip (once functionality is implemented)
        return false
    end
    if step.InstanceID then
        return not self:CanLootSomethingFromInstance(step.InstanceID)
    end

    local mapID = C_Map.GetBestMapForUnit("player")
    local onDestinationMap
    if type(step.DestinationID) == "table" then
        onDestinationMap = tContains(step.DestinationID, mapID)
    else
        onDestinationMap = mapID == step.DestinationID
    end
    if not onDestinationMap then return false end

    for i = 1, index - 1 do
        if not self:IsStepCompleted(self.Route[i], i) then return false end
    end
    return true
end

---@param index number
function WorldTour:SetStep(index)
    local numSteps = #self.Route
    local newIndex = ((index - 1) % numSteps) + 1
    AddOn.db.global.worldTour.currentStep = newIndex
    AddOn:SetWorldTourMapPin()
    self:RefreshWindowIfShown()
end

---@param index number
---@param delta -1|1 Indicates which direction to step in (-1 for backward, 1 for forwards)
function WorldTour:StepInDirection(index, delta)
    local numSteps = #self.Route
    local nextStepIndex = index
    for _ = 1, numSteps do
        nextStepIndex = ((nextStepIndex - 1 + delta) % numSteps) + 1
        if not self:IsStepCompleted(self.Route[nextStepIndex], nextStepIndex) then
            self:SetStep(nextStepIndex)
            return
        end
    end
    self:SetStep(((index - 1 + delta) % numSteps) + 1)
end

function WorldTour:Next()
    local _, index = self:GetCurrentStep()
    self:StepInDirection(index or 1, 1)
end

function WorldTour:Prev()
    local _, index = self:GetCurrentStep()
    self:StepInDirection(index or 1, -1)
end

function WorldTour:Start()
    AddOn.db.global.worldTour.active = true
    self:Reset()
    AddOn:SetWorldTourMapPin()
    if ICHWorldTour then ICHWorldTour:Show() end
end

---Rebuilds `self.Route` and resets the current step back to its first entry.
function WorldTour:Reset()
    self:BuildRoute(false)
    self:RefreshWindowIfShown()
end

function WorldTour:Stop()
    AddOn.db.global.worldTour.active = false
    self:Reset()
end

function WorldTour:RefreshWindowIfShown()
    if ICHWorldTour and ICHWorldTour:IsShown() then
        ICHWorldTour:RefreshContents()
    end
end
