local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem
---@return boolean `true` if conditions to use TomTom waypoints are satisfied, `false` otherwise
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
local function ShouldUseTomTom(data)
    return C_AddOns.IsAddOnLoaded("TomTom")
        and AddOn.db.global.useTomTomPoints
        and (data.Waypoint or data.InstanceID == 1176)
end

---Sets and tracks navigation to a map marker at the coordinates or Area POI associated with an instance entrance
---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem
---@return boolean `true` if a map pin was successfully placed, `false` otherwise
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
---@see WowRemixItem
local function SetBlizzardMapPin(data)
    -- Clear any previously supertracked pins and waypoints
    C_SuperTrack.ClearSuperTrackedMapPin()
    C_SuperTrack.SetSuperTrackedUserWaypoint(false)
    C_Map.ClearUserWaypoint()
    
    local faction = UnitFactionGroup("player")
    -- Special case for BoD (separate entrances based on faction)
    if data.InstanceID == 1176 then
        C_SuperTrack.SetSuperTrackedMapPin(0, faction == "Horde" and 6012 or 6013)
        return true
    -- elseif data.InstanceID == 1194 then
    --     -- Special case for Tazavesh (AreaPoiID is a flight path from Oribos)
    --     C_SuperTrack.SetSuperTrackedMapPin(2, data.AreaPoiID)
    --     return true
    -- Special cases for Timewalking vendors for Classic, Cata, and WoD (different vendors based on faction)
    elseif data.Expansion == "Classic" then
        C_SuperTrack.SetSuperTrackedMapPin(0, faction == "Horde" and 8191 or 8190)
        return true
    elseif data.Expansion == "Cataclysm" then
        C_SuperTrack.SetSuperTrackedMapPin(0, faction == "Horde" and 6983 or 6984)
        return true
    elseif data.Expansion == "Warlords of Draenor" then
        C_SuperTrack.SetSuperTrackedMapPin(0, faction == "Horde" and 6985 or 6986)
        return true
    elseif data.AreaPoiID then
        C_SuperTrack.SetSuperTrackedMapPin(0, data.AreaPoiID)
        return true
    elseif data.Waypoint then
        C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(data.Waypoint.mapID, data.Waypoint.x, data.Waypoint.y))
        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        return true
    end
    return false
end

---Sets a TomTom waypoint at the coordinates associated with an instance entrance
---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem
---@param destinationName string The localized name of the destination to set a waypoint for
---@return boolean `true` if a TomTom waypoint was successfully created, `false` otherwise
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
---@see WowRemixItem
local function SetTomTomWaypoint(data, destinationName)
    if AddOn.db.global.currentTomTomWaypoint then
        TomTom:RemoveWaypoint(AddOn.db.global.currentTomTomWaypoint)
        AddOn.db.global.currentTomTomWaypoint = nil
    end
    local ttOptions = {
        title = destinationName,
        from = name,
        crazy = true,
        silent = true
    }
    -- Special case for BoD (separate entrances based on faction)
    if data.InstanceID == 1176 then
        local faction = UnitFactionGroup("player")
        if faction == "Horde" then AddOn.db.global.currentTomTomWaypoint = TomTom:AddWaypoint(862, 0.543, 0.299, ttOptions)
        else AddOn.db.global.currentTomTomWaypoint = TomTom:AddWaypoint(1161, 0.704, .356, ttOptions) end
        return true
    -- elseif data.InstanceID == 1194 then
    --     -- Change the name of the TomTom waypoint when set for Tazavesh
    --     ttOptions.title = "Oribos -> "..destinationName
    end
    if data.Waypoint then
        AddOn.db.global.currentTomTomWaypoint = TomTom:AddWaypoint(data.Waypoint.mapID, data.Waypoint.x, data.Waypoint.y, ttOptions)
        return true
    end

    return false
end

---Handles how waypoints should be set using either Blizzard's super tracking or TomTom
---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem
---@param destinationName string The localized name of the destination to set a waypoint for
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
---@see WowRemixItem
local function HandleWaypointClick(data, destinationName)
    local isPinSet = false
    if ShouldUseTomTom(data) then
        isPinSet = SetTomTomWaypoint(data, destinationName)
        AddOn:PrintChatMessage(isPinSet and L["TomTom waypoint set for"] or L["Unable to set TomTom waypoint for"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(destinationName))
    elseif data.AreaPoiID or data.InstanceID == 1176 or data.Expansion then
        isPinSet = SetBlizzardMapPin(data)
        AddOn:PrintChatMessage(isPinSet and L["Map pin set for"] or L["Unable to set map pin for"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(destinationName))
    end
end

---Sets up and displays the appropriate waypoint button based on user preferences and **TomTom** being enabled or not
---@param destinationName string The name of the destination to set a waypoint for, such as an NPC or an instance
---@param frame ICHListItem|ICHLemixListItem
---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem|DecorItem
---@see ICHListItem
---@see ICHLemixListItem
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
---@see WowRemixItem
---@see DecorItem
function AddOn:ConfigureWaypointButton(destinationName, frame, data)
    -- if data.InstanceID == 1176 or data.InstanceID == 1194 or data.AreaPoiID or data.Waypoint then
    if data.InstanceID == 1176 or data.Expansion or data.AreaPoiID or data.Waypoint then
        local isPinSettable = false
        if ShouldUseTomTom(data) then
            frame.OtherInfoContainer.ICHWaypointButton:SetNormalTexture("Interface/AddOns/TomTom/Images/GoldGreenDotNew")
            frame.OtherInfoContainer.ICHWaypointButton:SetHighlightTexture("Interface/AddOns/TomTom/Images/GoldPurpleDotNew")
            frame.OtherInfoContainer.ICHWaypointButton:SetSize(15, 15)
            frame.OtherInfoContainer.ICHWaypointButton:SetPoint("RIGHT", -2, 0)
            isPinSettable = true
        -- Currently excluding BfA from the condition due to vendors not having an AreaPoiID
        elseif data.AreaPoiID or (data.Expansion and data.Expansion ~= "Battle for Azeroth") or data.InstanceID == 1176 then
            frame.OtherInfoContainer.ICHWaypointButton:SetNormalTexture("Interface/Minimap/Minimap-Waypoint-MapPin-Untracked")
            frame.OtherInfoContainer.ICHWaypointButton:SetHighlightTexture("Interface/Minimap/Minimap-Waypoint-MapPin-Tracked")
            frame.OtherInfoContainer.ICHWaypointButton:SetSize(24, 24)
            frame.OtherInfoContainer.ICHWaypointButton:SetPoint("RIGHT", 3, 0)
            isPinSettable = true
        end
        if isPinSettable then frame.OtherInfoContainer.ICHWaypointButton:Show() else frame.OtherInfoContainer.ICHWaypointButton:Hide() end
    elseif frame.OtherInfoContainer.ICHWaypointButton:IsShown() then frame.OtherInfoContainer.ICHWaypointButton:Hide() end
    frame.OtherInfoContainer.ICHWaypointButton.instanceID = data.InstanceID
    frame.OtherInfoContainer.ICHWaypointButton.vendorName = data.VendorName

    frame.OtherInfoContainer.ICHWaypointButton:SetScript("OnClick", function() HandleWaypointClick(data, destinationName) end)
end