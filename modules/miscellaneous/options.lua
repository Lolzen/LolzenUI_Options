--// Miscellaneous options //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["miscellaneous"] == true then

		local title = ns.createTitle("miscellaneous")

		local about = ns.createDescription("miscellaneous", LUI["desc_miscellaneous"])

		local header1 = ns.createHeader("miscellaneous", L["misc_rep_colors_header"])
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local cb1 = ns.createCheckBox("miscellaneous", "alternateFactionColors", "|cff5599ff"..L["misc_use_alternative_rep_colors"].."|r", LolzenUIcfg.miscellaneous["misc_alternative_faction_colors"])
		cb1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local color_text_hated = ns.createFontstring("miscellaneous", L["misc_hated"]..":")
		color_text_hated:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -15)

		local color_hated = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][1], "LolzenUI Standard")
		color_hated:SetPoint("LEFT", color_text_hated, "RIGHT", 32, 0)

		local color_f_hated = ns.createColorPicker("miscellaneous", color_hated, LolzenUIcfg.miscellaneous["misc_faction_colors"][1])
		color_f_hated:SetAllPoints(color_hated)

		local color_text_hostile = ns.createFontstring("miscellaneous", L["misc_hostile"]..":")
		color_text_hostile:SetPoint("TOPLEFT", color_text_hated, "BOTTOMLEFT", 0, -15)

		local color_hostile = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][2], "LolzenUI Standard")
		color_hostile:SetPoint("LEFT", color_text_hostile, "RIGHT", 27, 0)

		local color_f_hostile = ns.createColorPicker("miscellaneous", color_hostile, LolzenUIcfg.miscellaneous["misc_faction_colors"][2])
		color_f_hostile:SetAllPoints(color_hostile)

		local color_text_unfriendly = ns.createFontstring("miscellaneous", L["misc_unfriendly"]..":")
		color_text_unfriendly:SetPoint("TOPLEFT", color_text_hostile, "BOTTOMLEFT", 0, -15)

		local color_unfriendly = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][3], "LolzenUI Standard")
		color_unfriendly:SetPoint("LEFT", color_text_unfriendly, "RIGHT", 10, 0)

		local color_f_unfriendly = ns.createColorPicker("miscellaneous", color_unfriendly, LolzenUIcfg.miscellaneous["misc_faction_colors"][3])
		color_f_unfriendly:SetAllPoints(color_unfriendly)

		local color_text_neutral = ns.createFontstring("miscellaneous", L["misc_neutral"]..":")
		color_text_neutral:SetPoint("TOPLEFT", color_text_unfriendly, "BOTTOMLEFT", 0, -15)

		local color_neutral = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][4], "LolzenUI Standard")
		color_neutral:SetPoint("LEFT", color_text_neutral, "RIGHT", 26, 0)

		local color_f_neutral = ns.createColorPicker("miscellaneous", color_neutral, LolzenUIcfg.miscellaneous["misc_faction_colors"][4])
		color_f_neutral:SetAllPoints(color_neutral)

		local color_text_friendly = ns.createFontstring("miscellaneous", L["misc_friendly"]..":")
		color_text_friendly:SetPoint("TOPLEFT", color_text_neutral, "BOTTOMLEFT", 0, -15)

		local color_friendly = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][5], "LolzenUI Standard")
		color_friendly:SetPoint("LEFT", color_text_friendly, "RIGHT", 23, 0)

		local color_f_friendly = ns.createColorPicker("miscellaneous", color_friendly, LolzenUIcfg.miscellaneous["misc_faction_colors"][5])
		color_f_friendly:SetAllPoints(color_friendly)

		local color_text_honored = ns.createFontstring("miscellaneous", L["misc_honored"]..":")
		color_text_honored:SetPoint("TOPLEFT", color_text_friendly, "BOTTOMLEFT", 0, -15)

		local color_honored = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][6], "LolzenUI Standard")
		color_honored:SetPoint("LEFT", color_text_honored, "RIGHT", 18, 0)

		local color_f_honored = ns.createColorPicker("miscellaneous", color_honored, LolzenUIcfg.miscellaneous["misc_faction_colors"][6])
		color_f_honored:SetAllPoints(color_honored)

		local color_text_revered = ns.createFontstring("miscellaneous", L["misc_revered"]..":")
		color_text_revered:SetPoint("TOPLEFT", color_text_honored, "BOTTOMLEFT", 0, -15)

		local color_revered = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][7], "LolzenUI Standard")
		color_revered:SetPoint("LEFT", color_text_revered, "RIGHT", 21, 0)

		local color_f_revered = ns.createColorPicker("miscellaneous", color_revered, LolzenUIcfg.miscellaneous["misc_faction_colors"][7])
		color_f_revered:SetAllPoints(color_revered)

		local color_text_exalted = ns.createFontstring("miscellaneous", L["misc_exalted"]..":")
		color_text_exalted:SetPoint("TOPLEFT", color_text_revered, "BOTTOMLEFT", 0, -15)

		local color_exalted = ns.createColorTexture("miscellaneous", 16, 16, LolzenUIcfg.miscellaneous["misc_faction_colors"][8], "LolzenUI Standard")
		color_exalted:SetPoint("LEFT", color_text_exalted, "RIGHT", 25, 0)

		local color_f_exalted = ns.createColorPicker("miscellaneous", color_exalted, LolzenUIcfg.miscellaneous["misc_faction_colors"][8])
		color_f_exalted:SetAllPoints(color_exalted)

		local header2 = ns.createHeader("miscellaneous", L["misc_microbuttons"])
		header2:SetPoint("TOPLEFT", color_text_exalted, "BOTTOMLEFT", 0, -20)

		local cb2 = ns.createCheckBox("miscellaneous", "misc_microbttons", "|cff5599ff"..L["misc_hide_microbuttons"].."|r", LolzenUIcfg.miscellaneous["misc_hide_microbuttons"])
		cb2:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local applyButton = ns.createApplyButton("miscellaneous")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.miscellaneous["misc_alternative_faction_colors"] = cb1:GetChecked()
			LolzenUIcfg.miscellaneous["misc_faction_colors"][1] = {color_hated:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][2] = {color_hostile:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][3] = {color_unfriendly:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][4] = {color_neutral:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][5] = {color_friendly:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][6] = {color_honored:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][7] = {color_revered:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][8] = {color_exalted:GetVertexColor()}
			LolzenUIcfg.miscellaneous["misc_hide_microbuttons"] = cb2:GetChecked()
			ReloadUI()
		end)

		ns["miscellaneous"].default = function(self)
			LolzenUIcfg.miscellaneous["misc_alternative_faction_colors"] = true
			LolzenUIcfg.miscellaneous["misc_faction_colors"][1] = {1, 0.2, 0.15}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][2] = {0.8, 0.3, 0.22}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][3] = {0.75, 0.27, 0}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][4] = {0.9, 0.7, 0}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][5] = {0, 0.6, 0.1}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][6] = {0, 0.6, 0.33}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][7] = {0, 0.7, 0.5}
			LolzenUIcfg.miscellaneous["misc_faction_colors"][8] = {0, 0.7, 0.7}
			LolzenUIcfg.miscellaneous["misc_hide_microbuttons"] = true
			ReloadUI()
		end
	end
end)