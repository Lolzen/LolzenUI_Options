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

		-- // Create a subcategory panel for Boss // --
		ns.uf_boss_options = CreateFrame("Frame", "unitframe_bosspanel", ns["unitframes"])
		ns.uf_boss_options.name = "   "..L["sub_panel_unitframes_boss"]
		ns.uf_boss_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_boss_options)

		local title = ns.createTitle("uf_boss_options", L["sub_panel_unitframes_boss_title"])

		local scrollFrame = ns.createScrollFrame("uf_boss_options", 48)

		local width_text = ns.createFontstring("uf_boss_options", L["width"]..":", "content")
		width_text:SetPoint("TOPLEFT", ns.uf_boss_options.content, 16, -16)

		local width = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes.boss["uf_boss_width"], "content")
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		local width = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes.player["uf_player_width"], "content")
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_width"] = tonumber(width:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerSize()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local height_text = ns.createFontstring("uf_boss_options", L["height"]..":", "content")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local height = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes.boss["uf_boss_height"], "content")
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerSize()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local growth_text = ns.createFontstring("uf_boss_options", L["sub_panel_unitframes_boss_placement"]..":", "content")
		growth_text:SetPoint("TOPLEFT", width_text, "BOTTOMLEFT", 0, -10)

		local growth = ns.createPicker("uf_boss_options", "growth", "uf_boss_additional_boss_anchor", 110, LolzenUIcfg.unitframes.boss["uf_boss_additional_pos"], "content")
		growth:SetPoint("LEFT", growth_text, "RIGHT", -10, -3)
		growth.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			--LolzenUI.SetUFPlayerHPFont()
		end

		local growth_spacing_text = ns.createFontstring("uf_boss_options", L["spacing"]..":", "content")
		growth_spacing_text:SetPoint("LEFT", growth, "RIGHT", -10, 3)

		local growth_spacing = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes.boss["uf_boss_additional_spacing"], "content")
		growth_spacing:SetPoint("LEFT", growth_spacing_text, "RIGHT", 10, 0)

		growth_spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		growth_spacing:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerSize()
		end)

		growth_spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		growth_spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb1 = ns.createCheckBox("uf_boss_options", "uf_boss_show_power", "|cff5599ff"..L["sub_panel_unitframes_boss_show_power"].."|r", LolzenUIcfg.unitframes.boss["uf_boss_show_power"], "content")
		cb1:SetPoint("TOPLEFT", growth_text, "BOTTOMLEFT", 0, -8)

		local header1 = ns.createHeader("uf_boss_options", L["uf_healthpoints"], "content")
		header1:SetPoint("TOPLEFT", cb1, 0, -30)

		local cb2 = ns.createCheckBox("uf_boss_options", "uf_boss_use_custom_font_hp", "|cff5599ff"..L["uf_healthpoints_overwrite_global_settings"].."|r", LolzenUIcfg.unitframes.boss["uf_boss_use_own_hp_font_settings"], "content")
		cb2:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		cb2:SetScript("OnClick", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_use_own_hp_font_settings"] = cb1:GetChecked()
			--LolzenUI.SetUFPlayerOwnFont()
		end)

		local hp_pos_x_text = ns.createFontstring("uf_boss_options", L["PosX"]..":", "content")
		hp_pos_x_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -8)

		local hp_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_hp_posx"], "content")
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		hp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_x:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_hp_posx"] = tonumber(hp_pos_x:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerHPPos()
		end)

		hp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_pos_y_text = ns.createFontstring("uf_boss_options", L["PosY"]..":", "content")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_hp_posy"], "content")
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		hp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_y:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_hp_posy"] = tonumber(hp_pos_y:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerHPPos()
		end)

		hp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_anchor_text = ns.createFontstring("uf_boss_options", L["anchor"]..":", "content")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_hp_anchor", 110, LolzenUIcfg.unitframes.boss["uf_boss_hp_anchor"], "content")
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)
		hp_anchor.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			--LolzenUI.SetUFPlayerHPPos()
		end

		local hp_font_text = ns.createFontstring("uf_boss_options", L["font"]..":", "content")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_boss_options", "font", "uf_boss_hp_font", 120, LolzenUIcfg.unitframes.boss["uf_boss_hp_font"], "content")
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)
		hp_font.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			--LolzenUI.SetUFPlayerHPFont()
		end

		local hp_font_size_text = ns.createFontstring("uf_boss_options", L["size"]..":", "content")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_hp_font_size"], "content")
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		hp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_font_size:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_hp_font_size"] = tonumber(hp_font_size:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerHPFont()
		end)

		hp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_font_flag_text = ns.createFontstring("uf_boss_options", L["flag"]..":", "content")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_hp_font_flag", 120, LolzenUIcfg.unitframes.boss["uf_boss_hp_font_flag"], "content")
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)
		hp_font_flag.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			--LolzenUI.SetUFPlayerHPFont()
		end

		local header2 = ns.createHeader("uf_boss_options", L["uf_powerpoints"], "content")
		header2:SetPoint("TOPLEFT", hp_font_text, 0, -30)

		local pp_pos_x_text = ns.createFontstring("uf_boss_options", L["PosX"]..":", "content")
		pp_pos_x_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local pp_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_pp_posx"], "content")
		pp_pos_x:SetPoint("LEFT", pp_pos_x_text, "RIGHT", 10, 0)

		pp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_pos_x:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_pp_posx"] = tonumber(pp_pos_x:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerPowerPos()
		end)

		pp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_pos_y_text = ns.createFontstring("uf_boss_options", L["PosY"]..":", "content")
		pp_pos_y_text:SetPoint("LEFT", pp_pos_x, "RIGHT", 5, 0)

		local pp_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_pp_posy"], "content")
		pp_pos_y:SetPoint("LEFT", pp_pos_y_text, "RIGHT", 10, 0)

		pp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_pos_y:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_pp_posy"] = tonumber(pp_pos_y:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerPowerPos()
		end)

		pp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_anchor_text = ns.createFontstring("uf_boss_options", L["anchor"].."1:", "content")
		pp_anchor_text:SetPoint("TOPLEFT", pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local pp_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_pp_anchor", 90, LolzenUIcfg.unitframes.boss["uf_boss_pp_anchor"], "content")
		pp_anchor:SetPoint("LEFT", pp_anchor_text, "RIGHT", -10, -3)
		pp_anchor.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor)]
			--LolzenUI.SetUFPlayerPowerPos()
		end

		local pp_parent_text = ns.createFontstring("uf_boss_options", L["parent"]..":", "content")
		pp_parent_text:SetPoint("LEFT", pp_anchor, "RIGHT", -10, 3)

		local pp_parent = ns.createPicker("uf_boss_options", "uf_parent", "uf_boss_pp_parent", 50, LolzenUIcfg.unitframes.boss["uf_boss_pp_parent"], "content")
		pp_parent:SetPoint("LEFT", pp_parent_text, "RIGHT", -10, -3)
		pp_parent.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(pp_parent)]
			--LolzenUI.SetUFPlayerPowerPos()
		end

		local pp_anchor2_text = ns.createFontstring("uf_boss_options", L["anchor"].."2:", "content")
		pp_anchor2_text:SetPoint("LEFT", pp_parent, "RIGHT", -10, 3)

		local pp_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_pp_anchor2", 90, LolzenUIcfg.unitframes.boss["uf_boss_pp_anchor2"], "content")
		pp_anchor2:SetPoint("LEFT", pp_anchor2_text, "RIGHT", -10, -3)
		pp_anchor2.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor2)]
			--LolzenUI.SetUFPlayerPowerPos()
		end

		local pp_font_text = ns.createFontstring("uf_boss_options", L["font"]..":", "content")
		pp_font_text:SetPoint("TOPLEFT", pp_anchor_text, "BOTTOMLEFT", 0, -15)

		local pp_font = ns.createPicker("uf_boss_options", "font", "uf_boss_pp_font", 120, LolzenUIcfg.unitframes.boss["uf_boss_pp_font"], "content")
		pp_font:SetPoint("LEFT", pp_font_text, "RIGHT", -10, -3)
		pp_font.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_pp_font"] = UIDropDownMenu_GetSelectedName(pp_font)
			--LolzenUI.SetUFPlayerPowerFont()
		end

		local pp_font_size_text = ns.createFontstring("uf_boss_options", L["size"]..":", "content")
		pp_font_size_text:SetPoint("LEFT", pp_font, "RIGHT", -5, 3)

		local pp_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_pp_font_size"], "content")
		pp_font_size:SetPoint("LEFT", pp_font_size_text, "RIGHT", 10, 0)

		pp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_font_size:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.player["uf_player_pp_font_size"] = tonumber(pp_font_size:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFPlayerPowerFont()
		end)

		pp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_font_flag_text = ns.createFontstring("uf_boss_options", L["flag"]..":", "content")
		pp_font_flag_text:SetPoint("LEFT", pp_font_size, "RIGHT", 10, 0)

		local pp_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_pp_font_flag", 120, LolzenUIcfg.unitframes.boss["uf_boss_pp_font_flag"], "content")
		pp_font_flag:SetPoint("LEFT", pp_font_flag_text, "RIGHT", -10, -3)
		pp_font_flag.OnClick = function()
			--LolzenUIcfg.unitframes.player["uf_player_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(pp_font_flag)]
			--LolzenUI.SetUFPlayerPowerFont()
		end

		local header3 = ns.createHeader("uf_boss_options", L["auras"], "content")

		cb1:SetScript("OnClick", function(self)
			if cb1:GetChecked() == true then
				header2:Show()
				pp_pos_x_text:Show()
				pp_pos_x:Show()
				pp_pos_y_text:Show()
				pp_pos_y:Show()
				pp_anchor_text:Show()
				pp_anchor:Show()
				pp_parent_text:Show()
				pp_parent:Show()
				pp_anchor2_text:Show()
				pp_anchor2:Show()
				pp_font_text:Show()
				pp_font:Show()
				pp_font_size_text:Show()
				pp_font_size:Show()
				pp_font_flag_text:Show()
				pp_font_flag:Show()
				header3:SetPoint("TOPLEFT", pp_font_text, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "+", 100)
			else
				header2:Hide()
				pp_pos_x_text:Hide()
				pp_pos_x:Hide()
				pp_pos_y_text:Hide()
				pp_pos_y:Hide()
				pp_anchor_text:Hide()
				pp_anchor:Hide()
				pp_parent_text:Hide()
				pp_parent:Hide()
				pp_anchor2_text:Hide()
				pp_anchor2:Hide()
				pp_font_text:Hide()
				pp_font:Hide()
				pp_font_size_text:Hide()
				pp_font_size:Hide()
				pp_font_flag_text:Hide()
				pp_font_flag:Hide()
				header3:SetPoint("TOPLEFT", hp_font_text, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "-", 100)
			end
		end)

		if cb1:GetChecked() == true then
			header2:Show()
			pp_pos_x_text:Show()
			pp_pos_x:Show()
			pp_pos_y_text:Show()
			pp_pos_y:Show()
			pp_anchor_text:Show()
			pp_anchor:Show()
			pp_parent_text:Show()
			pp_parent:Show()
			pp_anchor2_text:Show()
			pp_anchor2:Show()
			pp_font_text:Show()
			pp_font:Show()
			pp_font_size_text:Show()
			pp_font_size:Show()
			pp_font_flag_text:Show()
			pp_font_flag:Show()
			header3:SetPoint("TOPLEFT", pp_font_text, 0, -30)
			ChangeScrollbarMinMax("uf_boss_options", "+", 100)
		else
			header2:Hide()
			pp_pos_x_text:Hide()
			pp_pos_x:Hide()
			pp_pos_y_text:Hide()
			pp_pos_y:Hide()
			pp_anchor_text:Hide()
			pp_anchor:Hide()
			pp_parent_text:Hide()
			pp_parent:Hide()
			pp_anchor2_text:Hide()
			pp_anchor2:Hide()
			pp_font_text:Hide()
			pp_font:Hide()
			pp_font_size_text:Hide()
			pp_font_size:Hide()
			pp_font_flag_text:Hide()
			pp_font_flag:Hide()
			header3:SetPoint("TOPLEFT", hp_font_text, 0, -30)
		end

		local aura_type_text = ns.createFontstring("uf_boss_options", L["show"]..":", "content")
		aura_type_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local aura_type = ns.createPicker("uf_boss_options", "uf_auratype", "uf_boss_aura_type", 70, LolzenUIcfg.unitframes.boss["uf_boss_aura_show_type"], "content")
		aura_type:SetPoint("LEFT", aura_type_text, "RIGHT", -10, -3)
		aura_type.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(aura_type)]
			--LolzenUI.SetUFTargetAuraType()
		end

		local aura_maxnum_text = ns.createFontstring("uf_boss_options", L["show_max_0_to_40"]..":", "content")
		aura_maxnum_text:SetPoint("LEFT", aura_type, "RIGHT", -5, 3)

		local aura_maxnum = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_aura_maxnum"], "content")
		aura_maxnum:SetPoint("LEFT", aura_maxnum_text, "RIGHT", 10, 0)

		aura_maxnum:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_maxnum:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_aura_maxnum"] = tonumber(aura_maxnum:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetAuraNum()
		end)

		aura_maxnum:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_maxnum:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_spacing_text = ns.createFontstring("uf_boss_options", L["spacing"]..":", "content")
		aura_spacing_text:SetPoint("LEFT", aura_maxnum, "RIGHT", 10, 0)

		local aura_spacing = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_aura_spacing"], "content")
		aura_spacing:SetPoint("LEFT", aura_spacing_text, "RIGHT", 10, 0)

		aura_spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_spacing:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_aura_spacing"] = tonumber(aura_spacing:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetAuraSpacing()
		end)

		aura_spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_size_text = ns.createFontstring("uf_boss_options", L["size"]..":", "content")
		aura_size_text:SetPoint("LEFT", aura_spacing, "RIGHT", 10, 0)

		local aura_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_aura_size"], "content")
		aura_size:SetPoint("LEFT", aura_size_text, "RIGHT", 10, 0)

		aura_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_size:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_aura_size"] = tonumber(aura_size:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTagetAuraSize()
		end)

		aura_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_pos_x_text = ns.createFontstring("uf_boss_options", L["PosX"]..":", "content")
		aura_pos_x_text:SetPoint("TOPLEFT", aura_type_text, "BOTTOMLEFT", 0, -15)

		local aura_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_aura_posx"], "content")
		aura_pos_x:SetPoint("LEFT", aura_pos_x_text, "RIGHT", 10, 0)

		aura_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_pos_x:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_aura_posx"] = tonumber(aura_pos_x:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetAuraPos()
		end)

		aura_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_pos_y_text = ns.createFontstring("uf_boss_options", L["PosY"]..":", "content")
		aura_pos_y_text:SetPoint("LEFT", aura_pos_x, "RIGHT", 5, 0)

		local aura_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_aura_posy"], "content")
		aura_pos_y:SetPoint("LEFT", aura_pos_y_text, "RIGHT", 10, 0)

		aura_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_pos_y:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_aura_posy"] = tonumber(aura_pos_y:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetAuraPos()
		end)

		aura_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_anchor_text = ns.createFontstring("uf_boss_options", L["anchor"].."1:", "content")
		aura_anchor_text:SetPoint("LEFT", aura_pos_y, "RIGHT", 5, 0)

		local aura_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_aura_anchor", 90, LolzenUIcfg.unitframes.boss["uf_boss_aura_anchor1"], "content")
		aura_anchor:SetPoint("LEFT", aura_anchor_text, "RIGHT", -10, -3)
		aura_anchor.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor)]
			--LolzenUI.SetUFTargetAuraPos()
		end

		local aura_anchor2_text = ns.createFontstring("uf_boss_options", L["anchor"].."2:", "content")
		aura_anchor2_text:SetPoint("LEFT", aura_anchor, "RIGHT", -10, 3)

		local aura_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_aura_anchor2", 90, LolzenUIcfg.unitframes.boss["uf_boss_aura_anchor2"], "content")
		aura_anchor2:SetPoint("LEFT", aura_anchor2_text, "RIGHT", -10, -3)
		aura_anchor2.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor2)]
			--LolzenUI.SetUFTargetAuraPos()
		end

		local aura_growthx_text = ns.createFontstring("uf_boss_options", L["growth_x"]..":", "content")
		aura_growthx_text:SetPoint("TOPLEFT", aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		local aura_growthx = ns.createPicker("uf_boss_options", "uf_auragrowth_x", "uf_boss_aura_growthx", 70, LolzenUIcfg.unitframes.boss["uf_boss_aura_growth_x"], "content")
		aura_growthx:SetPoint("LEFT", aura_growthx_text, "RIGHT", -10, -3)
		aura_growthx.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(aura_growthx)]
			--LolzenUI.SetUFTargetAuraGrowth()
		end

		local aura_growthy_text = ns.createFontstring("uf_boss_options", L["growth_y"]..":", "content")
		aura_growthy_text:SetPoint("LEFT", aura_growthx, "RIGHT", -5, 3)

		local aura_growthy = ns.createPicker("uf_boss_options", "uf_auragrowth_y", "uf_boss_aura_growthy", 70, LolzenUIcfg.unitframes.boss["uf_boss_aura_growth_y"], "content")
		aura_growthy:SetPoint("LEFT", aura_growthy_text, "RIGHT", -10, -3)
		aura_growthy.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(aura_growthy)]
			--LolzenUI.SetUFTargetAuraGrowth()
		end

		local cb3 = ns.createCheckBox("uf_boss_options", "uf_boss_show_only_player_auras", "|cff5599ff"..L["show_only_player_auras"].."|r", LolzenUIcfg.unitframes.boss["uf_boss_aura_show_only_player"], "content")
		cb3:SetPoint("TOPLEFT", aura_growthx_text, "BOTTOMLEFT", 0, -8)

		local cb4 = ns.createCheckBox("uf_boss_options", "uf_boss_desature_nonplayer_auras", "|cff5599ff"..L["desature_auras_not_by_player"].."|r", LolzenUIcfg.unitframes.boss["uf_boss_aura_desature_nonplayer_auras"], "content")
		cb4:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, 0)

		cb4:SetScript("OnClick", function(self)

		end)

		local header4 = ns.createHeader("uf_boss_options", L["uf_castbar"], "content")

		cb3:SetScript("OnClick", function(self)
			if cb3:GetChecked() == true then
				cb4:Hide()
				header4:SetPoint("TOPLEFT", cb3, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "-", 24)
			else
				cb4:Show()
				header4:SetPoint("TOPLEFT", cb4, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "+", 24)
			end
		end)

		if cb3:GetChecked() == true then
			cb4:Hide()
			header4:SetPoint("TOPLEFT", cb3, 0, -30)
		else
			cb4:Show()
			header4:SetPoint("TOPLEFT", cb4, 0, -30)
			ChangeScrollbarMinMax("uf_boss_options", "+", 24)
		end

		local cb_color_text = ns.createFontstring("uf_boss_options", L["color"]..":", "content")
		cb_color_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -8)

		local cb_color = ns.createColorTexture("uf_boss_options", 16, 16, LolzenUIcfg.unitframes.boss["uf_boss_cb_color"], LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		cb_color:SetPoint("LEFT", cb_color_text, "RIGHT", 10, 0)
		cb_color.setActualColors = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_color"] = {cb_color:GetVertexColor()}
			--LolzenUI.SetUFTargetCBColor()
		end

		local cb_color_f = ns.createColorPicker("uf_boss_options", cb_color, LolzenUIcfg.unitframes.boss["uf_boss_cb_color"], "content")
		cb_color_f:SetAllPoints(cb_color)

		local cb_alpha_text = ns.createFontstring("uf_boss_options", L["alpha"]..":", "content")
		cb_alpha_text:SetPoint("LEFT", cb_color, "RIGHT", 10, 0)

		local cb_alpha = ns.createPicker("uf_boss_options", "alpha", "uf_boss_cb_alpha", 45, LolzenUIcfg.unitframes.boss["uf_boss_cb_alpha"], "content")
		cb_alpha:SetPoint("LEFT", cb_alpha_text, "RIGHT", -10, -3)
		cb_alpha.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(cb_alpha)])
			--LolzenUI.SetUFTargetCBColor()
		end

		local header5 = ns.createHeader("uf_boss_options", L["icon"]..":", "content")
		header5:SetPoint("TOPLEFT", cb_color_text, "BOTTOMLEFT", 0, -12)

		local cb_icon_size_text = ns.createFontstring("uf_boss_options", L["size"]..":", "content")
		cb_icon_size_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 0, -8)

		local cb_icon_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_size"], "content")
		cb_icon_size:SetPoint("LEFT", cb_icon_size_text, "RIGHT", 10, 0)

		cb_icon_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_size:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_icon_size"] = tonumber(cb_icon_size:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBIconCutAndSize()
		end)

		cb_icon_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_x_text = ns.createFontstring("uf_boss_options", L["PosX"]..":", "content")
		cb_icon_pos_x_text:SetPoint("LEFT", cb_icon_size, "RIGHT", 10, 0)

		local cb_icon_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_posx"], "content")
		cb_icon_pos_x:SetPoint("LEFT", cb_icon_pos_x_text, "RIGHT", 10, 0)

		cb_icon_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_x:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_icon_posx"] = tonumber(cb_icon_pos_x:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBIconPos()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_y_text = ns.createFontstring("uf_boss_options", L["PosY"]..":", "content")
		cb_icon_pos_y_text:SetPoint("LEFT", cb_icon_pos_x, "RIGHT", 5, 0)

		local cb_icon_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_posy"], "content")
		cb_icon_pos_y:SetPoint("LEFT", cb_icon_pos_y_text, "RIGHT", 10, 0)

		cb_icon_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_y:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_icon_posy"] = tonumber(cb_icon_pos_y:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBIconPos()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_anchor1_text = ns.createFontstring("uf_boss_options", L["anchor"].."1:", "content")
		cb_icon_anchor1_text:SetPoint("LEFT", cb_icon_pos_y, "RIGHT", 10, 0)

		local cb_icon_anchor1 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_icon_anchor1", 70, LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_anchor1"], "content")
		cb_icon_anchor1:SetPoint("LEFT", cb_icon_anchor1_text, "RIGHT", -10, -3)
		cb_icon_anchor1.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor1)]
			--LolzenUI.SetUFTargetCBIconPos()
		end

		local cb_icon_anchor2_text = ns.createFontstring("uf_boss_options", L["anchor"].."2:", "content")
		cb_icon_anchor2_text:SetPoint("LEFT", cb_icon_anchor1, "RIGHT", -5, 3)

		local cb_icon_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_icon_anchor2", 70, LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_anchor2"], "content")
		cb_icon_anchor2:SetPoint("LEFT", cb_icon_anchor2_text, "RIGHT", -10, -3)
		cb_icon_anchor2.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			--LolzenUI.SetUFTargetCBIconPos()
		end

		local cb5 = ns.createCheckBox("uf_boss_options", "uf_boss_use_castbar_icon_cut", "|cff5599ff"..L["uf_trim_castbar_icon"].."|r", LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_cut"], "content")
		cb5:SetPoint("TOPLEFT", cb_icon_size_text, "BOTTOMLEFT", 0, -8)

		cb5:SetScript("OnClick", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_icon_cut"] = cb5:GetChecked()
			--LolzenUI.SetUFTargetCBIconCutAndSize()
		end)

		local header6 = ns.createHeader("uf_boss_options", L["time"]..":", "content")
		header6:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, -8)

		local cb_time_pos_x_text = ns.createFontstring("uf_boss_options", L["PosX"]..":", "content")
		cb_time_pos_x_text:SetPoint("TOPLEFT", header6, "BOTTOMLEFT", 0, -8)

		local cb_time_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_time_posx"], "content")
		cb_time_pos_x:SetPoint("LEFT", cb_time_pos_x_text, "RIGHT", 10, 0)

		cb_time_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_x:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_time_posx"] = tonumber(cb_time_pos_x:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBTimePos()
		end)

		cb_time_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_pos_y_text = ns.createFontstring("uf_boss_options", L["PosY"]..":", "content")
		cb_time_pos_y_text:SetPoint("LEFT", cb_time_pos_x, "RIGHT", 5, 0)

		local cb_time_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_time_posy"], "content")
		cb_time_pos_y:SetPoint("LEFT", cb_time_pos_y_text, "RIGHT", 10, 0)

		cb_time_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_y:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_time_posy"] = tonumber(cb_time_pos_y:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBTimePos()
		end)

		cb_time_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_anchor1_text = ns.createFontstring("uf_boss_options", L["anchor"].."1:", "content")
		cb_time_anchor1_text:SetPoint("LEFT", cb_time_pos_y, "RIGHT", 10, 0)

		local cb_time_anchor1 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_time_anchor1", 110, LolzenUIcfg.unitframes.boss["uf_boss_cb_time_anchor1"], "content")
		cb_time_anchor1:SetPoint("LEFT", cb_time_anchor1_text, "RIGHT", -10, -3)
		cb_time_anchor1.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor1)]
			--LolzenUI.SetUFTargetCBTimePos()
		end

		local cb_time_anchor2_text = ns.createFontstring("uf_boss_options", L["anchor"].."2:", "content")
		cb_time_anchor2_text:SetPoint("LEFT", cb_time_anchor1, "RIGHT", -5, 3)

		local cb_time_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_time_anchor2", 110, LolzenUIcfg.unitframes.boss["uf_boss_cb_time_anchor2"], "content")
		cb_time_anchor2:SetPoint("LEFT", cb_time_anchor2_text, "RIGHT", -10, -3)
		cb_time_anchor2.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			--LolzenUI.SetUFTargetCBTimePos()
		end

		local header7 = ns.createHeader("uf_boss_options", L["text"]..":", "content")
		header7:SetPoint("TOPLEFT", cb_time_pos_x_text, "BOTTOMLEFT", 0, -13)

		local cb_text_pos_x_text = ns.createFontstring("uf_boss_options", L["PosX"]..":", "content")
		cb_text_pos_x_text:SetPoint("TOPLEFT", header7, "BOTTOMLEFT", 0, -8)

		local cb_text_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_text_posx"], "content")
		cb_text_pos_x:SetPoint("LEFT", cb_text_pos_x_text, "RIGHT", 10, 0)

		cb_text_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_x:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_text_posx"] = tonumber(cb_text_pos_x:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBTextPos()
		end)

		cb_text_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_pos_y_text = ns.createFontstring("uf_boss_options", L["PosY"]..":", "content")
		cb_text_pos_y_text:SetPoint("LEFT", cb_text_pos_x, "RIGHT", 5, 0)

		local cb_text_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_text_posy"], "content")
		cb_text_pos_y:SetPoint("LEFT", cb_text_pos_y_text, "RIGHT", 10, 0)

		cb_text_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_y:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_text_posy"] = tonumber(cb_text_pos_y:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBTextPos()
		end)

		cb_text_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_anchor1_text = ns.createFontstring("uf_boss_options", L["anchor"].."1:", "content")
		cb_text_anchor1_text:SetPoint("LEFT", cb_text_pos_y, "RIGHT", 10, 0)

		local cb_text_anchor1 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_text_anchor1", 110, LolzenUIcfg.unitframes.boss["uf_boss_cb_text_anchor1"], "content")
		cb_text_anchor1:SetPoint("LEFT", cb_text_anchor1_text, "RIGHT", -10, -3)
		cb_text_anchor1.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor1)]
			--LolzenUI.SetUFTargetCBTextPos()
		end

		local cb_text_anchor2_text = ns.createFontstring("uf_boss_options", L["anchor"].."2:", "content")
		cb_text_anchor2_text:SetPoint("LEFT", cb_text_anchor1, "RIGHT", -5, 3)

		local cb_text_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_text_anchor2", 110, LolzenUIcfg.unitframes.boss["uf_boss_cb_text_anchor2"], "content")
		cb_text_anchor2:SetPoint("LEFT", cb_text_anchor2_text, "RIGHT", -10, -3)
		cb_text_anchor2.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			--LolzenUI.SetUFTargetCBTextPos()
		end

		local header8 = ns.createHeader("uf_boss_options", L["uf_time_and_spellname_header"]..":", "content")
		header8:SetPoint("TOPLEFT", cb_text_pos_x_text, "BOTTOMLEFT", 0, -13)

		local cb_font = ns.createPicker("uf_boss_options", "font", "uf_boss_cb_font", 120, LolzenUIcfg.unitframes.boss["uf_boss_cb_font"], "content")
		cb_font:SetPoint("TOPLEFT", header8, "BOTTOMLEFT", -20, -8)
		cb_font.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_font"] = UIDropDownMenu_GetSelectedName(cb_font)
			--LolzenUI.SetUFTargetCBTextFont()
		end

		local cb_font_size_text = ns.createFontstring("uf_boss_options", L["size"]..":", "content")
		cb_font_size_text:SetPoint("LEFT", cb_font, "RIGHT", -5, 3)

		local cb_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes.boss["uf_boss_cb_font_size"], "content")
		cb_font_size:SetPoint("LEFT", cb_font_size_text, "RIGHT", 10, 0)

		cb_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_font_size:SetScript("OnEnterPressed", function(self)
			--LolzenUIcfg.unitframes.target["uf_target_cb_font_size"] = tonumber(cb_font_size:GetText())
			self.oldText = self:GetText()
			--LolzenUI.SetUFTargetCBTextFont()
		end)

		cb_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_font_flag_text = ns.createFontstring("uf_boss_options", L["flag"]..":", "content")
		cb_font_flag_text:SetPoint("LEFT", cb_font_size, "RIGHT", 10, 0)

		local cb_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_cb_font_flag", 120, LolzenUIcfg.unitframes.boss["uf_boss_cb_font_flag"], "content")
		cb_font_flag:SetPoint("LEFT", cb_font_flag_text, "RIGHT", -10, -3)
		cb_font_flag.OnClick = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_font_flag)]
			--LolzenUI.SetUFTargetCBTextFont()
		end

		local cb_font_color_text = ns.createFontstring("uf_boss_options", L["color"]..":", "content")
		cb_font_color_text:SetPoint("LEFT", cb_font_flag, "RIGHT", -10, 3)

		local cb_font_color = ns.createColorTexture("uf_boss_options", 16, 16, LolzenUIcfg.unitframes.boss["uf_boss_cb_font_color"], LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		cb_font_color:SetPoint("LEFT", cb_font_color_text, "RIGHT", 10, 0)
		cb_font_color.setActualColors = function()
			--LolzenUIcfg.unitframes.target["uf_target_cb_font_color"] = {cb_font_color:GetVertexColor()}
			--LolzenUI.SetUFTargetCBTextColor()
		end

		local cb_font_color_f = ns.createColorPicker("uf_boss_options", cb_font_color, LolzenUIcfg.unitframes.boss["uf_boss_cb_font_color"], "content")
		cb_font_color_f:SetAllPoints(cb_font_color)

		local applyButton = ns.createApplyButton("uf_boss_options")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.unitframes.boss["uf_boss_width"] = tonumber(width:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_height"] = tonumber(height:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_additional_pos"] = ns.picker_growth[UIDropDownMenu_GetSelectedID(growth)]
			LolzenUIcfg.unitframes.boss["uf_boss_additional_spacing"] = tonumber(growth_spacing:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_show_power"] = cb1:GetChecked()
			LolzenUIcfg.unitframes.boss["uf_boss_use_own_hp_font_settings"] = cb2:GetChecked()
			LolzenUIcfg.unitframes.boss["uf_boss_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUIcfg.unitframes.boss["uf_boss_hp_font_size"] = tonumber(hp_font_size:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUIcfg.unitframes.boss["uf_boss_hp_posx"] = tonumber(hp_pos_x:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_hp_posy"] = tonumber(hp_pos_y:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUIcfg.unitframes.boss["uf_boss_pp_font"] = UIDropDownMenu_GetSelectedName(pp_font)
			LolzenUIcfg.unitframes.boss["uf_boss_pp_font_size"] = tonumber(pp_font_size:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(pp_font_flag)]
			LolzenUIcfg.unitframes.boss["uf_boss_pp_posx"] = tonumber(pp_pos_x:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_pp_posy"] = tonumber(pp_pos_y:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor)]
			LolzenUIcfg.unitframes.boss["uf_boss_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor2)]
			LolzenUIcfg.unitframes.boss["uf_boss_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(pp_parent)]
			LolzenUIcfg.unitframes.boss["uf_boss_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(aura_type)]
			LolzenUIcfg.unitframes.boss["uf_boss_aura_posx"] = tonumber(aura_pos_x:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_aura_posy"] = tonumber(aura_pos_y:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor)]
			LolzenUIcfg.unitframes.boss["uf_boss_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor2)]
			LolzenUIcfg.unitframes.boss["uf_boss_aura_maxnum"] = tonumber(aura_maxnum:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_aura_spacing"] = tonumber(aura_spacing:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_aura_size"] = tonumber(aura_size:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(aura_growthx)]
			LolzenUIcfg.unitframes.boss["uf_boss_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(aura_growthy)]
			LolzenUIcfg.unitframes.boss["uf_boss_aura_show_only_player"] = cb3:GetChecked()
			LolzenUIcfg.unitframes.boss["uf_boss_aura_desature_nonplayer_auras"] = cb4:GetChecked()
			LolzenUIcfg.unitframes.boss["uf_boss_cb_color"] = {cb_color:GetVertexColor()}
			LolzenUIcfg.unitframes.boss["uf_boss_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(cb_alpha)])
			LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_cut"] = cb5:GetChecked()
			LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_size"] = tonumber(cb_icon_size:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_posx"] = tonumber(cb_icon_pos_x:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_posy"] = tonumber(cb_icon_pos_y:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor1)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_time_posx"] = tonumber(cb_time_pos_x:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_time_posy"] = tonumber(cb_time_pos_y:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor1)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_text_posx"] = tonumber(cb_text_pos_x:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_text_posy"] = tonumber(cb_text_pos_y:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor1)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_font"] = UIDropDownMenu_GetSelectedName(cb_font)
			LolzenUIcfg.unitframes.boss["uf_boss_cb_font_size"] = tonumber(cb_font_size:GetText())
			LolzenUIcfg.unitframes.boss["uf_boss_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_font_flag)]
			LolzenUIcfg.unitframes.boss["uf_boss_cb_font_color"] = {cb_font_color:GetVertexColor()}
			ReloadUI()
		end)

		ns["uf_boss_options"].default = function(self)
			LolzenUIcfg.unitframes.boss = _G["LolzenUIdefaultcfg"].unitframes.boss
			ReloadUI()
		end
	end
end)