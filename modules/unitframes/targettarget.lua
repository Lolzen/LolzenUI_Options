local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- // Create a subcategory panel for Targettarget // --
		ns.uf_targettarget_options = CreateFrame("Frame", "unitframe_targettargetpanel", ns["unitframes"])
		ns.uf_targettarget_options.name = "   "..L["sub_panel_unitframes_targettarget"]
		ns.uf_targettarget_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_targettarget_options)

		local title = ns.createTitle("uf_targettarget_options", L["sub_panel_unitframes_targettarget_title"])

		local width_text = ns.createFontstring("uf_targettarget_options", L["width"]..":")
		width_text:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)

		local width = ns.createInputbox("uf_targettarget_options", 40, 20, LolzenUIcfg.unitframes.targettarget["uf_targettarget_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_width"] = tonumber(width:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFToTSize()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local height_text = ns.createFontstring("uf_targettarget_options", L["height"]..":")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local height = ns.createInputbox("uf_targettarget_options", 40, 20, LolzenUIcfg.unitframes.targettarget["uf_targettarget_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFToTSize()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header1 = ns.createHeader("uf_targettarget_options", L["uf_healthpoints"])
		header1:SetPoint("TOPLEFT", width_text, 0, -30)

		local cb1 = ns.createCheckBox("uf_targettarget_options", "uf_targettarget_use_custom_font_hp", "|cff5599ff"..L["uf_healthpoints_overwrite_global_settings"].."|r", LolzenUIcfg.unitframes.targettarget["uf_targettarget_use_own_hp_font_settings"])
		cb1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)
		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_use_own_hp_font_settings"] = cb1:GetChecked()
			LolzenUI.SetUFToTOwnFont()
		end)

		local hp_pos_x_text = ns.createFontstring("uf_targettarget_options", L["PosX"]..":")
		hp_pos_x_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local hp_pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_posx"])
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		hp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_posx"] = tonumber(hp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFToTHPPos()
		end)

		hp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_pos_y_text = ns.createFontstring("uf_targettarget_options", L["PosY"]..":")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_posy"])
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		hp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_posy"] = tonumber(hp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFToTHPPos()
		end)

		hp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_anchor_text = ns.createFontstring("uf_targettarget_options", L["anchor"]..":")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_hp_anchor", 110, LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_anchor"])
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)
		hp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUI.SetUFToTHPPos()
		end

		local hp_font_text = ns.createFontstring("uf_targettarget_options", L["font"]..":")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_targettarget_options", "font", "uf_targettarget_hp_font", 120, LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_font"])
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)
		hp_font.OnClick = function()
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUI.SetUFToTHPFont()
		end

		local hp_font_size_text = ns.createFontstring("uf_targettarget_options", L["size"]..":")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_font_size"])
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		hp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		hp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_font_size"] = tonumber(hp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFToTHPFont()
		end)

		hp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		hp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local hp_font_flag_text = ns.createFontstring("uf_targettarget_options", L["flag"]..":")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_targettarget_options", "flag", "uf_targettarget_hp_font_flag", 120, LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_font_flag"])
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)
		hp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.targettarget["uf_targettarget_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUI.SetUFToTHPFont()
		end

		ns["uf_targettarget_options"].default = function(self)
			LolzenUIcfg.unitframes.targettarget = _G["LolzenUIdefaultcfg"].unitframes.targettarget
			ReloadUI()
		end
	end
end)