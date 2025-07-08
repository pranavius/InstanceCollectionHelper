local name, AddOn = ...
---@class InstanceCollectionHelper: AceAddon, AceConsole-3.0, AceEvent-3.0
AddOn = LibStub("AceAddon-3.0"):NewAddon(name, "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

AddOn.DatabaseDefaults = {
    global = {
        minimap = { hide = false }
    }
}

AddOn.Icon = LibStub("LibDBIcon-1.0")

AddOn.SlashOptions = {
    type = "group",
    handler = AddOn,
    get = function(key) return AddOn.db.global[key[#key]] end,
    set = function(key, val) AddOn.db.global[key[#key]] = val end,
    args = {
        minimap = {
            type = "toggle",
            name = "minimap",
            desc = "Show/hide the minimap icon",
            set = function()
                AddOn.db.global.minimap.hide = not AddOn.db.global.minimap.hide
                if AddOn.db.global.minimap.hide then AddOn.Icon:Hide(name)
                else AddOn.Icon:Show(name)
                end
            end
        }
    }
}