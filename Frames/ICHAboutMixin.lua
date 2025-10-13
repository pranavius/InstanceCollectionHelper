local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHAbout: Frame
---@field Bg Texture The background texture for the frame
---@field Name FontString AddOn name
---@field Author FontString AddOn author
---@field Twitter FontString AddOn author's Twitter/X handle
---@field GitHub FontString AddOn author's GitHub username
---@field SpecialThanksHeader FontString Heading for list of people to give a special thanks to for their contributions to the AddOn
---@field Translators FontString Heading for list of people to thank for providing translations into other languages for the AddOn
---@field OpenICH Button Closes the About information and re-opens the AddOn
---@field Close Button Closes the About information
ICHAboutMixin = {}

local CURRENT_VERSION = 12.2

---@class Translator An individual who has contributed to the localization of ICH in another language/locale besides English (_enUS_)
---@field name string The name of the translator
---@field locale "enUS"|"enGB"|"enAU"|"esES"|"esMX"|"ptBR"|"ptPT"|"frFR"|"deDE"|"itIT"|"ruRU"|"koKR"|"zhTW"|"zhCN" The locale for which they provided translations

---@type Translator[]
local translators = {
    { name = "Fargoran", locale = "deDE" },
    { name = "BNS333", locale = "zhTW" },
    { name = "柳心怡", locale = "zhCN" }
}

function ICHAboutMixin:OnLoad()
    -- Allows closing via ESC key
    tinsert(UISpecialFrames, self:GetName())

    self.Name:SetText("Instance Collection Helper v"..CURRENT_VERSION)
    self.Author:SetText(L["Created by Pranavius"])
    self.Twitter:SetText("|TInterface\\AddOns\\InstanceCollectionHelper\\Media\\X-logo:20:20|t   ".."@PranaviusWoW")
    self.GitHub:SetText("|TInterface\\AddOns\\InstanceCollectionHelper\\Media\\Github-logo:20:20|t   ".."Pranavius")
    self.SpecialThanksHeader:SetText(L["Special Thanks"])
    self.Translators:SetText(L["Translations:"])
    self.OpenICH:SetText(L["Open ICH"])
    self.Close:SetText(L["Close"])

    -- FontString for each translator is generated dynamically since this can change more regularly than other sections
    for idx, translator in ipairs(translators) do
        local fs = self:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        if idx == 1 then
            fs:SetPoint("TOPLEFT", self.Translators, "BOTTOMLEFT", 0, -10)
            fs:SetPoint("TOPRIGHT", self.Translators, "BOTTOMRIGHT", 0, -10)
        else
            fs:SetPoint("TOPLEFT", self["Translator"..tostring(idx - 1)], "BOTTOMLEFT", 0, -10)
            fs:SetPoint("TOPRIGHT", self["Translator"..tostring(idx - 1)], "BOTTOMRIGHT", 0, -10)
        end
        fs:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(translator.name).." ("..translator.locale..")")
        self["Translator"..tostring(idx)] = fs
    end

    self.OpenICH:SetScript("OnClick", function()
        self:Hide()
        AddOn.Container:Show()
    end)

    self.Close:SetScript("OnClick", function()
        self:Hide()
    end)

    AddOn.About = self
end