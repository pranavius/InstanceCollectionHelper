local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

-- All WoW supported locales
-- "enUS"|"enGB"|"enAU"|"esES"|"esMX"|"ptBR"|"ptPT"|"frFR"|"deDE"|"itIT"|"ruRU"|"koKR"|"zhTW"|"zhCN"

---@class Translator An individual who has contributed to the localization of ICH in another language/locale besides English (_enUS_)
---@field name string The name of the translator
---@field locale string The locale for which they provided translations

---@type Translator[]
local translators = {
    { name = "Fargoran", locale = "deDE" },
    { name = "BNS333", locale = "zhTW" },
    { name = "柳心怡", locale = "zhCN" }
}

---Initializes the About frame that displays contact info and translation credit for the AddOn
function AddOn:CreateAboutFrame()
    local a = CreateFrame("Frame", "ICHAbout", UIParent)
    a:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    a:SetSize(400, 500)
    a:SetFrameStrata("MEDIUM")

    -- Frame background
    a.Bg = a:CreateTexture(nil, "BACKGROUND")
    a.Bg:SetAllPoints(a)
    a.Bg:SetColorTexture(0, 0, 0, 0.5)

    -- Frame Title
    a.Name = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    a.Name:SetPoint("TOPLEFT", a, "TOPLEFT", 0, -10)
    a.Name:SetPoint("TOPRIGHT", a, "TOPRIGHT", 0, -10)
    a.Name:SetText(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Instance Collection Helper v11"))

    a.Author = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    a.Author:SetPoint("TOPLEFT", a.Name, "BOTTOMLEFT", 0, -10)
    a.Author:SetPoint("TOPRIGHT", a.Name, "BOTTOMRIGHT", 0, -10)
    a.Author:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(L["Created by Pranavius"]))

    a.Twitter = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    a.Twitter:SetPoint("TOPLEFT", a.Author, "BOTTOMLEFT", 0, -20)
    a.Twitter:SetPoint("TOPRIGHT", a.Author, "BOTTOMRIGHT", 0, -20)
    a.Twitter:SetText("|TInterface\\AddOns\\InstanceCollectionHelper\\Media\\X-logo:20:20|t   "..LEGENDARY_ORANGE_COLOR:WrapTextInColorCode("@PranaviusWoW"))
    
    a.GitHub = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    a.GitHub:SetPoint("TOPLEFT", a.Twitter, "BOTTOMLEFT", 0, 0)
    a.GitHub:SetPoint("TOPRIGHT", a.Twitter, "BOTTOMRIGHT", 0, 0)
    a.GitHub:SetText("|TInterface\\AddOns\\InstanceCollectionHelper\\Media\\Github-logo:20:20|t   "..LEGENDARY_ORANGE_COLOR:WrapTextInColorCode("Pranavius"))

    a.SpecialThanksHeader = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightHuge")
    a.SpecialThanksHeader:SetPoint("TOPLEFT", a.Twitter, "BOTTOMLEFT", 0, -40)
    a.SpecialThanksHeader:SetPoint("TOPRIGHT", a.Twitter, "BOTTOMRIGHT", 0, -40)
    a.SpecialThanksHeader:SetText(DARKYELLOW_FONT_COLOR:WrapTextInColorCode(L["Special Thanks"]))

    a.SpecialThanks1 = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    a.SpecialThanks1:SetPoint("TOPLEFT", a.SpecialThanksHeader, "BOTTOMLEFT", 0, -10)
    a.SpecialThanks1:SetPoint("TOPRIGHT", a.SpecialThanksHeader, "BOTTOMRIGHT", 0, -10)
    a.SpecialThanks1:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("Plusmouse"))

    a.SpecialThanks2 = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    a.SpecialThanks2:SetPoint("TOPLEFT", a.SpecialThanks1, "BOTTOMLEFT", 0, -10)
    a.SpecialThanks2:SetPoint("TOPRIGHT", a.SpecialThanks1, "BOTTOMRIGHT", 0, -10)
    a.SpecialThanks2:SetText(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("Tuskyouup"))

    a.Translators = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightHuge")
    a.Translators:SetPoint("TOPLEFT", a.SpecialThanks2, "BOTTOMLEFT", 0, -40)
    a.Translators:SetPoint("TOPRIGHT", a.SpecialThanks2, "BOTTOMRIGHT", 0, -40)
    a.Translators:SetText(DARKYELLOW_FONT_COLOR:WrapTextInColorCode(L["Translations:"]))

    for idx, translator in ipairs(translators) do
        local parentKey = "Translator"..tostring(idx)
        a[parentKey] = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        if idx == 1 then
            a[parentKey]:SetPoint("TOPLEFT", a.Translators, "BOTTOMLEFT", 0, -10)
            a[parentKey]:SetPoint("TOPRIGHT", a.Translators, "BOTTOMRIGHT", 0, -10)
        else
            a[parentKey]:SetPoint("TOPLEFT", a["Translator"..tostring(idx - 1)], "BOTTOMLEFT", 0, -10)
            a[parentKey]:SetPoint("TOPRIGHT", a["Translator"..tostring(idx - 1)], "BOTTOMRIGHT", 0, -10)
        end
        a[parentKey]:SetText(translator.name.." ("..translator.locale..")")
    end

    a.OpenICH = CreateFrame("Button", nil, a, "UIPanelButtonTemplate")
    a.OpenICH:SetPoint("BOTTOMLEFT", a, "BOTTOMLEFT", 50, 20)
    a.OpenICH:SetSize(100, 40)
    a.OpenICH:SetText(L["Open ICH"])
    a.OpenICH:SetScript("OnClick", function()
        a:Hide()
        self.Container:Show()
    end)

    a.Close = CreateFrame("Button", nil, a, "UIPanelButtonTemplate")
    a.Close:SetPoint("BOTTOMRIGHT", a, "BOTTOMRIGHT", -50, 20)
    a.Close:SetSize(100, 40)
    a.Close:SetText(L["Close"])
    a.Close:SetScript("OnClick", function() a:Hide() end)

    self.About = a
end