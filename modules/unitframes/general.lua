local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		local title = ns.createTitle("unitframes")

		local about = ns.createDescription("unitframes", LUI["desc_unitframes"])

		local scrollFrame = ns.createScrollFrame("unitframes", 46)

		local cb1 = ns.createCheckBox("unitframes", "uf_hp_perc", "|cff5599ff"..L["uf_general_use_hp_percent"].."|r", LolzenUIcfg.unitframes.general["uf_use_hp_percent"], "content")
		cb1:SetPoint("TOPLEFT", ns.unitframes.content, 16, -14)

		local cbBG = ns.createBackground("unitframes", 580, 130, "content")
		cbBG:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", -4, 30)
		cbBG:SetFrameLevel(1)

		local cb2 = ns.createCheckBox("unitframes", "uf_hp_val_and_perc", "|cff5599ff"..L["uf_general_use_both_value_and_percent"].."|r", LolzenUIcfg.unitframes.general["uf_use_val_and_perc"], "content")
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -0)

		local perc_val_divider_text = ns.createFontstring("unitframes", L["uf_general_hpdivider_text"]..":", "content")
		perc_val_divider_text:SetPoint("LEFT", uf_hp_val_and_percText, "RIGHT", 10, 0)

		local perc_val_divider = ns.createInputbox("unitframes", 20, 20, LolzenUIcfg.unitframes.general["uf_val_perc_divider"], "content")
		perc_val_divider:SetPoint("LEFT", perc_val_divider_text, "RIGHT", 10, 0)

		perc_val_divider:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		perc_val_divider:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_val_perc_divider"] = perc_val_divider:GetText()
			self.oldText = self:GetText()
			LolzenUI.SetUFTagUpdate()
		end)

		perc_val_divider:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		perc_val_divider:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb3 = ns.createCheckBox("unitframes", "uf_perc_first", "|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r", LolzenUIcfg.unitframes.general["uf_perc_first"], "content")
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -0)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_perc_first"] = cb3:GetChecked()
			LolzenUI.SetUFTagUpdate()
		end)

		local cb4 = ns.createCheckBox("unitframes", "uf_siVal", "|cff5599ff"..L["uf_general_use_short_values"].."|r", LolzenUIcfg.unitframes.general["uf_use_sivalue"], "content")
		cb4:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -0)

		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_use_sivalue"] = cb4:GetChecked()
			LolzenUI.SetUFTagUpdate()
		end)

		local cb5 = ns.createCheckBox("unitframes", "uf_siVal_dot", "|cff5599ff"..L["uf_general_use dot_divider"].."|r", LolzenUIcfg.unitframes.general["uf_use_dot_format"], "content")
		cb5:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, -0)

		cb5:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_use_dot_format"] = cb5:GetChecked()
			LolzenUI.SetUFTagUpdate()
		end)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_use_hp_percent"] = cb1:GetChecked()
			LolzenUI.SetUFTagUpdate()
			if cb1:GetChecked() == true then
				cb2:Enable()
				if cb2:GetChecked() == true then
					cb3:Enable()
					cb4:Enable()
					uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r")
					uf_hp_val_and_percText:SetText("|cff5599ff"..L["uf_general_use_both_value_and_percent"].."|r")
				else
					cb3:Disable()
					cb4:Disable()
					uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r |cffff5555"..L["uf_general_notice_activate_hpperc_for_this"].."|r")
					uf_hp_val_and_percText:SetText("|cff5599ff"..L["uf_general_use_both_value_and_percent"].."|r")
				end
				if cb2:GetChecked() == true then
					perc_val_divider_text:Show()
					perc_val_divider:Show()
					uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r |cffff5555"..L["uf_general_notice_deactivate_hpperc_for_this"].."|r")
				else
					perc_val_divider_text:Hide()
					perc_val_divider:Hide()
					uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r")
				end
				uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r")
			else
				cb2:Disable()
				cb3:Disable()
				perc_val_divider_text:Hide()
				perc_val_divider:Hide()
				uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r |cffff5555"..L["uf_general_notice_activate_hpperc_for_this"].."|r")
				uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r")
				uf_hp_val_and_percText:SetText("|cff5599ff"..L["uf_general_use_both_value_and_percent"].."|r |cffff5555"..L["uf_general_notice_activate_hpperc_for_this"].."|r")
			end
		end)

		if cb1:GetChecked() == true then
			if cb2:GetChecked() == true then
				cb3:Enable()
				cb4:Enable()
				cb5:Enable()
			else
				cb3:Disable()
				cb4:Disable()
				cb5:Disable()
				uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r |cffff5555"..L["uf_general_notice_activate_hpperc_for_this"].."|r")
				uf_siValText:SetText("|cff5599ff"..L["uf_general_use_short_values"].."|r |cffff5555"..L["uf_general_notice_deactivate_hpperc_for_this"].."|r")
				uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r |cffff5555"..L["uf_general_notice_deactivate_hpperc_for_this"].."|r")
			end
		else
			cb2:Disable()
			cb3:Disable()
			uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r |cffff5555"..L["uf_general_notice_activate_hpperc_for_this"].."|r")
			uf_hp_val_and_percText:SetText("|cff5599ff"..L["uf_general_use_both_value_and_percent"].."|r |cffff5555"..L["uf_general_notice_activate_hpperc_for_this"].."|r")
		end

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_use_val_and_perc"] = cb2:GetChecked()
			LolzenUI.SetUFTagUpdate()
			if cb2:GetChecked() == true then
				cb3:Enable()
				cb4:Enable()
				cb5:Enable()
				uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r")
				uf_siValText:SetText("|cff5599ff"..L["uf_general_use_short_values"].."|r")
				uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r")
				perc_val_divider_text:Show()
				perc_val_divider:Show()
			else
				cb3:Disable()
				cb4:Disable()
				cb5:Disable()
				perc_val_divider_text:Hide()
				perc_val_divider:Hide()
				uf_perc_firstText:SetText("|cff5599ff"..L["uf_general_switch_value_and_percent_order"].."|r |cffff5555"..L["uf_general_notice_activate_hpval_and_hpperc_for_this"].."|r")
				uf_siValText:SetText("|cff5599ff"..L["uf_general_use_short_values"].."|r |cffff5555"..L["uf_general_notice_activate_hpval_and_hpperc_for_this"].."|r")
				uf_siVal_dotText:SetText("|cff5599ff"..L["uf_general_use dot_divider"].."|r |cffff5555"..L["uf_general_notice_activate_hpval_and_hpperc_for_this"].."|r")
			end
		end)

		if cb2:GetChecked() == true then
			perc_val_divider_text:Show()
			perc_val_divider:Show()
		else
			perc_val_divider_text:Hide()
			perc_val_divider:Hide()
		end

		local cb5BG = ns.createBackground("unitframes", 580, 40, "content")
		cb5BG:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", -4, -4)
		cb5BG:SetFrameLevel(1)

		local texture_text = ns.createFontstring("unitframes", L["texture"]..":", "content")
		texture_text:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 4, -19)

		local texture = ns.createPicker("unitframes", "statusbar", "uf_statusbar", 120, LolzenUIcfg.unitframes.general["uf_statusbar_texture"], "content")
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -2)
		texture.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_statusbar_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUI.SetUFTexture()
		end

		local border_text = ns.createFontstring("unitframes", L["border"]..":", "content")
		border_text:SetPoint("LEFT", texture, "RIGHT", -5, 1)

		local border = ns.createPicker("unitframes", "border", "uf_border", 120, LolzenUIcfg.unitframes.general["uf_border"], "content")
		border:SetPoint("LEFT", border_text, "RIGHT", -10, -1)
		border.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_border"] = UIDropDownMenu_GetSelectedName(border)
			LolzenUI.SetUFBorder()
		end

		local header1 = ns.createHeader("unitframes", L["raidmarks"], "content")
		header1:SetPoint("TOPLEFT", texture_text, "BOTTOMLEFT", -4, -20)

		local header1BG = ns.createBackground("unitframes", 580, 40, "content")
		header1BG:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", -4, -4)
		header1BG:SetFrameLevel(1)

		local rt_size_text = ns.createFontstring("unitframes", L["size"]..":", "content")
		rt_size_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 4, -19)

		local rt_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_ri_size"], "content")
		rt_size:SetPoint("LEFT", rt_size_text, "RIGHT", 10, 0)

		rt_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rt_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_ri_size"] = tonumber(rt_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidMarkSize()
		end)

		rt_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rt_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rt_pos_x_text = ns.createFontstring("unitframes", L["PosX"]..":", "content")
		rt_pos_x_text:SetPoint("LEFT", rt_size, "RIGHT", 10, 0)

		local rt_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_ri_posx"], "content")
		rt_pos_x:SetPoint("LEFT", rt_pos_x_text, "RIGHT", 10, 0)

		rt_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rt_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_ri_posx"] = tonumber(rt_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidMarkPos()
		end)

		rt_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rt_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rt_pos_y_text = ns.createFontstring("unitframes", L["PosY"]..":", "content")
		rt_pos_y_text:SetPoint("LEFT", rt_pos_x, "RIGHT", 10, 0)

		local rt_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_ri_posy"], "content")
		rt_pos_y:SetPoint("LEFT", rt_pos_y_text, "RIGHT", 10, 0)

		rt_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rt_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_ri_posy"] = tonumber(rt_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFRaidMarkPos()
		end)

		rt_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rt_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rt_anchor_text = ns.createFontstring("unitframes", L["anchor"]..":", "content")
		rt_anchor_text:SetPoint("LEFT", rt_pos_y, "RIGHT", 10, 0)

		local rt_anchor = ns.createPicker("unitframes", "anchor", "uf_rt_anchor", 110, LolzenUIcfg.unitframes.general["uf_ri_anchor"], "content")
		rt_anchor:SetPoint("LEFT", rt_anchor_text, "RIGHT", -10, -2)
		rt_anchor.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(rt_anchor)]
			LolzenUI.SetUFRaidMarkPos()
		end

		local header2 = ns.createHeader("unitframes", L["uf_general_leadindicator"], "content")
		header2:SetPoint("TOPLEFT", rt_size_text, "BOTTOMLEFT", -4, -20)

		local header2BG = ns.createBackground("unitframes", 580, 40, "content")
		header2BG:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", -4, -4)
		header2BG:SetFrameLevel(1)

		local lead_size_text = ns.createFontstring("unitframes", L["size"]..":", "content")
		lead_size_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 4, -19)

		local lead_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_lead_size"], "content")
		lead_size:SetPoint("LEFT", lead_size_text, "RIGHT", 10, 0)

		lead_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		lead_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_lead_size"] = tonumber(lead_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFLeadIndicatorSize()
		end)

		lead_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		lead_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local lead_pos_x_text = ns.createFontstring("unitframes", L["PosX"]..":", "content")
		lead_pos_x_text:SetPoint("LEFT", lead_size, "RIGHT", 10, 0)

		local lead_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_lead_posx"], "content")
		lead_pos_x:SetPoint("LEFT", lead_pos_x_text, "RIGHT", 10, 0)

		lead_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		lead_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_lead_posx"] = tonumber(lead_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFLeadIndicatorPos()
		end)

		lead_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		lead_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local lead_pos_y_text = ns.createFontstring("unitframes", L["PosY"]..":", "content")
		lead_pos_y_text:SetPoint("LEFT", lead_pos_x, "RIGHT", 10, 0)

		local lead_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_lead_posy"], "content")
		lead_pos_y:SetPoint("LEFT", lead_pos_y_text, "RIGHT", 10, 0)

		lead_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		lead_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_lead_posy"] = tonumber(lead_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFLeadIndicatorPos()
		end)

		lead_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		lead_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local lead_anchor_text = ns.createFontstring("unitframes", L["anchor"]..":", "content")
		lead_anchor_text:SetPoint("LEFT", lead_pos_y, "RIGHT", 10, 0)

		local lead_anchor = ns.createPicker("unitframes", "anchor", "uf_lead_anchor", 110, LolzenUIcfg.unitframes.general["uf_lead_anchor"], "content")
		lead_anchor:SetPoint("LEFT", lead_anchor_text, "RIGHT", -10, -2)
		lead_anchor.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_lead_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(lead_anchor)]
			LolzenUI.SetUFLeadIndicatorPos()
		end

		local header3 = ns.createHeader("unitframes", L["alpha"], "content")
		header3:SetPoint("TOPLEFT", lead_size_text, "BOTTOMLEFT", -4, -20)

		local header3BG = ns.createBackground("unitframes", 580, 136, "content")
		header3BG:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", -4, -4)
		header3BG:SetFrameLevel(1)

		local cb6 = ns.createCheckBox("unitframes", "uf_fadeout", "|cff5599ff"..L["uf_general_fadout_out_of_reach"].."|r", LolzenUIcfg.unitframes.general["uf_fade_outofreach"], "content")
		cb6:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		cb6:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_fade_outofreach"] = cb6:GetChecked()
			LolzenUI.SetUFPartyReachIndicatorToggle()
			LolzenUI.SetUFRaidReachIndicatorToggle()
		end)

		local fadeout_alpha_text = ns.createFontstring("unitframes", L["uf_general_fadout_out_of_reach_alpha"]..":", "content")
		fadeout_alpha_text:SetPoint("TOPLEFT", cb6, "BOTTOMLEFT", 4, -8)

		local fadeout_alpha = ns.createPicker("unitframes", "alpha", "uf_fadout_alpha", 45, LolzenUIcfg.unitframes.general["uf_fade_outofreach_alpha"], "content")
		fadeout_alpha:SetPoint("LEFT", fadeout_alpha_text, "RIGHT", -10, -3)
		fadeout_alpha.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_fade_outofreach_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(fadeout_alpha)])
			LolzenUI.SetUFPartyReachIndicatorAlpha()
			LolzenUI.SetUFRaidReachIndicatorAlpha()
		end

		local cb7 = ns.createCheckBox("unitframes", "uf_combatfade", "|cff5599ff"..L["uf_general_combatfade"].."|r", LolzenUIcfg.unitframes.general["uf_fade_combat"], "content")
		cb7:SetPoint("TOPLEFT", fadeout_alpha_text, "BOTTOMLEFT", -4, -8)

		cb7:SetScript("OnClick", function(self)
			LolzenUIcfg.unitframes.general["uf_fade_combat"] = cb7:GetChecked()
			LolzenUI.SetUFCombatFade()
		end)

		local combatfadeout_alpha_text = ns.createFontstring("unitframes", L["uf_general_combatfade_in_combat_alpha"]..":", "content")
		combatfadeout_alpha_text:SetPoint("TOPLEFT", cb7, "BOTTOMLEFT", 4, -8)

		local combatfadeout_alpha = ns.createPicker("unitframes", "alpha", "uf_combatfade_incombat", 45, LolzenUIcfg.unitframes.general["uf_fade_combat_incombat"], "content")
		combatfadeout_alpha:SetPoint("LEFT", combatfadeout_alpha_text, "RIGHT", -10, -3)
		combatfadeout_alpha.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_fade_combat_incombat"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(combatfadeout_alpha)])
			LolzenUI.SetUFCombatFadeAlpha()
		end

		local outofcombatfadeout_alpha_text = ns.createFontstring("unitframes", L["uf_general_combatfade_out_of_combat_alpha"]..":", "content")
		outofcombatfadeout_alpha_text:SetPoint("TOPLEFT", combatfadeout_alpha_text, "BOTTOMLEFT", 0, -15)

		local outofcombatfadeout_alpha = ns.createPicker("unitframes", "alpha", "uf_combatfade_outofcombat", 45, LolzenUIcfg.unitframes.general["uf_fade_combat_outofcombat"], "content")
		outofcombatfadeout_alpha:SetPoint("LEFT", outofcombatfadeout_alpha_text, "RIGHT", -10, -3)
		outofcombatfadeout_alpha.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_fade_combat_outofcombat"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(outofcombatfadeout_alpha)])
			LolzenUI.SetUFCombatFadeAlpha()
		end

		local header4 = ns.createHeader("unitframes", L["uf_general_hp_font_options"], "content")
		header4:SetPoint("TOPLEFT", outofcombatfadeout_alpha_text, "BOTTOMLEFT", -4, -20)

		local header4BG = ns.createBackground("unitframes", 580, 68, "content")
		header4BG:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", -4, -4)
		header4BG:SetFrameLevel(1)

		local general_hp_pos_x_text = ns.createFontstring("unitframes", L["PosX"]..":", "content")
		general_hp_pos_x_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 4, -20)

		local general_hp_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_general_hp_posx"], "content")
		general_hp_pos_x:SetPoint("LEFT", general_hp_pos_x_text, "RIGHT", 10, 0)

		general_hp_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		general_hp_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_general_hp_posx"] = tonumber(general_hp_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFGeneralHPPos()
		end)

		general_hp_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		general_hp_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local general_hp_pos_y_text = ns.createFontstring("unitframes", L["PosY"]..":", "content")
		general_hp_pos_y_text:SetPoint("LEFT", general_hp_pos_x, "RIGHT", 5, 0)

		local general_hp_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_general_hp_posy"], "content")
		general_hp_pos_y:SetPoint("LEFT", general_hp_pos_y_text, "RIGHT", 10, 0)

		general_hp_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		general_hp_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_general_hp_posy"] = tonumber(general_hp_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFGeneralHPPos()
		end)

		general_hp_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		general_hp_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local general_hp_anchor_text = ns.createFontstring("unitframes", L["anchor"]..":", "content")
		general_hp_anchor_text:SetPoint("LEFT", general_hp_pos_y, "RIGHT", 5, 0)

		local general_hp_anchor = ns.createPicker("unitframes", "anchor", "uf_general_hp_anchor", 110, LolzenUIcfg.unitframes.general["uf_general_hp_anchor"], "content")
		general_hp_anchor:SetPoint("LEFT", general_hp_anchor_text, "RIGHT", -10, -3)
		general_hp_anchor.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_general_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(general_hp_anchor)]
			LolzenUI.SetUFGeneralHPPos()
		end

		local general_hp_font_text = ns.createFontstring("unitframes", L["font"]..":", "content")
		general_hp_font_text:SetPoint("TOPLEFT", general_hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local general_hp_font = ns.createPicker("unitframes", "font", "uf_general_hp_font", 120, LolzenUIcfg.unitframes.general["uf_general_hp_font"], "content")
		general_hp_font:SetPoint("LEFT", general_hp_font_text, "RIGHT", -10, -3)
		general_hp_font.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_general_hp_font"] = UIDropDownMenu_GetSelectedName(general_hp_font)
			LolzenUI.SetUFGeneralHPFont()
		end

		local general_hp_font_size_text = ns.createFontstring("unitframes", L["size"]..":", "content")
		general_hp_font_size_text:SetPoint("LEFT", general_hp_font, "RIGHT", -5, 3)

		local general_hp_font_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes.general["uf_general_hp_font_size"], "content")
		general_hp_font_size:SetPoint("LEFT", general_hp_font_size_text, "RIGHT", 10, 0)

		general_hp_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		general_hp_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.unitframes.general["uf_general_hp_font_size"] = tonumber(general_hp_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetUFGeneralHPFont()
		end)

		general_hp_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		general_hp_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local general_hp_font_flag_text = ns.createFontstring("unitframes", L["flag"]..":", "content")
		general_hp_font_flag_text:SetPoint("LEFT", general_hp_font_size, "RIGHT", 10, 0)

		local general_hp_font_flag = ns.createPicker("unitframes", "flag", "uf_general_hp_font_flag", 120, LolzenUIcfg.unitframes.general["uf_general_hp_font_flag"], "content")
		general_hp_font_flag:SetPoint("LEFT", general_hp_font_flag_text, "RIGHT", -10, -3)
		general_hp_font_flag.OnClick = function()
			LolzenUIcfg.unitframes.general["uf_general_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(general_hp_font_flag)]
			LolzenUI.SetUFGeneralHPFont()
		end

		ns["unitframes"].default = function(self)
			LolzenUIcfg.unitframes.general = _G["LolzenUIdefaultcfg"].unitframes.general
			ReloadUI()
		end
	end
end)