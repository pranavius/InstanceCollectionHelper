local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHInstanceHelper
ICHInstanceHelperMixin = {}

function ICHInstanceHelperMixin:OnLoad()
    print("Instance Helper Loaded")
    AddOn:RegisterEvent("PLAYER_ENTERING_WORLD", function()
        DevTools_Dump({ GetInstanceInfo() })
        local instanceName, instanceType, difficultyID = GetInstanceInfo()
        -- print("PLAYER_ENTERING_WORLD:", instanceName, instanceType, difficultyID)
        if instanceType == "party" or instanceType == "raid" then
            self.InstanceName:SetText(instanceName.." ("..difficultyID..")")
        end
    end)
end

function ICHInstanceHelperMixin:OnDragStart()
    self:StartMoving()
end

function ICHInstanceHelperMixin:OnDragStop()
    self:StopMovingOrSizing()
end