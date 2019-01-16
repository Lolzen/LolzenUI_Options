--// options for clock //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["clock"] == true then

		local title = ns.createTitle("clock")

		local about = ns.createDescription("clock", LUI["desc_clock"])

		local header1 = ns.createHeader("clock", L["clock_hours_and_minutes_header"])
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local font_text = ns.createFontstring("clock", L["font"]..":")
		font_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -10)

		local font = ns.createPicker("clock", "font", "clock_font", 120, LolzenUIcfg.clock["clock_font"])
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)

		local font_size_text = ns.createFontstring("clock", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		local font_flag_text = ns.createFontstring("clock", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 10, 0)

		local font_flag = ns.createPicker("clock", "flag", "clock_font_flag", 120, LolzenUIcfg.clock["clock_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)

		local color_text = ns.createFontstring("clock", L["color"]..":")
		color_text:SetPoint("LEFT", font_flag, "RIGHT", -5, 3)

		local color = ns.createColorTexture("clock", 16, 16, LolzenUIcfg.clock["clock_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)

		local color_f = ns.createColorPicker("clock", color, LolzenUIcfg.clock["clock_color"])
		color_f:SetAllPoints(color)

		local header2 = ns.createHeader("clock", L["clock_seconds_header"])
		header2:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -30)

		local cb1 = ns.createCheckBox("clock", "clock_seconds_enabled", "|cff5599ff"..L["clock_seconds_enabled"].."|r", LolzenUIcfg.clock["clock_seconds_enabled"])
		cb1:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		local seconds_font_text = ns.createFontstring("clock", L["font"]..":")
		seconds_font_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local seconds_font = ns.createPicker("clock", "font", "clock_font_seconds", 120, LolzenUIcfg.clock["clock_font_seconds"])
		seconds_font:SetPoint("LEFT", seconds_font_text, "RIGHT", -10, -3)

		local seconds_font_size_text = ns.createFontstring("clock", L["size"]..":")
		seconds_font_size_text:SetPoint("LEFT", seconds_font, "RIGHT", -5, 3)

		local seconds_font_size = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_seconds_font_size"])
		seconds_font_size:SetPoint("LEFT", seconds_font_size_text, "RIGHT", 10, 0)

		local seconds_font_flag_text = ns.createFontstring("clock", L["flag"]..":")
		seconds_font_flag_text:SetPoint("LEFT", seconds_font_size, "RIGHT", 10, 0)

		local seconds_font_flag = ns.createPicker("clock", "flag", "clock_font_flag_seconds", 120, LolzenUIcfg.clock["clock_seconds_font_flag"])
		seconds_font_flag:SetPoint("LEFT", seconds_font_flag_text, "RIGHT", -10, -3)

		local seconds_color_text = ns.createFontstring("clock", L["color"]..":")
		seconds_color_text:SetPoint("LEFT", seconds_font_flag, "RIGHT", -5, 3)

		local seconds_color = ns.createColorTexture("clock", 16, 16, LolzenUIcfg.clock["clock_seconds_color"], "LolzenUI Standard")
		seconds_color:SetPoint("LEFT", seconds_color_text, "RIGHT", 10, 0)

		local seconds_color_f = ns.createColorPicker("clock", seconds_color, LolzenUIcfg.clock["clock_seconds_color"])
		seconds_color_f:SetAllPoints(seconds_color)

		local header3 = ns.createHeader("clock", L["frame"])
		header3:SetPoint("TOPLEFT", seconds_font_text, "BOTTOMLEFT", 0, -30)

		local pos_x_text = ns.createFontstring("clock", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("clock", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 10, 0)

		local pos_y = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("clock", L["anchor"].."1:")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 10, 0)

		local anchor = ns.createPicker("clock", "anchor", "clock_text_anchor_1", 110, LolzenUIcfg.clock["clock_anchor1"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local anchor_text2 = ns.createFontstring("clock", L["anchor"].."2:")
		anchor_text2:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local anchor2 = ns.createPicker("clock", "anchor", "clock_text_anchor_2", 110, LolzenUIcfg.clock["clock_anchor2"])
		anchor2:SetPoint("LEFT", anchor_text2, "RIGHT", -10, -3)

		local applyButton = ns.createApplyButton("clock")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.clock["clock_seconds_enabled"] = cb1:GetChecked()
			LolzenUIcfg.clock["clock_color"] = {color:GetVertexColor()}
			LolzenUIcfg.clock["clock_seconds_color"] = {seconds_color:GetVertexColor()}
			LolzenUIcfg.clock["clock_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUIcfg.clock["clock_font_seconds"] = UIDropDownMenu_GetSelectedName(seconds_font)
			LolzenUIcfg.clock["clock_font_size"] = tonumber(font_size:GetText())
			LolzenUIcfg.clock["clock_seconds_font_size"] = tonumber(seconds_font_size:GetText())
			LolzenUIcfg.clock["clock_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUIcfg.clock["clock_seconds_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(seconds_font_flag)]
			LolzenUIcfg.clock["clock_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.clock["clock_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			LolzenUIcfg.clock["clock_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.clock["clock_posy"] = tonumber(pos_y:GetText())
			ReloadUI()
		end)

		ns["clock"].default = function(self)
			LolzenUIcfg.clock = _G["LolzenUIdefaultcfg"].clock
			ReloadUI()
		end
	end
end)