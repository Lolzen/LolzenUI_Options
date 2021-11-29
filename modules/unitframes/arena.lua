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

		-- // Create a subcategory panel for arena // --
		ns.uf_arena_options = CreateFrame("Frame", "unitframe_arenapanel", ns["unitframes"])
		ns.uf_arena_options.name = "   "..L["sub_panel_unitframes_arena"]
		ns.uf_arena_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_arena_options)

		local title = ns.createTitle("uf_arena_options", L["sub_panel_unitframes_arena_title"])

		local scrollFrame = ns.createScrollFrame("uf_arena_options", 204)

		local width_text = ns.createFontstring("uf_arena_options", L["width"]..":", "content")
		width_text:SetPoint("TOPLEFT", ns.uf_arena_options.content, 20, -20)

		local wtBG = ns.createBackground("uf_arena_options", 580, 34, "content")
		wtBG:SetPoint("TOPLEFT", width_text, "BOTTOMLEFT", -8, 23)
		wtBG:SetFrameLevel(1)

		local width = ns.createInputbox("uf_arena_options", 40, 20, LolzenUIcfg.unitframes.arena["uf_arena_width"], "content")
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 1)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_width"] = tonumber(width:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaSize()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local height_text = ns.createFontstring("uf_arena_options", L["height"]..":", "content")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, -1)

		local height = ns.createInputbox("uf_arena_options", 40, 20, LolzenUIcfg.unitframes.arena["uf_arena_height"], "content")
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 1)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaSize()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header1 = ns.createHeader("uf_arena_options", L["uf_healthpoints"], "content")
		header1:SetPoint("TOPLEFT", width_text, -4, -24)

		local header1BG = ns.createBackground("uf_arena_options", 580, 86, "content")
		header1BG:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", -4, -4)
		header1BG:SetFrameLevel(1)

		local cb1 = ns.createCheckBox("uf_arena_options", "uf_arena_use_custom_font_hp", "|cff5599ff"..L["uf_healthpoints_overwrite_global_settings"].."|r", LolzenUIcfg.unitframes.arena["uf_arena_use_own_hp_font_settings"], "content")
		cb1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_use_own_hp_font_settings"] = cb1:GetChecked()
			LolzenUI.SetUFArenaOwnFont()
		end)

		local hp_pos_x_text = ns.createFontstring("uf_arena_options", L["PosX"]..":", "content")
		hp_pos_x_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 4, -8)

		local hp_pos_x = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_hp_posx"], "content")
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		hp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_hp_posx"] = tonumber(hp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaHPPos()
		end)

		hp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_pos_y_text = ns.createFontstring("uf_arena_options", L["PosY"]..":", "content")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_hp_posy"], "content")
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		hp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_hp_posy"] = tonumber(hp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaHPPos()
		end)

		hp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_anchor_text = ns.createFontstring("uf_arena_options", L["anchor"]..":", "content")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_arena_options", "anchor", "uf_arena_hp_anchor", 110, LolzenUIcfg.unitframes.arena["uf_arena_hp_anchor"], "content")
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)
		hp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUI.SetUFArenaHPPos()
		end

		local hp_font_text = ns.createFontstring("uf_arena_options", L["font"]..":", "content")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_arena_options", "font", "uf_arena_hp_font", 120, LolzenUIcfg.unitframes.arena["uf_arena_hp_font"], "content")
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)
		hp_font.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUI.SetUFArenaHPFont()
		end

		local hp_font_size_text = ns.createFontstring("uf_arena_options", L["size"]..":", "content")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_hp_font_size"], "content")
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		hp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_hp_font_size"] = tonumber(hp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaHPFont()
		end)

		hp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_font_flag_text = ns.createFontstring("uf_arena_options", L["flag"]..":", "content")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_arena_options", "flag", "uf_arena_hp_font_flag", 120, LolzenUIcfg.unitframes.arena["uf_arena_hp_font_flag"], "content")
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)
		hp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUI.SetUFArenaHPFont()
		end

		local header2 = ns.createHeader("uf_arena_options", L["uf_powerpoints"], "content")
		header2:SetPoint("TOPLEFT", hp_font_text, -4, -28)

		local header2BG = ns.createBackground("uf_arena_options", 580, 86, "content")
		header2BG:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", -4, -4)
		header2BG:SetFrameLevel(1)

		local pp_pos_x_text = ns.createFontstring("uf_arena_options", L["PosX"]..":", "content")
		pp_pos_x_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 4, -14)

		local pp_pos_x = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_pp_posx"], "content")
		pp_pos_x:SetPoint("LEFT", pp_pos_x_text, "RIGHT", 10, 0)

		pp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_pp_posx"] = tonumber(pp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaPowerPos()
		end)

		pp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_pos_y_text = ns.createFontstring("uf_arena_options", L["PosY"]..":", "content")
		pp_pos_y_text:SetPoint("LEFT", pp_pos_x, "RIGHT", 5, 0)

		local pp_pos_y = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_pp_posy"], "content")
		pp_pos_y:SetPoint("LEFT", pp_pos_y_text, "RIGHT", 10, 0)

		pp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_pp_posy"] = tonumber(pp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaPowerPos()
		end)

		pp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_anchor_text = ns.createFontstring("uf_arena_options", L["anchor"].."1:", "content")
		pp_anchor_text:SetPoint("TOPLEFT", pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local pp_anchor = ns.createPicker("uf_arena_options", "anchor", "uf_arena_pp_anchor", 90, LolzenUIcfg.unitframes.arena["uf_arena_pp_anchor"], "content")
		pp_anchor:SetPoint("LEFT", pp_anchor_text, "RIGHT", -10, -3)
		pp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor)]
			LolzenUI.SetUFArenaPowerPos()
		end

		local pp_parent_text = ns.createFontstring("uf_arena_options", L["parent"]..":", "content")
		pp_parent_text:SetPoint("LEFT", pp_anchor, "RIGHT", -10, 3)

		local pp_parent = ns.createPicker("uf_arena_options", "uf_parent", "uf_arena_pp_parent", 50, LolzenUIcfg.unitframes.arena["uf_arena_pp_parent"], "content")
		pp_parent:SetPoint("LEFT", pp_parent_text, "RIGHT", -10, -3)
		pp_parent.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(pp_parent)]
			LolzenUI.SetUFArenaPowerPos()
		end

		local pp_anchor2_text = ns.createFontstring("uf_arena_options", L["anchor"].."2:", "content")
		pp_anchor2_text:SetPoint("LEFT", pp_parent, "RIGHT", -10, 3)

		local pp_anchor2 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_pp_anchor2", 90, LolzenUIcfg.unitframes.arena["uf_arena_pp_anchor2"], "content")
		pp_anchor2:SetPoint("LEFT", pp_anchor2_text, "RIGHT", -10, -3)
		pp_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pp_anchor2)]
			LolzenUI.SetUFArenaPowerPos()
		end

		local pp_font_text = ns.createFontstring("uf_arena_options", L["font"]..":", "content")
		pp_font_text:SetPoint("TOPLEFT", pp_anchor_text, "BOTTOMLEFT", 0, -15)

		local pp_font = ns.createPicker("uf_arena_options", "font", "uf_arena_pp_font", 120, LolzenUIcfg.unitframes.arena["uf_arena_pp_font"], "content")
		pp_font:SetPoint("LEFT", pp_font_text, "RIGHT", -10, -3)
		pp_font.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_pp_font"] = UIDropDownMenu_GetSelectedName(pp_font)
			LolzenUI.SetUFArenaPowerFont()
		end

		local pp_font_size_text = ns.createFontstring("uf_arena_options", L["size"]..":", "content")
		pp_font_size_text:SetPoint("LEFT", pp_font, "RIGHT", -5, 3)

		local pp_font_size = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_pp_font_size"], "content")
		pp_font_size:SetPoint("LEFT", pp_font_size_text, "RIGHT", 10, 0)

		pp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_pp_font_size"] = tonumber(pp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaPowerFont()
		end)

		pp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pp_font_flag_text = ns.createFontstring("uf_arena_options", L["flag"]..":", "content")
		pp_font_flag_text:SetPoint("LEFT", pp_font_size, "RIGHT", 10, 0)

		local pp_font_flag = ns.createPicker("uf_arena_options", "flag", "uf_arena_pp_font_flag", 120, LolzenUIcfg.unitframes.arena["uf_arena_pp_font_flag"], "content")
		pp_font_flag:SetPoint("LEFT", pp_font_flag_text, "RIGHT", -10, -3)
		pp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(pp_font_flag)]
			LolzenUI.SetUFArenaPowerFont()
		end

		local header3 = ns.createHeader("uf_arena_options", L["auras"], "content")
		header3:SetPoint("TOPLEFT", pp_font_text, -4, -28)

		local header3BG = ns.createBackground("uf_arena_options", 580, 133, "content")
		header3BG:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", -4, -4)
		header3BG:SetFrameLevel(1)

		local aura_type_text = ns.createFontstring("uf_arena_options", L["show"]..":", "content")
		aura_type_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 4, -17)

		local aura_type = ns.createPicker("uf_arena_options", "uf_auratype", "uf_arena_aura_type", 70, LolzenUIcfg.unitframes.arena["uf_arena_aura_show_type"], "content")
		aura_type:SetPoint("LEFT", aura_type_text, "RIGHT", -10, -3)
		aura_type.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(aura_type)]
			LolzenUI.SetUFArenaAuraType()
		end

		local aura_maxnum_text = ns.createFontstring("uf_arena_options", L["show_max_0_to_40"]..":", "content")
		aura_maxnum_text:SetPoint("LEFT", aura_type, "RIGHT", -5, 3)

		local aura_maxnum = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_aura_maxnum"], "content")
		aura_maxnum:SetPoint("LEFT", aura_maxnum_text, "RIGHT", 10, 0)

		aura_maxnum:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_maxnum:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_maxnum"] = tonumber(aura_maxnum:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaAuraNum()
		end)

		aura_maxnum:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_maxnum:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_spacing_text = ns.createFontstring("uf_arena_options", L["spacing"]..":", "content")
		aura_spacing_text:SetPoint("LEFT", aura_maxnum, "RIGHT", 10, 0)

		local aura_spacing = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_aura_spacing"], "content")
		aura_spacing:SetPoint("LEFT", aura_spacing_text, "RIGHT", 10, 0)

		aura_spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_spacing:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_spacing"] = tonumber(aura_spacing:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaAuraSpacing()
		end)

		aura_spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_size_text = ns.createFontstring("uf_arena_options", L["size"]..":", "content")
		aura_size_text:SetPoint("LEFT", aura_spacing, "RIGHT", 10, 0)

		local aura_size = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_aura_size"], "content")
		aura_size:SetPoint("LEFT", aura_size_text, "RIGHT", 10, 0)

		aura_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_size"] = tonumber(aura_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaAuraSize()
		end)

		aura_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_pos_x_text = ns.createFontstring("uf_arena_options", L["PosX"]..":", "content")
		aura_pos_x_text:SetPoint("TOPLEFT", aura_type_text, "BOTTOMLEFT", 0, -15)

		local aura_pos_x = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_aura_posx"], "content")
		aura_pos_x:SetPoint("LEFT", aura_pos_x_text, "RIGHT", 10, 0)

		aura_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_posx"] = tonumber(aura_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaAuraPos()
		end)

		aura_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_pos_y_text = ns.createFontstring("uf_arena_options", L["PosY"]..":", "content")
		aura_pos_y_text:SetPoint("LEFT", aura_pos_x, "RIGHT", 5, 0)

		local aura_pos_y = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_aura_posy"], "content")
		aura_pos_y:SetPoint("LEFT", aura_pos_y_text, "RIGHT", 10, 0)

		aura_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_posy"] = tonumber(aura_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaAuraPos()
		end)

		aura_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_anchor_text = ns.createFontstring("uf_arena_options", L["anchor"].."1:", "content")
		aura_anchor_text:SetPoint("LEFT", aura_pos_y, "RIGHT", 5, 0)

		local aura_anchor = ns.createPicker("uf_arena_options", "anchor", "uf_arena_aura_anchor", 90, LolzenUIcfg.unitframes.arena["uf_arena_aura_anchor1"], "content")
		aura_anchor:SetPoint("LEFT", aura_anchor_text, "RIGHT", -10, -3)
		aura_anchor.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor)]
			LolzenUI.SetUFArenaAuraPos()
		end

		local aura_anchor2_text = ns.createFontstring("uf_arena_options", L["anchor"].."2:", "content")
		aura_anchor2_text:SetPoint("LEFT", aura_anchor, "RIGHT", -10, 3)

		local aura_anchor2 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_aura_anchor2", 90, LolzenUIcfg.unitframes.arena["uf_arena_aura_anchor2"], "content")
		aura_anchor2:SetPoint("LEFT", aura_anchor2_text, "RIGHT", -10, -3)
		aura_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor2)]
			LolzenUI.SetUFArenaAuraPos()
		end

		local aura_growthx_text = ns.createFontstring("uf_arena_options", L["growth_x"]..":", "content")
		aura_growthx_text:SetPoint("TOPLEFT", aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		local aura_growthx = ns.createPicker("uf_arena_options", "uf_auragrowth_x", "uf_arena_aura_growthx", 70, LolzenUIcfg.unitframes.arena["uf_arena_aura_growth_x"], "content")
		aura_growthx:SetPoint("LEFT", aura_growthx_text, "RIGHT", -10, -3)
		aura_growthx.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(aura_growthx)]
			LolzenUI.SetUFArenaAuraGrowth()
		end

		local aura_growthy_text = ns.createFontstring("uf_arena_options", L["growth_y"]..":", "content")
		aura_growthy_text:SetPoint("LEFT", aura_growthx, "RIGHT", -5, 3)

		local aura_growthy = ns.createPicker("uf_arena_options", "uf_auragrowth_y", "uf_arena_aura_growthy", 70, LolzenUIcfg.unitframes.arena["uf_arena_aura_growth_y"], "content")
		aura_growthy:SetPoint("LEFT", aura_growthy_text, "RIGHT", -10, -3)
		aura_growthy.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(aura_growthy)]
			LolzenUI.SetUFArenaAuraGrowth()
		end

		local cb2 = ns.createCheckBox("uf_arena_options", "uf_arena_show_only_player_auras", "|cff5599ff"..L["show_only_player_auras"].."|r", LolzenUIcfg.unitframes.arena["uf_arena_aura_show_only_player"], "content")
		cb2:SetPoint("TOPLEFT", aura_growthx_text, "BOTTOMLEFT", -4, -8)

		local cb3 = ns.createCheckBox("uf_arena_options", "uf_arena_desature_nonplayer_auras", "|cff5599ff"..L["desature_auras_not_by_player"].."|r", LolzenUIcfg.unitframes.arena["uf_arena_aura_desature_nonplayer_auras"], "content")
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_desature_nonplayer_auras"] = cb3:GetChecked()
			LolzenUI.SetUFArenaAuraDesatureNonPlayerAuras()
		end)

		local header4 = ns.createHeader("uf_arena_options", L["uf_castbar"], "content")

		local header4BG = ns.createBackground("uf_arena_options", 580, 38, "content")
		header4BG:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", -4, -4)
		header4BG:SetFrameLevel(1)

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_aura_show_only_player"] = cb2:GetChecked()
			LolzenUI.SetUFArenaAuraShowOnlyPlayerAuras()
			if cb2:GetChecked() == true then
				cb3:Hide()
				header4:SetPoint("TOPLEFT", cb2, 0, -30)
				ChangeScrollbarMinMax("uf_arena_options", "-", 24)
				header3BG:SetSize(580, 109)
			else
				cb3:Show()
				header4:SetPoint("TOPLEFT", cb3, 0, -30)
				ChangeScrollbarMinMax("uf_arena_options", "+", 24)
				header3BG:SetSize(580, 133)
			end
		end)

		if cb2:GetChecked() == true then
			cb3:Hide()
			header4:SetPoint("TOPLEFT", cb2, 0, -30)
			ChangeScrollbarMinMax("uf_arena_options", "-", 24)
			header3BG:SetSize(580, 109)
		else
			cb3:Show()
			header4:SetPoint("TOPLEFT", cb3, 0, -30)
			header3BG:SetSize(580, 133)
		end

		local cb_color_text = ns.createFontstring("uf_arena_options", L["color"]..":", "content")
		cb_color_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 4, -18)

		local cb_color = ns.createColorTexture("uf_arena_options", 16, 16, LolzenUIcfg.unitframes.arena["uf_arena_cb_color"], LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		cb_color:SetPoint("LEFT", cb_color_text, "RIGHT", 10, 0)
		cb_color.setActualColors = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_color"] = {cb_color:GetVertexColor()}
			LolzenUI.SetUFArenaCBColor()
		end

		local cb_color_f = ns.createColorPicker("uf_arena_options", cb_color, LolzenUIcfg.unitframes.arena["uf_arena_cb_color"], "content")
		cb_color_f:SetAllPoints(cb_color)

		local cb_alpha_text = ns.createFontstring("uf_arena_options", L["alpha"]..":", "content")
		cb_alpha_text:SetPoint("LEFT", cb_color, "RIGHT", 10, 0)

		local cb_alpha = ns.createPicker("uf_arena_options", "alpha", "uf_arena_cb_alpha", 45, LolzenUIcfg.unitframes.arena["uf_arena_cb_alpha"], "content")
		cb_alpha:SetPoint("LEFT", cb_alpha_text, "RIGHT", -10, -2)
		cb_alpha.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(cb_alpha)])
			LolzenUI.SetUFArenaCBColor()
		end

		local header5 = ns.createHeader("uf_arena_options", L["icon"]..":", "content")
		header5:SetPoint("TOPLEFT", cb_color_text, "BOTTOMLEFT", -4, -16)

		local header5BG = ns.createBackground("uf_arena_options", 580, 58, "content")
		header5BG:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", -4, -4)
		header5BG:SetFrameLevel(1)

		local cb_icon_size_text = ns.createFontstring("uf_arena_options", L["size"]..":", "content")
		cb_icon_size_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 4, -16)

		local cb_icon_size = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_size"], "content")
		cb_icon_size:SetPoint("LEFT", cb_icon_size_text, "RIGHT", 10, 0)

		cb_icon_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_size"] = tonumber(cb_icon_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBIconCutAndSize()
		end)

		cb_icon_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_x_text = ns.createFontstring("uf_arena_options", L["PosX"]..":", "content")
		cb_icon_pos_x_text:SetPoint("LEFT", cb_icon_size, "RIGHT", 10, 0)

		local cb_icon_pos_x = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_posx"], "content")
		cb_icon_pos_x:SetPoint("LEFT", cb_icon_pos_x_text, "RIGHT", 10, 0)

		cb_icon_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_posx"] = tonumber(cb_icon_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBIconPos()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_y_text = ns.createFontstring("uf_arena_options", L["PosY"]..":", "content")
		cb_icon_pos_y_text:SetPoint("LEFT", cb_icon_pos_x, "RIGHT", 5, 0)

		local cb_icon_pos_y = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_posy"], "content")
		cb_icon_pos_y:SetPoint("LEFT", cb_icon_pos_y_text, "RIGHT", 10, 0)

		cb_icon_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_posy"] = tonumber(cb_icon_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBIconPos()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_anchor1_text = ns.createFontstring("uf_arena_options", L["anchor"].."1:", "content")
		cb_icon_anchor1_text:SetPoint("LEFT", cb_icon_pos_y, "RIGHT", 10, 0)

		local cb_icon_anchor1 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_cb_icon_anchor1", 70, LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_anchor1"], "content")
		cb_icon_anchor1:SetPoint("LEFT", cb_icon_anchor1_text, "RIGHT", -10, -3)
		cb_icon_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor1)]
			LolzenUI.SetUFArenaCBIconPos()
		end

		local cb_icon_anchor2_text = ns.createFontstring("uf_arena_options", L["anchor"].."2:", "content")
		cb_icon_anchor2_text:SetPoint("LEFT", cb_icon_anchor1, "RIGHT", -5, 3)

		local cb_icon_anchor2 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_cb_icon_anchor2", 70, LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_anchor2"], "content")
		cb_icon_anchor2:SetPoint("LEFT", cb_icon_anchor2_text, "RIGHT", -10, -3)
		cb_icon_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			LolzenUI.SetUFArenaCBIconPos()
		end

		local cb4 = ns.createCheckBox("uf_arena_options", "uf_arena_use_castbar_icon_cut", "|cff5599ff"..L["uf_trim_castbar_icon"].."|r", LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_cut"], "content")
		cb4:SetPoint("TOPLEFT", cb_icon_size_text, "BOTTOMLEFT", -4, -8)

		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_icon_cut"] = cb4:GetChecked()
			LolzenUI.SetUFArenaCBIconCutAndSize()
		end)

		local header6 = ns.createHeader("uf_arena_options", L["time"]..":", "content")
		header6:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, -8)

		local header6BG = ns.createBackground("uf_arena_options", 580, 38, "content")
		header6BG:SetPoint("TOPLEFT", header6, "BOTTOMLEFT", -4, -4)
		header6BG:SetFrameLevel(1)

		local cb_time_pos_x_text = ns.createFontstring("uf_arena_options", L["PosX"]..":", "content")
		cb_time_pos_x_text:SetPoint("TOPLEFT", header6, "BOTTOMLEFT", 4, -18)

		local cb_time_pos_x = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_time_posx"], "content")
		cb_time_pos_x:SetPoint("LEFT", cb_time_pos_x_text, "RIGHT", 10, 0)

		cb_time_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_time_posx"] = tonumber(cb_time_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFTargetCBTimePos()
		end)

		cb_time_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_pos_y_text = ns.createFontstring("uf_arena_options", L["PosY"]..":", "content")
		cb_time_pos_y_text:SetPoint("LEFT", cb_time_pos_x, "RIGHT", 5, 0)

		local cb_time_pos_y = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_time_posy"], "content")
		cb_time_pos_y:SetPoint("LEFT", cb_time_pos_y_text, "RIGHT", 10, 0)

		cb_time_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_time_posy"] = tonumber(cb_time_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBTimePos()
		end)

		cb_time_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_anchor1_text = ns.createFontstring("uf_arena_options", L["anchor"].."1:", "content")
		cb_time_anchor1_text:SetPoint("LEFT", cb_time_pos_y, "RIGHT", 10, 0)

		local cb_time_anchor1 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_cb_time_anchor1", 110, LolzenUIcfg.unitframes.arena["uf_arena_cb_time_anchor1"], "content")
		cb_time_anchor1:SetPoint("LEFT", cb_time_anchor1_text, "RIGHT", -10, -3)
		cb_time_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor1)]
			LolzenUI.SetUFArenaCBTimePos()
		end

		local cb_time_anchor2_text = ns.createFontstring("uf_arena_options", L["anchor"].."2:", "content")
		cb_time_anchor2_text:SetPoint("LEFT", cb_time_anchor1, "RIGHT", -5, 3)

		local cb_time_anchor2 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_cb_time_anchor2", 110, LolzenUIcfg.unitframes.arena["uf_arena_cb_time_anchor2"], "content")
		cb_time_anchor2:SetPoint("LEFT", cb_time_anchor2_text, "RIGHT", -10, -3)
		cb_time_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			LolzenUI.SetUFArenaCBTimePos()
		end

		local header7 = ns.createHeader("uf_arena_options", L["text"]..":", "content")
		header7:SetPoint("TOPLEFT", cb_time_pos_x_text, "BOTTOMLEFT", -4, -17)

		local header7BG = ns.createBackground("uf_arena_options", 580, 38, "content")
		header7BG:SetPoint("TOPLEFT", header7, "BOTTOMLEFT", -4, -4)
		header7BG:SetFrameLevel(1)

		local cb_text_pos_x_text = ns.createFontstring("uf_arena_options", L["PosX"]..":", "content")
		cb_text_pos_x_text:SetPoint("TOPLEFT", header7, "BOTTOMLEFT", 4, -18)

		local cb_text_pos_x = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_text_posx"], "content")
		cb_text_pos_x:SetPoint("LEFT", cb_text_pos_x_text, "RIGHT", 10, 0)

		cb_text_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_text_posx"] = tonumber(cb_text_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBTextPos()
		end)

		cb_text_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_pos_y_text = ns.createFontstring("uf_arena_options", L["PosY"]..":", "content")
		cb_text_pos_y_text:SetPoint("LEFT", cb_text_pos_x, "RIGHT", 5, 0)

		local cb_text_pos_y = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_text_posy"], "content")
		cb_text_pos_y:SetPoint("LEFT", cb_text_pos_y_text, "RIGHT", 10, 0)

		cb_text_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_text_posy"] = tonumber(cb_text_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBTextPos()
		end)

		cb_text_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_anchor1_text = ns.createFontstring("uf_arena_options", L["anchor"].."1:", "content")
		cb_text_anchor1_text:SetPoint("LEFT", cb_text_pos_y, "RIGHT", 10, 0)

		local cb_text_anchor1 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_cb_text_anchor1", 110, LolzenUIcfg.unitframes.arena["uf_arena_cb_text_anchor1"], "content")
		cb_text_anchor1:SetPoint("LEFT", cb_text_anchor1_text, "RIGHT", -10, -3)
		cb_text_anchor1.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor1)]
			LolzenUI.SetUFArenaCBTextPos()
		end

		local cb_text_anchor2_text = ns.createFontstring("uf_arena_options", L["anchor"].."2:", "content")
		cb_text_anchor2_text:SetPoint("LEFT", cb_text_anchor1, "RIGHT", -5, 3)

		local cb_text_anchor2 = ns.createPicker("uf_arena_options", "anchor", "uf_arena_cb_text_anchor2", 110, LolzenUIcfg.unitframes.arena["uf_arena_cb_text_anchor2"], "content")
		cb_text_anchor2:SetPoint("LEFT", cb_text_anchor2_text, "RIGHT", -10, -3)
		cb_text_anchor2.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			LolzenUI.SetUFArenaCBTextPos()
		end

		local header8 = ns.createHeader("uf_arena_options", L["uf_time_and_spellname_header"]..":", "content")
		header8:SetPoint("TOPLEFT", cb_text_pos_x_text, "BOTTOMLEFT", -4, -17)

		local header8BG = ns.createBackground("uf_arena_options", 580, 38, "content")
		header8BG:SetPoint("TOPLEFT", header8, "BOTTOMLEFT", -4, -4)
		header8BG:SetFrameLevel(1)

		local cb_font = ns.createPicker("uf_arena_options", "font", "uf_arena_cb_font", 120, LolzenUIcfg.unitframes.arena["uf_arena_cb_font"], "content")
		cb_font:SetPoint("TOPLEFT", header8, "BOTTOMLEFT", -16, -10)
		cb_font.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_font"] = UIDropDownMenu_GetSelectedName(cb_font)
			LolzenUI.SetUFArenaCBTextFont()
		end

		local cb_font_size_text = ns.createFontstring("uf_arena_options", L["size"]..":", "content")
		cb_font_size_text:SetPoint("LEFT", cb_font, "RIGHT", -5, 3)

		local cb_font_size = ns.createInputbox("uf_arena_options", 30, 20, LolzenUIcfg.unitframes.arena["uf_arena_cb_font_size"], "content")
		cb_font_size:SetPoint("LEFT", cb_font_size_text, "RIGHT", 10, 0)

		cb_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.arena["uf_arena_cb_font_size"] = tonumber(cb_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFArenaCBTextFont()
		end)

		cb_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_font_flag_text = ns.createFontstring("uf_arena_options", L["flag"]..":", "content")
		cb_font_flag_text:SetPoint("LEFT", cb_font_size, "RIGHT", 10, 0)

		local cb_font_flag = ns.createPicker("uf_arena_options", "flag", "uf_arena_cb_font_flag", 120, LolzenUIcfg.unitframes.arena["uf_arena_cb_font_flag"], "content")
		cb_font_flag:SetPoint("LEFT", cb_font_flag_text, "RIGHT", -10, -3)
		cb_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_font_flag)]
			LolzenUI.SetUFArenaCBTextFont()
		end

		local cb_font_color_text = ns.createFontstring("uf_arena_options", L["color"]..":", "content")
		cb_font_color_text:SetPoint("LEFT", cb_font_flag, "RIGHT", -10, 3)

		local cb_font_color = ns.createColorTexture("uf_arena_options", 16, 16, LolzenUIcfg.unitframes.arena["uf_arena_cb_font_color"], LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		cb_font_color:SetPoint("LEFT", cb_font_color_text, "RIGHT", 10, 0)
		cb_font_color.setActualColors = function()
			LolzenUIcfg.unitframes.arena["uf_arena_cb_font_color"] = {cb_font_color:GetVertexColor()}
			LolzenUI.SetUFArenaCBTextColor()
		end

		local cb_font_color_f = ns.createColorPicker("uf_arena_options", cb_font_color, LolzenUIcfg.unitframes.arena["uf_arena_cb_font_color"], "content")
		cb_font_color_f:SetAllPoints(cb_font_color)

		ns["uf_arena_options"].default = function(self)
			LolzenUIcfg.unitframes.arena = _G["LolzenUIdefaultcfg"].unitframes.arena
			ReloadUI()
		end

		ns["uf_arena_options"].okay = function(self)
			LolzenUI.UFrestoreOriginalUnit()
		end

		ns["uf_arena_options"].cancel = function(self)
			LolzenUI.UFrestoreOriginalUnit()
		end
	end
end)