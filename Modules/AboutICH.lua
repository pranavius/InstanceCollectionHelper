local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local translators = {
    { name = "Fargoran", locale = "deDE" },
    { name = "BNS333", locale = "zhTW" },
    { name = "柳心怡", locale = "zhCN" }
}

function AddOn:CreateAboutFrame()
    local a = CreateFrame("Frame", "ICHAbout", UIParent)
    a:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    a:SetSize(400, 400)
    a:SetFrameStrata("HIGH")

    -- Frame background
    a.Bg = a:CreateTexture(nil, "BACKGROUND")
    a.Bg:SetAllPoints(a)
    a.Bg:SetColorTexture(0, 0, 0, 0.5)

    -- Frame Title
    a.Name = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    a.Name:SetPoint("TOPLEFT", a, "TOPLEFT", 0, -10)
    a.Name:SetPoint("TOPRIGHT", a, "TOPRIGHT", 0, -10)
    a.Name:SetText(WrapTextInColor(name, DARKYELLOW_FONT_COLOR))

    a.Author = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    a.Author:SetPoint("TOPLEFT", a.Name, "BOTTOMLEFT", 0, -10)
    a.Author:SetPoint("TOPRIGHT", a.Name, "BOTTOMRIGHT", 0, -10)
    a.Author:SetText(WrapTextInColor(L["Created by Pranavius"], HEIRLOOM_BLUE_COLOR))

    a.Twitter = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    a.Twitter:SetPoint("TOPLEFT", a.Author, "BOTTOMLEFT", 0, -20)
    a.Twitter:SetPoint("TOPRIGHT", a.Author, "BOTTOMRIGHT", 0, -20)
    a.Twitter:SetText("|TInterface\\AddOns\\PranGearView\\Media\\X-logo:20:20|t   "..WrapTextInColor("@PranaviusWoW", LEGENDARY_ORANGE_COLOR))
    
    a.GitHub = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium")
    a.GitHub:SetPoint("TOPLEFT", a.Twitter, "BOTTOMLEFT", 0, 0)
    a.GitHub:SetPoint("TOPRIGHT", a.Twitter, "BOTTOMRIGHT", 0, 0)
    a.GitHub:SetText("|TInterface\\AddOns\\PranGearView\\Media\\Github-logo:20:20|t   "..WrapTextInColor("Pranavius", LEGENDARY_ORANGE_COLOR))

    a.Translators = a:CreateFontString(nil, "OVERLAY", "GameFontHighlightHuge")
    a.Translators:SetPoint("TOPLEFT", a.Twitter, "BOTTOMLEFT", 0, -40)
    a.Translators:SetPoint("TOPRIGHT", a.Twitter, "BOTTOMRIGHT", 0, -40)
    a.Translators:SetText(WrapTextInColor(L["Translations:"], DARKYELLOW_FONT_COLOR))

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