local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHAbout
ICHAboutMixin = {}

---@type Translator[]
local translators = {
    { name = "Fargoran", locale = "deDE" },
    { name = "BNS333", locale = "zhTW" },
    { name = "柳心怡", locale = "zhCN" }
}

function ICHAboutMixin:OnLoad()
    -- Allows closing via ESC key
    tinsert(UISpecialFrames, self:GetName())

    ---@diagnostic disable-next-line: exp-in-action, undefined-global, unknown-symbol, miss-exp, miss-symbol
    self.Name:SetText("Instance Collection Helper v"..@project-version@)
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