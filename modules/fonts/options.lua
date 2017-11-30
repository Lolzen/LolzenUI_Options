--// options for fonts //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["fonts"] == true then

		local title = ns.createTitle("fonts")

		local about = ns.createDescription("fonts", "Changes the fonts used in WoW")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

		local dmg_text = ns.createFonstring("fonts", "|cff5599ffDAMAGE_TEXT_FONT:|r")
		dmg_text:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local dmg = ns.createPicker("fonts", "font", "fonts_dmgfont", 120, LolzenUIcfg.fonts["fonts_DAMAGE_TEXT_FONT"])
		dmg:SetPoint("LEFT", dmg_text, "RIGHT", -10, -3)

		local unit_text = ns.createFonstring("fonts", "|cff5599ffUNIT_NAME_FONT:|r")
		unit_text:SetPoint("TOPLEFT", dmg_text, "BOTTOMLEFT", 0, -15)

		local unit = ns.createPicker("fonts", "font", "fonts_unitfont", 120, LolzenUIcfg.fonts["fonts_UNIT_NAME_FONT"])
		unit:SetPoint("LEFT", unit_text, "RIGHT", -10, -3)

		local np_text = ns.createFonstring("fonts", "|cff5599ffNAMEPLATE_FONT:|r")
		np_text:SetPoint("TOPLEFT", unit_text, "BOTTOMLEFT", 0, -15)

		local np = ns.createPicker("fonts", "font", "fonts_npfont", 120, LolzenUIcfg.fonts["fonts_NAMEPLATE_FONT"])
		np:SetPoint("LEFT", np_text, "RIGHT", -10, -3)

		local standard_text = ns.createFonstring("fonts", "|cff5599ffSTANDARD_TEXT_FONT:|r")
		standard_text:SetPoint("TOPLEFT", np_text, "BOTTOMLEFT", 0, -15)

		local standard = ns.createPicker("fonts", "font", "fonts_standardfont", 120, LolzenUIcfg.fonts["fonts_STANDARD_TEXT_FONT"])
		standard:SetPoint("LEFT", standard_text, "RIGHT", -10, -3)

		ns["fonts"].okay = function(self)
			LolzenUIcfg.fonts["fonts_DAMAGE_TEXT_FONT"] = UIDropDownMenu_GetSelectedName(dmg)
			LolzenUIcfg.fonts["fonts_UNIT_NAME_FONT"] = UIDropDownMenu_GetSelectedName(unit)
			LolzenUIcfg.fonts["fonts_NAMEPLATE_FONT"] = UIDropDownMenu_GetSelectedName(np)
			LolzenUIcfg.fonts["fonts_STANDARD_TEXT_FONT"] = UIDropDownMenu_GetSelectedName(standard)
		end

		ns["fonts"].default = function(self)
			LolzenUIcfg.fonts["fonts_DAMAGE_TEXT_FONT"] = "DroidSansBold"
			LolzenUIcfg.fonts["fonts_UNIT_NAME_FONT"] = "DroidSans"
			LolzenUIcfg.fonts["fonts_NAMEPLATE_FONT"] = "DroidSans"
			LolzenUIcfg.fonts["fonts_STANDARD_TEXT_FONT"] = "DroidSans"
			ReloadUI()
		end
	end
end)