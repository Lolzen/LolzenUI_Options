local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- // Create a subcategory panel for Raid // --
		ns.uf_raid_options = CreateFrame("Frame", "unitframe_raidpanel", ns["unitframes"])
		ns.uf_raid_options.name = "   "..L["sub_panel_unitframes_raid"] 
		ns.uf_raid_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_raid_options)

		local title = ns.createTitle("uf_raid_options", L["sub_panel_unitframes_raid_title"])

		local cb1 = ns.createCheckBox("uf_raid_options", "uf_raid_enabled", "|cff5599ff"..L["sub_panel_unitframes_raid_use_LolzenUI"].."", LolzenUIcfg.unitframes.raid["uf_raid_enabled"])
		cb1:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_enabled"] = cb1:GetChecked()
			LolzenUI.ToggleOUFRaid()
		end)

		local width_text = ns.createFontstring("uf_raid_options", L["width"]..":")
		width_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local width = ns.createInputbox("uf_raid_options", 40, 20, LolzenUIcfg.unitframes.raid["uf_raid_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_width"] = tonumber(width:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidSize()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local height_text = ns.createFontstring("uf_raid_options", L["height"]..":")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local height = ns.createInputbox("uf_raid_options", 40, 20, LolzenUIcfg.unitframes.raid["uf_raid_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidSize()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header1 = ns.createHeader("uf_raid_options", L["uf_healthpoints"])
		header1:SetPoint("TOPLEFT", width_text, 0, -30)

		local cb2 = ns.createCheckBox("uf_raid_options", "uf_raid_use_custom_font_hp", "|cff5599ff"..L["uf_healthpoints_overwrite_global_settings"].."|r", LolzenUIcfg.unitframes.raid["uf_raid_use_own_hp_font_settings"])
		cb2:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_use_own_hp_font_settings"] = cb2:GetChecked()
			LolzenUI.SetUFRaidOwnFont()
		end)

		local hp_pos_x_text = ns.createFontstring("uf_raid_options", L["PosX"]..":")
		hp_pos_x_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -8)

		local hp_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_hp_posx"])
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		hp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_hp_posx"] = tonumber(hp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidHPPos()
		end)

		hp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_pos_y_text = ns.createFontstring("uf_raid_options", L["PosY"]..":")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_hp_posy"])
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		hp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_hp_posy"] = tonumber(hp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidHPPos()
		end)

		hp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_anchor_text = ns.createFontstring("uf_raid_options", L["anchor"]..":")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_hp_anchor", 110, LolzenUIcfg.unitframes.raid["uf_raid_hp_anchor"])
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)
		hp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.raid["uf_raid_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUI.SetUFRaidHPPos()
		end

		local hp_font_text = ns.createFontstring("uf_raid_options", L["font"]..":")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_raid_options", "font", "uf_raid_hp_font", 120, LolzenUIcfg.unitframes.raid["uf_raid_hp_font"])
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)
		hp_font.OnClick = function()
			LolzenUIcfg.unitframes.raid["uf_raid_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUI.SetUFRaidHPFont()
		end

		local hp_font_size_text = ns.createFontstring("uf_raid_options", L["size"]..":")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_hp_font_size"])
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		hp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_hp_font_size"] = tonumber(hp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidHPFont()
		end)

		hp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_font_flag_text = ns.createFontstring("uf_raid_options", L["flag"]..":")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_raid_options", "flag", "uf_raid_hp_font_flag", 120, LolzenUIcfg.unitframes.raid["uf_raid_hp_font_flag"])
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)
		hp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.raid["uf_raid_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUI.SetUFRaidHPFont()
		end

		local header2 = ns.createHeader("uf_raid_options", L["uf_roleindicator_header"])
		header2:SetPoint("TOPLEFT", hp_font_text, 0, -30)

		local cb3 = ns.createCheckBox("uf_raid_options", "uf_raid_ri", "|cff5599ff"..L["uf_show_roleindicator"].."|r", LolzenUIcfg.unitframes.raid["uf_raid_showroleindicator"])
		cb3:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_showroleindicator"] = cb3:GetChecked()
			LolzenUI.SetUFRaidShowRoleIndicator()
		end)

		local ri_size_text = ns.createFontstring("uf_raid_options", L["size"]..":")
		ri_size_text:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -8)

		local ri_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_ri_size"])
		ri_size:SetPoint("LEFT", ri_size_text, "RIGHT", 10, 0)

		ri_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		ri_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_ri_size"] = tonumber(ri_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidRoleIndicatorSize()
		end)

		ri_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		ri_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local ri_pos_x_text = ns.createFontstring("uf_raid_options", L["PosX"]..":")
		ri_pos_x_text:SetPoint("LEFT", ri_size, "RIGHT", 10, 0)

		local ri_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_ri_posx"])
		ri_pos_x:SetPoint("LEFT", ri_pos_x_text, "RIGHT", 10, 0)

		ri_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		ri_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_ri_posx"] = tonumber(ri_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidRoleIndicatorPos()
		end)

		ri_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		ri_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local ri_pos_y_text = ns.createFontstring("uf_raid_options", L["PosY"]..":")
		ri_pos_y_text:SetPoint("LEFT", ri_pos_x, "RIGHT", 10, 0)

		local ri_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_ri_posy"])
		ri_pos_y:SetPoint("LEFT", ri_pos_y_text, "RIGHT", 10, 0)

		ri_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		ri_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_ri_posy"] = tonumber(ri_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidRoleIndicatorPos()
		end)

		ri_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		ri_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local ri_anchor_text = ns.createFontstring("uf_raid_options", L["anchor"]..":")
		ri_anchor_text:SetPoint("LEFT", ri_pos_y, "RIGHT", 10, 0)

		local ri_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_ri_anchor", 120, LolzenUIcfg.unitframes.raid["uf_raid_ri_anchor"])
		ri_anchor:SetPoint("LEFT", ri_anchor_text, "RIGHT", -10, -3)
		ri_anchor.OnClick = function()
			LolzenUIcfg.unitframes.raid["uf_raid_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ri_anchor)]
			LolzenUI.SetUFRaidRoleIndicatorPos()
		end

		local header3 = ns.createHeader("uf_raid_options", L["uf_readycheckindicator_header"])
		header3:SetPoint("TOPLEFT", ri_size_text, 0, -30)

		local rc_size_text = ns.createFontstring("uf_raid_options", L["size"]..":")
		rc_size_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -15)

		local rc_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_rc_size"])
		rc_size:SetPoint("LEFT", rc_size_text, "RIGHT", 10, 0)

		rc_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rc_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_rc_size"] = tonumber(rc_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidReadyCheckIndicatorSize()
		end)

		rc_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rc_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rc_pos_x_text = ns.createFontstring("uf_raid_options", L["PosX"]..":")
		rc_pos_x_text:SetPoint("LEFT", rc_size, "RIGHT", 10, 0)

		local rc_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_rc_posx"])
		rc_pos_x:SetPoint("LEFT", rc_pos_x_text, "RIGHT", 10, 0)

		rc_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rc_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_rc_posx"] = tonumber(rc_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidReadyCheckIndicatorPos()
		end)

		rc_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rc_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rc_pos_y_text = ns.createFontstring("uf_raid_options", L["PosY"]..":")
		rc_pos_y_text:SetPoint("LEFT", rc_pos_x, "RIGHT", 10, 0)

		local rc_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes.raid["uf_raid_rc_posy"])
		rc_pos_y:SetPoint("LEFT", rc_pos_y_text, "RIGHT", 10, 0)

		rc_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rc_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.raid["uf_raid_rc_posy"] = tonumber(rc_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidReadyCheckIndicatorPos()
		end)

		rc_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rc_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rc_anchor_text = ns.createFontstring("uf_raid_options", L["anchor"]..":")
		rc_anchor_text:SetPoint("LEFT", rc_pos_y, "RIGHT", 10, 0)

		local rc_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_rc_anchor", 120, LolzenUIcfg.unitframes.raid["uf_raid_rc_anchor"])
		rc_anchor:SetPoint("LEFT", rc_anchor_text, "RIGHT", -10, -3)
		rc_anchor.OnClick = function()
			LolzenUIcfg.unitframes.raid["uf_raid_rc_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(rc_anchor)]
			LolzenUI.SetUFRaidReadyCheckIndicatorPos()
		end

		ns["uf_raid_options"].default = function(self)
			LolzenUIcfg.unitframes.raid = _G["LolzenUIdefaultcfg"].unitframes.raid
			ReloadUI()
		end
	end
end)