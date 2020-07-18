local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- function to change scrollable content size on demand
		local function ChangeScrollbarMinMax(parent, operator, num)
			local min, max = ns[parent].scrollbar:GetMinMaxValues()
			local newmax
			if operator == "-" then
				newmax = max - num
			else
				newmax = max + num
			end
			ns[parent].scrollbar:SetMinMaxValues(min, newmax)
		end

		-- // Create a subcategory panel for Player // --
		ns.uf_player_options = CreateFrame("Frame", "unitframe_playerpanel", ns["unitframes"])
		ns.uf_player_options.name = "   "..L["sub_panel_unitframes_player"]
		ns.uf_player_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_player_options)

		local title = ns.createTitle("uf_player_options", L["sub_panel_unitframes_player_title"])

		local scrollFrame = ns.createScrollFrame("uf_player_options", 186)

		local width_text = ns.createFontstring("uf_player_options", L["width"]..":", "content")
		width_text:SetPoint("TOPLEFT", ns.uf_player_options.content, 16, -16)

		local width = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes.player["uf_player_width"], "content")
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_width"] = tonumber(width:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerSize()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local height_text = ns.createFontstring("uf_player_options", L["height"]..":", "content")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local height = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes.player["uf_player_height"], "content")
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerSize()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header1 = ns.createHeader("uf_player_options", L["uf_healthpoints"], "content")
		header1:SetPoint("TOPLEFT", width_text, 0, -30)

		local cb1 = ns.createCheckBox("uf_player_options", "uf_player_use_custom_font_hp", "|cff5599ff"..L["uf_healthpoints_overwrite_global_settings"].."|r", LolzenUIcfg.unitframes.player["uf_player_use_own_hp_font_settings"], "content")
		cb1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)
		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.player["uf_player_use_own_hp_font_settings"] = cb1:GetChecked()
			LolzenUI.SetUFPlayerOwnFont()
		end)

		local hp_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		hp_pos_x_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local hp_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_hp_posx"], "content")
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		hp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_hp_posx"] = tonumber(hp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerHPPos()
		end)

		hp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_hp_posy"], "content")
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		hp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_hp_posy"] = tonumber(hp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerHPPos()
		end)

		hp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_anchor_text = ns.createFontstring("uf_player_options", L["anchor"]..":", "content")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_hp_anchor", 110, LolzenUIcfg.unitframes.player["uf_player_hp_anchor"], "content")
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)
		hp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUI.SetUFPlayerHPPos()
		end

		local hp_font_text = ns.createFontstring("uf_player_options", L["font"]..":", "content")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_player_options", "font", "uf_player_hp_font", 120, LolzenUIcfg.unitframes.player["uf_player_hp_font"], "content")
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)
		hp_font.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUI.SetUFPlayerHPFont()
		end

		local hp_font_size_text = ns.createFontstring("uf_player_options", L["size"]..":", "content")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_hp_font_size"], "content")
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		hp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_hp_font_size"] = tonumber(hp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerHPFont()
		end)

		hp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_font_flag_text = ns.createFontstring("uf_player_options", L["flag"]..":", "content")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_hp_font_flag", 120, LolzenUIcfg.unitframes.player["uf_player_hp_font_flag"], "content")
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)
		hp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUI.SetUFPlayerHPFont()
		end

		local header2 = ns.createHeader("uf_player_options", L["uf_powerpoints"], "content")
		header2:SetPoint("TOPLEFT", hp_font_text, 0, -30)

		local pp_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		pp_pos_x_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local pp_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_pp_posx"], "content")
		pp_pos_x:SetPoint("LEFT", pp_pos_x_text, "RIGHT", 10, 0)

		pp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_pp_posx"] = tonumber(pp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerPowerPos()
		end)

		pp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		pp_pos_y_text:SetPoint("LEFT", pp_pos_x, "RIGHT", 5, 0)

		local pp_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_pp_posy"], "content")
		pp_pos_y:SetPoint("LEFT", pp_pos_y_text, "RIGHT", 10, 0)

		pp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_pp_posy"] = tonumber(pp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerPowerPos()
		end)

		pp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_anchor_text = ns.createFontstring("uf_player_options", L["anchor"].."1:", "content")
		pp_anchor_text:SetPoint("TOPLEFT", pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local pp_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_pp_anchor", 90, LolzenUIcfg.unitframes.player["uf_player_pp_anchor"], "content")
		pp_anchor:SetPoint("LEFT", pp_anchor_text, "RIGHT", -10, -3)
		pp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor)]
			LolzenUI.SetUFPlayerPowerPos()
		end

		local pp_parent_text = ns.createFontstring("uf_player_options", L["parent"]..":", "content")
		pp_parent_text:SetPoint("LEFT", pp_anchor, "RIGHT", -10, 3)

		local pp_parent = ns.createPicker("uf_player_options", "uf_parent", "uf_player_pp_parent", 50, LolzenUIcfg.unitframes.player["uf_player_pp_parent"], "content")
		pp_parent:SetPoint("LEFT", pp_parent_text, "RIGHT", -10, -3)
		pp_parent.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(pp_parent)]
			LolzenUI.SetUFPlayerPowerPos()
		end

		local pp_anchor2_text = ns.createFontstring("uf_player_options", L["anchor"].."2:", "content")
		pp_anchor2_text:SetPoint("LEFT", pp_parent, "RIGHT", -10, 3)

		local pp_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_pp_anchor2", 90, LolzenUIcfg.unitframes.player["uf_player_pp_anchor2"], "content")
		pp_anchor2:SetPoint("LEFT", pp_anchor2_text, "RIGHT", -10, -3)
		pp_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor2)]
			LolzenUI.SetUFPlayerPowerPos()
		end

		local pp_font_text = ns.createFontstring("uf_player_options", L["font"]..":", "content")
		pp_font_text:SetPoint("TOPLEFT", pp_anchor_text, "BOTTOMLEFT", 0, -15)

		local pp_font = ns.createPicker("uf_player_options", "font", "uf_player_pp_font", 120, LolzenUIcfg.unitframes.player["uf_player_pp_font"], "content")
		pp_font:SetPoint("LEFT", pp_font_text, "RIGHT", -10, -3)
		pp_font.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_pp_font"] = UIDropDownMenu_GetSelectedName(pp_font)
			LolzenUI.SetUFPlayerPowerFont()
		end

		local pp_font_size_text = ns.createFontstring("uf_player_options", L["size"]..":", "content")
		pp_font_size_text:SetPoint("LEFT", pp_font, "RIGHT", -5, 3)

		local pp_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_pp_font_size"], "content")
		pp_font_size:SetPoint("LEFT", pp_font_size_text, "RIGHT", 10, 0)

		pp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_pp_font_size"] = tonumber(pp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerPowerFont()
		end)

		pp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_font_flag_text = ns.createFontstring("uf_player_options", L["flag"]..":", "content")
		pp_font_flag_text:SetPoint("LEFT", pp_font_size, "RIGHT", 10, 0)

		local pp_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_pp_font_flag", 120, LolzenUIcfg.unitframes.player["uf_player_pp_font_flag"], "content")
		pp_font_flag:SetPoint("LEFT", pp_font_flag_text, "RIGHT", -10, -3)
		pp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(pp_font_flag)]
			LolzenUI.SetUFPlayerPowerFont()
		end

		local header3 = ns.createHeader("uf_player_options", L["sub_panel_unitframes_player_classpower_and_runes_header"], "content")
		header3:SetPoint("TOPLEFT", pp_font_text, 0, -30)
		
		local classpower_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		classpower_pos_x_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -13)

		local classpower_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_classpower_posx"], "content")
		classpower_pos_x:SetPoint("LEFT", classpower_pos_x_text, "RIGHT", 10, 0)

		classpower_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		classpower_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_classpower_posx"] = tonumber(classpower_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerClassPowerPos()
		end)

		classpower_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		classpower_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local classpower_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		classpower_pos_y_text:SetPoint("LEFT", classpower_pos_x, "RIGHT", 5, 0)

		local classpower_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_classpower_posy"], "content")
		classpower_pos_y:SetPoint("LEFT", classpower_pos_y_text, "RIGHT", 10, 0)

		classpower_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		classpower_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_classpower_posy"] = tonumber(classpower_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerClassPowerPos()
		end)

		classpower_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		classpower_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local classpower_anchor1_text = ns.createFontstring("uf_player_options", L["anchor"].."1:", "content")
		classpower_anchor1_text:SetPoint("LEFT", classpower_pos_y, "RIGHT", 10, 0)

		local classpower_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_classpower_anchor1", 110, LolzenUIcfg.unitframes.player["uf_player_classpower_anchor1"], "content")
		classpower_anchor1:SetPoint("LEFT", classpower_anchor1_text, "RIGHT", -10, -3)
		classpower_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_classpower_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(classpower_anchor1)]
			LolzenUI.SetUFPlayerClassPowerPos()
		end

		local classpower_anchor2_text = ns.createFontstring("uf_player_options", L["anchor"].."2:", "content")
		classpower_anchor2_text:SetPoint("LEFT", classpower_anchor1, "RIGHT", -5, 3)

		local classpower_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_classpower_anchor2", 110, LolzenUIcfg.unitframes.player["uf_player_classpower_anchor2"], "content")
		classpower_anchor2:SetPoint("LEFT", classpower_anchor2_text, "RIGHT", -10, -3)
		classpower_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_classpower_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(classpower_anchor2)]
			LolzenUI.SetUFPlayerClassPowerPos()
		end

		local classpower_border_text = ns.createFontstring("uf_player_options", L["border"]..":", "content")
		classpower_border_text:SetPoint("TOPLEFT", classpower_pos_x_text, "BOTTOMLEFT", 0, -15)

		local classpower_border = ns.createPicker("uf_player_options", "border", "uf_player_classbar_border", 120, LolzenUIcfg.unitframes.player["uf_player_classpower_border"], "content")
		classpower_border:SetPoint("LEFT", classpower_border_text, "RIGHT", -10, -3)
		classpower_border.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_classpower_border"] = UIDropDownMenu_GetSelectedName(classpower_border)
			LolzenUI.SetUFPlayerClassPowerBorder()
		end

		local classpower_spacing_text = ns.createFontstring("uf_player_options", L["spacing"]..":", "content")
		classpower_spacing_text:SetPoint("LEFT", classpower_border, "RIGHT", -5, 3)

		local classpower_spacing = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_classpower_spacing"], "content")
		classpower_spacing:SetPoint("LEFT", classpower_spacing_text, "RIGHT", 10, 0)

		classpower_spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		classpower_spacing:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_classpower_spacing"] = tonumber(classpower_spacing:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerClassPowerPos()
		end)

		classpower_spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		classpower_spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header4 = ns.createHeader("uf_player_options", L["uf_castbar"], "content")
		header4:SetPoint("TOPLEFT", classpower_border_text, 0, -30)

		local cb2 = ns.createCheckBox("uf_player_options", "uf_player_use_castbar_standalone", "|cff5599ff"..L["uf_use_standalone_castbar"].."|r", LolzenUIcfg.unitframes.player["uf_player_cb_standalone"], "content")
		cb2:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -8)

		local cb_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		cb_pos_x_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -5)

		local cb_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_posx"], "content")
		cb_pos_x:SetPoint("LEFT", cb_pos_x_text, "RIGHT", 10, 0)

		cb_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_posx"] = tonumber(cb_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBPos()
		end)

		cb_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		cb_pos_y_text:SetPoint("LEFT", cb_pos_x, "RIGHT", 5, 0)

		local cb_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_posy"], "content")
		cb_pos_y:SetPoint("LEFT", cb_pos_y_text, "RIGHT", 10, 0)

		cb_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_posy"] = tonumber(cb_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBPos()
		end)

		cb_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_anchor1_text = ns.createFontstring("uf_player_options", L["anchor"].."1:", "content")
		cb_anchor1_text:SetPoint("LEFT", cb_pos_y, "RIGHT", 10, 0)

		local cb_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_anchor1", 110, LolzenUIcfg.unitframes.player["uf_player_cb_anchor1"], "content")
		cb_anchor1:SetPoint("LEFT", cb_anchor1_text, "RIGHT", -10, -3)
		cb_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_anchor1)]
			LolzenUI.SetUFPlayerCBPos()
		end

		local cb_anchor2_text = ns.createFontstring("uf_player_options", L["anchor"].."2:", "content")
		cb_anchor2_text:SetPoint("LEFT", cb_anchor1, "RIGHT", -5, 3)

		local cb_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_anchor2", 110, LolzenUIcfg.unitframes.player["uf_player_cb_anchor2"], "content")
		cb_anchor2:SetPoint("LEFT", cb_anchor2_text, "RIGHT", -10, -3)
		cb_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_anchor2)]
			LolzenUI.SetUFPlayerCBPos()
		end

		local cb_width_text = ns.createFontstring("uf_player_options", L["width"]..":", "content")
		cb_width_text:SetPoint("TOPLEFT", cb_pos_x_text, "BOTTOMLEFT", 0, -15)

		local cb_width = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_width"], "content")
		cb_width:SetPoint("LEFT", cb_width_text, "RIGHT", 10, 0)

		cb_width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_width"] = tonumber(cb_width:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBSize()
		end)

		cb_width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_height_text = ns.createFontstring("uf_player_options", L["height"]..":", "content")
		cb_height_text:SetPoint("LEFT", cb_width, "RIGHT", 10, 0)

		local cb_height = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_height"], "content")
		cb_height:SetPoint("LEFT", cb_height_text, "RIGHT", 10, 0)

		cb_height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_height"] = tonumber(cb_height:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBSize()
		end)

		cb_height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_color_text = ns.createFontstring("uf_player_options", L["color"]..":", "content")

		local cb_color = ns.createColorTexture("uf_player_options", 16, 16, LolzenUIcfg.unitframes.player["uf_player_cb_color"], LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		cb_color:SetPoint("LEFT", cb_color_text, "RIGHT", 10, 0)
		cb_color.setActualColors = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_color"] = {cb_color:GetVertexColor()}
			LolzenUI.SetUFPlayerCBColor()
		end

		local cb_color_f = ns.createColorPicker("uf_player_options", cb_color, LolzenUIcfg.unitframes.player["uf_player_cb_color"], "content")
		cb_color_f:SetAllPoints(cb_color)

		local cb_alpha_text = ns.createFontstring("uf_player_options", L["alpha"]..":", "content")
		cb_alpha_text:SetPoint("LEFT", cb_color, "RIGHT", 10, 0)

		local cb_alpha = ns.createPicker("uf_player_options", "alpha", "uf_player_cb_alpha", 45, LolzenUIcfg.unitframes.player["uf_player_cb_alpha"], "content")
		cb_alpha:SetPoint("LEFT", cb_alpha_text, "RIGHT", -10, -3)
		cb_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(cb_alpha)])
			LolzenUI.SetUFPlayerCBColor()
		end

		local header5 = ns.createHeader("uf_player_options", L["icon"]..":", "content")

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_standalone"] = cb2:GetChecked()
			LolzenUI.SetUFPlayerCBStandalone()
			if cb2:GetChecked() == true then
				cb_pos_x_text:Show()
				cb_pos_x:Show()
				cb_pos_y_text:Show()
				cb_pos_y:Show()
				cb_anchor1_text:Show()
				cb_anchor1:Show()
				cb_anchor2_text:Show()
				cb_anchor2:Show()
				cb_width_text:Show()
				cb_width:Show()
				cb_height_text:Show()
				cb_height:Show()
				cb_color_text:ClearAllPoints()
				cb_color_text:SetPoint("LEFT", cb_height, "RIGHT", 10, 0)
				header5:SetPoint("TOPLEFT", cb_width_text, "BOTTOMLEFT", 0, -13)
				ChangeScrollbarMinMax("uf_player_options", "+", 25)
			else
				cb_pos_x_text:Hide()
				cb_pos_x:Hide()
				cb_pos_y_text:Hide()
				cb_pos_y:Hide()
				cb_anchor1_text:Hide()
				cb_anchor1:Hide()
				cb_anchor2_text:Hide()
				cb_anchor2:Hide()
				cb_width_text:Hide()
				cb_width:Hide()
				cb_height_text:Hide()
				cb_height:Hide()
				cb_color_text:ClearAllPoints()
				cb_color_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -5)
				header5:SetPoint("TOPLEFT", cb_color_text, "BOTTOMLEFT", 0, -13)
				ChangeScrollbarMinMax("uf_player_options", "-", 25)
			end
		end)

		if cb2:GetChecked() == true then
			cb_pos_x_text:Show()
			cb_pos_x:Show()
			cb_pos_y_text:Show()
			cb_pos_y:Show()
			cb_anchor1_text:Show()
			cb_anchor1:Show()
			cb_anchor2_text:Show()
			cb_anchor2:Show()
			cb_width_text:Show()
			cb_width:Show()
			cb_height_text:Show()
			cb_height:Show()
			cb_color_text:SetPoint("LEFT", cb_height, "RIGHT", 10, 0)
			header5:SetPoint("TOPLEFT", cb_width_text, "BOTTOMLEFT", 0, -13)
			ChangeScrollbarMinMax("uf_player_options", "+", 25)
		else
			cb_pos_x_text:Hide()
			cb_pos_x:Hide()
			cb_pos_y_text:Hide()
			cb_pos_y:Hide()
			cb_anchor1_text:Hide()
			cb_anchor1:Hide()
			cb_anchor2_text:Hide()
			cb_anchor2:Hide()
			cb_width_text:Hide()
			cb_width:Hide()
			cb_height_text:Hide()
			cb_height:Hide()
			cb_color_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -5)
			header5:SetPoint("TOPLEFT", cb_color_text, "BOTTOMLEFT", 0, -13)
		end

		local cb_icon_size_text = ns.createFontstring("uf_player_options", L["size"]..":", "content")
		cb_icon_size_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 0, -8)

		local cb_icon_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_icon_size"], "content")
		cb_icon_size:SetPoint("LEFT", cb_icon_size_text, "RIGHT", 10, 0)

		cb_icon_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_icon_size"] = tonumber(cb_icon_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBIconCutAndSize()
		end)

		cb_icon_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		cb_icon_pos_x_text:SetPoint("LEFT", cb_icon_size, "RIGHT", 10, 0)

		local cb_icon_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_icon_posx"], "content")
		cb_icon_pos_x:SetPoint("LEFT", cb_icon_pos_x_text, "RIGHT", 10, 0)

		cb_icon_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_icon_posx"] = tonumber(cb_icon_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBIconPos()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		cb_icon_pos_y_text:SetPoint("LEFT", cb_icon_pos_x, "RIGHT", 5, 0)

		local cb_icon_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_icon_posy"], "content")
		cb_icon_pos_y:SetPoint("LEFT", cb_icon_pos_y_text, "RIGHT", 10, 0)

		cb_icon_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_icon_posy"] = tonumber(cb_icon_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBIconPos()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_anchor1_text = ns.createFontstring("uf_player_options", L["anchor"].."1:", "content")
		cb_icon_anchor1_text:SetPoint("LEFT", cb_icon_pos_y, "RIGHT", 10, 0)

		local cb_icon_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_icon_anchor1", 70, LolzenUIcfg.unitframes.player["uf_player_cb_icon_anchor1"], "content")
		cb_icon_anchor1:SetPoint("LEFT", cb_icon_anchor1_text, "RIGHT", -10, -3)
		cb_icon_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor1)]
			LolzenUI.SetUFPlayerCBIconPos()
		end

		local cb_icon_anchor2_text = ns.createFontstring("uf_player_options", L["anchor"].."2:", "content")
		cb_icon_anchor2_text:SetPoint("LEFT", cb_icon_anchor1, "RIGHT", -5, 3)

		local cb_icon_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_icon_anchor2", 70, LolzenUIcfg.unitframes.player["uf_player_cb_icon_anchor2"], "content")
		cb_icon_anchor2:SetPoint("LEFT", cb_icon_anchor2_text, "RIGHT", -10, -3)
		cb_icon_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			LolzenUI.SetUFPlayerCBIconPos()
		end

		local cb3 = ns.createCheckBox("uf_player_options", "uf_player_use_castbar_icon_cut", "|cff5599ff"..L["uf_trim_castbar_icon"].."|r", LolzenUIcfg.unitframes.player["uf_player_cb_icon_cut"], "content")
		cb3:SetPoint("TOPLEFT", cb_icon_size_text, "BOTTOMLEFT", 0, -8)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_icon_cut"] = cb3:GetChecked()
			LolzenUI.SetUFPlayerCBIconCutAndSize()
		end)

		local header6 = ns.createHeader("uf_player_options", L["time"]..":", "content")
		header6:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -8)

		local cb_time_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		cb_time_pos_x_text:SetPoint("TOPLEFT", header6, "BOTTOMLEFT", 0, -8)

		local cb_time_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_time_posx"], "content")
		cb_time_pos_x:SetPoint("LEFT", cb_time_pos_x_text, "RIGHT", 10, 0)

		cb_time_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_time_posx"] = tonumber(cb_time_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBTimePos()
		end)

		cb_time_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		cb_time_pos_y_text:SetPoint("LEFT", cb_time_pos_x, "RIGHT", 5, 0)

		local cb_time_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_time_posy"], "content")
		cb_time_pos_y:SetPoint("LEFT", cb_time_pos_y_text, "RIGHT", 10, 0)

		cb_time_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_time_posy"] = tonumber(cb_time_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBTimePos()
		end)

		cb_time_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_anchor1_text = ns.createFontstring("uf_player_options", L["anchor"].."1:", "content")
		cb_time_anchor1_text:SetPoint("LEFT", cb_time_pos_y, "RIGHT", 10, 0)

		local cb_time_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_time_anchor1", 110, LolzenUIcfg.unitframes.player["uf_player_cb_time_anchor1"], "content")
		cb_time_anchor1:SetPoint("LEFT", cb_time_anchor1_text, "RIGHT", -10, -3)
		cb_time_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor1)]
			LolzenUI.SetUFPlayerCBTimePos()
		end

		local cb_time_anchor2_text = ns.createFontstring("uf_player_options", L["anchor"].."2:", "content")
		cb_time_anchor2_text:SetPoint("LEFT", cb_time_anchor1, "RIGHT", -5, 3)		
	
		local cb_time_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_time_anchor2", 110, LolzenUIcfg.unitframes.player["uf_player_cb_time_anchor2"], "content")
		cb_time_anchor2:SetPoint("LEFT", cb_time_anchor2_text, "RIGHT", -10, -3)
		cb_time_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			LolzenUI.SetUFPlayerCBTimePos()
		end

		local header7 = ns.createHeader("uf_player_options", L["text"]..":", "content")
		header7:SetPoint("TOPLEFT", cb_time_pos_x_text, "BOTTOMLEFT", 0, -13)

		local cb_text_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		cb_text_pos_x_text:SetPoint("TOPLEFT", header7, "BOTTOMLEFT", 0, -8)

		local cb_text_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_text_posx"], "content")
		cb_text_pos_x:SetPoint("LEFT", cb_text_pos_x_text, "RIGHT", 10, 0)

		cb_text_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_text_posx"] = tonumber(cb_text_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBTextPos()
		end)

		cb_text_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		cb_text_pos_y_text:SetPoint("LEFT", cb_text_pos_x, "RIGHT", 5, 0)

		local cb_text_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_text_posy"], "content")
		cb_text_pos_y:SetPoint("LEFT", cb_text_pos_y_text, "RIGHT", 10, 0)

		cb_text_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_text_posy"] = tonumber(cb_text_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBTextPos()
		end)

		cb_text_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_anchor1_text = ns.createFontstring("uf_player_options", L["anchor"].."1:", "content")
		cb_text_anchor1_text:SetPoint("LEFT", cb_text_pos_y, "RIGHT", 10, 0)

		local cb_text_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_text_anchor1", 110, LolzenUIcfg.unitframes.player["uf_player_cb_text_anchor1"], "content")
		cb_text_anchor1:SetPoint("LEFT", cb_text_anchor1_text, "RIGHT", -10, -3)
		cb_text_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor1)]
			LolzenUI.SetUFPlayerCBTextPos()
		end

		local cb_text_anchor2_text = ns.createFontstring("uf_player_options", L["anchor"].."2:", "content")
		cb_text_anchor2_text:SetPoint("LEFT", cb_text_anchor1, "RIGHT", -5, 3)

		local cb_text_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_text_anchor2", 110, LolzenUIcfg.unitframes.player["uf_player_cb_text_anchor2"], "content")
		cb_text_anchor2:SetPoint("LEFT", cb_text_anchor2_text, "RIGHT", -10, -3)
		cb_text_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			LolzenUI.SetUFPlayerCBTextPos()
		end

		local header8 = ns.createHeader("uf_player_options", L["uf_time_and_spellname_header"]..":", "content")
		header8:SetPoint("TOPLEFT", cb_text_pos_x_text, "BOTTOMLEFT", 0, -13)

		local cb_font = ns.createPicker("uf_player_options", "font", "uf_player_cb_font", 120, LolzenUIcfg.unitframes.player["uf_player_cb_font"], "content")
		cb_font:SetPoint("TOPLEFT", header8, "BOTTOMLEFT", -20, -8)
		cb_font.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_font"] = UIDropDownMenu_GetSelectedName(cb_font)
			LolzenUI.SetUFPlayerCBTextFont()
		end

		local cb_font_size_text = ns.createFontstring("uf_player_options", L["size"]..":", "content")
		cb_font_size_text:SetPoint("LEFT", cb_font, "RIGHT", -5, 3)

		local cb_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_cb_font_size"], "content")
		cb_font_size:SetPoint("LEFT", cb_font_size_text, "RIGHT", 10, 0)

		cb_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_cb_font_size"] = tonumber(cb_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerCBTextFont()
		end)

		cb_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_font_flag_text = ns.createFontstring("uf_player_options", L["flag"]..":", "content")
		cb_font_flag_text:SetPoint("LEFT", cb_font_size, "RIGHT", 10, 0)

		local cb_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_cb_font_flag", 120, LolzenUIcfg.unitframes.player["uf_player_cb_font_flag"], "content")
		cb_font_flag:SetPoint("LEFT", cb_font_flag_text, "RIGHT", -10, -3)
		cb_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_font_flag)]
			LolzenUI.SetUFPlayerCBTextFont()
		end

		local cb_font_color_text = ns.createFontstring("uf_player_options", L["color"]..":", "content")
		cb_font_color_text:SetPoint("LEFT", cb_font_flag, "RIGHT", -10, 3)

		local cb_font_color = ns.createColorTexture("uf_player_options", 16, 16, LolzenUIcfg.unitframes.player["uf_player_cb_font_color"], LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		cb_font_color:SetPoint("LEFT", cb_font_color_text, "RIGHT", 10, 0)
		cb_font_color.setActualColors = function()
			LolzenUIcfg.unitframes.player["uf_player_cb_font_color"] = {cb_font_color:GetVertexColor()}
			LolzenUI.SetUFPlayerCBTextColor()
		end

		local cb_font_color_f = ns.createColorPicker("uf_player_options", cb_font_color, LolzenUIcfg.unitframes.player["uf_player_cb_font_color"], "content")
		cb_font_color_f:SetAllPoints(cb_font_color)

		local header9 = ns.createHeader("uf_player_options", L["uf_restingindicator_header"], "content")
		header9:SetPoint("TOPLEFT", cb_font, "BOTTOMLEFT", 17, -8)

		local cb4 = ns.createCheckBox("uf_player_options", "uf_player_ri", "|cff5599ff"..L["uf_show_restingindicator"].."|r", LolzenUIcfg.unitframes.player["uf_player_show_restingindicator"], "content")
		cb4:SetPoint("TOPLEFT", header9, "BOTTOMLEFT", 0, -8)
		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.player["uf_player_show_restingindicator"] = cb4:GetChecked()
			LolzenUI.SetUFPlayerRestingIndicator()
		end)

		local resting_size_text = ns.createFontstring("uf_player_options", L["size"]..":", "content")
		resting_size_text:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, -8)

		local resting_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_resting_size"], "content")
		resting_size:SetPoint("LEFT", resting_size_text, "RIGHT", 10, 0)

		resting_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		resting_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_resting_size"] = tonumber(resting_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerRISize()
		end)

		resting_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		resting_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local resting_pos_x_text = ns.createFontstring("uf_player_options", L["PosX"]..":", "content")
		resting_pos_x_text:SetPoint("LEFT", resting_size, "RIGHT", 10, 0)

		local resting_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_resting_posx"], "content")
		resting_pos_x:SetPoint("LEFT", resting_pos_x_text, "RIGHT", 10, 0)

		resting_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		resting_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_resting_posx"] = tonumber(resting_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerRIPos()
		end)

		resting_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		resting_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local resting_pos_y_text = ns.createFontstring("uf_player_options", L["PosY"]..":", "content")
		resting_pos_y_text:SetPoint("LEFT", resting_pos_x, "RIGHT", 10, 0)

		local resting_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes.player["uf_player_resting_posy"], "content")
		resting_pos_y:SetPoint("LEFT", resting_pos_y_text, "RIGHT", 10, 0)

		resting_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		resting_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.player["uf_player_resting_posy"] = tonumber(resting_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFPlayerRIPos()
		end)

		resting_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		resting_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local resting_anchor_text = ns.createFontstring("uf_player_options", L["anchor"]..":", "content")
		resting_anchor_text:SetPoint("LEFT", resting_pos_y, "RIGHT", 10, 0)

		local resting_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_resting_anchor", 120, LolzenUIcfg.unitframes.player["uf_player_resting_anchor"], "content")
		resting_anchor:SetPoint("LEFT", resting_anchor_text, "RIGHT", -10, -3)
		resting_anchor.OnClick = function()
			LolzenUIcfg.unitframes.player["uf_player_resting_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(resting_anchor)]
			LolzenUI.SetUFPlayerRIPos()
		end

		ns["uf_player_options"].default = function(self)
			LolzenUIcfg.unitframes.player = _G["LolzenUIdefaultcfg"].unitframes.player
			ReloadUI()
		end
	end
end)