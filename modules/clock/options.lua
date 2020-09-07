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
		font.OnClick = function()
			LolzenUIcfg.clock["clock_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUI.SetClockFont()
		end

		local font_size_text = ns.createFontstring("clock", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.clock["clock_font_size"] = tonumber(font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetClockFont()
		end)

		font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_flag_text = ns.createFontstring("clock", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 10, 0)

		local font_flag = ns.createPicker("clock", "flag", "clock_font_flag", 120, LolzenUIcfg.clock["clock_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)
		font_flag.OnClick = function()
			LolzenUIcfg.clock["clock_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUI.SetClockFont()
		end

		local color_text = ns.createFontstring("clock", L["color"]..":")
		color_text:SetPoint("LEFT", font_flag, "RIGHT", -5, 3)

		local color = ns.createColorTexture("clock", 16, 16, LolzenUIcfg.clock["clock_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)
		color.setActualColors = function()
			LolzenUIcfg.clock["clock_color"] = {color:GetVertexColor()}
			LolzenUI.SetClockFontColor()
		end

		local color_f = ns.createColorPicker("clock", color, LolzenUIcfg.clock["clock_color"])
		color_f:SetAllPoints(color)

		local header2 = ns.createHeader("clock", L["clock_seconds_header"])
		header2:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -30)

		local cb1 = ns.createCheckBox("clock", "clock_seconds_enabled", "|cff5599ff"..L["clock_seconds_enabled"].."|r", LolzenUIcfg.clock["clock_seconds_enabled"])
		cb1:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.clock["clock_seconds_enabled"] = cb1:GetChecked()
		end)

		local seconds_font_text = ns.createFontstring("clock", L["font"]..":")
		seconds_font_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local seconds_font = ns.createPicker("clock", "font", "clock_font_seconds", 120, LolzenUIcfg.clock["clock_font_seconds"])
		seconds_font:SetPoint("LEFT", seconds_font_text, "RIGHT", -10, -3)
		seconds_font.OnClick = function()
			LolzenUIcfg.clock["clock_font_seconds"] = UIDropDownMenu_GetSelectedName(seconds_font)
			LolzenUI.SetClockFontSeconds()
		end

		local seconds_font_size_text = ns.createFontstring("clock", L["size"]..":")
		seconds_font_size_text:SetPoint("LEFT", seconds_font, "RIGHT", -5, 3)

		local seconds_font_size = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_seconds_font_size"])
		seconds_font_size:SetPoint("LEFT", seconds_font_size_text, "RIGHT", 10, 0)

		seconds_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		seconds_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.clock["clock_seconds_font_size"] = tonumber(seconds_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetClockFontSeconds()
		end)

		seconds_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		seconds_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local seconds_font_flag_text = ns.createFontstring("clock", L["flag"]..":")
		seconds_font_flag_text:SetPoint("LEFT", seconds_font_size, "RIGHT", 10, 0)

		local seconds_font_flag = ns.createPicker("clock", "flag", "clock_font_flag_seconds", 120, LolzenUIcfg.clock["clock_seconds_font_flag"])
		seconds_font_flag:SetPoint("LEFT", seconds_font_flag_text, "RIGHT", -10, -3)
		seconds_font_flag.OnClick = function()
			LolzenUIcfg.clock["clock_seconds_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(seconds_font_flag)]
			LolzenUI.SetClockFontSeconds()
		end

		local seconds_color_text = ns.createFontstring("clock", L["color"]..":")
		seconds_color_text:SetPoint("LEFT", seconds_font_flag, "RIGHT", -5, 3)

		local seconds_color = ns.createColorTexture("clock", 16, 16, LolzenUIcfg.clock["clock_seconds_color"], "LolzenUI Standard")
		seconds_color:SetPoint("LEFT", seconds_color_text, "RIGHT", 10, 0)
		seconds_color.setActualColors = function()
			LolzenUIcfg.clock["clock_seconds_color"] = {seconds_color:GetVertexColor()}
			LolzenUI.SetClockFontSecondsColor()
		end

		local seconds_color_f = ns.createColorPicker("clock", seconds_color, LolzenUIcfg.clock["clock_seconds_color"])
		seconds_color_f:SetAllPoints(seconds_color)

		local header3 = ns.createHeader("clock", L["clock_date"])
		header3:SetPoint("TOPLEFT", seconds_font_text, "BOTTOMLEFT", 0, -30)

		local dateformat = ns.createPicker("clock", "dateformat", "clock_dateformat", 50, LolzenUIcfg.clock["clock_dateformat"])
		dateformat:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", -17, -3)
		dateformat.OnClick = function()
			LolzenUIcfg.clock["clock_dateformat"] = UIDropDownMenu_GetSelectedName(dateformat)
		end

		local header4 = ns.createHeader("clock", L["frame"])
		header4:SetPoint("TOPLEFT", dateformat, "BOTTOMLEFT", 17, -27)

		local pos_x_text = ns.createFontstring("clock", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.clock["clock_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetClockPosition()
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("clock", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 10, 0)

		local pos_y = ns.createInputbox("clock", 30, 20, LolzenUIcfg.clock["clock_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.clock["clock_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetClockPosition()
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("clock", L["anchor"].."1:")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 10, 0)

		local anchor = ns.createPicker("clock", "anchor", "clock_text_anchor_1", 110, LolzenUIcfg.clock["clock_anchor1"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)
		anchor.OnClick = function()
			LolzenUIcfg.clock["clock_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUI.SetClockPosition()
		end

		local anchor_text2 = ns.createFontstring("clock", L["anchor"].."2:")
		anchor_text2:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local anchor2 = ns.createPicker("clock", "anchor", "clock_text_anchor_2", 110, LolzenUIcfg.clock["clock_anchor2"])
		anchor2:SetPoint("LEFT", anchor_text2, "RIGHT", -10, -3)
		anchor2.OnClick = function()
			LolzenUIcfg.clock["clock_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			LolzenUI.SetClockPosition()
		end

		ns["clock"].default = function(self)
			LolzenUIcfg.clock = _G["LolzenUIdefaultcfg"].clock
			ReloadUI()
		end
	end
end)