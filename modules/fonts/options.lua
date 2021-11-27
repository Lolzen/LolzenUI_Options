--// options for fonts //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["fonts"] == true then

		local title = ns.createTitle("fonts")

		local about = ns.createDescription("fonts", LUI["desc_fonts"])

		local aboutBG = ns.createBackground("fonts", 600, 116)
		aboutBG:SetPoint("TOPLEFT", about, "BOTTOMLEFT", -4, -14)
		aboutBG:SetFrameLevel(1)

		local dmg_text = ns.createFontstring("fonts", "|cff5599ff"..L["DAMAGE_TEXT_FONT"]..":|r")
		dmg_text:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 4, -28)

		local dmg = ns.createPicker("fonts", "font", "fonts_dmgfont", 120, LolzenUIcfg.fonts["fonts_DAMAGE_TEXT_FONT"])
		dmg:SetPoint("LEFT", dmg_text, "RIGHT", -10, -3)

		local unit_text = ns.createFontstring("fonts", "|cff5599ff"..L["UNIT_NAME_FONT"]..":|r")
		unit_text:SetPoint("TOPLEFT", dmg_text, "BOTTOMLEFT", 0, -15)

		local unit = ns.createPicker("fonts", "font", "fonts_unitfont", 120, LolzenUIcfg.fonts["fonts_UNIT_NAME_FONT"])
		unit:SetPoint("LEFT", unit_text, "RIGHT", -10, -3)

		local np_text = ns.createFontstring("fonts", "|cff5599ff"..L["NAMEPLATE_FONT"]..":|r")
		np_text:SetPoint("TOPLEFT", unit_text, "BOTTOMLEFT", 0, -15)

		local np = ns.createPicker("fonts", "font", "fonts_npfont", 120, LolzenUIcfg.fonts["fonts_NAMEPLATE_FONT"])
		np:SetPoint("LEFT", np_text, "RIGHT", -10, -3)

		local standard_text = ns.createFontstring("fonts", "|cff5599ff"..L["STANDARD_TEXT_FONT"]..":|r")
		standard_text:SetPoint("TOPLEFT", np_text, "BOTTOMLEFT", 0, -15)

		local standard = ns.createPicker("fonts", "font", "fonts_standardfont", 120, LolzenUIcfg.fonts["fonts_STANDARD_TEXT_FONT"])
		standard:SetPoint("LEFT", standard_text, "RIGHT", -10, -3)

		local applyButton = ns.createApplyButton("fonts")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.fonts["fonts_DAMAGE_TEXT_FONT"] = UIDropDownMenu_GetSelectedName(dmg)
			LolzenUIcfg.fonts["fonts_UNIT_NAME_FONT"] = UIDropDownMenu_GetSelectedName(unit)
			LolzenUIcfg.fonts["fonts_NAMEPLATE_FONT"] = UIDropDownMenu_GetSelectedName(np)
			LolzenUIcfg.fonts["fonts_STANDARD_TEXT_FONT"] = UIDropDownMenu_GetSelectedName(standard)
			ReloadUI()
		end)

		ns["fonts"].default = function(self)
			LolzenUIcfg.fonts = _G["LolzenUIdefaultcfg"].fonts
			ReloadUI()
		end
	end
end)