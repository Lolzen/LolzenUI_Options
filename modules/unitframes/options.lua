--// options for unitframes //--

local _, ns = ...

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

		ns.unitframes.title = ns.createTitle("unitframes")

		ns.unitframes.about = ns.createDescription("unitframes", "General Unitframe Options")
		ns.unitframes.about:SetPoint("TOPLEFT", ns.unitframes.title, "BOTTOMLEFT", 0, -8)

		ns.unitframes.cb1 = ns.createCheckBox("unitframes", "uf_hp_perc", "|cff5599ffuse hp percentage|r", LolzenUIcfg.unitframes["uf_use_hp_percent"])
		ns.unitframes.cb1:SetPoint("TOPLEFT", ns.unitframes.about, "BOTTOMLEFT", 0, -20)

		ns.unitframes.cb2 = ns.createCheckBox("unitframes", "uf_hp_val_and_perc", "|cff5599ffuse both value and percent (reenables the options below)|r", LolzenUIcfg.unitframes["uf_use_val_and_perc"])
		ns.unitframes.cb2:SetPoint("TOPLEFT", ns.unitframes.cb1, "BOTTOMLEFT", 0, -0)

		ns.unitframes.perc_val_divider_text = ns.createFontstring("unitframes", "Percent & Value divider:")
		ns.unitframes.perc_val_divider_text:SetPoint("LEFT", uf_hp_val_and_percText, "RIGHT", 10, 0)

		ns.unitframes.perc_val_divider = ns.createInputbox("unitframes", 20, 20, LolzenUIcfg.unitframes["uf_val_perc_divider"])
		ns.unitframes.perc_val_divider:SetPoint("LEFT", ns.unitframes.perc_val_divider_text, "RIGHT", 10, 0)

		ns.unitframes.cb3 = ns.createCheckBox("unitframes", "uf_perc_first", "|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r", LolzenUIcfg.unitframes["uf_perc_first"])
		ns.unitframes.cb3:SetPoint("TOPLEFT", ns.unitframes.cb2, "BOTTOMLEFT", 0, -0)

		ns.unitframes.cb4 = ns.createCheckBox("unitframes", "uf_siVal", "|cff5599ffuse short values (34m5, 3k2, etc)|r", LolzenUIcfg.unitframes["uf_use_sivalue"])
		ns.unitframes.cb4:SetPoint("TOPLEFT", ns.unitframes.cb3, "BOTTOMLEFT", 0, -0)

		ns.unitframes.cb5 = ns.createCheckBox("unitframes", "uf_siVal_dot", "|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r", LolzenUIcfg.unitframes["uf_use_dot_format"])
		ns.unitframes.cb5:SetPoint("TOPLEFT", ns.unitframes.cb4, "BOTTOMLEFT", 0, -0)

		ns.unitframes.cb1:SetScript("OnClick", function(self)
			if ns.unitframes.cb1:GetChecked() == true then
				ns.unitframes.cb2:Enable()
				ns.unitframes.cb4:Disable()
				ns.unitframes.cb5:Disable()
				uf_hp_val_and_percText:SetText("|cff5599ffuse both value and percent (reenables the options below)|r")
				if ns.unitframes.cb2:GetChecked() == true then
					ns.unitframes.cb3:Enable()
					uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r")
				else
					ns.unitframes.cb3:Disable()
					uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r |cffff5555enable 'both value and percent'|r")
				end
				if ns.unitframes.cb2:GetChecked() == true then
					ns.unitframes.perc_val_divider_text:Show()
					ns.unitframes.perc_val_divider:Show()
				else
					ns.unitframes.perc_val_divider_text:Hide()
					ns.unitframes.perc_val_divider:Hide()
				end
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
				uf_siVal_dotText:SetText("|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r |cffff5555disable hp percentage for this option|r")
			else
				ns.unitframes.cb2:Disable()
				ns.unitframes.cb3:Disable()
				ns.unitframes.cb4:Enable()
				ns.unitframes.cb5:Enable()
				ns.unitframes.perc_val_divider_text:Hide()
				ns.unitframes.perc_val_divider:Hide()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r")
				uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r |cffff5555enable hp percentage for this option|r")
				uf_siVal_dotText:SetText("|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r")
				uf_hp_val_and_percText:SetText("|cff5599ffuse both value and percent|r |cffff5555enable hp percentage for this option|r")
			end
		end)

		if ns.unitframes.cb1:GetChecked() == true then
			if ns.unitframes.cb2:GetChecked() == true then
				ns.unitframes.cb3:Enable()
				ns.unitframes.cb4:Enable()
				ns.unitframes.cb5:Enable()
			else
				ns.unitframes.cb2:Disable()
				ns.unitframes.cb3:Disable()
				ns.unitframes.cb4:Disable()
				ns.unitframes.cb5:Disable()
				uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r |cffff5555enable 'both value and percent'|r")
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
			end
		else
			ns.unitframes.cb2:Disable()
			ns.unitframes.cb3:Disable()
			ns.unitframes.cb4:Enable()
			ns.unitframes.cb5:Enable()
			uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r |cffff5555enable hp percentage for this option|r")
			uf_hp_val_and_percText:SetText("|cff5599ffuse both value and percent|r |cffff5555enable hp percentage for this option|r")
		end

		ns.unitframes.cb2:SetScript("OnClick", function(self)
			if ns.unitframes.cb2:GetChecked() == true then
				ns.unitframes.cb3:Enable()
				ns.unitframes.cb4:Enable()
				ns.unitframes.cb5:Enable()
				uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r")
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r")
				uf_siVal_dotText:SetText("|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r")
				ns.unitframes.perc_val_divider_text:Show()
				ns.unitframes.perc_val_divider:Show()
			else
				ns.unitframes.cb3:Disable()
				ns.unitframes.cb4:Disable()
				ns.unitframes.cb5:Disable()
				ns.unitframes.perc_val_divider_text:Hide()
				ns.unitframes.perc_val_divider:Hide()
				uf_perc_firstText:SetText("|cff5599ffuse [percent]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[value] instead of [value]"..LolzenUIcfg.unitframes["uf_val_perc_divider"].."[percent]|r |cffff5555enable 'both value and percent'|r")
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
				uf_siVal_dotText:SetText("|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r |cffff5555disable hp percentage for this option|r")
			end
		end)

		if ns.unitframes.cb2:GetChecked() == true then
			ns.unitframes.perc_val_divider_text:Show()
			ns.unitframes.perc_val_divider:Show()
		else
			ns.unitframes.perc_val_divider_text:Hide()
			ns.unitframes.perc_val_divider:Hide()
		end

		ns.unitframes.texture_text = ns.createFontstring("unitframes", "Texture:")
		ns.unitframes.texture_text:SetPoint("TOPLEFT", ns.unitframes.cb5, "BOTTOMLEFT", 0, -15)

		ns.unitframes.texture = ns.createPicker("unitframes", "statusbar", "uf_statusbar", 120, LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.texture:SetPoint("LEFT", ns.unitframes.texture_text, "RIGHT", -10, -3)

		ns.unitframes.border_text = ns.createFontstring("unitframes", "Border:")
		ns.unitframes.border_text:SetPoint("LEFT", ns.unitframes.texture, "RIGHT", -5, 3)

		ns.unitframes.border = ns.createPicker("unitframes", "border", "uf_border", 120, LolzenUIcfg.unitframes["uf_border"])
		ns.unitframes.border:SetPoint("LEFT", ns.unitframes.border_text, "RIGHT", -10, -3)

		ns.unitframes.header1 = ns.createHeader("unitframes", "Raidmark indicator")
		ns.unitframes.header1:SetPoint("TOPLEFT", ns.unitframes.texture_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.rt_size_text = ns.createFontstring("unitframes", "Size:")
		ns.unitframes.rt_size_text:SetPoint("TOPLEFT", ns.unitframes.header1, "BOTTOMLEFT", 0, -10)

		ns.unitframes.rt_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_size"])
		ns.unitframes.rt_size:SetPoint("LEFT", ns.unitframes.rt_size_text, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_x_text = ns.createFontstring("unitframes", "PosX:")
		ns.unitframes.rt_pos_x_text:SetPoint("LEFT", ns.unitframes.rt_size, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_posx"])
		ns.unitframes.rt_pos_x:SetPoint("LEFT", ns.unitframes.rt_pos_x_text, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_y_text = ns.createFontstring("unitframes", "PosY:")
		ns.unitframes.rt_pos_y_text:SetPoint("LEFT", ns.unitframes.rt_pos_x, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_posy"])
		ns.unitframes.rt_pos_y:SetPoint("LEFT", ns.unitframes.rt_pos_y_text, "RIGHT", 10, 0)

		ns.unitframes.rt_anchor_text = ns.createFontstring("unitframes", "Anchor:")
		ns.unitframes.rt_anchor_text:SetPoint("LEFT", ns.unitframes.rt_pos_y, "RIGHT", 10, 0)

		ns.unitframes.rt_anchor = ns.createPicker("unitframes", "anchor", "uf_rt_anchor", 110, LolzenUIcfg.unitframes["uf_ri_anchor"])
		ns.unitframes.rt_anchor:SetPoint("LEFT", ns.unitframes.rt_anchor_text, "RIGHT", -10, -3)

		ns.unitframes.header2 = ns.createHeader("unitframes", "Lead indicator")
		ns.unitframes.header2:SetPoint("TOPLEFT", ns.unitframes.rt_size_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.lead_size_text = ns.createFontstring("unitframes", "Size:")
		ns.unitframes.lead_size_text:SetPoint("TOPLEFT", ns.unitframes.header2, "BOTTOMLEFT", 0, -10)

		ns.unitframes.lead_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_size"])
		ns.unitframes.lead_size:SetPoint("LEFT", ns.unitframes.lead_size_text, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_x_text = ns.createFontstring("unitframes", "PosX:")
		ns.unitframes.lead_pos_x_text:SetPoint("LEFT", ns.unitframes.lead_size, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_posx"])
		ns.unitframes.lead_pos_x:SetPoint("LEFT", ns.unitframes.lead_pos_x_text, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_y_text = ns.createFontstring("unitframes", "PosY:")
		ns.unitframes.lead_pos_y_text:SetPoint("LEFT", ns.unitframes.lead_pos_x, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_posy"])
		ns.unitframes.lead_pos_y:SetPoint("LEFT", ns.unitframes.lead_pos_y_text, "RIGHT", 10, 0)

		ns.unitframes.lead_anchor_text = ns.createFontstring("unitframes", "Anchor:")
		ns.unitframes.lead_anchor_text:SetPoint("LEFT", ns.unitframes.lead_pos_y, "RIGHT", 10, 0)

		ns.unitframes.lead_anchor = ns.createPicker("unitframes", "anchor", "uf_lead_anchor", 110, LolzenUIcfg.unitframes["uf_lead_anchor"])
		ns.unitframes.lead_anchor:SetPoint("LEFT", ns.unitframes.lead_anchor_text, "RIGHT", -10, -3)

		ns.unitframes.header3 = ns.createHeader("unitframes", "Fadeout")
		ns.unitframes.header3:SetPoint("TOPLEFT", ns.unitframes.lead_size_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.cb6 = ns.createCheckBox("unitframes", "uf_fadeout", "|cff5599fffadeout out of reach unitframes|r", LolzenUIcfg.unitframes["uf_fade_outofreach"])
		ns.unitframes.cb6:SetPoint("TOPLEFT", ns.unitframes.header3, "BOTTOMLEFT", 0, -8)

		ns.unitframes.fadeout_alpha_text = ns.createFontstring("unitframes", "out of reach alpha (party/raid members):")
		ns.unitframes.fadeout_alpha_text:SetPoint("TOPLEFT", ns.unitframes.cb6, "BOTTOMLEFT", 0, -8)

		ns.unitframes.fadeout_alpha = ns.createPicker("unitframes", "alpha", "uf_fadout_alpha", 45, LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"])
		ns.unitframes.fadeout_alpha:SetPoint("LEFT", ns.unitframes.fadeout_alpha_text, "RIGHT", -10, -3)

		ns.unitframes.header4 = ns.createHeader("unitframes", "General Healthpoints Font options (can be overwritten per unit specific settings)")
		ns.unitframes.header4:SetPoint("TOPLEFT", ns.unitframes.fadeout_alpha_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.general_hp_pos_x_text = ns.createFontstring("unitframes", "PosX:")
		ns.unitframes.general_hp_pos_x_text:SetPoint("TOPLEFT", ns.unitframes.header4, "BOTTOMLEFT", 0, -10)

		ns.unitframes.general_hp_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_general_hp_posx"])
		ns.unitframes.general_hp_pos_x:SetPoint("LEFT", ns.unitframes.general_hp_pos_x_text, "RIGHT", 10, 0)

		ns.unitframes.general_hp_pos_y_text = ns.createFontstring("unitframes", "PosY:")
		ns.unitframes.general_hp_pos_y_text:SetPoint("LEFT", ns.unitframes.general_hp_pos_x, "RIGHT", 5, 0)

		ns.unitframes.general_hp_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_general_hp_posy"])
		ns.unitframes.general_hp_pos_y:SetPoint("LEFT", ns.unitframes.general_hp_pos_y_text, "RIGHT", 10, 0)

		ns.unitframes.general_hp_anchor_text = ns.createFontstring("unitframes", "Anchor:")
		ns.unitframes.general_hp_anchor_text:SetPoint("LEFT", ns.unitframes.general_hp_pos_y, "RIGHT", 5, 0)

		ns.unitframes.general_hp_anchor = ns.createPicker("unitframes", "anchor", "uf_general_hp_anchor", 110, LolzenUIcfg.unitframes["uf_general_hp_anchor"])
		ns.unitframes.general_hp_anchor:SetPoint("LEFT", ns.unitframes.general_hp_anchor_text, "RIGHT", -10, -3)

		ns.unitframes.general_hp_font_text = ns.createFontstring("unitframes", "Font:")
		ns.unitframes.general_hp_font_text:SetPoint("TOPLEFT", ns.unitframes.general_hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.unitframes.general_hp_font = ns.createPicker("unitframes", "font", "uf_general_hp_font", 120, LolzenUIcfg.unitframes["uf_general_hp_font"])
		ns.unitframes.general_hp_font:SetPoint("LEFT", ns.unitframes.general_hp_font_text, "RIGHT", -10, -3)

		ns.unitframes.general_hp_font_size_text = ns.createFontstring("unitframes", "Font size:")
		ns.unitframes.general_hp_font_size_text:SetPoint("LEFT", ns.unitframes.general_hp_font, "RIGHT", -5, 3)

		ns.unitframes.general_hp_font_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_general_hp_font_size"])
		ns.unitframes.general_hp_font_size:SetPoint("LEFT", ns.unitframes.general_hp_font_size_text, "RIGHT", 10, 0)

		ns.unitframes.general_hp_font_flag_text = ns.createFontstring("unitframes", "Font flag:")
		ns.unitframes.general_hp_font_flag_text:SetPoint("LEFT", ns.unitframes.general_hp_font_size, "RIGHT", 10, 0)

		ns.unitframes.general_hp_font_flag = ns.createPicker("unitframes", "flag", "uf_general_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_general_hp_font_flag"])
		ns.unitframes.general_hp_font_flag:SetPoint("LEFT", ns.unitframes.general_hp_font_flag_text, "RIGHT", -10, -3)

		ns.unitframes.cb7 = ns.createCheckBox("unitframes", "uf_testmode", "|cffff0000tesmode: shows every unitframe at all times|r", LolzenUIcfg.unitframes["uf_testmode"])
		ns.unitframes.cb7:SetPoint("TOPLEFT", ns.unitframes.general_hp_font_text, "BOTTOMLEFT", 0, -18)
		
		-- // Create a subcategory panel for Player // --
		ns.uf_player_options = CreateFrame("Frame", "unitframe_playerpanel", ns["unitframes"])
		ns.uf_player_options.name = "   Player"
		ns.uf_player_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_player_options)

		ns.uf_player_options.title = ns.uf_player_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_player_options.title:SetPoint("TOPLEFT", ns.uf_player_options, 16, -16)
		ns.uf_player_options.title:SetText("|cff5599ffUnitframes module: Player Options|r")

		ns.uf_player_options.pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_player_options.pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_posx"])
		ns.uf_player_options.pos_x:SetPoint("LEFT", ns.uf_player_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.pos_y_text:SetPoint("LEFT", ns.uf_player_options.pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_posy"])
		ns.uf_player_options.pos_y:SetPoint("LEFT", ns.uf_player_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.anchor_text = ns.createFontstring("uf_player_options", "Anchor:")
		ns.uf_player_options.anchor_text:SetPoint("LEFT", ns.uf_player_options.pos_y, "RIGHT", 5, 0)

		ns.uf_player_options.anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_anchor", 110, LolzenUIcfg.unitframes["uf_player_anchor"])
		ns.uf_player_options.anchor:SetPoint("LEFT", ns.uf_player_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_player_options.width_text = ns.createFontstring("uf_player_options", "Width:")
		ns.uf_player_options.width_text:SetPoint("TOPLEFT", ns.uf_player_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_player_options.width = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes["uf_player_width"])
		ns.uf_player_options.width:SetPoint("LEFT", ns.uf_player_options.width_text, "RIGHT", 10, 0)

		ns.uf_player_options.height_text = ns.createFontstring("uf_player_options", "Height:")
		ns.uf_player_options.height_text:SetPoint("LEFT", ns.uf_player_options.width, "RIGHT", 10, 0)

		ns.uf_player_options.height = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes["uf_player_height"])
		ns.uf_player_options.height:SetPoint("LEFT", ns.uf_player_options.height_text, "RIGHT", 10, 0)

		ns.uf_player_options.header1 = ns.createHeader("uf_player_options", "Healthpoints")
		ns.uf_player_options.header1:SetPoint("TOPLEFT", ns.uf_player_options.width_text, 0, -30)

		ns.uf_player_options.cb1 = ns.createCheckBox("uf_player_options", "uf_player_use_custom_font_hp", "|cff5599ffoverwrite the general font options for player healthpoints|r", LolzenUIcfg.unitframes["uf_player_use_own_hp_font_settings"])
		ns.uf_player_options.cb1:SetPoint("TOPLEFT", ns.uf_player_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_player_options.hp_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_player_options.hp_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_posx"])
		ns.uf_player_options.hp_pos_x:SetPoint("LEFT", ns.uf_player_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.hp_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_player_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.hp_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_posy"])
		ns.uf_player_options.hp_pos_y:SetPoint("LEFT", ns.uf_player_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.hp_anchor_text = ns.createFontstring("uf_player_options", "Anchor:")
		ns.uf_player_options.hp_anchor_text:SetPoint("LEFT", ns.uf_player_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_player_options.hp_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_hp_anchor", 110, LolzenUIcfg.unitframes["uf_player_hp_anchor"])
		ns.uf_player_options.hp_anchor:SetPoint("LEFT", ns.uf_player_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_player_options.hp_font_text = ns.createFontstring("uf_player_options", "Font:")
		ns.uf_player_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_player_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_player_options.hp_font = ns.createPicker("uf_player_options", "font", "uf_player_hp_font", 120, LolzenUIcfg.unitframes["uf_player_hp_font"])
		ns.uf_player_options.hp_font:SetPoint("LEFT", ns.uf_player_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_player_options.hp_font_size_text = ns.createFontstring("uf_player_options", "Font size:")
		ns.uf_player_options.hp_font_size_text:SetPoint("LEFT", ns.uf_player_options.hp_font, "RIGHT", -5, 3)

		ns.uf_player_options.hp_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_font_size"])
		ns.uf_player_options.hp_font_size:SetPoint("LEFT", ns.uf_player_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_player_options.hp_font_flag_text = ns.createFontstring("uf_player_options", "Font flag:")
		ns.uf_player_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_player_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_player_options.hp_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_player_hp_font_flag"])
		ns.uf_player_options.hp_font_flag:SetPoint("LEFT", ns.uf_player_options.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_player_options.header2 = ns.createHeader("uf_player_options", "Powerpoints")
		ns.uf_player_options.header2:SetPoint("TOPLEFT", ns.uf_player_options.hp_font_text, 0, -30)

		ns.uf_player_options.pp_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.pp_pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_player_options.pp_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_pp_posx"])
		ns.uf_player_options.pp_pos_x:SetPoint("LEFT", ns.uf_player_options.pp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.pp_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.pp_pos_y_text:SetPoint("LEFT", ns.uf_player_options.pp_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.pp_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_pp_posy"])
		ns.uf_player_options.pp_pos_y:SetPoint("LEFT", ns.uf_player_options.pp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.pp_anchor_text = ns.createFontstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.pp_anchor_text:SetPoint("LEFT", ns.uf_player_options.pp_pos_y, "RIGHT", 5, 0)

		ns.uf_player_options.pp_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_pp_anchor", 90, LolzenUIcfg.unitframes["uf_player_pp_anchor"])
		ns.uf_player_options.pp_anchor:SetPoint("LEFT", ns.uf_player_options.pp_anchor_text, "RIGHT", -10, -3)

		ns.uf_player_options.pp_parent_text = ns.createFontstring("uf_player_options", "Parent:")
		ns.uf_player_options.pp_parent_text:SetPoint("LEFT", ns.uf_player_options.pp_anchor, "RIGHT", -10, 3)

		ns.uf_player_options.pp_parent = ns.createPicker("uf_player_options", "uf_parent", "uf_player_pp_parent", 50, LolzenUIcfg.unitframes["uf_player_pp_parent"])
		ns.uf_player_options.pp_parent:SetPoint("LEFT", ns.uf_player_options.pp_parent_text, "RIGHT", -10, -3)
		
		ns.uf_player_options.pp_anchor2_text = ns.createFontstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.pp_anchor2_text:SetPoint("LEFT", ns.uf_player_options.pp_parent, "RIGHT", -10, 3)

		ns.uf_player_options.pp_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_pp_anchor2", 90, LolzenUIcfg.unitframes["uf_player_pp_anchor2"])
		ns.uf_player_options.pp_anchor2:SetPoint("LEFT", ns.uf_player_options.pp_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.pp_font_text = ns.createFontstring("uf_player_options", "Font:")
		ns.uf_player_options.pp_font_text:SetPoint("TOPLEFT", ns.uf_player_options.pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_player_options.pp_font = ns.createPicker("uf_player_options", "font", "uf_player_pp_font", 120, LolzenUIcfg.unitframes["uf_player_pp_font"])
		ns.uf_player_options.pp_font:SetPoint("LEFT", ns.uf_player_options.pp_font_text, "RIGHT", -10, -3)

		ns.uf_player_options.pp_font_size_text = ns.createFontstring("uf_player_options", "Font size:")
		ns.uf_player_options.pp_font_size_text:SetPoint("LEFT", ns.uf_player_options.pp_font, "RIGHT", -5, 3)

		ns.uf_player_options.pp_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_pp_font_size"])
		ns.uf_player_options.pp_font_size:SetPoint("LEFT", ns.uf_player_options.pp_font_size_text, "RIGHT", 10, 0)

		ns.uf_player_options.pp_font_flag_text = ns.createFontstring("uf_player_options", "Font flag:")
		ns.uf_player_options.pp_font_flag_text:SetPoint("LEFT", ns.uf_player_options.pp_font_size, "RIGHT", 10, 0)

		ns.uf_player_options.pp_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_pp_font_flag", 120, LolzenUIcfg.unitframes["uf_player_pp_font_flag"])
		ns.uf_player_options.pp_font_flag:SetPoint("LEFT", ns.uf_player_options.pp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_player_options.header3 = ns.createHeader("uf_player_options", "Class Power & Runes")
		ns.uf_player_options.header3:SetPoint("TOPLEFT", ns.uf_player_options.pp_font_text, 0, -30)
		
		ns.uf_player_options.classpower_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.classpower_pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.header3, "BOTTOMLEFT", 0, -13)

		ns.uf_player_options.classpower_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_classpower_posx"])
		ns.uf_player_options.classpower_pos_x:SetPoint("LEFT", ns.uf_player_options.classpower_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.classpower_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.classpower_pos_y_text:SetPoint("LEFT", ns.uf_player_options.classpower_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.classpower_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_classpower_posy"])
		ns.uf_player_options.classpower_pos_y:SetPoint("LEFT", ns.uf_player_options.classpower_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.classpower_anchor1_text = ns.createFontstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.classpower_anchor1_text:SetPoint("LEFT", ns.uf_player_options.classpower_pos_y, "RIGHT", 10, 0)

		ns.uf_player_options.classpower_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_classpower_anchor1", 110, LolzenUIcfg.unitframes["uf_player_classpower_anchor1"])
		ns.uf_player_options.classpower_anchor1:SetPoint("LEFT", ns.uf_player_options.classpower_anchor1_text, "RIGHT", -10, -3)

		ns.uf_player_options.classpower_anchor2_text = ns.createFontstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.classpower_anchor2_text:SetPoint("LEFT", ns.uf_player_options.classpower_anchor1, "RIGHT", -5, 3)

		ns.uf_player_options.classpower_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_classpower_anchor2", 110, LolzenUIcfg.unitframes["uf_player_classpower_anchor2"])
		ns.uf_player_options.classpower_anchor2:SetPoint("LEFT", ns.uf_player_options.classpower_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.classpower_border_text = ns.createFontstring("uf_player_options", "Border:")
		ns.uf_player_options.classpower_border_text:SetPoint("TOPLEFT", ns.uf_player_options.classpower_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_player_options.classpower_border = ns.createPicker("uf_player_options", "border", "uf_player_classbar_border", 120, LolzenUIcfg.unitframes["uf_player_classpower_border"])
		ns.uf_player_options.classpower_border:SetPoint("LEFT", ns.uf_player_options.classpower_border_text, "RIGHT", -10, -3)

		ns.uf_player_options.classpower_spacing_text = ns.createFontstring("uf_player_options", "Spacing:")
		ns.uf_player_options.classpower_spacing_text:SetPoint("LEFT", ns.uf_player_options.classpower_border, "RIGHT", -5, 3)

		ns.uf_player_options.classpower_spacing = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_classpower_spacing"])
		ns.uf_player_options.classpower_spacing:SetPoint("LEFT", ns.uf_player_options.classpower_spacing_text, "RIGHT", 10, 0)

		ns.uf_player_options.header4 = ns.createHeader("uf_player_options", "Castbar")
		ns.uf_player_options.header4:SetPoint("TOPLEFT", ns.uf_player_options.classpower_border_text, 0, -30)

		ns.uf_player_options.cb2 = ns.createCheckBox("uf_player_options", "uf_player_use_castbar_standalone", "|cff5599ffuse standalone castbar (independent placement & size)|r", LolzenUIcfg.unitframes["uf_player_cb_standalone"])
		ns.uf_player_options.cb2:SetPoint("TOPLEFT", ns.uf_player_options.header4, "BOTTOMLEFT", 0, -8)

		ns.uf_player_options.cb_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.cb_pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.cb2, "BOTTOMLEFT", 0, -5)

		ns.uf_player_options.cb_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_posx"])
		ns.uf_player_options.cb_pos_x:SetPoint("LEFT", ns.uf_player_options.cb_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.cb_pos_y_text:SetPoint("LEFT", ns.uf_player_options.cb_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.cb_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_posy"])
		ns.uf_player_options.cb_pos_y:SetPoint("LEFT", ns.uf_player_options.cb_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_anchor1_text = ns.createFontstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.cb_anchor1_text:SetPoint("LEFT", ns.uf_player_options.cb_pos_y, "RIGHT", 10, 0)

		ns.uf_player_options.cb_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_anchor1", 110, LolzenUIcfg.unitframes["uf_player_cb_anchor1"])
		ns.uf_player_options.cb_anchor1:SetPoint("LEFT", ns.uf_player_options.cb_anchor1_text, "RIGHT", -10, -3)

		ns.uf_player_options.cb_anchor2_text = ns.createFontstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.cb_anchor2_text:SetPoint("LEFT", ns.uf_player_options.cb_anchor1, "RIGHT", -5, 3)

		ns.uf_player_options.cb_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_anchor2", 110, LolzenUIcfg.unitframes["uf_player_cb_anchor2"])
		ns.uf_player_options.cb_anchor2:SetPoint("LEFT", ns.uf_player_options.cb_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.cb_width_text = ns.createFontstring("uf_player_options", "Width:")
		ns.uf_player_options.cb_width_text:SetPoint("TOPLEFT", ns.uf_player_options.cb_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_player_options.cb_width = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_width"])
		ns.uf_player_options.cb_width:SetPoint("LEFT", ns.uf_player_options.cb_width_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_height_text = ns.createFontstring("uf_player_options", "Height:")
		ns.uf_player_options.cb_height_text:SetPoint("LEFT", ns.uf_player_options.cb_width, "RIGHT", 10, 0)

		ns.uf_player_options.cb_height = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_height"])
		ns.uf_player_options.cb_height:SetPoint("LEFT", ns.uf_player_options.cb_height_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_color_text = ns.createFontstring("uf_player_options", "Color:")

		ns.uf_player_options.cb_color = ns.createColorTexture("uf_player_options", 16, 16, LolzenUIcfg.unitframes["uf_player_cb_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_player_options.cb_color:SetPoint("LEFT", ns.uf_player_options.cb_color_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_color_f = ns.createColorPicker("uf_player_options", ns.uf_player_options.cb_color, LolzenUIcfg.unitframes["uf_player_cb_color"])
		ns.uf_player_options.cb_color_f:SetAllPoints(ns.uf_player_options.cb_color)

		ns.uf_player_options.cb_alpha_text = ns.createFontstring("uf_player_options", "Alpha:")
		ns.uf_player_options.cb_alpha_text:SetPoint("LEFT", ns.uf_player_options.cb_color, "RIGHT", 10, 0)

		ns.uf_player_options.cb_alpha = ns.createPicker("uf_player_options", "alpha", "uf_player_cb_alpha", 45, LolzenUIcfg.unitframes["uf_player_cb_alpha"])
		ns.uf_player_options.cb_alpha:SetPoint("LEFT", ns.uf_player_options.cb_alpha_text, "RIGHT", -10, -3)

		ns.uf_player_options.header5 = ns.createHeader("uf_player_options", "Icon:")

		ns.uf_player_options.cb2:SetScript("OnClick", function(self)
			if ns.uf_player_options.cb2:GetChecked() == true then
				ns.uf_player_options.cb_pos_x_text:Show()
				ns.uf_player_options.cb_pos_x:Show()
				ns.uf_player_options.cb_pos_y_text:Show()
				ns.uf_player_options.cb_pos_y:Show()
				ns.uf_player_options.cb_anchor1_text:Show()
				ns.uf_player_options.cb_anchor1:Show()
				ns.uf_player_options.cb_anchor2_text:Show()
				ns.uf_player_options.cb_anchor2:Show()
				ns.uf_player_options.cb_width_text:Show()
				ns.uf_player_options.cb_width:Show()
				ns.uf_player_options.cb_height_text:Show()
				ns.uf_player_options.cb_height:Show()
				ns.uf_player_options.cb_color_text:ClearAllPoints()
				ns.uf_player_options.cb_color_text:SetPoint("LEFT", ns.uf_player_options.cb_height, "RIGHT", 10, 0)
				ns.uf_player_options.header5:SetPoint("TOPLEFT", ns.uf_player_options.cb_width_text, "BOTTOMLEFT", 0, -12)
			else
				ns.uf_player_options.cb_pos_x_text:Hide()
				ns.uf_player_options.cb_pos_x:Hide()
				ns.uf_player_options.cb_pos_y_text:Hide()
				ns.uf_player_options.cb_pos_y:Hide()
				ns.uf_player_options.cb_anchor1_text:Hide()
				ns.uf_player_options.cb_anchor1:Hide()
				ns.uf_player_options.cb_anchor2_text:Hide()
				ns.uf_player_options.cb_anchor2:Hide()
				ns.uf_player_options.cb_width_text:Hide()
				ns.uf_player_options.cb_width:Hide()
				ns.uf_player_options.cb_height_text:Hide()
				ns.uf_player_options.cb_height:Hide()
				ns.uf_player_options.cb_color_text:ClearAllPoints()
				ns.uf_player_options.cb_color_text:SetPoint("TOPLEFT", ns.uf_player_options.cb2, "BOTTOMLEFT", 0, -5)
				ns.uf_player_options.header5:SetPoint("TOPLEFT", ns.uf_player_options.cb_color_text, "BOTTOMLEFT", 0, -12)
			end
		end)

		if ns.uf_player_options.cb2:GetChecked() == true then
			ns.uf_player_options.cb_pos_x_text:Show()
			ns.uf_player_options.cb_pos_x:Show()
			ns.uf_player_options.cb_pos_y_text:Show()
			ns.uf_player_options.cb_pos_y:Show()
			ns.uf_player_options.cb_anchor1_text:Show()
			ns.uf_player_options.cb_anchor1:Show()
			ns.uf_player_options.cb_anchor2_text:Show()
			ns.uf_player_options.cb_anchor2:Show()
			ns.uf_player_options.cb_width_text:Show()
			ns.uf_player_options.cb_width:Show()
			ns.uf_player_options.cb_height_text:Show()
			ns.uf_player_options.cb_height:Show()
			ns.uf_player_options.cb_color_text:SetPoint("LEFT", ns.uf_player_options.cb_height, "RIGHT", 10, 0)
			ns.uf_player_options.header5:SetPoint("TOPLEFT", ns.uf_player_options.cb_width_text, "BOTTOMLEFT", 0, -13)
		else
			ns.uf_player_options.cb_pos_x_text:Hide()
			ns.uf_player_options.cb_pos_x:Hide()
			ns.uf_player_options.cb_pos_y_text:Hide()
			ns.uf_player_options.cb_pos_y:Hide()
			ns.uf_player_options.cb_anchor1_text:Hide()
			ns.uf_player_options.cb_anchor1:Hide()
			ns.uf_player_options.cb_anchor2_text:Hide()
			ns.uf_player_options.cb_anchor2:Hide()
			ns.uf_player_options.cb_width_text:Hide()
			ns.uf_player_options.cb_width:Hide()
			ns.uf_player_options.cb_height_text:Hide()
			ns.uf_player_options.cb_height:Hide()
			ns.uf_player_options.cb_color_text:SetPoint("TOPLEFT", ns.uf_player_options.cb2, "BOTTOMLEFT", 0, -5)
			ns.uf_player_options.header5:SetPoint("TOPLEFT", ns.uf_player_options.cb_color_text, "BOTTOMLEFT", 0, -13)
		end

		ns.uf_player_options.cb_icon_size_text = ns.createFontstring("uf_player_options", "Size:")
		ns.uf_player_options.cb_icon_size_text:SetPoint("LEFT", ns.uf_player_options.header5, "RIGHT", 10, 0)

		ns.uf_player_options.cb_icon_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_icon_size"])
		ns.uf_player_options.cb_icon_size:SetPoint("LEFT", ns.uf_player_options.cb_icon_size_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_icon_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.cb_icon_pos_x_text:SetPoint("LEFT", ns.uf_player_options.cb_icon_size, "RIGHT", 10, 0)

		ns.uf_player_options.cb_icon_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_icon_posx"])
		ns.uf_player_options.cb_icon_pos_x:SetPoint("LEFT", ns.uf_player_options.cb_icon_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_icon_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.cb_icon_pos_y_text:SetPoint("LEFT", ns.uf_player_options.cb_icon_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.cb_icon_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_icon_posy"])
		ns.uf_player_options.cb_icon_pos_y:SetPoint("LEFT", ns.uf_player_options.cb_icon_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_icon_anchor1_text = ns.createFontstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.cb_icon_anchor1_text:SetPoint("LEFT", ns.uf_player_options.cb_icon_pos_y, "RIGHT", 10, 0)

		ns.uf_player_options.cb_icon_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_icon_anchor1", 70, LolzenUIcfg.unitframes["uf_player_cb_icon_anchor1"])
		ns.uf_player_options.cb_icon_anchor1:SetPoint("LEFT", ns.uf_player_options.cb_icon_anchor1_text, "RIGHT", -10, -3)

		ns.uf_player_options.cb_icon_anchor2_text = ns.createFontstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.cb_icon_anchor2_text:SetPoint("LEFT", ns.uf_player_options.cb_icon_anchor1, "RIGHT", -5, 3)

		ns.uf_player_options.cb_icon_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_icon_anchor2", 70, LolzenUIcfg.unitframes["uf_player_cb_icon_anchor2"])
		ns.uf_player_options.cb_icon_anchor2:SetPoint("LEFT", ns.uf_player_options.cb_icon_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.header6 = ns.createHeader("uf_player_options", "Time:")
		ns.uf_player_options.header6:SetPoint("TOPLEFT", ns.uf_player_options.header5, "BOTTOMLEFT", 0, -13)

		ns.uf_player_options.cb_time_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.cb_time_pos_x_text:SetPoint("LEFT", ns.uf_player_options.header6, "RIGHT", 10, 0)

		ns.uf_player_options.cb_time_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_time_posx"])
		ns.uf_player_options.cb_time_pos_x:SetPoint("LEFT", ns.uf_player_options.cb_time_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_time_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.cb_time_pos_y_text:SetPoint("LEFT", ns.uf_player_options.cb_time_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.cb_time_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_time_posy"])
		ns.uf_player_options.cb_time_pos_y:SetPoint("LEFT", ns.uf_player_options.cb_time_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_time_anchor1_text = ns.createFontstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.cb_time_anchor1_text:SetPoint("LEFT", ns.uf_player_options.cb_time_pos_y, "RIGHT", 10, 0)

		ns.uf_player_options.cb_time_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_time_anchor1", 110, LolzenUIcfg.unitframes["uf_player_cb_time_anchor1"])
		ns.uf_player_options.cb_time_anchor1:SetPoint("LEFT", ns.uf_player_options.cb_time_anchor1_text, "RIGHT", -10, -3)

		ns.uf_player_options.cb_time_anchor2_text = ns.createFontstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.cb_time_anchor2_text:SetPoint("LEFT", ns.uf_player_options.cb_time_anchor1, "RIGHT", -5, 3)

		ns.uf_player_options.cb_time_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_time_anchor2", 110, LolzenUIcfg.unitframes["uf_player_cb_time_anchor2"])
		ns.uf_player_options.cb_time_anchor2:SetPoint("LEFT", ns.uf_player_options.cb_time_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.header7 = ns.createHeader("uf_player_options", "Text:")
		ns.uf_player_options.header7:SetPoint("TOPLEFT", ns.uf_player_options.header6, "BOTTOMLEFT", 0, -13)

		ns.uf_player_options.cb_text_pos_x_text = ns.createFontstring("uf_player_options", "PosX:")
		ns.uf_player_options.cb_text_pos_x_text:SetPoint("LEFT", ns.uf_player_options.header7, "RIGHT", 10, 0)

		ns.uf_player_options.cb_text_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_text_posx"])
		ns.uf_player_options.cb_text_pos_x:SetPoint("LEFT", ns.uf_player_options.cb_text_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_text_pos_y_text = ns.createFontstring("uf_player_options", "PosY:")
		ns.uf_player_options.cb_text_pos_y_text:SetPoint("LEFT", ns.uf_player_options.cb_text_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.cb_text_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_text_posy"])
		ns.uf_player_options.cb_text_pos_y:SetPoint("LEFT", ns.uf_player_options.cb_text_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_text_anchor1_text = ns.createFontstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.cb_text_anchor1_text:SetPoint("LEFT", ns.uf_player_options.cb_text_pos_y, "RIGHT", 10, 0)

		ns.uf_player_options.cb_text_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_text_anchor1", 110, LolzenUIcfg.unitframes["uf_player_cb_text_anchor1"])
		ns.uf_player_options.cb_text_anchor1:SetPoint("LEFT", ns.uf_player_options.cb_text_anchor1_text, "RIGHT", -10, -3)

		ns.uf_player_options.cb_text_anchor2_text = ns.createFontstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.cb_text_anchor2_text:SetPoint("LEFT", ns.uf_player_options.cb_text_anchor1, "RIGHT", -5, 3)

		ns.uf_player_options.cb_text_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_cb_text_anchor2", 110, LolzenUIcfg.unitframes["uf_player_cb_text_anchor2"])
		ns.uf_player_options.cb_text_anchor2:SetPoint("LEFT", ns.uf_player_options.cb_text_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.header8 = ns.createHeader("uf_player_options", "Time/Text Font:")
		ns.uf_player_options.header8:SetPoint("TOPLEFT", ns.uf_player_options.header7, "BOTTOMLEFT", 0, -13)

		ns.uf_player_options.cb_font = ns.createPicker("uf_player_options", "font", "uf_player_cb_font", 120, LolzenUIcfg.unitframes["uf_player_cb_font"])
		ns.uf_player_options.cb_font:SetPoint("LEFT", ns.uf_player_options.header8, "RIGHT", -10, -3)

		ns.uf_player_options.cb_font_size_text = ns.createFontstring("uf_player_options", "Size:")
		ns.uf_player_options.cb_font_size_text:SetPoint("LEFT", ns.uf_player_options.cb_font, "RIGHT", -5, 3)

		ns.uf_player_options.cb_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_cb_font_size"])
		ns.uf_player_options.cb_font_size:SetPoint("LEFT", ns.uf_player_options.cb_font_size_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_font_flag_text = ns.createFontstring("uf_player_options", "Flag:")
		ns.uf_player_options.cb_font_flag_text:SetPoint("LEFT", ns.uf_player_options.cb_font_size, "RIGHT", 10, 0)

		ns.uf_player_options.cb_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_cb_font_flag", 120, LolzenUIcfg.unitframes["uf_player_cb_font_flag"])
		ns.uf_player_options.cb_font_flag:SetPoint("LEFT", ns.uf_player_options.cb_font_flag_text, "RIGHT", -10, -3)

		ns.uf_player_options.cb_font_color_text = ns.createFontstring("uf_player_options", "Color:")
		ns.uf_player_options.cb_font_color_text:SetPoint("LEFT", ns.uf_player_options.cb_font_flag, "RIGHT", -10, 3)

		ns.uf_player_options.cb_font_color = ns.createColorTexture("uf_player_options", 16, 16, LolzenUIcfg.unitframes["uf_player_cb_font_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_player_options.cb_font_color:SetPoint("LEFT", ns.uf_player_options.cb_font_color_text, "RIGHT", 10, 0)

		ns.uf_player_options.cb_font_color_f = ns.createColorPicker("uf_player_options", ns.uf_player_options.cb_font_color, LolzenUIcfg.unitframes["uf_player_cb_font_color"])
		ns.uf_player_options.cb_font_color_f:SetAllPoints(ns.uf_player_options.cb_font_color)

		-- // Create a subcategory panel for Target // --
		ns.uf_target_options = CreateFrame("Frame", "unitframe_targetpanel", ns["unitframes"])
		ns.uf_target_options.name = "   Target"
		ns.uf_target_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_target_options)
		
		-- as the optionpanel space is sparse, create a scrollframe where we can put all the content in we want
		ns.uf_target_options.scrollframe = CreateFrame("ScrollFrame", nil, ns.uf_target_options)
		ns.uf_target_options.scrollframe:SetPoint("TOPLEFT", 0, -5) 
		ns.uf_target_options.scrollframe:SetPoint("BOTTOMRIGHT", 0, 5)
		
		ns.uf_target_options.scrollbar = CreateFrame("Slider", nil, ns.uf_target_options.scrollframe, "UIPanelScrollBarTemplate")
		ns.uf_target_options.scrollbar:SetPoint("TOPLEFT", ns.uf_target_options, "TOPRIGHT", -20, -20)
		ns.uf_target_options.scrollbar:SetPoint("BOTTOMLEFT", ns.uf_target_options, "BOTTOMRIGHT", -20, 20)
		-- min value: 5, else the title would be misaligned with the other subpanel titles
		ns.uf_target_options.scrollbar:SetMinMaxValues(5, 23) 
		ns.uf_target_options.scrollbar:SetValueStep(1) 
		ns.uf_target_options.scrollbar.scrollStep = 1
		ns.uf_target_options.scrollbar:SetValue(0) 
		ns.uf_target_options.scrollbar:SetWidth(16) 
		ns.uf_target_options.scrollbar:SetScript("OnValueChanged", function (self, value) 
			self:GetParent():SetVerticalScroll(value) 
		end)
		
		ns.uf_target_options.content = CreateFrame("Frame", nil, ns.uf_target_options.scrollframe) 
		ns.uf_target_options.content:SetSize(128, 80) 
		ns.uf_target_options.scrollframe.content = ns.uf_target_options.content 
 
		ns.uf_target_options.scrollframe:SetScrollChild(ns.uf_target_options.content)
		
		-- enable mousewheel scrolling
		ns.uf_target_options.scrollframe:EnableMouseWheel(true)
		ns.uf_target_options.scrollframe:SetScript("OnMouseWheel", function(self, direction)
			local current = ns.uf_target_options.scrollbar:GetValue()
			if direction == 1 then -- "up"
				ns.uf_target_options.scrollbar:SetValue(current - 10)
			elseif direction == -1 then -- "down"
				ns.uf_target_options.scrollbar:SetValue(current + 10)
			end
		end)

		ns.uf_target_options.content.title = ns.uf_target_options.content:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_target_options.content.title:SetPoint("TOPLEFT", ns.uf_target_options.content, 16, -16)
		ns.uf_target_options.content.title:SetText("|cff5599ffUnitframes module: Target Options|r")

		ns.uf_target_options.content.pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.content.title, "BOTTOMLEFT", 0, -30)

		ns.uf_target_options.content.pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_posx"], "content")
		ns.uf_target_options.content.pos_x:SetPoint("LEFT", ns.uf_target_options.content.pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_posy"], "content")
		ns.uf_target_options.content.pos_y:SetPoint("LEFT", ns.uf_target_options.content.pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.anchor_text = ns.createFontstring("uf_target_options", "Anchor:", "content")
		ns.uf_target_options.content.anchor_text:SetPoint("LEFT", ns.uf_target_options.content.pos_y, "RIGHT", 5, 0)

		ns.uf_target_options.content.anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_anchor", 110, LolzenUIcfg.unitframes["uf_target_anchor"], "content")
		ns.uf_target_options.content.anchor:SetPoint("LEFT", ns.uf_target_options.content.anchor_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.width_text = ns.createFontstring("uf_target_options", "Width:", "content")
		ns.uf_target_options.content.width_text:SetPoint("TOPLEFT", ns.uf_target_options.content.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_target_options.content.width = ns.createInputbox("uf_target_options", 40, 20, LolzenUIcfg.unitframes["uf_target_width"], "content")
		ns.uf_target_options.content.width:SetPoint("LEFT", ns.uf_target_options.content.width_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.height_text = ns.createFontstring("uf_target_options", "Height:", "content")
		ns.uf_target_options.content.height_text:SetPoint("LEFT", ns.uf_target_options.content.width, "RIGHT", 10, 0)

		ns.uf_target_options.content.height = ns.createInputbox("uf_target_options", 40, 20, LolzenUIcfg.unitframes["uf_target_height"], "content")
		ns.uf_target_options.content.height:SetPoint("LEFT", ns.uf_target_options.content.height_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.header1 = ns.createHeader("uf_target_options", "Healthpoints", "content")
		ns.uf_target_options.content.header1:SetPoint("TOPLEFT", ns.uf_target_options.content.width_text, 0, -30)

		ns.uf_target_options.content.cb1 = ns.createCheckBox("uf_target_options", "uf_target_use_custom_font_hp", "|cff5599ffoverwrite the general font options for target healthpoints|r", LolzenUIcfg.unitframes["uf_target_use_own_hp_font_settings"], "content")
		ns.uf_target_options.content.cb1:SetPoint("TOPLEFT", ns.uf_target_options.content.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.content.hp_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.content.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.content.hp_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_posx"], "content")
		ns.uf_target_options.content.hp_pos_x:SetPoint("LEFT", ns.uf_target_options.content.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.hp_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.hp_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.hp_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_posy"], "content")
		ns.uf_target_options.content.hp_pos_y:SetPoint("LEFT", ns.uf_target_options.content.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.hp_anchor_text = ns.createFontstring("uf_target_options", "Anchor:", "content")
		ns.uf_target_options.content.hp_anchor_text:SetPoint("LEFT", ns.uf_target_options.content.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_target_options.content.hp_anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_hp_anchor", 110, LolzenUIcfg.unitframes["uf_target_hp_anchor"], "content")
		ns.uf_target_options.content.hp_anchor:SetPoint("LEFT", ns.uf_target_options.content.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.hp_font_text = ns.createFontstring("uf_target_options", "Font:", "content")
		ns.uf_target_options.content.hp_font_text:SetPoint("TOPLEFT", ns.uf_target_options.content.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_target_options.content.hp_font = ns.createPicker("uf_target_options", "font", "uf_target_hp_font", 120, LolzenUIcfg.unitframes["uf_target_hp_font"], "content")
		ns.uf_target_options.content.hp_font:SetPoint("LEFT", ns.uf_target_options.content.hp_font_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.hp_font_size_text = ns.createFontstring("uf_target_options", "Font size:", "content")
		ns.uf_target_options.content.hp_font_size_text:SetPoint("LEFT", ns.uf_target_options.content.hp_font, "RIGHT", -5, 3)

		ns.uf_target_options.content.hp_font_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_font_size"], "content")
		ns.uf_target_options.content.hp_font_size:SetPoint("LEFT", ns.uf_target_options.content.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.hp_font_flag_text = ns.createFontstring("uf_target_options", "Font flag:", "content")
		ns.uf_target_options.content.hp_font_flag_text:SetPoint("LEFT", ns.uf_target_options.content.hp_font_size, "RIGHT", 10, 0)

		ns.uf_target_options.content.hp_font_flag = ns.createPicker("uf_target_options", "flag", "uf_target_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_target_hp_font_flag"], "content")
		ns.uf_target_options.content.hp_font_flag:SetPoint("LEFT", ns.uf_target_options.content.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.header2 = ns.createHeader("uf_target_options", "Powerpoints", "content")
		ns.uf_target_options.content.header2:SetPoint("TOPLEFT", ns.uf_target_options.content.hp_font_text, 0, -30)

		ns.uf_target_options.content.pp_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.pp_pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.content.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.content.pp_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_pp_posx"], "content")
		ns.uf_target_options.content.pp_pos_x:SetPoint("LEFT", ns.uf_target_options.content.pp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.pp_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.pp_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.pp_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.pp_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_pp_posy"], "content")
		ns.uf_target_options.content.pp_pos_y:SetPoint("LEFT", ns.uf_target_options.content.pp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.pp_anchor_text = ns.createFontstring("uf_target_options", "Anchor1:", "content")
		ns.uf_target_options.content.pp_anchor_text:SetPoint("LEFT", ns.uf_target_options.content.pp_pos_y, "RIGHT", 5, 0)

		ns.uf_target_options.content.pp_anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_pp_anchor", 90, LolzenUIcfg.unitframes["uf_target_pp_anchor"], "content")
		ns.uf_target_options.content.pp_anchor:SetPoint("LEFT", ns.uf_target_options.content.pp_anchor_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.pp_parent_text = ns.createFontstring("uf_target_options", "Parent:", "content")
		ns.uf_target_options.content.pp_parent_text:SetPoint("LEFT", ns.uf_target_options.content.pp_anchor, "RIGHT", -10, 3)

		ns.uf_target_options.content.pp_parent = ns.createPicker("uf_target_options", "uf_parent", "uf_target_pp_parent", 50, LolzenUIcfg.unitframes["uf_target_pp_parent"], "content")
		ns.uf_target_options.content.pp_parent:SetPoint("LEFT", ns.uf_target_options.content.pp_parent_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.pp_anchor2_text = ns.createFontstring("uf_target_options", "Anchor2:", "content")
		ns.uf_target_options.content.pp_anchor2_text:SetPoint("LEFT", ns.uf_target_options.content.pp_parent, "RIGHT", -10, 3)

		ns.uf_target_options.content.pp_anchor2 = ns.createPicker("uf_target_options", "anchor", "uf_target_pp_anchor2", 90, LolzenUIcfg.unitframes["uf_target_pp_anchor2"], "content")
		ns.uf_target_options.content.pp_anchor2:SetPoint("LEFT", ns.uf_target_options.content.pp_anchor2_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.pp_font_text = ns.createFontstring("uf_target_options", "Font:", "content")
		ns.uf_target_options.content.pp_font_text:SetPoint("TOPLEFT", ns.uf_target_options.content.pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_target_options.content.pp_font = ns.createPicker("uf_target_options", "font", "uf_target_pp_font", 120, LolzenUIcfg.unitframes["uf_target_pp_font"], "content")
		ns.uf_target_options.content.pp_font:SetPoint("LEFT", ns.uf_target_options.content.pp_font_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.pp_font_size_text = ns.createFontstring("uf_target_options", "Font size:", "content")
		ns.uf_target_options.content.pp_font_size_text:SetPoint("LEFT", ns.uf_target_options.content.pp_font, "RIGHT", -5, 3)

		ns.uf_target_options.content.pp_font_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_pp_font_size"], "content")
		ns.uf_target_options.content.pp_font_size:SetPoint("LEFT", ns.uf_target_options.content.pp_font_size_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.pp_font_flag_text = ns.createFontstring("uf_target_options", "Font flag:", "content")
		ns.uf_target_options.content.pp_font_flag_text:SetPoint("LEFT", ns.uf_target_options.content.pp_font_size, "RIGHT", 10, 0)

		ns.uf_target_options.content.pp_font_flag = ns.createPicker("uf_target_options", "flag", "uf_target_pp_font_flag", 120, LolzenUIcfg.unitframes["uf_target_pp_font_flag"], "content")
		ns.uf_target_options.content.pp_font_flag:SetPoint("LEFT", ns.uf_target_options.content.pp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.header3 = ns.createHeader("uf_target_options", "Auras", "content")
		ns.uf_target_options.content.header3:SetPoint("TOPLEFT", ns.uf_target_options.content.pp_font_text, 0, -30)

		ns.uf_target_options.content.aura_type_text = ns.createFontstring("uf_target_options", "Show:", "content")
		ns.uf_target_options.content.aura_type_text:SetPoint("TOPLEFT", ns.uf_target_options.content.header3, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.content.aura_type = ns.createPicker("uf_target_options", "uf_auratype", "uf_target_aura_type", 70, LolzenUIcfg.unitframes["uf_target_aura_show_type"], "content")
		ns.uf_target_options.content.aura_type:SetPoint("LEFT", ns.uf_target_options.content.aura_type_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.aura_maxnum_text = ns.createFontstring("uf_target_options", "Show max (0-40):", "content")
		ns.uf_target_options.content.aura_maxnum_text:SetPoint("LEFT", ns.uf_target_options.content.aura_type, "RIGHT", -5, 3)

		ns.uf_target_options.content.aura_maxnum = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_aura_maxnum"], "content")
		ns.uf_target_options.content.aura_maxnum:SetPoint("LEFT", ns.uf_target_options.content.aura_maxnum_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_spacing_text = ns.createFontstring("uf_target_options", "Spacing:", "content")
		ns.uf_target_options.content.aura_spacing_text:SetPoint("LEFT", ns.uf_target_options.content.aura_maxnum, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_spacing = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_aura_spacing"], "content")
		ns.uf_target_options.content.aura_spacing:SetPoint("LEFT", ns.uf_target_options.content.aura_spacing_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_size_text = ns.createFontstring("uf_target_options", "Size:", "content")
		ns.uf_target_options.content.aura_size_text:SetPoint("LEFT", ns.uf_target_options.content.aura_spacing, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_aura_size"], "content")
		ns.uf_target_options.content.aura_size:SetPoint("LEFT", ns.uf_target_options.content.aura_size_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.aura_pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.content.aura_type_text, "BOTTOMLEFT", 0, -15)

		ns.uf_target_options.content.aura_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_aura_posx"], "content")
		ns.uf_target_options.content.aura_pos_x:SetPoint("LEFT", ns.uf_target_options.content.aura_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.aura_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.aura_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.aura_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_aura_posy"], "content")
		ns.uf_target_options.content.aura_pos_y:SetPoint("LEFT", ns.uf_target_options.content.aura_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.aura_anchor_text = ns.createFontstring("uf_target_options", "Anchor1:", "content")
		ns.uf_target_options.content.aura_anchor_text:SetPoint("LEFT", ns.uf_target_options.content.aura_pos_y, "RIGHT", 5, 0)

		ns.uf_target_options.content.aura_anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_aura_anchor", 90, LolzenUIcfg.unitframes["uf_target_aura_anchor1"], "content")
		ns.uf_target_options.content.aura_anchor:SetPoint("LEFT", ns.uf_target_options.content.aura_anchor_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.aura_anchor2_text = ns.createFontstring("uf_target_options", "Anchor2:", "content")
		ns.uf_target_options.content.aura_anchor2_text:SetPoint("LEFT", ns.uf_target_options.content.aura_anchor, "RIGHT", -10, 3)

		ns.uf_target_options.content.aura_anchor2 = ns.createPicker("uf_target_options", "anchor", "uf_target_aura_anchor2", 90, LolzenUIcfg.unitframes["uf_target_aura_anchor2"], "content")
		ns.uf_target_options.content.aura_anchor2:SetPoint("LEFT", ns.uf_target_options.content.aura_anchor2_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.aura_growthx_text = ns.createFontstring("uf_target_options", "GrowthX:", "content")
		ns.uf_target_options.content.aura_growthx_text:SetPoint("TOPLEFT", ns.uf_target_options.content.aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_target_options.content.aura_growthx = ns.createPicker("uf_target_options", "uf_auragrowth_x", "uf_target_aura_growthx", 70, LolzenUIcfg.unitframes["uf_target_aura_growth_x"], "content")
		ns.uf_target_options.content.aura_growthx:SetPoint("LEFT", ns.uf_target_options.content.aura_growthx_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.aura_growthy_text = ns.createFontstring("uf_target_options", "GrowthY:", "content")
		ns.uf_target_options.content.aura_growthy_text:SetPoint("LEFT", ns.uf_target_options.content.aura_growthx, "RIGHT", -5, 3)

		ns.uf_target_options.content.aura_growthy = ns.createPicker("uf_target_options", "uf_auragrowth_y", "uf_target_aura_growthy", 70, LolzenUIcfg.unitframes["uf_target_aura_growth_y"], "content")
		ns.uf_target_options.content.aura_growthy:SetPoint("LEFT", ns.uf_target_options.content.aura_growthy_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb2 = ns.createCheckBox("uf_target_options", "uf_target_show_only_player_auras", "|cff5599ffshow only player's auras|r", LolzenUIcfg.unitframes["uf_target_aura_show_only_player"], "content")
		ns.uf_target_options.content.cb2:SetPoint("TOPLEFT", ns.uf_target_options.content.aura_growthx_text, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.content.cb3 = ns.createCheckBox("uf_target_options", "uf_target_desature_nonplayer_auras", "|cff5599ffdesature nonplayer auras|r", LolzenUIcfg.unitframes["uf_target_aura_desature_nonplayer_auras"], "content")
		ns.uf_target_options.content.cb3:SetPoint("TOPLEFT", ns.uf_target_options.content.cb2, "BOTTOMLEFT", 0, 0)

		ns.uf_target_options.content.header4 = ns.createHeader("uf_target_options", "Castbar", "content")
		
		ns.uf_target_options.content.cb2:SetScript("OnClick", function(self)
			if ns.uf_target_options.content.cb2:GetChecked() == true then
				ns.uf_target_options.content.cb3:Hide()
				ns.uf_target_options.content.header4:SetPoint("TOPLEFT", ns.uf_target_options.content.cb2, 0, -30)
				ChangeScrollbarMinMax("uf_target_options", "-", 24)
			else
				ns.uf_target_options.content.cb3:Show()
				ns.uf_target_options.content.header4:SetPoint("TOPLEFT", ns.uf_target_options.content.cb3, 0, -30)
				ChangeScrollbarMinMax("uf_target_options", "+", 24)
			end
		end)

		if ns.uf_target_options.content.cb2:GetChecked() == true then
			ns.uf_target_options.content.cb3:Hide()
			ns.uf_target_options.content.header4:SetPoint("TOPLEFT", ns.uf_target_options.content.cb2, 0, -30)
		else
			ns.uf_target_options.content.cb3:Show()
			ns.uf_target_options.content.header4:SetPoint("TOPLEFT", ns.uf_target_options.content.cb3, 0, -30)
			ChangeScrollbarMinMax("uf_target_options", "+", 24)
		end

		ns.uf_target_options.content.cb4 = ns.createCheckBox("uf_target_options", "uf_target_use_castbar_standalone", "|cff5599ffuse standalone castbar (independent placement & size)|r", LolzenUIcfg.unitframes["uf_target_cb_standalone"], "content")
		ns.uf_target_options.content.cb4:SetPoint("TOPLEFT", ns.uf_target_options.content.header4, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.content.cb_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.cb_pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.content.cb4, "BOTTOMLEFT", 0, -5)

		ns.uf_target_options.content.cb_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_posx"], "content")
		ns.uf_target_options.content.cb_pos_x:SetPoint("LEFT", ns.uf_target_options.content.cb_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.cb_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.cb_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.cb_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_posy"], "content")
		ns.uf_target_options.content.cb_pos_y:SetPoint("LEFT", ns.uf_target_options.content.cb_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_anchor1_text = ns.createFontstring("uf_target_options", "Anchor1:", "content")
		ns.uf_target_options.content.cb_anchor1_text:SetPoint("LEFT", ns.uf_target_options.content.cb_pos_y, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_anchor1 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_anchor1", 110, LolzenUIcfg.unitframes["uf_target_cb_anchor1"], "content")
		ns.uf_target_options.content.cb_anchor1:SetPoint("LEFT", ns.uf_target_options.content.cb_anchor1_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_anchor2_text = ns.createFontstring("uf_target_options", "Anchor2:", "content")
		ns.uf_target_options.content.cb_anchor2_text:SetPoint("LEFT", ns.uf_target_options.content.cb_anchor1, "RIGHT", -5, 3)

		ns.uf_target_options.content.cb_anchor2 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_anchor2", 110, LolzenUIcfg.unitframes["uf_target_cb_anchor2"], "content")
		ns.uf_target_options.content.cb_anchor2:SetPoint("LEFT", ns.uf_target_options.content.cb_anchor2_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_width_text = ns.createFontstring("uf_target_options", "Width:", "content")
		ns.uf_target_options.content.cb_width_text:SetPoint("TOPLEFT", ns.uf_target_options.content.cb_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_target_options.content.cb_width = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_width"], "content")
		ns.uf_target_options.content.cb_width:SetPoint("LEFT", ns.uf_target_options.content.cb_width_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_height_text = ns.createFontstring("uf_target_options", "Height:", "content")
		ns.uf_target_options.content.cb_height_text:SetPoint("LEFT", ns.uf_target_options.content.cb_width, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_height = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_height"], "content")
		ns.uf_target_options.content.cb_height:SetPoint("LEFT", ns.uf_target_options.content.cb_height_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_color_text = ns.createFontstring("uf_target_options", "Color:", "content")

		ns.uf_target_options.content.cb_color = ns.createColorTexture("uf_target_options", 16, 16, LolzenUIcfg.unitframes["uf_target_cb_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"], "content")
		ns.uf_target_options.content.cb_color:SetPoint("LEFT", ns.uf_target_options.content.cb_color_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_color_f = ns.createColorPicker("uf_target_options", ns.uf_target_options.content.cb_color, LolzenUIcfg.unitframes["uf_target_cb_color"], "content")
		ns.uf_target_options.content.cb_color_f:SetAllPoints(ns.uf_target_options.content.cb_color)

		ns.uf_target_options.content.cb_alpha_text = ns.createFontstring("uf_target_options", "Alpha:", "content")
		ns.uf_target_options.content.cb_alpha_text:SetPoint("LEFT", ns.uf_target_options.content.cb_color, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_alpha = ns.createPicker("uf_target_options", "alpha", "uf_target_cb_alpha", 45, LolzenUIcfg.unitframes["uf_target_cb_alpha"], "content")
		ns.uf_target_options.content.cb_alpha:SetPoint("LEFT", ns.uf_target_options.content.cb_alpha_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.header5 = ns.createHeader("uf_target_options", "Icon:", "content")

		ns.uf_target_options.content.cb4:SetScript("OnClick", function(self)
			if ns.uf_target_options.content.cb4:GetChecked() == true then
				ns.uf_target_options.content.cb_pos_x_text:Show()
				ns.uf_target_options.content.cb_pos_x:Show()
				ns.uf_target_options.content.cb_pos_y_text:Show()
				ns.uf_target_options.content.cb_pos_y:Show()
				ns.uf_target_options.content.cb_anchor1_text:Show()
				ns.uf_target_options.content.cb_anchor1:Show()
				ns.uf_target_options.content.cb_anchor2_text:Show()
				ns.uf_target_options.content.cb_anchor2:Show()
				ns.uf_target_options.content.cb_width_text:Show()
				ns.uf_target_options.content.cb_width:Show()
				ns.uf_target_options.content.cb_height_text:Show()
				ns.uf_target_options.content.cb_height:Show()
				ns.uf_target_options.content.cb_color_text:ClearAllPoints()
				ns.uf_target_options.content.cb_color_text:SetPoint("LEFT", ns.uf_target_options.content.cb_height, "RIGHT", 10, 0)
				ns.uf_target_options.content.header5:SetPoint("TOPLEFT", ns.uf_target_options.content.cb_width_text, "BOTTOMLEFT", 0, -12)
				ChangeScrollbarMinMax("uf_target_options", "+", 25)
			else
				ns.uf_target_options.content.cb_pos_x_text:Hide()
				ns.uf_target_options.content.cb_pos_x:Hide()
				ns.uf_target_options.content.cb_pos_y_text:Hide()
				ns.uf_target_options.content.cb_pos_y:Hide()
				ns.uf_target_options.content.cb_anchor1_text:Hide()
				ns.uf_target_options.content.cb_anchor1:Hide()
				ns.uf_target_options.content.cb_anchor2_text:Hide()
				ns.uf_target_options.content.cb_anchor2:Hide()
				ns.uf_target_options.content.cb_width_text:Hide()
				ns.uf_target_options.content.cb_width:Hide()
				ns.uf_target_options.content.cb_height_text:Hide()
				ns.uf_target_options.content.cb_height:Hide()
				ns.uf_target_options.content.cb_color_text:ClearAllPoints()
				ns.uf_target_options.content.cb_color_text:SetPoint("TOPLEFT", ns.uf_target_options.content.cb4, "BOTTOMLEFT", 0, -5)
				ns.uf_target_options.content.header5:SetPoint("TOPLEFT", ns.uf_target_options.content.cb_color_text, "BOTTOMLEFT", 0, -12)
				ChangeScrollbarMinMax("uf_target_options", "-", 25)
			end
		end)

		if ns.uf_target_options.content.cb4:GetChecked() == true then
			ns.uf_target_options.content.cb_pos_x_text:Show()
			ns.uf_target_options.content.cb_pos_x:Show()
			ns.uf_target_options.content.cb_pos_y_text:Show()
			ns.uf_target_options.content.cb_pos_y:Show()
			ns.uf_target_options.content.cb_anchor1_text:Show()
			ns.uf_target_options.content.cb_anchor1:Show()
			ns.uf_target_options.content.cb_anchor2_text:Show()
			ns.uf_target_options.content.cb_anchor2:Show()
			ns.uf_target_options.content.cb_width_text:Show()
			ns.uf_target_options.content.cb_width:Show()
			ns.uf_target_options.content.cb_height_text:Show()
			ns.uf_target_options.content.cb_height:Show()
			ns.uf_target_options.content.cb_color_text:SetPoint("LEFT", ns.uf_target_options.content.cb_height, "RIGHT", 10, 0)
			ns.uf_target_options.content.header5:SetPoint("TOPLEFT", ns.uf_target_options.content.cb_width_text, "BOTTOMLEFT", 0, -13)
			ChangeScrollbarMinMax("uf_target_options", "+", 25)
		else
			ns.uf_target_options.content.cb_pos_x_text:Hide()
			ns.uf_target_options.content.cb_pos_x:Hide()
			ns.uf_target_options.content.cb_pos_y_text:Hide()
			ns.uf_target_options.content.cb_pos_y:Hide()
			ns.uf_target_options.content.cb_anchor1_text:Hide()
			ns.uf_target_options.content.cb_anchor1:Hide()
			ns.uf_target_options.content.cb_anchor2_text:Hide()
			ns.uf_target_options.content.cb_anchor2:Hide()
			ns.uf_target_options.content.cb_width_text:Hide()
			ns.uf_target_options.content.cb_width:Hide()
			ns.uf_target_options.content.cb_height_text:Hide()
			ns.uf_target_options.content.cb_height:Hide()
			ns.uf_target_options.content.cb_color_text:SetPoint("TOPLEFT", ns.uf_target_options.content.cb4, "BOTTOMLEFT", 0, -5)
			ns.uf_target_options.content.header5:SetPoint("TOPLEFT", ns.uf_target_options.content.cb_color_text, "BOTTOMLEFT", 0, -13)
		end

		ns.uf_target_options.content.cb_icon_size_text = ns.createFontstring("uf_target_options", "Size:", "content")
		ns.uf_target_options.content.cb_icon_size_text:SetPoint("LEFT", ns.uf_target_options.content.header5, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_icon_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_icon_size"], "content")
		ns.uf_target_options.content.cb_icon_size:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_size_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_icon_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.cb_icon_pos_x_text:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_size, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_icon_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_icon_posx"], "content")
		ns.uf_target_options.content.cb_icon_pos_x:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_icon_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.cb_icon_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.cb_icon_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_icon_posy"], "content")
		ns.uf_target_options.content.cb_icon_pos_y:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_icon_anchor1_text = ns.createFontstring("uf_target_options", "Anchor1:", "content")
		ns.uf_target_options.content.cb_icon_anchor1_text:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_pos_y, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_icon_anchor1 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_icon_anchor1", 70, LolzenUIcfg.unitframes["uf_target_cb_icon_anchor1"], "content")
		ns.uf_target_options.content.cb_icon_anchor1:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_anchor1_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_icon_anchor2_text = ns.createFontstring("uf_target_options", "Anchor2:", "content")
		ns.uf_target_options.content.cb_icon_anchor2_text:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_anchor1, "RIGHT", -5, 3)

		ns.uf_target_options.content.cb_icon_anchor2 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_icon_anchor2", 70, LolzenUIcfg.unitframes["uf_target_cb_icon_anchor2"], "content")
		ns.uf_target_options.content.cb_icon_anchor2:SetPoint("LEFT", ns.uf_target_options.content.cb_icon_anchor2_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.header6 = ns.createHeader("uf_target_options", "Time:", "content")
		ns.uf_target_options.content.header6:SetPoint("TOPLEFT", ns.uf_target_options.content.header5, "BOTTOMLEFT", 0, -13)

		ns.uf_target_options.content.cb_time_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.cb_time_pos_x_text:SetPoint("LEFT", ns.uf_target_options.content.header6, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_time_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_time_posx"], "content")
		ns.uf_target_options.content.cb_time_pos_x:SetPoint("LEFT", ns.uf_target_options.content.cb_time_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_time_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.cb_time_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.cb_time_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.cb_time_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_time_posy"], "content")
		ns.uf_target_options.content.cb_time_pos_y:SetPoint("LEFT", ns.uf_target_options.content.cb_time_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_time_anchor1_text = ns.createFontstring("uf_target_options", "Anchor1:", "content")
		ns.uf_target_options.content.cb_time_anchor1_text:SetPoint("LEFT", ns.uf_target_options.content.cb_time_pos_y, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_time_anchor1 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_time_anchor1", 110, LolzenUIcfg.unitframes["uf_target_cb_time_anchor1"], "content")
		ns.uf_target_options.content.cb_time_anchor1:SetPoint("LEFT", ns.uf_target_options.content.cb_time_anchor1_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_time_anchor2_text = ns.createFontstring("uf_target_options", "Anchor2:", "content")
		ns.uf_target_options.content.cb_time_anchor2_text:SetPoint("LEFT", ns.uf_target_options.content.cb_time_anchor1, "RIGHT", -5, 3)

		ns.uf_target_options.content.cb_time_anchor2 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_time_anchor2", 110, LolzenUIcfg.unitframes["uf_target_cb_time_anchor2"], "content")
		ns.uf_target_options.content.cb_time_anchor2:SetPoint("LEFT", ns.uf_target_options.content.cb_time_anchor2_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.header7 = ns.createHeader("uf_target_options", "Text:", "content")
		ns.uf_target_options.content.header7:SetPoint("TOPLEFT", ns.uf_target_options.content.header6, "BOTTOMLEFT", 0, -13)

		ns.uf_target_options.content.cb_text_pos_x_text = ns.createFontstring("uf_target_options", "PosX:", "content")
		ns.uf_target_options.content.cb_text_pos_x_text:SetPoint("LEFT", ns.uf_target_options.content.header7, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_text_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_text_posx"], "content")
		ns.uf_target_options.content.cb_text_pos_x:SetPoint("LEFT", ns.uf_target_options.content.cb_text_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_text_pos_y_text = ns.createFontstring("uf_target_options", "PosY:", "content")
		ns.uf_target_options.content.cb_text_pos_y_text:SetPoint("LEFT", ns.uf_target_options.content.cb_text_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.content.cb_text_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_text_posy"], "content")
		ns.uf_target_options.content.cb_text_pos_y:SetPoint("LEFT", ns.uf_target_options.content.cb_text_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_text_anchor1_text = ns.createFontstring("uf_target_options", "Anchor1:", "content")
		ns.uf_target_options.content.cb_text_anchor1_text:SetPoint("LEFT", ns.uf_target_options.content.cb_text_pos_y, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_text_anchor1 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_text_anchor1", 110, LolzenUIcfg.unitframes["uf_target_cb_text_anchor1"], "content")
		ns.uf_target_options.content.cb_text_anchor1:SetPoint("LEFT", ns.uf_target_options.content.cb_text_anchor1_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_text_anchor2_text = ns.createFontstring("uf_target_options", "Anchor2:", "content")
		ns.uf_target_options.content.cb_text_anchor2_text:SetPoint("LEFT", ns.uf_target_options.content.cb_text_anchor1, "RIGHT", -5, 3)

		ns.uf_target_options.content.cb_text_anchor2 = ns.createPicker("uf_target_options", "anchor", "uf_target_cb_text_anchor2", 110, LolzenUIcfg.unitframes["uf_target_cb_text_anchor2"], "content")
		ns.uf_target_options.content.cb_text_anchor2:SetPoint("LEFT", ns.uf_target_options.content.cb_text_anchor2_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.header8 = ns.createHeader("uf_target_options", "Time/Text Font:", "content")
		ns.uf_target_options.content.header8:SetPoint("TOPLEFT", ns.uf_target_options.content.header7, "BOTTOMLEFT", 0, -13)

		ns.uf_target_options.content.cb_font = ns.createPicker("uf_target_options", "font", "uf_target_cb_font", 120, LolzenUIcfg.unitframes["uf_target_cb_font"], "content")
		ns.uf_target_options.content.cb_font:SetPoint("LEFT", ns.uf_target_options.content.header8, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_font_size_text = ns.createFontstring("uf_target_options", "Size:", "content")
		ns.uf_target_options.content.cb_font_size_text:SetPoint("LEFT", ns.uf_target_options.content.cb_font, "RIGHT", -5, 3)

		ns.uf_target_options.content.cb_font_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_cb_font_size"], "content")
		ns.uf_target_options.content.cb_font_size:SetPoint("LEFT", ns.uf_target_options.content.cb_font_size_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_font_flag_text = ns.createFontstring("uf_target_options", "Flag:", "content")
		ns.uf_target_options.content.cb_font_flag_text:SetPoint("LEFT", ns.uf_target_options.content.cb_font_size, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_font_flag = ns.createPicker("uf_target_options", "flag", "uf_target_cb_font_flag", 120, LolzenUIcfg.unitframes["uf_target_cb_font_flag"], "content")
		ns.uf_target_options.content.cb_font_flag:SetPoint("LEFT", ns.uf_target_options.content.cb_font_flag_text, "RIGHT", -10, -3)

		ns.uf_target_options.content.cb_font_color_text = ns.createFontstring("uf_target_options", "Color:", "content")
		ns.uf_target_options.content.cb_font_color_text:SetPoint("LEFT", ns.uf_target_options.content.cb_font_flag, "RIGHT", -10, 3)

		ns.uf_target_options.content.cb_font_color = ns.createColorTexture("uf_target_options", 16, 16, LolzenUIcfg.unitframes["uf_target_cb_font_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"], "content")
		ns.uf_target_options.content.cb_font_color:SetPoint("LEFT", ns.uf_target_options.content.cb_font_color_text, "RIGHT", 10, 0)

		ns.uf_target_options.content.cb_font_color_f = ns.createColorPicker("uf_target_options", ns.uf_target_options.content.cb_font_color, LolzenUIcfg.unitframes["uf_target_cb_font_color"], "content")
		ns.uf_target_options.content.cb_font_color_f:SetAllPoints(ns.uf_target_options.content.cb_font_color)

		-- // Create a subcategory panel for Targettarget // --
		ns.uf_targettarget_options = CreateFrame("Frame", "unitframe_targettargetpanel", ns["unitframes"])
		ns.uf_targettarget_options.name = "   Targettarget"
		ns.uf_targettarget_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_targettarget_options)

		ns.uf_targettarget_options.title = ns.uf_targettarget_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_targettarget_options.title:SetPoint("TOPLEFT", ns.uf_targettarget_options, 16, -16)
		ns.uf_targettarget_options.title:SetText("|cff5599ffUnitframes module: Targettarget Options|r")

		ns.uf_targettarget_options.pos_x_text = ns.createFontstring("uf_targettarget_options", "PosX:")
		ns.uf_targettarget_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_targettarget_options.pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_posx"])
		ns.uf_targettarget_options.pos_x:SetPoint("LEFT", ns.uf_targettarget_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.pos_y_text = ns.createFontstring("uf_targettarget_options", "PosY:")
		ns.uf_targettarget_options.pos_y_text:SetPoint("LEFT", ns.uf_targettarget_options.pos_x, "RIGHT", 5, 0)

		ns.uf_targettarget_options.pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_posy"])
		ns.uf_targettarget_options.pos_y:SetPoint("LEFT", ns.uf_targettarget_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.anchor_text = ns.createFontstring("uf_targettarget_options", "Anchor:")
		ns.uf_targettarget_options.anchor_text:SetPoint("LEFT", ns.uf_targettarget_options.pos_y, "RIGHT", 5, 0)

		ns.uf_targettarget_options.anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_anchor", 110, LolzenUIcfg.unitframes["uf_targettarget_anchor"])
		ns.uf_targettarget_options.anchor:SetPoint("LEFT", ns.uf_targettarget_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_targettarget_options.width_text = ns.createFontstring("uf_targettarget_options", "Width:")
		ns.uf_targettarget_options.width_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_targettarget_options.width = ns.createInputbox("uf_targettarget_options", 40, 20, LolzenUIcfg.unitframes["uf_targettarget_width"])
		ns.uf_targettarget_options.width:SetPoint("LEFT", ns.uf_targettarget_options.width_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.height_text = ns.createFontstring("uf_targettarget_options", "Height:")
		ns.uf_targettarget_options.height_text:SetPoint("LEFT", ns.uf_targettarget_options.width, "RIGHT", 10, 0)

		ns.uf_targettarget_options.height = ns.createInputbox("uf_targettarget_options", 40, 20, LolzenUIcfg.unitframes["uf_targettarget_height"])
		ns.uf_targettarget_options.height:SetPoint("LEFT", ns.uf_targettarget_options.height_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.header1 = ns.createHeader("uf_targettarget_options", "Healthpoints")
		ns.uf_targettarget_options.header1:SetPoint("TOPLEFT", ns.uf_targettarget_options.width_text, 0, -30)

		ns.uf_targettarget_options.cb1 = ns.createCheckBox("uf_targettarget_options", "uf_targettarget_use_custom_font_hp", "|cff5599ffoverwrite the general font options for targettarget healthpoints|r", LolzenUIcfg.unitframes["uf_targettarget_use_own_hp_font_settings"])
		ns.uf_targettarget_options.cb1:SetPoint("TOPLEFT", ns.uf_targettarget_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_targettarget_options.hp_pos_x_text = ns.createFontstring("uf_targettarget_options", "PosX:")
		ns.uf_targettarget_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_targettarget_options.hp_pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_posx"])
		ns.uf_targettarget_options.hp_pos_x:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_pos_y_text = ns.createFontstring("uf_targettarget_options", "PosY:")
		ns.uf_targettarget_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_targettarget_options.hp_pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_posy"])
		ns.uf_targettarget_options.hp_pos_y:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_anchor_text = ns.createFontstring("uf_targettarget_options", "Anchor:")
		ns.uf_targettarget_options.hp_anchor_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_targettarget_options.hp_anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_hp_anchor", 110, LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"])
		ns.uf_targettarget_options.hp_anchor:SetPoint("LEFT", ns.uf_targettarget_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_targettarget_options.hp_font_text = ns.createFontstring("uf_targettarget_options", "Font:")
		ns.uf_targettarget_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_targettarget_options.hp_font = ns.createPicker("uf_targettarget_options", "font", "uf_targettarget_hp_font", 120, LolzenUIcfg.unitframes["uf_targettarget_hp_font"])
		ns.uf_targettarget_options.hp_font:SetPoint("LEFT", ns.uf_targettarget_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_targettarget_options.hp_font_size_text = ns.createFontstring("uf_targettarget_options", "Font size:")
		ns.uf_targettarget_options.hp_font_size_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_font, "RIGHT", -5, 3)

		ns.uf_targettarget_options.hp_font_size = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"])
		ns.uf_targettarget_options.hp_font_size:SetPoint("LEFT", ns.uf_targettarget_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_font_flag_text = ns.createFontstring("uf_targettarget_options", "Font flag:")
		ns.uf_targettarget_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_font_flag = ns.createPicker("uf_targettarget_options", "flag", "uf_targettarget_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_targettarget_hp_font_flag"])
		ns.uf_targettarget_options.hp_font_flag:SetPoint("LEFT", ns.uf_targettarget_options.hp_font_flag_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Party // --
		ns.uf_party_options = CreateFrame("Frame", "unitframe_partypanel", ns["unitframes"])
		ns.uf_party_options.name = "   Party"
		ns.uf_party_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_party_options)

		ns.uf_party_options.title = ns.uf_party_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_party_options.title:SetPoint("TOPLEFT", ns.uf_party_options, 16, -16)
		ns.uf_party_options.title:SetText("|cff5599ffUnitframes module: Party Options|r")

		ns.uf_party_options.cb1 = ns.createCheckBox("uf_party_options", "uf_party_enabled", "|cff5599ffuse LolzenUI partyframes (disable for alternatives/blizzard default)|r", LolzenUIcfg.unitframes["uf_party_enabled"])
		ns.uf_party_options.cb1:SetPoint("TOPLEFT", ns.uf_party_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_party_options.cb2 = ns.createCheckBox("uf_party_options", "uf_party_vertical", "|cff5599ffuse vertical Layout|r", LolzenUIcfg.unitframes["uf_party_use_vertical_layout"])
		ns.uf_party_options.cb2:SetPoint("TOPLEFT", ns.uf_party_options.cb1, "BOTTOMLEFT", 0, 0)

		ns.uf_party_options.pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		ns.uf_party_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_party_options.cb2, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_posx"])
		ns.uf_party_options.pos_x:SetPoint("LEFT", ns.uf_party_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		ns.uf_party_options.pos_y_text:SetPoint("LEFT", ns.uf_party_options.pos_x, "RIGHT", 5, 0)

		ns.uf_party_options.pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_posy"])
		ns.uf_party_options.pos_y:SetPoint("LEFT", ns.uf_party_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		ns.uf_party_options.anchor_text:SetPoint("LEFT", ns.uf_party_options.pos_y, "RIGHT", 5, 0)

		ns.uf_party_options.anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_anchor", 110, LolzenUIcfg.unitframes["uf_party_anchor"])
		ns.uf_party_options.anchor:SetPoint("LEFT", ns.uf_party_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_party_options.width_text = ns.createFontstring("uf_party_options", "Width:")
		ns.uf_party_options.width_text:SetPoint("TOPLEFT", ns.uf_party_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_party_options.width = ns.createInputbox("uf_party_options", 40, 20, LolzenUIcfg.unitframes["uf_party_width"])
		ns.uf_party_options.width:SetPoint("LEFT", ns.uf_party_options.width_text, "RIGHT", 10, 0)

		ns.uf_party_options.height_text = ns.createFontstring("uf_party_options", "Height:")
		ns.uf_party_options.height_text:SetPoint("LEFT", ns.uf_party_options.width, "RIGHT", 10, 0)

		ns.uf_party_options.height = ns.createInputbox("uf_party_options", 40, 20, LolzenUIcfg.unitframes["uf_party_height"])
		ns.uf_party_options.height:SetPoint("LEFT", ns.uf_party_options.height_text, "RIGHT", 10, 0)

		ns.uf_party_options.header1 = ns.createHeader("uf_party_options", "Healthpoints")
		ns.uf_party_options.header1:SetPoint("TOPLEFT", ns.uf_party_options.width_text, 0, -30)

		ns.uf_party_options.cb3 = ns.createCheckBox("uf_party_options", "uf_party_use_custom_font_hp", "|cff5599ffoverwrite the general font options for party healthpoints|r", LolzenUIcfg.unitframes["uf_party_use_own_hp_font_settings"])
		ns.uf_party_options.cb3:SetPoint("TOPLEFT", ns.uf_party_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.hp_pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		ns.uf_party_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_party_options.cb3, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.hp_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posx"])
		ns.uf_party_options.hp_pos_x:SetPoint("LEFT", ns.uf_party_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.hp_pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		ns.uf_party_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_party_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_party_options.hp_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posy"])
		ns.uf_party_options.hp_pos_y:SetPoint("LEFT", ns.uf_party_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.hp_anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		ns.uf_party_options.hp_anchor_text:SetPoint("LEFT", ns.uf_party_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_party_options.hp_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_hp_anchor", 110, LolzenUIcfg.unitframes["uf_party_hp_anchor"])
		ns.uf_party_options.hp_anchor:SetPoint("LEFT", ns.uf_party_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_party_options.hp_font_text = ns.createFontstring("uf_party_options", "Font:")
		ns.uf_party_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_party_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_party_options.hp_font = ns.createPicker("uf_party_options", "font", "uf_party_hp_font", 120, LolzenUIcfg.unitframes["uf_party_hp_font"])
		ns.uf_party_options.hp_font:SetPoint("LEFT", ns.uf_party_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_party_options.hp_font_size_text = ns.createFontstring("uf_party_options", "Font size:")
		ns.uf_party_options.hp_font_size_text:SetPoint("LEFT", ns.uf_party_options.hp_font, "RIGHT", -5, 3)

		ns.uf_party_options.hp_font_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_font_size"])
		ns.uf_party_options.hp_font_size:SetPoint("LEFT", ns.uf_party_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_party_options.hp_font_flag_text = ns.createFontstring("uf_party_options", "Font flag:")
		ns.uf_party_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_party_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_party_options.hp_font_flag = ns.createPicker("uf_party_options", "flag", "uf_party_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_party_hp_font_flag"])
		ns.uf_party_options.hp_font_flag:SetPoint("LEFT", ns.uf_party_options.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_party_options.header2 = ns.createHeader("uf_party_options", "Role Indicator")
		ns.uf_party_options.header2:SetPoint("TOPLEFT", ns.uf_party_options.hp_font_text, 0, -30)

		ns.uf_party_options.cb4 = ns.createCheckBox("uf_party_options", "uf_party_ri", "|cff5599ffshow role indicator|r", LolzenUIcfg.unitframes["uf_party_showroleindicator"])
		ns.uf_party_options.cb4:SetPoint("TOPLEFT", ns.uf_party_options.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.ri_size_text = ns.createFontstring("uf_party_options", "Size:")
		ns.uf_party_options.ri_size_text:SetPoint("TOPLEFT", ns.uf_party_options.cb4, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.ri_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_size"])
		ns.uf_party_options.ri_size:SetPoint("LEFT", ns.uf_party_options.ri_size_text, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		ns.uf_party_options.ri_pos_x_text:SetPoint("LEFT", ns.uf_party_options.ri_size, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_posx"])
		ns.uf_party_options.ri_pos_x:SetPoint("LEFT", ns.uf_party_options.ri_pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		ns.uf_party_options.ri_pos_y_text:SetPoint("LEFT", ns.uf_party_options.ri_pos_x, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_posy"])
		ns.uf_party_options.ri_pos_y:SetPoint("LEFT", ns.uf_party_options.ri_pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.ri_anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		ns.uf_party_options.ri_anchor_text:SetPoint("LEFT", ns.uf_party_options.ri_pos_y, "RIGHT", 10, 0)

		ns.uf_party_options.ri_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_ri_anchor", 120, LolzenUIcfg.unitframes["uf_party_ri_anchor"])
		ns.uf_party_options.ri_anchor:SetPoint("LEFT", ns.uf_party_options.ri_anchor_text, "RIGHT", -10, -3)

		ns.uf_party_options.header3 = ns.createHeader("uf_party_options", "Readycheck Indicator")
		ns.uf_party_options.header3:SetPoint("TOPLEFT", ns.uf_party_options.ri_size_text, 0, -30)

		ns.uf_party_options.rc_size_text = ns.createFontstring("uf_party_options", "Size:")
		ns.uf_party_options.rc_size_text:SetPoint("TOPLEFT", ns.uf_party_options.header3, "BOTTOMLEFT", 0, -15)

		ns.uf_party_options.rc_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_size"])
		ns.uf_party_options.rc_size:SetPoint("LEFT", ns.uf_party_options.rc_size_text, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		ns.uf_party_options.rc_pos_x_text:SetPoint("LEFT", ns.uf_party_options.rc_size, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_posx"])
		ns.uf_party_options.rc_pos_x:SetPoint("LEFT", ns.uf_party_options.rc_pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		ns.uf_party_options.rc_pos_y_text:SetPoint("LEFT", ns.uf_party_options.rc_pos_x, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_posy"])
		ns.uf_party_options.rc_pos_y:SetPoint("LEFT", ns.uf_party_options.rc_pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.rc_anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		ns.uf_party_options.rc_anchor_text:SetPoint("LEFT", ns.uf_party_options.rc_pos_y, "RIGHT", 10, 0)

		ns.uf_party_options.rc_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_rc_anchor", 120, LolzenUIcfg.unitframes["uf_party_rc_anchor"])
		ns.uf_party_options.rc_anchor:SetPoint("LEFT", ns.uf_party_options.rc_anchor_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Raid // --
		ns.uf_raid_options = CreateFrame("Frame", "unitframe_raidpanel", ns["unitframes"])
		ns.uf_raid_options.name = "   Raid"
		ns.uf_raid_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_raid_options)

		ns.uf_raid_options.title = ns.uf_raid_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_raid_options.title:SetPoint("TOPLEFT", ns.uf_raid_options, 16, -16)
		ns.uf_raid_options.title:SetText("|cff5599ffUnitframes module: Raid Options|r")

		ns.uf_raid_options.cb1 = ns.createCheckBox("uf_raid_options", "uf_raid_enabled", "|cff5599ffuse LolzenUI raidframes (disable for alternatives/blizzard default)|r", LolzenUIcfg.unitframes["uf_raid_enabled"])
		ns.uf_raid_options.cb1:SetPoint("TOPLEFT", ns.uf_raid_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_raid_options.pos_x_text = ns.createFontstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_raid_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_posx"])
		ns.uf_raid_options.pos_x:SetPoint("LEFT", ns.uf_raid_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.pos_y_text = ns.createFontstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.pos_y_text:SetPoint("LEFT", ns.uf_raid_options.pos_x, "RIGHT", 5, 0)

		ns.uf_raid_options.pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_posy"])
		ns.uf_raid_options.pos_y:SetPoint("LEFT", ns.uf_raid_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.anchor_text = ns.createFontstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.anchor_text:SetPoint("LEFT", ns.uf_raid_options.pos_y, "RIGHT", 5, 0)

		ns.uf_raid_options.anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_anchor", 110, LolzenUIcfg.unitframes["uf_raid_anchor"])
		ns.uf_raid_options.anchor:SetPoint("LEFT", ns.uf_raid_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_raid_options.width_text = ns.createFontstring("uf_raid_options", "Width:")
		ns.uf_raid_options.width_text:SetPoint("TOPLEFT", ns.uf_raid_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_raid_options.width = ns.createInputbox("uf_raid_options", 40, 20, LolzenUIcfg.unitframes["uf_raid_width"])
		ns.uf_raid_options.width:SetPoint("LEFT", ns.uf_raid_options.width_text, "RIGHT", 10, 0)

		ns.uf_raid_options.height_text = ns.createFontstring("uf_raid_options", "Height:")
		ns.uf_raid_options.height_text:SetPoint("LEFT", ns.uf_raid_options.width, "RIGHT", 10, 0)

		ns.uf_raid_options.height = ns.createInputbox("uf_raid_options", 40, 20, LolzenUIcfg.unitframes["uf_raid_height"])
		ns.uf_raid_options.height:SetPoint("LEFT", ns.uf_raid_options.height_text, "RIGHT", 10, 0)

		ns.uf_raid_options.header1 = ns.createHeader("uf_raid_options", "Healthpoints")
		ns.uf_raid_options.header1:SetPoint("TOPLEFT", ns.uf_raid_options.width_text, 0, -30)

		ns.uf_raid_options.cb2 = ns.createCheckBox("uf_raid_options", "uf_raid_use_custom_font_hp", "|cff5599ffoverwrite the general font options for raid healthpoints|r", LolzenUIcfg.unitframes["uf_raid_use_own_hp_font_settings"])
		ns.uf_raid_options.cb2:SetPoint("TOPLEFT", ns.uf_raid_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.hp_pos_x_text = ns.createFontstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_raid_options.cb2, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.hp_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_posx"])
		ns.uf_raid_options.hp_pos_x:SetPoint("LEFT", ns.uf_raid_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_pos_y_text = ns.createFontstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_raid_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_raid_options.hp_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_posy"])
		ns.uf_raid_options.hp_pos_y:SetPoint("LEFT", ns.uf_raid_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_anchor_text = ns.createFontstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.hp_anchor_text:SetPoint("LEFT", ns.uf_raid_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_raid_options.hp_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_hp_anchor", 110, LolzenUIcfg.unitframes["uf_raid_hp_anchor"])
		ns.uf_raid_options.hp_anchor:SetPoint("LEFT", ns.uf_raid_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_raid_options.hp_font_text = ns.createFontstring("uf_raid_options", "Font:")
		ns.uf_raid_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_raid_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_raid_options.hp_font = ns.createPicker("uf_raid_options", "font", "uf_raid_hp_font", 120, LolzenUIcfg.unitframes["uf_raid_hp_font"])
		ns.uf_raid_options.hp_font:SetPoint("LEFT", ns.uf_raid_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_raid_options.hp_font_size_text = ns.createFontstring("uf_raid_options", "Font size:")
		ns.uf_raid_options.hp_font_size_text:SetPoint("LEFT", ns.uf_raid_options.hp_font, "RIGHT", -5, 3)

		ns.uf_raid_options.hp_font_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_font_size"])
		ns.uf_raid_options.hp_font_size:SetPoint("LEFT", ns.uf_raid_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_font_flag_text = ns.createFontstring("uf_raid_options", "Font flag:")
		ns.uf_raid_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_raid_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_font_flag = ns.createPicker("uf_raid_options", "flag", "uf_raid_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_raid_hp_font_flag"])
		ns.uf_raid_options.hp_font_flag:SetPoint("LEFT", ns.uf_raid_options.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_raid_options.header2 = ns.createHeader("uf_raid_options", "Role Indicator")
		ns.uf_raid_options.header2:SetPoint("TOPLEFT", ns.uf_raid_options.hp_font_text, 0, -30)

		ns.uf_raid_options.cb3 = ns.createCheckBox("uf_raid_options", "uf_raid_ri", "|cff5599ffshow role indicator|r", LolzenUIcfg.unitframes["uf_raid_showroleindicator"])
		ns.uf_raid_options.cb3:SetPoint("TOPLEFT", ns.uf_raid_options.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.ri_size_text = ns.createFontstring("uf_raid_options", "Size:")
		ns.uf_raid_options.ri_size_text:SetPoint("TOPLEFT", ns.uf_raid_options.cb3, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.ri_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_ri_size"])
		ns.uf_raid_options.ri_size:SetPoint("LEFT", ns.uf_raid_options.ri_size_text, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_x_text = ns.createFontstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.ri_pos_x_text:SetPoint("LEFT", ns.uf_raid_options.ri_size, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_ri_posx"])
		ns.uf_raid_options.ri_pos_x:SetPoint("LEFT", ns.uf_raid_options.ri_pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_y_text = ns.createFontstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.ri_pos_y_text:SetPoint("LEFT", ns.uf_raid_options.ri_pos_x, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_ri_posy"])
		ns.uf_raid_options.ri_pos_y:SetPoint("LEFT", ns.uf_raid_options.ri_pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_anchor_text = ns.createFontstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.ri_anchor_text:SetPoint("LEFT", ns.uf_raid_options.ri_pos_y, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_ri_anchor", 120, LolzenUIcfg.unitframes["uf_raid_ri_anchor"])
		ns.uf_raid_options.ri_anchor:SetPoint("LEFT", ns.uf_raid_options.ri_anchor_text, "RIGHT", -10, -3)

		ns.uf_raid_options.header3 = ns.createHeader("uf_raid_options", "Readycheck Indicator")
		ns.uf_raid_options.header3:SetPoint("TOPLEFT", ns.uf_raid_options.ri_size_text, 0, -30)

		ns.uf_raid_options.rc_size_text = ns.createFontstring("uf_raid_options", "Size:")
		ns.uf_raid_options.rc_size_text:SetPoint("TOPLEFT", ns.uf_raid_options.header3, "BOTTOMLEFT", 0, -15)

		ns.uf_raid_options.rc_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_rc_size"])
		ns.uf_raid_options.rc_size:SetPoint("LEFT", ns.uf_raid_options.rc_size_text, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_x_text = ns.createFontstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.rc_pos_x_text:SetPoint("LEFT", ns.uf_raid_options.rc_size, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_rc_posx"])
		ns.uf_raid_options.rc_pos_x:SetPoint("LEFT", ns.uf_raid_options.rc_pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_y_text = ns.createFontstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.rc_pos_y_text:SetPoint("LEFT", ns.uf_raid_options.rc_pos_x, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_rc_posy"])
		ns.uf_raid_options.rc_pos_y:SetPoint("LEFT", ns.uf_raid_options.rc_pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_anchor_text = ns.createFontstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.rc_anchor_text:SetPoint("LEFT", ns.uf_raid_options.rc_pos_y, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_rc_anchor", 120, LolzenUIcfg.unitframes["uf_raid_rc_anchor"])
		ns.uf_raid_options.rc_anchor:SetPoint("LEFT", ns.uf_raid_options.rc_anchor_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Pet // --
		ns.uf_pet_options = CreateFrame("Frame", "unitframe_petpanel", ns["unitframes"])
		ns.uf_pet_options.name = "   Pet"
		ns.uf_pet_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_pet_options)

		ns.uf_pet_options.title = ns.uf_pet_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_pet_options.title:SetPoint("TOPLEFT", ns.uf_pet_options, 16, -16)
		ns.uf_pet_options.title:SetText("|cff5599ffUnitframes module: Pet Options|r")

		ns.uf_pet_options.pos_x_text = ns.createFontstring("uf_pet_options", "PosX:")
		ns.uf_pet_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_pet_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_pet_options.pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_posx"])
		ns.uf_pet_options.pos_x:SetPoint("LEFT", ns.uf_pet_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_pet_options.pos_y_text = ns.createFontstring("uf_pet_options", "PosY:")
		ns.uf_pet_options.pos_y_text:SetPoint("LEFT", ns.uf_pet_options.pos_x, "RIGHT", 5, 0)

		ns.uf_pet_options.pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_posy"])
		ns.uf_pet_options.pos_y:SetPoint("LEFT", ns.uf_pet_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_pet_options.anchor_text = ns.createFontstring("uf_pet_options", "Anchor:")
		ns.uf_pet_options.anchor_text:SetPoint("LEFT", ns.uf_pet_options.pos_y, "RIGHT", 5, 0)

		ns.uf_pet_options.anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_anchor", 110, LolzenUIcfg.unitframes["uf_pet_anchor"])
		ns.uf_pet_options.anchor:SetPoint("LEFT", ns.uf_pet_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_pet_options.width_text = ns.createFontstring("uf_pet_options", "Width:")
		ns.uf_pet_options.width_text:SetPoint("TOPLEFT", ns.uf_pet_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_pet_options.width = ns.createInputbox("uf_pet_options", 40, 20, LolzenUIcfg.unitframes["uf_pet_width"])
		ns.uf_pet_options.width:SetPoint("LEFT", ns.uf_pet_options.width_text, "RIGHT", 10, 0)

		ns.uf_pet_options.height_text = ns.createFontstring("uf_pet_options", "Height:")
		ns.uf_pet_options.height_text:SetPoint("LEFT", ns.uf_pet_options.width, "RIGHT", 10, 0)

		ns.uf_pet_options.height = ns.createInputbox("uf_pet_options", 40, 20, LolzenUIcfg.unitframes["uf_pet_height"])
		ns.uf_pet_options.height:SetPoint("LEFT", ns.uf_pet_options.height_text, "RIGHT", 10, 0)

		ns.uf_pet_options.header1 = ns.createHeader("uf_pet_options", "Healthpoints")
		ns.uf_pet_options.header1:SetPoint("TOPLEFT", ns.uf_pet_options.width_text, 0, -30)

		ns.uf_pet_options.cb1 = ns.createCheckBox("uf_pet_options", "uf_pet_use_custom_font_hp", "|cff5599ffoverwrite the general font options for pet healthpoints|r", LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"])
		ns.uf_pet_options.cb1:SetPoint("TOPLEFT", ns.uf_pet_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_pet_options.hp_pos_x_text = ns.createFontstring("uf_pet_options", "PosX:")
		ns.uf_pet_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_pet_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_pet_options.hp_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posx"])
		ns.uf_pet_options.hp_pos_x:SetPoint("LEFT", ns.uf_pet_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_pos_y_text = ns.createFontstring("uf_pet_options", "PosY:")
		ns.uf_pet_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_pet_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_pet_options.hp_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posy"])
		ns.uf_pet_options.hp_pos_y:SetPoint("LEFT", ns.uf_pet_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_anchor_text = ns.createFontstring("uf_pet_options", "Anchor:")
		ns.uf_pet_options.hp_anchor_text:SetPoint("LEFT", ns.uf_pet_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_pet_options.hp_anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_hp_anchor", 110, LolzenUIcfg.unitframes["uf_pet_hp_anchor"])
		ns.uf_pet_options.hp_anchor:SetPoint("LEFT", ns.uf_pet_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_pet_options.hp_font_text = ns.createFontstring("uf_pet_options", "Font:")
		ns.uf_pet_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_pet_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_pet_options.hp_font = ns.createPicker("uf_pet_options", "font", "uf_pet_hp_font", 120, LolzenUIcfg.unitframes["uf_pet_hp_font"])
		ns.uf_pet_options.hp_font:SetPoint("LEFT", ns.uf_pet_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_pet_options.hp_font_size_text = ns.createFontstring("uf_pet_options", "Font size:")
		ns.uf_pet_options.hp_font_size_text:SetPoint("LEFT", ns.uf_pet_options.hp_font, "RIGHT", -5, 3)

		ns.uf_pet_options.hp_font_size = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_font_size"])
		ns.uf_pet_options.hp_font_size:SetPoint("LEFT", ns.uf_pet_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_font_flag_text = ns.createFontstring("uf_pet_options", "Font flag:")
		ns.uf_pet_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_pet_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_font_flag = ns.createPicker("uf_pet_options", "flag", "uf_pet_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_pet_hp_font_flag"])
		ns.uf_pet_options.hp_font_flag:SetPoint("LEFT", ns.uf_pet_options.hp_font_flag_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Boss // --
		ns.uf_boss_options = CreateFrame("Frame", "unitframe_bosspanel", ns["unitframes"])
		ns.uf_boss_options.name = "   Boss"
		ns.uf_boss_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_boss_options)

		-- as the optionpanel space is sparse, create a scrollframe where we can put all the content in we want
		ns.uf_boss_options.scrollframe = CreateFrame("ScrollFrame", nil, ns.uf_boss_options)
		ns.uf_boss_options.scrollframe:SetPoint("TOPLEFT", 0, -5) 
		ns.uf_boss_options.scrollframe:SetPoint("BOTTOMRIGHT", 0, 5)
		
		ns.uf_boss_options.scrollbar = CreateFrame("Slider", nil, ns.uf_boss_options.scrollframe, "UIPanelScrollBarTemplate")
		ns.uf_boss_options.scrollbar:SetPoint("TOPLEFT", ns.uf_boss_options, "TOPRIGHT", -20, -20)
		ns.uf_boss_options.scrollbar:SetPoint("BOTTOMLEFT", ns.uf_boss_options, "BOTTOMRIGHT", -20, 20)
		-- min value: 5, else the title would be misaligned with the other subpanel titles
		ns.uf_boss_options.scrollbar:SetMinMaxValues(5, 20) 
		ns.uf_boss_options.scrollbar:SetValueStep(1) 
		ns.uf_boss_options.scrollbar.scrollStep = 1
		ns.uf_boss_options.scrollbar:SetValue(0) 
		ns.uf_boss_options.scrollbar:SetWidth(16) 
		ns.uf_boss_options.scrollbar:SetScript("OnValueChanged", function (self, value) 
			self:GetParent():SetVerticalScroll(value) 
		end)
		
		ns.uf_boss_options.content = CreateFrame("Frame", nil, ns.uf_boss_options.scrollframe) 
		ns.uf_boss_options.content:SetSize(128, 80) 
		ns.uf_boss_options.scrollframe.content = ns.uf_boss_options.content 
 
		ns.uf_boss_options.scrollframe:SetScrollChild(ns.uf_boss_options.content)
		
		-- enable mousewheel scrolling
		ns.uf_boss_options.scrollframe:EnableMouseWheel(true)
		ns.uf_boss_options.scrollframe:SetScript("OnMouseWheel", function(self, direction)
			local current = ns.uf_boss_options.scrollbar:GetValue()
			if direction == 1 then -- "up"
				ns.uf_boss_options.scrollbar:SetValue(current - 10)
			elseif direction == -1 then -- "down"
				ns.uf_boss_options.scrollbar:SetValue(current + 10)
			end
		end)

		ns.uf_boss_options.content.title = ns.uf_boss_options.content:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_boss_options.content.title:SetPoint("TOPLEFT", ns.uf_boss_options.content, 16, -16)
		ns.uf_boss_options.content.title:SetText("|cff5599ffUnitframes module: Boss Options|r")

		ns.uf_boss_options.content.pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.pos_x_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.title, "BOTTOMLEFT", 0, -30)

		ns.uf_boss_options.content.pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_posx"], "content")
		ns.uf_boss_options.content.pos_x:SetPoint("LEFT", ns.uf_boss_options.content.pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_posy"], "content")
		ns.uf_boss_options.content.pos_y:SetPoint("LEFT", ns.uf_boss_options.content.pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.anchor_text = ns.createFontstring("uf_boss_options", "Anchor:", "content")
		ns.uf_boss_options.content.anchor_text:SetPoint("LEFT", ns.uf_boss_options.content.pos_y, "RIGHT", 5, 0)

		ns.uf_boss_options.content.anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_anchor", 110, LolzenUIcfg.unitframes["uf_boss_anchor"], "content")
		ns.uf_boss_options.content.anchor:SetPoint("LEFT", ns.uf_boss_options.content.anchor_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.width_text = ns.createFontstring("uf_boss_options", "Width:", "content")
		ns.uf_boss_options.content.width_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_boss_options.content.width = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes["uf_boss_width"], "content")
		ns.uf_boss_options.content.width:SetPoint("LEFT", ns.uf_boss_options.content.width_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.height_text = ns.createFontstring("uf_boss_options", "Height:", "content")
		ns.uf_boss_options.content.height_text:SetPoint("LEFT", ns.uf_boss_options.content.width, "RIGHT", 10, 0)

		ns.uf_boss_options.content.height = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes["uf_boss_height"], "content")
		ns.uf_boss_options.content.height:SetPoint("LEFT", ns.uf_boss_options.content.height_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.growth_text = ns.createFontstring("uf_boss_options", "Additional Bossframe placement:", "content")
		ns.uf_boss_options.content.growth_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.width_text, "BOTTOMLEFT", 0, -10)

		ns.uf_boss_options.content.growth = ns.createPicker("uf_boss_options", "growth", "uf_boss_additional_boss_anchor", 110, LolzenUIcfg.unitframes["uf_boss_additional_pos"], "content")
		ns.uf_boss_options.content.growth:SetPoint("LEFT", ns.uf_boss_options.content.growth_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.growth_spacing_text = ns.createFontstring("uf_boss_options", "Spacing:", "content")
		ns.uf_boss_options.content.growth_spacing_text:SetPoint("LEFT", ns.uf_boss_options.content.growth, "RIGHT", -10, 3)

		ns.uf_boss_options.content.growth_spacing = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes["uf_boss_additional_spacing"], "content")
		ns.uf_boss_options.content.growth_spacing:SetPoint("LEFT", ns.uf_boss_options.content.growth_spacing_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb1 = ns.createCheckBox("uf_boss_options", "uf_boss_show_power", "|cff5599ffshow power bar & power points|r", LolzenUIcfg.unitframes["uf_boss_show_power"], "content")
		ns.uf_boss_options.content.cb1:SetPoint("TOPLEFT", ns.uf_boss_options.content.growth_text, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.header1 = ns.createHeader("uf_boss_options", "Healthpoints", "content")
		ns.uf_boss_options.content.header1:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb1, 0, -30)

		ns.uf_boss_options.content.cb2 = ns.createCheckBox("uf_boss_options", "uf_boss_use_custom_font_hp", "|cff5599ffoverwrite the general font options for boss healthpoints|r", LolzenUIcfg.unitframes["uf_boss_use_own_hp_font_settings"], "content")
		ns.uf_boss_options.content.cb2:SetPoint("TOPLEFT", ns.uf_boss_options.content.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.hp_pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb2, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.hp_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_hp_posx"], "content")
		ns.uf_boss_options.content.hp_pos_x:SetPoint("LEFT", ns.uf_boss_options.content.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.hp_pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.hp_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.hp_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_hp_posy"], "content")
		ns.uf_boss_options.content.hp_pos_y:SetPoint("LEFT", ns.uf_boss_options.content.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.hp_anchor_text = ns.createFontstring("uf_boss_options", "Anchor:", "content")
		ns.uf_boss_options.content.hp_anchor_text:SetPoint("LEFT", ns.uf_boss_options.content.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_boss_options.content.hp_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_hp_anchor", 110, LolzenUIcfg.unitframes["uf_boss_hp_anchor"], "content")
		ns.uf_boss_options.content.hp_anchor:SetPoint("LEFT", ns.uf_boss_options.content.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.hp_font_text = ns.createFontstring("uf_boss_options", "Font:", "content")
		ns.uf_boss_options.content.hp_font_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_boss_options.content.hp_font = ns.createPicker("uf_boss_options", "font", "uf_boss_hp_font", 120, LolzenUIcfg.unitframes["uf_boss_hp_font"], "content")
		ns.uf_boss_options.content.hp_font:SetPoint("LEFT", ns.uf_boss_options.content.hp_font_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.hp_font_size_text = ns.createFontstring("uf_boss_options", "Font size:", "content")
		ns.uf_boss_options.content.hp_font_size_text:SetPoint("LEFT", ns.uf_boss_options.content.hp_font, "RIGHT", -5, 3)

		ns.uf_boss_options.content.hp_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_hp_font_size"], "content")
		ns.uf_boss_options.content.hp_font_size:SetPoint("LEFT", ns.uf_boss_options.content.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.hp_font_flag_text = ns.createFontstring("uf_boss_options", "Font flag:", "content")
		ns.uf_boss_options.content.hp_font_flag_text:SetPoint("LEFT", ns.uf_boss_options.content.hp_font_size, "RIGHT", 10, 0)

		ns.uf_boss_options.content.hp_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_boss_hp_font_flag"], "content")
		ns.uf_boss_options.content.hp_font_flag:SetPoint("LEFT", ns.uf_boss_options.content.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.header2 = ns.createHeader("uf_boss_options", "Powerpoints", "content")
		ns.uf_boss_options.content.header2:SetPoint("TOPLEFT", ns.uf_boss_options.content.hp_font_text, 0, -30)

		ns.uf_boss_options.content.pp_pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.pp_pos_x_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.pp_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_pp_posx"], "content")
		ns.uf_boss_options.content.pp_pos_x:SetPoint("LEFT", ns.uf_boss_options.content.pp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.pp_pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.pp_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.pp_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.pp_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_pp_posy"], "content")
		ns.uf_boss_options.content.pp_pos_y:SetPoint("LEFT", ns.uf_boss_options.content.pp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.pp_anchor_text = ns.createFontstring("uf_boss_options", "Anchor1:", "content")
		ns.uf_boss_options.content.pp_anchor_text:SetPoint("LEFT", ns.uf_boss_options.content.pp_pos_y, "RIGHT", 5, 0)

		ns.uf_boss_options.content.pp_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_pp_anchor", 90, LolzenUIcfg.unitframes["uf_boss_pp_anchor"], "content")
		ns.uf_boss_options.content.pp_anchor:SetPoint("LEFT", ns.uf_boss_options.content.pp_anchor_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.pp_parent_text = ns.createFontstring("uf_boss_options", "Parent:", "content")
		ns.uf_boss_options.content.pp_parent_text:SetPoint("LEFT", ns.uf_boss_options.content.pp_anchor, "RIGHT", -10, 3)

		ns.uf_boss_options.content.pp_parent = ns.createPicker("uf_boss_options", "uf_parent", "uf_boss_pp_parent", 50, LolzenUIcfg.unitframes["uf_boss_pp_parent"], "content")
		ns.uf_boss_options.content.pp_parent:SetPoint("LEFT", ns.uf_boss_options.content.pp_parent_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.pp_anchor2_text = ns.createFontstring("uf_boss_options", "Anchor2:", "content")
		ns.uf_boss_options.content.pp_anchor2_text:SetPoint("LEFT", ns.uf_boss_options.content.pp_parent, "RIGHT", -10, 3)

		ns.uf_boss_options.content.pp_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_pp_anchor2", 90, LolzenUIcfg.unitframes["uf_boss_pp_anchor2"], "content")
		ns.uf_boss_options.content.pp_anchor2:SetPoint("LEFT", ns.uf_boss_options.content.pp_anchor2_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.pp_font_text = ns.createFontstring("uf_boss_options", "Font:", "content")
		ns.uf_boss_options.content.pp_font_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_boss_options.content.pp_font = ns.createPicker("uf_boss_options", "font", "uf_boss_pp_font", 120, LolzenUIcfg.unitframes["uf_boss_pp_font"], "content")
		ns.uf_boss_options.content.pp_font:SetPoint("LEFT", ns.uf_boss_options.content.pp_font_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.pp_font_size_text = ns.createFontstring("uf_boss_options", "Font size:", "content")
		ns.uf_boss_options.content.pp_font_size_text:SetPoint("LEFT", ns.uf_boss_options.content.pp_font, "RIGHT", -5, 3)

		ns.uf_boss_options.content.pp_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_pp_font_size"], "content")
		ns.uf_boss_options.content.pp_font_size:SetPoint("LEFT", ns.uf_boss_options.content.pp_font_size_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.pp_font_flag_text = ns.createFontstring("uf_boss_options", "Font flag:", "content")
		ns.uf_boss_options.content.pp_font_flag_text:SetPoint("LEFT", ns.uf_boss_options.content.pp_font_size, "RIGHT", 10, 0)

		ns.uf_boss_options.content.pp_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_pp_font_flag", 120, LolzenUIcfg.unitframes["uf_boss_pp_font_flag"], "content")
		ns.uf_boss_options.content.pp_font_flag:SetPoint("LEFT", ns.uf_boss_options.content.pp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.header3 = ns.createHeader("uf_boss_options", "Auras", "content")

		ns.uf_boss_options.content.cb1:SetScript("OnClick", function(self)
			if ns.uf_boss_options.content.cb1:GetChecked() == true then
				ns.uf_boss_options.content.header2:Show()
				ns.uf_boss_options.content.pp_pos_x_text:Show()
				ns.uf_boss_options.content.pp_pos_x:Show()
				ns.uf_boss_options.content.pp_pos_y_text:Show()
				ns.uf_boss_options.content.pp_pos_y:Show()
				ns.uf_boss_options.content.pp_anchor_text:Show()
				ns.uf_boss_options.content.pp_anchor:Show()
				ns.uf_boss_options.content.pp_parent_text:Show()
				ns.uf_boss_options.content.pp_parent:Show()
				ns.uf_boss_options.content.pp_anchor2_text:Show()
				ns.uf_boss_options.content.pp_anchor2:Show()
				ns.uf_boss_options.content.pp_font_text:Show()
				ns.uf_boss_options.content.pp_font:Show()
				ns.uf_boss_options.content.pp_font_size_text:Show()
				ns.uf_boss_options.content.pp_font_size:Show()
				ns.uf_boss_options.content.pp_font_flag_text:Show()
				ns.uf_boss_options.content.pp_font_flag:Show()
				ns.uf_boss_options.content.header3:SetPoint("TOPLEFT", ns.uf_boss_options.content.pp_font_text, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "+", 11)
				ns.uf_boss_options.scrollbar:Show()
				ns.uf_boss_options.scrollframe:EnableMouseWheel(true)
			else
				ns.uf_boss_options.content.header2:Hide()
				ns.uf_boss_options.content.pp_pos_x_text:Hide()
				ns.uf_boss_options.content.pp_pos_x:Hide()
				ns.uf_boss_options.content.pp_pos_y_text:Hide()
				ns.uf_boss_options.content.pp_pos_y:Hide()
				ns.uf_boss_options.content.pp_anchor_text:Hide()
				ns.uf_boss_options.content.pp_anchor:Hide()
				ns.uf_boss_options.content.pp_parent_text:Hide()
				ns.uf_boss_options.content.pp_parent:Hide()
				ns.uf_boss_options.content.pp_anchor2_text:Hide()
				ns.uf_boss_options.content.pp_anchor2:Hide()
				ns.uf_boss_options.content.pp_font_text:Hide()
				ns.uf_boss_options.content.pp_font:Hide()
				ns.uf_boss_options.content.pp_font_size_text:Hide()
				ns.uf_boss_options.content.pp_font_size:Hide()
				ns.uf_boss_options.content.pp_font_flag_text:Hide()
				ns.uf_boss_options.content.pp_font_flag:Hide()
				ns.uf_boss_options.content.header3:SetPoint("TOPLEFT", ns.uf_boss_options.content.hp_font_text, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "-", 11)
				ns.uf_boss_options.scrollbar:Hide()
				ns.uf_boss_options.scrollbar:SetValue(0)
				ns.uf_boss_options.scrollframe:EnableMouseWheel(false)
			end
		end)

		if ns.uf_boss_options.content.cb1:GetChecked() == true then
			ns.uf_boss_options.content.header2:Show()
			ns.uf_boss_options.content.pp_pos_x_text:Show()
			ns.uf_boss_options.content.pp_pos_x:Show()
			ns.uf_boss_options.content.pp_pos_y_text:Show()
			ns.uf_boss_options.content.pp_pos_y:Show()
			ns.uf_boss_options.content.pp_anchor_text:Show()
			ns.uf_boss_options.content.pp_anchor:Show()
			ns.uf_boss_options.content.pp_parent_text:Show()
			ns.uf_boss_options.content.pp_parent:Show()
			ns.uf_boss_options.content.pp_anchor2_text:Show()
			ns.uf_boss_options.content.pp_anchor2:Show()
			ns.uf_boss_options.content.pp_font_text:Show()
			ns.uf_boss_options.content.pp_font:Show()
			ns.uf_boss_options.content.pp_font_size_text:Show()
			ns.uf_boss_options.content.pp_font_size:Show()
			ns.uf_boss_options.content.pp_font_flag_text:Show()
			ns.uf_boss_options.content.pp_font_flag:Show()
			ns.uf_boss_options.content.header3:SetPoint("TOPLEFT", ns.uf_boss_options.content.pp_font_text, 0, -30)
			ChangeScrollbarMinMax("uf_boss_options", "+", 11)
		else
			ns.uf_boss_options.content.header2:Hide()
			ns.uf_boss_options.content.pp_pos_x_text:Hide()
			ns.uf_boss_options.content.pp_pos_x:Hide()
			ns.uf_boss_options.content.pp_pos_y_text:Hide()
			ns.uf_boss_options.content.pp_pos_y:Hide()
			ns.uf_boss_options.content.pp_anchor_text:Hide()
			ns.uf_boss_options.content.pp_anchor:Hide()
			ns.uf_boss_options.content.pp_parent_text:Hide()
			ns.uf_boss_options.content.pp_parent:Hide()
			ns.uf_boss_options.content.pp_anchor2_text:Hide()
			ns.uf_boss_options.content.pp_anchor2:Hide()
			ns.uf_boss_options.content.pp_font_text:Hide()
			ns.uf_boss_options.content.pp_font:Hide()
			ns.uf_boss_options.content.pp_font_size_text:Hide()
			ns.uf_boss_options.content.pp_font_size:Hide()
			ns.uf_boss_options.content.pp_font_flag_text:Hide()
			ns.uf_boss_options.content.pp_font_flag:Hide()
			ns.uf_boss_options.content.header3:SetPoint("TOPLEFT", ns.uf_boss_options.content.hp_font_text, 0, -30)
			ns.uf_boss_options.scrollbar:Hide()
			ns.uf_boss_options.scrollframe:EnableMouseWheel(false)
		end

		ns.uf_boss_options.content.aura_type_text = ns.createFontstring("uf_boss_options", "Show:", "content")
		ns.uf_boss_options.content.aura_type_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.header3, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.aura_type = ns.createPicker("uf_boss_options", "uf_auratype", "uf_boss_aura_type", 70, LolzenUIcfg.unitframes["uf_boss_aura_show_type"], "content")
		ns.uf_boss_options.content.aura_type:SetPoint("LEFT", ns.uf_boss_options.content.aura_type_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.aura_maxnum_text = ns.createFontstring("uf_boss_options", "Show max (0-40):", "content")
		ns.uf_boss_options.content.aura_maxnum_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_type, "RIGHT", -5, 3)

		ns.uf_boss_options.content.aura_maxnum = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_aura_maxnum"], "content")
		ns.uf_boss_options.content.aura_maxnum:SetPoint("LEFT", ns.uf_boss_options.content.aura_maxnum_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_spacing_text = ns.createFontstring("uf_boss_options", "Spacing:", "content")
		ns.uf_boss_options.content.aura_spacing_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_maxnum, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_spacing = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_aura_spacing"], "content")
		ns.uf_boss_options.content.aura_spacing:SetPoint("LEFT", ns.uf_boss_options.content.aura_spacing_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_size_text = ns.createFontstring("uf_boss_options", "Size:", "content")
		ns.uf_boss_options.content.aura_size_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_spacing, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_aura_size"], "content")
		ns.uf_boss_options.content.aura_size:SetPoint("LEFT", ns.uf_boss_options.content.aura_size_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.aura_pos_x_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.aura_type_text, "BOTTOMLEFT", 0, -15)

		ns.uf_boss_options.content.aura_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_aura_posx"], "content")
		ns.uf_boss_options.content.aura_pos_x:SetPoint("LEFT", ns.uf_boss_options.content.aura_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.aura_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.aura_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_aura_posy"], "content")
		ns.uf_boss_options.content.aura_pos_y:SetPoint("LEFT", ns.uf_boss_options.content.aura_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.aura_anchor_text = ns.createFontstring("uf_boss_options", "Anchor1:", "content")
		ns.uf_boss_options.content.aura_anchor_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_pos_y, "RIGHT", 5, 0)

		ns.uf_boss_options.content.aura_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_aura_anchor", 90, LolzenUIcfg.unitframes["uf_boss_aura_anchor1"], "content")
		ns.uf_boss_options.content.aura_anchor:SetPoint("LEFT", ns.uf_boss_options.content.aura_anchor_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.aura_anchor2_text = ns.createFontstring("uf_boss_options", "Anchor2:", "content")
		ns.uf_boss_options.content.aura_anchor2_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_anchor, "RIGHT", -10, 3)

		ns.uf_boss_options.content.aura_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_aura_anchor2", 90, LolzenUIcfg.unitframes["uf_boss_aura_anchor2"], "content")
		ns.uf_boss_options.content.aura_anchor2:SetPoint("LEFT", ns.uf_boss_options.content.aura_anchor2_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.aura_growthx_text = ns.createFontstring("uf_boss_options", "GrowthX:", "content")
		ns.uf_boss_options.content.aura_growthx_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_boss_options.content.aura_growthx = ns.createPicker("uf_boss_options", "uf_auragrowth_x", "uf_boss_aura_growthx", 70, LolzenUIcfg.unitframes["uf_boss_aura_growth_x"], "content")
		ns.uf_boss_options.content.aura_growthx:SetPoint("LEFT", ns.uf_boss_options.content.aura_growthx_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.aura_growthy_text = ns.createFontstring("uf_boss_options", "GrowthY:", "content")
		ns.uf_boss_options.content.aura_growthy_text:SetPoint("LEFT", ns.uf_boss_options.content.aura_growthx, "RIGHT", -5, 3)

		ns.uf_boss_options.content.aura_growthy = ns.createPicker("uf_boss_options", "uf_auragrowth_y", "uf_boss_aura_growthy", 70, LolzenUIcfg.unitframes["uf_boss_aura_growth_y"], "content")
		ns.uf_boss_options.content.aura_growthy:SetPoint("LEFT", ns.uf_boss_options.content.aura_growthy_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.cb3 = ns.createCheckBox("uf_boss_options", "uf_boss_show_only_player_auras", "|cff5599ffshow only player's auras|r", LolzenUIcfg.unitframes["uf_boss_aura_show_only_player"], "content")
		ns.uf_boss_options.content.cb3:SetPoint("TOPLEFT", ns.uf_boss_options.content.aura_growthx_text, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.cb4 = ns.createCheckBox("uf_boss_options", "uf_boss_desature_nonplayer_auras", "|cff5599ffdesature nonplayer auras|r", LolzenUIcfg.unitframes["uf_boss_aura_desature_nonplayer_auras"], "content")
		ns.uf_boss_options.content.cb4:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb3, "BOTTOMLEFT", 0, 0)

		ns.uf_boss_options.content.header4 = ns.createHeader("uf_boss_options", "Castbar", "content")

		ns.uf_boss_options.content.cb3:SetScript("OnClick", function(self)
			if ns.uf_boss_options.content.cb3:GetChecked() == true then
				ns.uf_boss_options.content.cb4:Hide()
				ns.uf_boss_options.content.header4:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb3, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "-", 24)
			else
				ns.uf_boss_options.content.cb4:Show()
				ns.uf_boss_options.content.header4:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb4, 0, -30)
				ChangeScrollbarMinMax("uf_boss_options", "+", 24)
			end
		end)

		if ns.uf_boss_options.content.cb3:GetChecked() == true then
			ns.uf_boss_options.content.cb4:Hide()
			ns.uf_boss_options.content.header4:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb3, 0, -30)
		else
			ns.uf_boss_options.content.cb4:Show()
			ns.uf_boss_options.content.header4:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb4, 0, -30)
			ChangeScrollbarMinMax("uf_boss_options", "+", 24)
		end

		ns.uf_boss_options.content.cb_color_text = ns.createFontstring("uf_boss_options", "Color:", "content")
		ns.uf_boss_options.content.cb_color_text:SetPoint("TOPLEFT", ns.uf_boss_options.content.header4, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.content.cb_color = ns.createColorTexture("uf_boss_options", 16, 16, LolzenUIcfg.unitframes["uf_boss_cb_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"], "content")
		ns.uf_boss_options.content.cb_color:SetPoint("LEFT", ns.uf_boss_options.content.cb_color_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_color_f = ns.createColorPicker("uf_boss_options", ns.uf_boss_options.content.cb_color, LolzenUIcfg.unitframes["uf_boss_cb_color"], "content")
		ns.uf_boss_options.content.cb_color_f:SetAllPoints(ns.uf_boss_options.content.cb_color)

		ns.uf_boss_options.content.cb_alpha_text = ns.createFontstring("uf_boss_options", "Alpha:", "content")
		ns.uf_boss_options.content.cb_alpha_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_color, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_alpha = ns.createPicker("uf_boss_options", "alpha", "uf_boss_cb_alpha", 45, LolzenUIcfg.unitframes["uf_boss_cb_alpha"], "content")
		ns.uf_boss_options.content.cb_alpha:SetPoint("LEFT", ns.uf_boss_options.content.cb_alpha_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.header5 = ns.createHeader("uf_boss_options", "Icon:", "content")
		ns.uf_boss_options.content.header5:SetPoint("TOPLEFT", ns.uf_boss_options.content.cb_color_text, "BOTTOMLEFT", 0, -12)

		ns.uf_boss_options.content.cb_icon_size_text = ns.createFontstring("uf_boss_options", "Size:", "content")
		ns.uf_boss_options.content.cb_icon_size_text:SetPoint("LEFT", ns.uf_boss_options.content.header5, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_icon_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_icon_size"], "content")
		ns.uf_boss_options.content.cb_icon_size:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_size_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_icon_pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.cb_icon_pos_x_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_size, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_icon_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_icon_posx"], "content")
		ns.uf_boss_options.content.cb_icon_pos_x:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_icon_pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.cb_icon_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.cb_icon_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_icon_posy"], "content")
		ns.uf_boss_options.content.cb_icon_pos_y:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_icon_anchor1_text = ns.createFontstring("uf_boss_options", "Anchor1:", "content")
		ns.uf_boss_options.content.cb_icon_anchor1_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_pos_y, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_icon_anchor1 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_icon_anchor1", 70, LolzenUIcfg.unitframes["uf_boss_cb_icon_anchor1"], "content")
		ns.uf_boss_options.content.cb_icon_anchor1:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_anchor1_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.cb_icon_anchor2_text = ns.createFontstring("uf_boss_options", "Anchor2:", "content")
		ns.uf_boss_options.content.cb_icon_anchor2_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_anchor1, "RIGHT", -5, 3)

		ns.uf_boss_options.content.cb_icon_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_icon_anchor2", 70, LolzenUIcfg.unitframes["uf_boss_cb_icon_anchor2"], "content")
		ns.uf_boss_options.content.cb_icon_anchor2:SetPoint("LEFT", ns.uf_boss_options.content.cb_icon_anchor2_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.header6 = ns.createHeader("uf_boss_options", "Time:", "content")
		ns.uf_boss_options.content.header6:SetPoint("TOPLEFT", ns.uf_boss_options.content.header5, "BOTTOMLEFT", 0, -13)

		ns.uf_boss_options.content.cb_time_pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.cb_time_pos_x_text:SetPoint("LEFT", ns.uf_boss_options.content.header6, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_time_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_time_posx"], "content")
		ns.uf_boss_options.content.cb_time_pos_x:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_time_pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.cb_time_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.cb_time_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_time_posy"], "content")
		ns.uf_boss_options.content.cb_time_pos_y:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_time_anchor1_text = ns.createFontstring("uf_boss_options", "Anchor1:", "content")
		ns.uf_boss_options.content.cb_time_anchor1_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_pos_y, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_time_anchor1 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_time_anchor1", 110, LolzenUIcfg.unitframes["uf_boss_cb_time_anchor1"], "content")
		ns.uf_boss_options.content.cb_time_anchor1:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_anchor1_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.cb_time_anchor2_text = ns.createFontstring("uf_boss_options", "Anchor2:", "content")
		ns.uf_boss_options.content.cb_time_anchor2_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_anchor1, "RIGHT", -5, 3)

		ns.uf_boss_options.content.cb_time_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_time_anchor2", 110, LolzenUIcfg.unitframes["uf_boss_cb_time_anchor2"], "content")
		ns.uf_boss_options.content.cb_time_anchor2:SetPoint("LEFT", ns.uf_boss_options.content.cb_time_anchor2_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.header7 = ns.createHeader("uf_boss_options", "Text:", "content")
		ns.uf_boss_options.content.header7:SetPoint("TOPLEFT", ns.uf_boss_options.content.header6, "BOTTOMLEFT", 0, -13)

		ns.uf_boss_options.content.cb_text_pos_x_text = ns.createFontstring("uf_boss_options", "PosX:", "content")
		ns.uf_boss_options.content.cb_text_pos_x_text:SetPoint("LEFT", ns.uf_boss_options.content.header7, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_text_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_text_posx"], "content")
		ns.uf_boss_options.content.cb_text_pos_x:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_text_pos_y_text = ns.createFontstring("uf_boss_options", "PosY:", "content")
		ns.uf_boss_options.content.cb_text_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.content.cb_text_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_text_posy"], "content")
		ns.uf_boss_options.content.cb_text_pos_y:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_text_anchor1_text = ns.createFontstring("uf_boss_options", "Anchor1:", "content")
		ns.uf_boss_options.content.cb_text_anchor1_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_pos_y, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_text_anchor1 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_text_anchor1", 110, LolzenUIcfg.unitframes["uf_boss_cb_text_anchor1"], "content")
		ns.uf_boss_options.content.cb_text_anchor1:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_anchor1_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.cb_text_anchor2_text = ns.createFontstring("uf_boss_options", "Anchor2:", "content")
		ns.uf_boss_options.content.cb_text_anchor2_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_anchor1, "RIGHT", -5, 3)

		ns.uf_boss_options.content.cb_text_anchor2 = ns.createPicker("uf_boss_options", "anchor", "uf_boss_cb_text_anchor2", 110, LolzenUIcfg.unitframes["uf_boss_cb_text_anchor2"], "content")
		ns.uf_boss_options.content.cb_text_anchor2:SetPoint("LEFT", ns.uf_boss_options.content.cb_text_anchor2_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.header8 = ns.createHeader("uf_boss_options", "Time/Text Font:", "content")
		ns.uf_boss_options.content.header8:SetPoint("TOPLEFT", ns.uf_boss_options.content.header7, "BOTTOMLEFT", 0, -13)

		ns.uf_boss_options.content.cb_font = ns.createPicker("uf_boss_options", "font", "uf_boss_cb_font", 120, LolzenUIcfg.unitframes["uf_boss_cb_font"], "content")
		ns.uf_boss_options.content.cb_font:SetPoint("LEFT", ns.uf_boss_options.content.header8, "RIGHT", -10, -3)

		ns.uf_boss_options.content.cb_font_size_text = ns.createFontstring("uf_boss_options", "Size:", "content")
		ns.uf_boss_options.content.cb_font_size_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_font, "RIGHT", -5, 3)

		ns.uf_boss_options.content.cb_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_cb_font_size"], "content")
		ns.uf_boss_options.content.cb_font_size:SetPoint("LEFT", ns.uf_boss_options.content.cb_font_size_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_font_flag_text = ns.createFontstring("uf_boss_options", "Flag:", "content")
		ns.uf_boss_options.content.cb_font_flag_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_font_size, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_cb_font_flag", 120, LolzenUIcfg.unitframes["uf_boss_cb_font_flag"], "content")
		ns.uf_boss_options.content.cb_font_flag:SetPoint("LEFT", ns.uf_boss_options.content.cb_font_flag_text, "RIGHT", -10, -3)

		ns.uf_boss_options.content.cb_font_color_text = ns.createFontstring("uf_boss_options", "Color:", "content")
		ns.uf_boss_options.content.cb_font_color_text:SetPoint("LEFT", ns.uf_boss_options.content.cb_font_flag, "RIGHT", -10, 3)

		ns.uf_boss_options.content.cb_font_color = ns.createColorTexture("uf_boss_options", 16, 16, LolzenUIcfg.unitframes["uf_boss_cb_font_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"], "content")
		ns.uf_boss_options.content.cb_font_color:SetPoint("LEFT", ns.uf_boss_options.content.cb_font_color_text, "RIGHT", 10, 0)

		ns.uf_boss_options.content.cb_font_color_f = ns.createColorPicker("uf_boss_options", ns.uf_boss_options.content.cb_font_color, LolzenUIcfg.unitframes["uf_boss_cb_font_color"], "content")
		ns.uf_boss_options.content.cb_font_color_f:SetAllPoints(ns.uf_boss_options.content.cb_font_color)

		-- // Create a subcategory panel for focus // --
		ns.uf_focus_options = CreateFrame("Frame", "unitframe_focuspanel", ns["unitframes"])
		ns.uf_focus_options.name = "   Focus"
		ns.uf_focus_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_focus_options)

		-- as the optionpanel space is sparse, create a scrollframe where we can put all the content in we want
		ns.uf_focus_options.scrollframe = CreateFrame("ScrollFrame", nil, ns.uf_focus_options)
		ns.uf_focus_options.scrollframe:SetPoint("TOPLEFT", 0, -5) 
		ns.uf_focus_options.scrollframe:SetPoint("BOTTOMRIGHT", 0, 5)
		
		ns.uf_focus_options.scrollbar = CreateFrame("Slider", nil, ns.uf_focus_options.scrollframe, "UIPanelScrollBarTemplate")
		ns.uf_focus_options.scrollbar:SetPoint("TOPLEFT", ns.uf_focus_options, "TOPRIGHT", -20, -20)
		ns.uf_focus_options.scrollbar:SetPoint("BOTTOMLEFT", ns.uf_focus_options, "BOTTOMRIGHT", -20, 20)
		-- min value: 5, else the title would be misaligned with the other subpanel titles
		ns.uf_focus_options.scrollbar:SetMinMaxValues(5, 17) 
		ns.uf_focus_options.scrollbar:SetValueStep(1) 
		ns.uf_focus_options.scrollbar.scrollStep = 1
		ns.uf_focus_options.scrollbar:SetValue(0) 
		ns.uf_focus_options.scrollbar:SetWidth(16) 
		ns.uf_focus_options.scrollbar:SetScript("OnValueChanged", function (self, value) 
			self:GetParent():SetVerticalScroll(value) 
		end)
		
		ns.uf_focus_options.content = CreateFrame("Frame", nil, ns.uf_focus_options.scrollframe) 
		ns.uf_focus_options.content:SetSize(128, 80) 
		ns.uf_focus_options.scrollframe.content = ns.uf_focus_options.content 
 
		ns.uf_focus_options.scrollframe:SetScrollChild(ns.uf_focus_options.content)
		
		-- enable mousewheel scrolling
		ns.uf_focus_options.scrollframe:EnableMouseWheel(true)
		ns.uf_focus_options.scrollframe:SetScript("OnMouseWheel", function(self, direction)
			local current = ns.uf_focus_options.scrollbar:GetValue()
			if direction == 1 then -- "up"
				ns.uf_focus_options.scrollbar:SetValue(current - 10)
			elseif direction == -1 then -- "down"
				ns.uf_focus_options.scrollbar:SetValue(current + 10)
			end
		end)

		ns.uf_focus_options.content.title = ns.uf_focus_options.content:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_focus_options.content.title:SetPoint("TOPLEFT", ns.uf_focus_options.content, 16, -16)
		ns.uf_focus_options.content.title:SetText("|cff5599ffUnitframes module: Focus Options|r")

		ns.uf_focus_options.content.pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.pos_x_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.title, "BOTTOMLEFT", 0, -30)

		ns.uf_focus_options.content.pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_posx"], "content")
		ns.uf_focus_options.content.pos_x:SetPoint("LEFT", ns.uf_focus_options.content.pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_posy"], "content")
		ns.uf_focus_options.content.pos_y:SetPoint("LEFT", ns.uf_focus_options.content.pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.anchor_text = ns.createFontstring("uf_focus_options", "Anchor:", "content")
		ns.uf_focus_options.content.anchor_text:SetPoint("LEFT", ns.uf_focus_options.content.pos_y, "RIGHT", 5, 0)

		ns.uf_focus_options.content.anchor = ns.createPicker("uf_focus_options", "anchor", "uf_focus_anchor", 110, LolzenUIcfg.unitframes["uf_focus_anchor"], "content")
		ns.uf_focus_options.content.anchor:SetPoint("LEFT", ns.uf_focus_options.content.anchor_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.width_text = ns.createFontstring("uf_focus_options", "Width:", "content")
		ns.uf_focus_options.content.width_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_focus_options.content.width = ns.createInputbox("uf_focus_options", 40, 20, LolzenUIcfg.unitframes["uf_focus_width"], "content")
		ns.uf_focus_options.content.width:SetPoint("LEFT", ns.uf_focus_options.content.width_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.height_text = ns.createFontstring("uf_focus_options", "Height:", "content")
		ns.uf_focus_options.content.height_text:SetPoint("LEFT", ns.uf_focus_options.content.width, "RIGHT", 10, 0)

		ns.uf_focus_options.content.height = ns.createInputbox("uf_focus_options", 40, 20, LolzenUIcfg.unitframes["uf_focus_height"], "content")
		ns.uf_focus_options.content.height:SetPoint("LEFT", ns.uf_focus_options.content.height_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.header1 = ns.createHeader("uf_focus_options", "Healthpoints", "content")
		ns.uf_focus_options.content.header1:SetPoint("TOPLEFT", ns.uf_focus_options.content.width_text, 0, -30)

		ns.uf_focus_options.content.cb1 = ns.createCheckBox("uf_focus_options", "uf_focus_use_custom_font_hp", "|cff5599ffoverwrite the general font options for focus healthpoints|r", LolzenUIcfg.unitframes["uf_focus_use_own_hp_font_settings"], "content")
		ns.uf_focus_options.content.cb1:SetPoint("TOPLEFT", ns.uf_focus_options.content.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_focus_options.content.hp_pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_focus_options.content.hp_pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_hp_posx"], "content")
		ns.uf_focus_options.content.hp_pos_x:SetPoint("LEFT", ns.uf_focus_options.content.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.hp_pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.hp_pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.hp_pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_hp_posy"], "content")
		ns.uf_focus_options.content.hp_pos_y:SetPoint("LEFT", ns.uf_focus_options.content.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.hp_anchor_text = ns.createFontstring("uf_focus_options", "Anchor:", "content")
		ns.uf_focus_options.content.hp_anchor_text:SetPoint("LEFT", ns.uf_focus_options.content.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_focus_options.content.hp_anchor = ns.createPicker("uf_focus_options", "anchor", "uf_focus_hp_anchor", 110, LolzenUIcfg.unitframes["uf_focus_hp_anchor"], "content")
		ns.uf_focus_options.content.hp_anchor:SetPoint("LEFT", ns.uf_focus_options.content.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.hp_font_text = ns.createFontstring("uf_focus_options", "Font:", "content")
		ns.uf_focus_options.content.hp_font_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_focus_options.content.hp_font = ns.createPicker("uf_focus_options", "font", "uf_focus_hp_font", 120, LolzenUIcfg.unitframes["uf_focus_hp_font"], "content")
		ns.uf_focus_options.content.hp_font:SetPoint("LEFT", ns.uf_focus_options.content.hp_font_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.hp_font_size_text = ns.createFontstring("uf_focus_options", "Font size:", "content")
		ns.uf_focus_options.content.hp_font_size_text:SetPoint("LEFT", ns.uf_focus_options.content.hp_font, "RIGHT", -5, 3)

		ns.uf_focus_options.content.hp_font_size = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_hp_font_size"], "content")
		ns.uf_focus_options.content.hp_font_size:SetPoint("LEFT", ns.uf_focus_options.content.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.hp_font_flag_text = ns.createFontstring("uf_focus_options", "Font flag:", "content")
		ns.uf_focus_options.content.hp_font_flag_text:SetPoint("LEFT", ns.uf_focus_options.content.hp_font_size, "RIGHT", 10, 0)

		ns.uf_focus_options.content.hp_font_flag = ns.createPicker("uf_focus_options", "flag", "uf_focus_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_focus_hp_font_flag"], "content")
		ns.uf_focus_options.content.hp_font_flag:SetPoint("LEFT", ns.uf_focus_options.content.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.header2 = ns.createHeader("uf_focus_options", "Powerpoints", "content")
		ns.uf_focus_options.content.header2:SetPoint("TOPLEFT", ns.uf_focus_options.content.hp_font_text, 0, -30)

		ns.uf_focus_options.content.pp_pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.pp_pos_x_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_focus_options.content.pp_pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_pp_posx"], "content")
		ns.uf_focus_options.content.pp_pos_x:SetPoint("LEFT", ns.uf_focus_options.content.pp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.pp_pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.pp_pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.pp_pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.pp_pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_pp_posy"], "content")
		ns.uf_focus_options.content.pp_pos_y:SetPoint("LEFT", ns.uf_focus_options.content.pp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.pp_anchor_text = ns.createFontstring("uf_focus_options", "Anchor1:", "content")
		ns.uf_focus_options.content.pp_anchor_text:SetPoint("LEFT", ns.uf_focus_options.content.pp_pos_y, "RIGHT", 5, 0)

		ns.uf_focus_options.content.pp_anchor = ns.createPicker("uf_focus_options", "anchor", "uf_focus_pp_anchor", 90, LolzenUIcfg.unitframes["uf_focus_pp_anchor"], "content")
		ns.uf_focus_options.content.pp_anchor:SetPoint("LEFT", ns.uf_focus_options.content.pp_anchor_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.pp_parent_text = ns.createFontstring("uf_focus_options", "Parent:", "content")
		ns.uf_focus_options.content.pp_parent_text:SetPoint("LEFT", ns.uf_focus_options.content.pp_anchor, "RIGHT", -10, 3)

		ns.uf_focus_options.content.pp_parent = ns.createPicker("uf_focus_options", "uf_parent", "uf_focus_pp_parent", 50, LolzenUIcfg.unitframes["uf_focus_pp_parent"], "content")
		ns.uf_focus_options.content.pp_parent:SetPoint("LEFT", ns.uf_focus_options.content.pp_parent_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.pp_anchor2_text = ns.createFontstring("uf_focus_options", "Anchor2:", "content")
		ns.uf_focus_options.content.pp_anchor2_text:SetPoint("LEFT", ns.uf_focus_options.content.pp_parent, "RIGHT", -10, 3)

		ns.uf_focus_options.content.pp_anchor2 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_pp_anchor2", 90, LolzenUIcfg.unitframes["uf_focus_pp_anchor2"], "content")
		ns.uf_focus_options.content.pp_anchor2:SetPoint("LEFT", ns.uf_focus_options.content.pp_anchor2_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.pp_font_text = ns.createFontstring("uf_focus_options", "Font:", "content")
		ns.uf_focus_options.content.pp_font_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.pp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_focus_options.content.pp_font = ns.createPicker("uf_focus_options", "font", "uf_focus_pp_font", 120, LolzenUIcfg.unitframes["uf_focus_pp_font"], "content")
		ns.uf_focus_options.content.pp_font:SetPoint("LEFT", ns.uf_focus_options.content.pp_font_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.pp_font_size_text = ns.createFontstring("uf_focus_options", "Font size:", "content")
		ns.uf_focus_options.content.pp_font_size_text:SetPoint("LEFT", ns.uf_focus_options.content.pp_font, "RIGHT", -5, 3)

		ns.uf_focus_options.content.pp_font_size = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_pp_font_size"], "content")
		ns.uf_focus_options.content.pp_font_size:SetPoint("LEFT", ns.uf_focus_options.content.pp_font_size_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.pp_font_flag_text = ns.createFontstring("uf_focus_options", "Font flag:", "content")
		ns.uf_focus_options.content.pp_font_flag_text:SetPoint("LEFT", ns.uf_focus_options.content.pp_font_size, "RIGHT", 10, 0)

		ns.uf_focus_options.content.pp_font_flag = ns.createPicker("uf_focus_options", "flag", "uf_focus_pp_font_flag", 120, LolzenUIcfg.unitframes["uf_focus_pp_font_flag"], "content")
		ns.uf_focus_options.content.pp_font_flag:SetPoint("LEFT", ns.uf_focus_options.content.pp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.header3 = ns.createHeader("uf_focus_options", "Auras", "content")
		ns.uf_focus_options.content.header3:SetPoint("TOPLEFT", ns.uf_focus_options.content.pp_font_text, 0, -30)

		ns.uf_focus_options.content.aura_type_text = ns.createFontstring("uf_focus_options", "Show:", "content")
		ns.uf_focus_options.content.aura_type_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.header3, "BOTTOMLEFT", 0, -8)

		ns.uf_focus_options.content.aura_type = ns.createPicker("uf_focus_options", "uf_auratype", "uf_focus_aura_type", 70, LolzenUIcfg.unitframes["uf_focus_aura_show_type"], "content")
		ns.uf_focus_options.content.aura_type:SetPoint("LEFT", ns.uf_focus_options.content.aura_type_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.aura_maxnum_text = ns.createFontstring("uf_focus_options", "Show max (0-40):", "content")
		ns.uf_focus_options.content.aura_maxnum_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_type, "RIGHT", -5, 3)

		ns.uf_focus_options.content.aura_maxnum = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_aura_maxnum"], "content")
		ns.uf_focus_options.content.aura_maxnum:SetPoint("LEFT", ns.uf_focus_options.content.aura_maxnum_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_spacing_text = ns.createFontstring("uf_focus_options", "Spacing:", "content")
		ns.uf_focus_options.content.aura_spacing_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_maxnum, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_spacing = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_aura_spacing"], "content")
		ns.uf_focus_options.content.aura_spacing:SetPoint("LEFT", ns.uf_focus_options.content.aura_spacing_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_size_text = ns.createFontstring("uf_focus_options", "Size:", "content")
		ns.uf_focus_options.content.aura_size_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_spacing, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_size = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_aura_size"], "content")
		ns.uf_focus_options.content.aura_size:SetPoint("LEFT", ns.uf_focus_options.content.aura_size_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.aura_pos_x_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.aura_type_text, "BOTTOMLEFT", 0, -15)

		ns.uf_focus_options.content.aura_pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_aura_posx"], "content")
		ns.uf_focus_options.content.aura_pos_x:SetPoint("LEFT", ns.uf_focus_options.content.aura_pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.aura_pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.aura_pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_aura_posy"], "content")
		ns.uf_focus_options.content.aura_pos_y:SetPoint("LEFT", ns.uf_focus_options.content.aura_pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.aura_anchor_text = ns.createFontstring("uf_focus_options", "Anchor1:", "content")
		ns.uf_focus_options.content.aura_anchor_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_pos_y, "RIGHT", 5, 0)

		ns.uf_focus_options.content.aura_anchor = ns.createPicker("uf_focus_options", "anchor", "uf_focus_aura_anchor", 90, LolzenUIcfg.unitframes["uf_focus_aura_anchor1"], "content")
		ns.uf_focus_options.content.aura_anchor:SetPoint("LEFT", ns.uf_focus_options.content.aura_anchor_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.aura_anchor2_text = ns.createFontstring("uf_focus_options", "Anchor2:", "content")
		ns.uf_focus_options.content.aura_anchor2_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_anchor, "RIGHT", -10, 3)

		ns.uf_focus_options.content.aura_anchor2 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_aura_anchor2", 90, LolzenUIcfg.unitframes["uf_focus_aura_anchor2"], "content")
		ns.uf_focus_options.content.aura_anchor2:SetPoint("LEFT", ns.uf_focus_options.content.aura_anchor2_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.aura_growthx_text = ns.createFontstring("uf_focus_options", "GrowthX:", "content")
		ns.uf_focus_options.content.aura_growthx_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_focus_options.content.aura_growthx = ns.createPicker("uf_focus_options", "uf_auragrowth_x", "uf_focus_aura_growthx", 70, LolzenUIcfg.unitframes["uf_focus_aura_growth_x"], "content")
		ns.uf_focus_options.content.aura_growthx:SetPoint("LEFT", ns.uf_focus_options.content.aura_growthx_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.aura_growthy_text = ns.createFontstring("uf_focus_options", "GrowthY:", "content")
		ns.uf_focus_options.content.aura_growthy_text:SetPoint("LEFT", ns.uf_focus_options.content.aura_growthx, "RIGHT", -5, 3)

		ns.uf_focus_options.content.aura_growthy = ns.createPicker("uf_focus_options", "uf_auragrowth_y", "uf_focus_aura_growthy", 70, LolzenUIcfg.unitframes["uf_focus_aura_growth_y"], "content")
		ns.uf_focus_options.content.aura_growthy:SetPoint("LEFT", ns.uf_focus_options.content.aura_growthy_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.cb2 = ns.createCheckBox("uf_focus_options", "uf_focus_show_only_player_auras", "|cff5599ffshow only player's auras|r", LolzenUIcfg.unitframes["uf_focus_aura_show_only_player"], "content")
		ns.uf_focus_options.content.cb2:SetPoint("TOPLEFT", ns.uf_focus_options.content.aura_growthx_text, "BOTTOMLEFT", 0, -8)

		ns.uf_focus_options.content.cb3 = ns.createCheckBox("uf_focus_options", "uf_focus_desature_nonplayer_auras", "|cff5599ffdesature nonplayer auras|r", LolzenUIcfg.unitframes["uf_focus_aura_desature_nonplayer_auras"], "content")
		ns.uf_focus_options.content.cb3:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb2, "BOTTOMLEFT", 0, 0)

		ns.uf_focus_options.content.header4 = ns.createHeader("uf_focus_options", "Castbar", "content")

		ns.uf_focus_options.content.cb2:SetScript("OnClick", function(self)
			if ns.uf_focus_options.content.cb2:GetChecked() == true then
				ns.uf_focus_options.content.cb3:Hide()
				ns.uf_focus_options.content.header4:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb2, 0, -30)
				ns.uf_focus_options.scrollbar:Hide()
				ns.uf_focus_options.scrollframe:EnableMouseWheel(false)
			else
				ns.uf_focus_options.content.cb3:Show()
				ns.uf_focus_options.content.header4:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb3, 0, -30)
				ns.uf_focus_options.scrollbar:Show()
				ns.uf_focus_options.scrollframe:EnableMouseWheel(true)
			end
		end)

		if ns.uf_focus_options.content.cb2:GetChecked() == true then
			ns.uf_focus_options.content.cb3:Hide()
			ns.uf_focus_options.content.header4:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb2, 0, -30)
			ns.uf_focus_options.scrollbar:Hide()
			ns.uf_focus_options.scrollframe:EnableMouseWheel(false)
		else
			ns.uf_focus_options.content.cb3:Show()
			ns.uf_focus_options.content.header4:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb3, 0, -30)
		end

		ns.uf_focus_options.content.cb_color_text = ns.createFontstring("uf_focus_options", "Color:", "content")
		ns.uf_focus_options.content.cb_color_text:SetPoint("TOPLEFT", ns.uf_focus_options.content.header4, "BOTTOMLEFT", 0, -8)

		ns.uf_focus_options.content.cb_color = ns.createColorTexture("uf_focus_options", 16, 16, LolzenUIcfg.unitframes["uf_focus_cb_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"], "content")
		ns.uf_focus_options.content.cb_color:SetPoint("LEFT", ns.uf_focus_options.content.cb_color_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_color_f = ns.createColorPicker("uf_focus_options", ns.uf_focus_options.content.cb_color, LolzenUIcfg.unitframes["uf_focus_cb_color"], "content")
		ns.uf_focus_options.content.cb_color_f:SetAllPoints(ns.uf_focus_options.content.cb_color)

		ns.uf_focus_options.content.cb_alpha_text = ns.createFontstring("uf_focus_options", "Alpha:", "content")
		ns.uf_focus_options.content.cb_alpha_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_color, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_alpha = ns.createPicker("uf_focus_options", "alpha", "uf_focus_cb_alpha", 45, LolzenUIcfg.unitframes["uf_focus_cb_alpha"], "content")
		ns.uf_focus_options.content.cb_alpha:SetPoint("LEFT", ns.uf_focus_options.content.cb_alpha_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.header5 = ns.createHeader("uf_focus_options", "Icon:", "content")
		ns.uf_focus_options.content.header5:SetPoint("TOPLEFT", ns.uf_focus_options.content.cb_color_text, "BOTTOMLEFT", 0, -12)

		ns.uf_focus_options.content.cb_icon_size_text = ns.createFontstring("uf_focus_options", "Size:", "content")
		ns.uf_focus_options.content.cb_icon_size_text:SetPoint("LEFT", ns.uf_focus_options.content.header5, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_icon_size = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_icon_size"], "content")
		ns.uf_focus_options.content.cb_icon_size:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_size_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_icon_pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.cb_icon_pos_x_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_size, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_icon_pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_icon_posx"], "content")
		ns.uf_focus_options.content.cb_icon_pos_x:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_icon_pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.cb_icon_pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.cb_icon_pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_icon_posy"], "content")
		ns.uf_focus_options.content.cb_icon_pos_y:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_icon_anchor1_text = ns.createFontstring("uf_focus_options", "Anchor1:", "content")
		ns.uf_focus_options.content.cb_icon_anchor1_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_pos_y, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_icon_anchor1 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_cb_icon_anchor1", 70, LolzenUIcfg.unitframes["uf_focus_cb_icon_anchor1"], "content")
		ns.uf_focus_options.content.cb_icon_anchor1:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_anchor1_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.cb_icon_anchor2_text = ns.createFontstring("uf_focus_options", "Anchor2:", "content")
		ns.uf_focus_options.content.cb_icon_anchor2_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_anchor1, "RIGHT", -5, 3)

		ns.uf_focus_options.content.cb_icon_anchor2 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_cb_icon_anchor2", 70, LolzenUIcfg.unitframes["uf_focus_cb_icon_anchor2"], "content")
		ns.uf_focus_options.content.cb_icon_anchor2:SetPoint("LEFT", ns.uf_focus_options.content.cb_icon_anchor2_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.header6 = ns.createHeader("uf_focus_options", "Time:", "content")
		ns.uf_focus_options.content.header6:SetPoint("TOPLEFT", ns.uf_focus_options.content.header5, "BOTTOMLEFT", 0, -13)

		ns.uf_focus_options.content.cb_time_pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.cb_time_pos_x_text:SetPoint("LEFT", ns.uf_focus_options.content.header6, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_time_pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_time_posx"], "content")
		ns.uf_focus_options.content.cb_time_pos_x:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_time_pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.cb_time_pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.cb_time_pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_time_posy"], "content")
		ns.uf_focus_options.content.cb_time_pos_y:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_time_anchor1_text = ns.createFontstring("uf_focus_options", "Anchor1:", "content")
		ns.uf_focus_options.content.cb_time_anchor1_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_pos_y, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_time_anchor1 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_cb_time_anchor1", 110, LolzenUIcfg.unitframes["uf_focus_cb_time_anchor1"], "content")
		ns.uf_focus_options.content.cb_time_anchor1:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_anchor1_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.cb_time_anchor2_text = ns.createFontstring("uf_focus_options", "Anchor2:", "content")
		ns.uf_focus_options.content.cb_time_anchor2_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_anchor1, "RIGHT", -5, 3)

		ns.uf_focus_options.content.cb_time_anchor2 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_cb_time_anchor2", 110, LolzenUIcfg.unitframes["uf_focus_cb_time_anchor2"], "content")
		ns.uf_focus_options.content.cb_time_anchor2:SetPoint("LEFT", ns.uf_focus_options.content.cb_time_anchor2_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.header7 = ns.createHeader("uf_focus_options", "Text:", "content")
		ns.uf_focus_options.content.header7:SetPoint("TOPLEFT", ns.uf_focus_options.content.header6, "BOTTOMLEFT", 0, -13)

		ns.uf_focus_options.content.cb_text_pos_x_text = ns.createFontstring("uf_focus_options", "PosX:", "content")
		ns.uf_focus_options.content.cb_text_pos_x_text:SetPoint("LEFT", ns.uf_focus_options.content.header7, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_text_pos_x = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_text_posx"], "content")
		ns.uf_focus_options.content.cb_text_pos_x:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_pos_x_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_text_pos_y_text = ns.createFontstring("uf_focus_options", "PosY:", "content")
		ns.uf_focus_options.content.cb_text_pos_y_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_pos_x, "RIGHT", 5, 0)

		ns.uf_focus_options.content.cb_text_pos_y = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_text_posy"], "content")
		ns.uf_focus_options.content.cb_text_pos_y:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_pos_y_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_text_anchor1_text = ns.createFontstring("uf_focus_options", "Anchor1:", "content")
		ns.uf_focus_options.content.cb_text_anchor1_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_pos_y, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_text_anchor1 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_cb_text_anchor1", 110, LolzenUIcfg.unitframes["uf_focus_cb_text_anchor1"], "content")
		ns.uf_focus_options.content.cb_text_anchor1:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_anchor1_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.cb_text_anchor2_text = ns.createFontstring("uf_focus_options", "Anchor2:", "content")
		ns.uf_focus_options.content.cb_text_anchor2_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_anchor1, "RIGHT", -5, 3)

		ns.uf_focus_options.content.cb_text_anchor2 = ns.createPicker("uf_focus_options", "anchor", "uf_focus_cb_text_anchor2", 110, LolzenUIcfg.unitframes["uf_focus_cb_text_anchor2"], "content")
		ns.uf_focus_options.content.cb_text_anchor2:SetPoint("LEFT", ns.uf_focus_options.content.cb_text_anchor2_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.header8 = ns.createHeader("uf_focus_options", "Time/Text Font:", "content")
		ns.uf_focus_options.content.header8:SetPoint("TOPLEFT", ns.uf_focus_options.content.header7, "BOTTOMLEFT", 0, -13)

		ns.uf_focus_options.content.cb_font = ns.createPicker("uf_focus_options", "font", "uf_focus_cb_font", 120, LolzenUIcfg.unitframes["uf_focus_cb_font"], "content")
		ns.uf_focus_options.content.cb_font:SetPoint("LEFT", ns.uf_focus_options.content.header8, "RIGHT", -10, -3)

		ns.uf_focus_options.content.cb_font_size_text = ns.createFontstring("uf_focus_options", "Size:", "content")
		ns.uf_focus_options.content.cb_font_size_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_font, "RIGHT", -5, 3)

		ns.uf_focus_options.content.cb_font_size = ns.createInputbox("uf_focus_options", 30, 20, LolzenUIcfg.unitframes["uf_focus_cb_font_size"], "content")
		ns.uf_focus_options.content.cb_font_size:SetPoint("LEFT", ns.uf_focus_options.content.cb_font_size_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_font_flag_text = ns.createFontstring("uf_focus_options", "Flag:", "content")
		ns.uf_focus_options.content.cb_font_flag_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_font_size, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_font_flag = ns.createPicker("uf_focus_options", "flag", "uf_focus_cb_font_flag", 120, LolzenUIcfg.unitframes["uf_focus_cb_font_flag"], "content")
		ns.uf_focus_options.content.cb_font_flag:SetPoint("LEFT", ns.uf_focus_options.content.cb_font_flag_text, "RIGHT", -10, -3)

		ns.uf_focus_options.content.cb_font_color_text = ns.createFontstring("uf_focus_options", "Color:", "content")
		ns.uf_focus_options.content.cb_font_color_text:SetPoint("LEFT", ns.uf_focus_options.content.cb_font_flag, "RIGHT", -10, 3)

		ns.uf_focus_options.content.cb_font_color = ns.createColorTexture("uf_focus_options", 16, 16, LolzenUIcfg.unitframes["uf_focus_cb_font_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"], "content")
		ns.uf_focus_options.content.cb_font_color:SetPoint("LEFT", ns.uf_focus_options.content.cb_font_color_text, "RIGHT", 10, 0)

		ns.uf_focus_options.content.cb_font_color_f = ns.createColorPicker("uf_focus_options", ns.uf_focus_options.content.cb_font_color, LolzenUIcfg.unitframes["uf_focus_cb_font_color"], "content")
		ns.uf_focus_options.content.cb_font_color_f:SetAllPoints(ns.uf_focus_options.content.cb_font_color)

		-- // Create a subcategory panel for Power Colors // --
		ns.uf_powercolor_options = CreateFrame("Frame", "unitframe_bosspanel", ns["unitframes"])
		ns.uf_powercolor_options.name = "   Power Colors"
		ns.uf_powercolor_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_powercolor_options)

		ns.uf_powercolor_options.title = ns.uf_powercolor_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_powercolor_options.title:SetPoint("TOPLEFT", ns.uf_powercolor_options, 16, -16)
		ns.uf_powercolor_options.title:SetText("|cff5599ffUnitframes module: Power Colors|r")

		ns.uf_powercolor_options.mana_text = ns.createFontstring("uf_powercolor_options", "Mana:")
		ns.uf_powercolor_options.mana_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_powercolor_options.mana = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["0"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.mana:SetPoint("LEFT", ns.uf_powercolor_options.mana_text, "RIGHT", 62, 0)

		ns.uf_powercolor_options.mana_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.mana, LolzenUIcfg.unitframes["uf_power_colors"]["0"])
		ns.uf_powercolor_options.mana_f:SetAllPoints(ns.uf_powercolor_options.mana)

		ns.uf_powercolor_options.rage_text = ns.createFontstring("uf_powercolor_options", "Rage:")
		ns.uf_powercolor_options.rage_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.mana_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.rage = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["1"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.rage:SetPoint("LEFT", ns.uf_powercolor_options.rage_text, "RIGHT", 65, 0)

		ns.uf_powercolor_options.rage_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.rage, LolzenUIcfg.unitframes["uf_power_colors"]["1"])
		ns.uf_powercolor_options.rage_f:SetAllPoints(ns.uf_powercolor_options.rage)

		ns.uf_powercolor_options.focus_text = ns.createFontstring("uf_powercolor_options", "Focus:")
		ns.uf_powercolor_options.focus_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.rage_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.focus = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["2"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.focus:SetPoint("LEFT", ns.uf_powercolor_options.focus_text, "RIGHT", 62, 0)

		ns.uf_powercolor_options.focus_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.focus, LolzenUIcfg.unitframes["uf_power_colors"]["2"])
		ns.uf_powercolor_options.focus_f:SetAllPoints(ns.uf_powercolor_options.focus)

		ns.uf_powercolor_options.energy_text = ns.createFontstring("uf_powercolor_options", "Energy:")
		ns.uf_powercolor_options.energy_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.focus_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.energy = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["3"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.energy:SetPoint("LEFT", ns.uf_powercolor_options.energy_text, "RIGHT", 56, 0)

		ns.uf_powercolor_options.energy_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.energy, LolzenUIcfg.unitframes["uf_power_colors"]["3"])
		ns.uf_powercolor_options.energy_f:SetAllPoints(ns.uf_powercolor_options.energy)

		ns.uf_powercolor_options.cp_text = ns.createFontstring("uf_powercolor_options", "Combo Points:")
		ns.uf_powercolor_options.cp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.energy_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.cp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["4"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.cp:SetPoint("LEFT", ns.uf_powercolor_options.cp_text, "RIGHT", 20, 0)

		ns.uf_powercolor_options.cp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.cp, LolzenUIcfg.unitframes["uf_power_colors"]["4"])
		ns.uf_powercolor_options.cp_f:SetAllPoints(ns.uf_powercolor_options.cp)

		ns.uf_powercolor_options.runes_text = ns.createFontstring("uf_powercolor_options", "Runes:")
		ns.uf_powercolor_options.runes_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.cp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.runes = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["5"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.runes:SetPoint("LEFT", ns.uf_powercolor_options.runes_text, "RIGHT", 61, 0)

		ns.uf_powercolor_options.runes_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.runes, LolzenUIcfg.unitframes["uf_power_colors"]["5"])
		ns.uf_powercolor_options.runes_f:SetAllPoints(ns.uf_powercolor_options.runes)

		ns.uf_powercolor_options.rp_text = ns.createFontstring("uf_powercolor_options", "Runic Power:")
		ns.uf_powercolor_options.rp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.runes_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.rp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["6"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.rp:SetPoint("LEFT", ns.uf_powercolor_options.rp_text, "RIGHT", 28, 0)

		ns.uf_powercolor_options.rp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.rp, LolzenUIcfg.unitframes["uf_power_colors"]["6"])
		ns.uf_powercolor_options.rp_f:SetAllPoints(ns.uf_powercolor_options.rp)

		ns.uf_powercolor_options.soulshards_text = ns.createFontstring("uf_powercolor_options", "Soul Shards:")
		ns.uf_powercolor_options.soulshards_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.rp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.soulshards = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["7"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.soulshards:SetPoint("LEFT", ns.uf_powercolor_options.soulshards_text, "RIGHT", 32, 0)

		ns.uf_powercolor_options.soulshards_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.soulshards, LolzenUIcfg.unitframes["uf_power_colors"]["7"])
		ns.uf_powercolor_options.soulshards_f:SetAllPoints(ns.uf_powercolor_options.soulshards)

		ns.uf_powercolor_options.lp_text = ns.createFontstring("uf_powercolor_options", "Lunar Power:")
		ns.uf_powercolor_options.lp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.soulshards_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.lp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["8"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.lp:SetPoint("LEFT", ns.uf_powercolor_options.lp_text, "RIGHT", 28, 0)

		ns.uf_powercolor_options.lp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.lp, LolzenUIcfg.unitframes["uf_power_colors"]["8"])
		ns.uf_powercolor_options.lp_f:SetAllPoints(ns.uf_powercolor_options.lp)

		ns.uf_powercolor_options.hp_text = ns.createFontstring("uf_powercolor_options", "Holy Power:")
		ns.uf_powercolor_options.hp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.lp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.hp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["9"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.hp:SetPoint("LEFT", ns.uf_powercolor_options.hp_text, "RIGHT", 32, 0)

		ns.uf_powercolor_options.hp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.hp, LolzenUIcfg.unitframes["uf_power_colors"]["9"])
		ns.uf_powercolor_options.hp_f:SetAllPoints(ns.uf_powercolor_options.hp)

		ns.uf_powercolor_options.maelstrom_text = ns.createFontstring("uf_powercolor_options", "Maelstrom:")
		ns.uf_powercolor_options.maelstrom_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.hp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.maelstrom = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["11"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.maelstrom:SetPoint("LEFT", ns.uf_powercolor_options.maelstrom_text, "RIGHT", 35, 0)

		ns.uf_powercolor_options.maelstrom_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.maelstrom, LolzenUIcfg.unitframes["uf_power_colors"]["11"])
		ns.uf_powercolor_options.maelstrom_f:SetAllPoints(ns.uf_powercolor_options.maelstrom)

		ns.uf_powercolor_options.chi_text = ns.createFontstring("uf_powercolor_options", "Chi:")
		ns.uf_powercolor_options.chi_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.maelstrom_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.chi = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["12"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.chi:SetPoint("LEFT", ns.uf_powercolor_options.chi_text, "RIGHT", 75, 0)

		ns.uf_powercolor_options.chi_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.chi, LolzenUIcfg.unitframes["uf_power_colors"]["12"])
		ns.uf_powercolor_options.chi_f:SetAllPoints(ns.uf_powercolor_options.chi)

		ns.uf_powercolor_options.insanity_text = ns.createFontstring("uf_powercolor_options", "Insanity:")
		ns.uf_powercolor_options.insanity_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.chi_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.insanity = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["13"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.insanity:SetPoint("LEFT", ns.uf_powercolor_options.insanity_text, "RIGHT", 51, 0)

		ns.uf_powercolor_options.insanity_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.insanity, LolzenUIcfg.unitframes["uf_power_colors"]["13"])
		ns.uf_powercolor_options.insanity_f:SetAllPoints(ns.uf_powercolor_options.insanity)

		ns.uf_powercolor_options.ac_text = ns.createFontstring("uf_powercolor_options", "Arcane Charges:")
		ns.uf_powercolor_options.ac_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.insanity_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.ac = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["16"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.ac:SetPoint("LEFT", ns.uf_powercolor_options.ac_text, "RIGHT", 11, 0)

		ns.uf_powercolor_options.ac_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.ac, LolzenUIcfg.unitframes["uf_power_colors"]["16"])
		ns.uf_powercolor_options.ac_f:SetAllPoints(ns.uf_powercolor_options.ac)

		ns.uf_powercolor_options.fury_text = ns.createFontstring("uf_powercolor_options", "Fury:")
		ns.uf_powercolor_options.fury_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.ac_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.fury = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["17"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.fury:SetPoint("LEFT", ns.uf_powercolor_options.fury_text, "RIGHT", 70, 0)

		ns.uf_powercolor_options.fury_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.fury, LolzenUIcfg.unitframes["uf_power_colors"]["17"])
		ns.uf_powercolor_options.fury_f:SetAllPoints(ns.uf_powercolor_options.fury)

		ns.uf_powercolor_options.pain_text = ns.createFontstring("uf_powercolor_options", "Pain:")
		ns.uf_powercolor_options.pain_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.fury_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.pain = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["18"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.pain:SetPoint("LEFT", ns.uf_powercolor_options.pain_text, "RIGHT", 70, 0)

		ns.uf_powercolor_options.pain_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.pain, LolzenUIcfg.unitframes["uf_power_colors"]["18"])
		ns.uf_powercolor_options.pain_f:SetAllPoints(ns.uf_powercolor_options.pain)

		ns["unitframes"].okay = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = ns.unitframes.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_use_val_and_perc"] = ns.unitframes.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_perc_first"] = ns.unitframes.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_val_perc_divider"] = ns.unitframes.perc_val_divider:GetText()
			LolzenUIcfg.unitframes["uf_use_sivalue"] = ns.unitframes.cb4:GetChecked()
			LolzenUIcfg.unitframes["uf_use_dot_format"] = ns.unitframes.cb5:GetChecked()
			LolzenUIcfg.unitframes["uf_statusbar_texture"] = UIDropDownMenu_GetSelectedName(ns.unitframes.texture)
			LolzenUIcfg.unitframes["uf_border"] = UIDropDownMenu_GetSelectedName(ns.unitframes.border)
			LolzenUIcfg.unitframes["uf_ri_size"] = tonumber(ns.unitframes.rt_size:GetText())
			LolzenUIcfg.unitframes["uf_ri_posx"] = tonumber(ns.unitframes.rt_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_ri_posy"] = tonumber(ns.unitframes.rt_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.unitframes.rt_anchor)]
			LolzenUIcfg.unitframes["uf_lead_size"] = tonumber(ns.unitframes.lead_size:GetText())
			LolzenUIcfg.unitframes["uf_lead_posx"] = tonumber(ns.unitframes.lead_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_lead_posy"] = tonumber(ns.unitframes.lead_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_lead_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.unitframes.lead_anchor)]
			LolzenUIcfg.unitframes["uf_fade_outofreach"] = ns.unitframes.cb6:GetChecked()
			LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.unitframes.fadeout_alpha)])
			LolzenUIcfg.unitframes["uf_general_hp_font_size"] = tonumber(ns.unitframes.general_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_font"] = UIDropDownMenu_GetSelectedName(ns.unitframes.general_hp_font)
			LolzenUIcfg.unitframes["uf_general_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.unitframes.general_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_general_hp_posx"] = tonumber(ns.unitframes.general_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_posy"] = tonumber(ns.unitframes.general_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.unitframes.general_hp_anchor)]
			LolzenUIcfg.unitframes["uf_testmode"] = ns.unitframes.cb7:GetChecked()
		end

		ns["unitframes"].default = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = false
			LolzenUIcfg.unitframes["uf_use_val_and_perc"] = false
			LolzenUIcfg.unitframes["uf_perc_first"] = false
			LolzenUIcfg.unitframes["uf_val_perc_divider"] = "."
			LolzenUIcfg.unitframes["uf_use_sivalue"] = true
			LolzenUIcfg.unitframes["uf_use_dot_format"] = false
			LolzenUIcfg.unitframes["uf_statusbar_texture"] = "LolzenUI Standard"
			LolzenUIcfg.unitframes["uf_border"] = "LolzenUI Standard"
			LolzenUIcfg.unitframes["uf_ri_size"] = 16
			LolzenUIcfg.unitframes["uf_ri_posx"] = 0
			LolzenUIcfg.unitframes["uf_ri_posy"] = 10
			LolzenUIcfg.unitframes["uf_ri_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_lead_size"] = 16
			LolzenUIcfg.unitframes["uf_lead_posx"] = 0
			LolzenUIcfg.unitframes["uf_lead_posy"] = 10
			LolzenUIcfg.unitframes["uf_lead_anchor"] = "TOPLEFT"
			LolzenUIcfg.unitframes["uf_fade_outofreach"] = true
			LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"] = 0.5
			LolzenUIcfg.unitframes["uf_general_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_general_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_general_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_general_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_general_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_general_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_testmode"] = false
			ReloadUI()
		end

		ns["uf_player_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_player_posx"] = tonumber(ns.uf_player_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_posy"] = tonumber(ns.uf_player_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.anchor)]
			LolzenUIcfg.unitframes["uf_player_use_own_hp_font_settings"] = ns.uf_player_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_player_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_player_options.hp_font)
			LolzenUIcfg.unitframes["uf_player_hp_font_size"] = tonumber(ns.uf_player_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_player_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_player_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_player_hp_posx"] = tonumber(ns.uf_player_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_hp_posy"] = tonumber(ns.uf_player_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_player_pp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_player_options.pp_font)
			LolzenUIcfg.unitframes["uf_player_pp_font_size"] = tonumber(ns.uf_player_options.pp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_player_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_player_options.pp_font_flag)]
			LolzenUIcfg.unitframes["uf_player_pp_posx"] = tonumber(ns.uf_player_options.pp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_pp_posy"] = tonumber(ns.uf_player_options.pp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.pp_anchor)]
			LolzenUIcfg.unitframes["uf_player_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.pp_anchor2)]
			LolzenUIcfg.unitframes["uf_player_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(ns.uf_player_options.pp_parent)]
			LolzenUIcfg.unitframes["uf_player_width"] = tonumber(ns.uf_player_options.width:GetText())
			LolzenUIcfg.unitframes["uf_player_height"] = tonumber(ns.uf_player_options.height:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_border"] = UIDropDownMenu_GetSelectedName(ns.uf_player_options.classpower_border)
			LolzenUIcfg.unitframes["uf_player_classpower_spacing"] = tonumber(ns.uf_player_options.classpower_spacing:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_posx"] = tonumber(ns.uf_player_options.classpower_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_posy"] = tonumber(ns.uf_player_options.classpower_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.classpower_anchor1)]
			LolzenUIcfg.unitframes["uf_player_classpower_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.classpower_anchor2)]
			LolzenUIcfg.unitframes["uf_player_cb_standalone"] = ns.uf_player_options.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_player_cb_posx"] = tonumber(ns.uf_player_options.cb_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_posy"] = tonumber(ns.uf_player_options.cb_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_anchor1)]
			LolzenUIcfg.unitframes["uf_player_cb_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_anchor2)]
			LolzenUIcfg.unitframes["uf_player_cb_width"] = tonumber(ns.uf_player_options.cb_width:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_height"] = tonumber(ns.uf_player_options.cb_height:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_color"] = {ns.uf_player_options.cb_color:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_player_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_alpha)])
			LolzenUIcfg.unitframes["uf_player_cb_icon_size"] = tonumber(ns.uf_player_options.cb_icon_size:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_icon_posx"] = tonumber(ns.uf_player_options.cb_icon_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_icon_posy"] = tonumber(ns.uf_player_options.cb_icon_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_icon_anchor1)]
			LolzenUIcfg.unitframes["uf_player_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_icon_anchor2)]
			LolzenUIcfg.unitframes["uf_player_cb_time_posx"] = tonumber(ns.uf_player_options.cb_time_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_time_posy"] = tonumber(ns.uf_player_options.cb_time_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_time_anchor1)]
			LolzenUIcfg.unitframes["uf_player_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_time_anchor2)]
			LolzenUIcfg.unitframes["uf_player_cb_text_posx"] = tonumber(ns.uf_player_options.cb_text_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_text_posy"] = tonumber(ns.uf_player_options.cb_text_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_text_anchor1)]
			LolzenUIcfg.unitframes["uf_player_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_text_anchor2)]
			LolzenUIcfg.unitframes["uf_player_cb_font"] = UIDropDownMenu_GetSelectedName(ns.uf_player_options.cb_font)
			LolzenUIcfg.unitframes["uf_player_cb_font_size"] = tonumber(ns.uf_player_options.cb_font_size:GetText())
			LolzenUIcfg.unitframes["uf_player_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_player_options.cb_font_flag)]
			LolzenUIcfg.unitframes["uf_player_cb_font_color"] = {ns.uf_player_options.cb_font_color:GetVertexColor()}
		end

		ns["uf_player_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_player_posx"] = -250
			LolzenUIcfg.unitframes["uf_player_posy"] = -200
			LolzenUIcfg.unitframes["uf_player_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_player_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_player_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_player_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_player_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_player_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_player_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_player_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_player_pp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_player_pp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_player_pp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_player_pp_posx"] = 0
			LolzenUIcfg.unitframes["uf_player_pp_posy"] = 0
			LolzenUIcfg.unitframes["uf_player_pp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_player_pp_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_player_pp_parent"] = "hp"
			LolzenUIcfg.unitframes["uf_player_width"] = 220
			LolzenUIcfg.unitframes["uf_player_height"] = 21
			LolzenUIcfg.unitframes["uf_player_classpower_border"] = "Blizzard Tooltip"
			LolzenUIcfg.unitframes["uf_player_classpower_spacing"] = 5
			LolzenUIcfg.unitframes["uf_player_classpower_posx"] = 0
			LolzenUIcfg.unitframes["uf_player_classpower_posy"] = -5
			LolzenUIcfg.unitframes["uf_player_classpower_anchor1"] = "TOPLEFT"
			LolzenUIcfg.unitframes["uf_player_classpower_anchor2"] = "BOTTOMLEFT"
			LolzenUIcfg.unitframes["uf_player_cb_standalone"] = false
			LolzenUIcfg.unitframes["uf_player_cb_posx"] = 0
			LolzenUIcfg.unitframes["uf_player_cb_posy"] = -320
			LolzenUIcfg.unitframes["uf_player_cb_anchor1"] = "CENTER"
			LolzenUIcfg.unitframes["uf_player_cb_anchor2"] = "CENTER"
			LolzenUIcfg.unitframes["uf_player_cb_width"] = 220
			LolzenUIcfg.unitframes["uf_player_cb_height"] = 21
			LolzenUIcfg.unitframes["uf_player_cb_color"] = {0.8, 0, 0}
			LolzenUIcfg.unitframes["uf_player_cb_alpha"] = 0.2
			LolzenUIcfg.unitframes["uf_player_cb_icon_size"] = 33
			LolzenUIcfg.unitframes["uf_player_cb_icon_posx"] = -14
			LolzenUIcfg.unitframes["uf_player_cb_icon_posy"] = 6
			LolzenUIcfg.unitframes["uf_player_cb_icon_anchor1"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_player_cb_icon_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_player_cb_time_posx"] = 13
			LolzenUIcfg.unitframes["uf_player_cb_time_posy"] = 2
			LolzenUIcfg.unitframes["uf_player_cb_time_anchor1"] = "TOPLEFT"
			LolzenUIcfg.unitframes["uf_player_cb_time_anchor2"] = "TOPRIGHT"
			LolzenUIcfg.unitframes["uf_player_cb_text_posx"] = 2
			LolzenUIcfg.unitframes["uf_player_cb_text_posy"] = 1
			LolzenUIcfg.unitframes["uf_player_cb_text_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_player_cb_text_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_player_cb_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_player_cb_font_size"] = 12
			LolzenUIcfg.unitframes["uf_player_cb_font_flag"] = "OUTLINE"
			LolzenUIcfg.unitframes["uf_player_cb_font_color"] = {1, 1, 1}
			ReloadUI()
		end

		ns["uf_target_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_target_posx"] = tonumber(ns.uf_target_options.content.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_posy"] = tonumber(ns.uf_target_options.content.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.anchor)]
			LolzenUIcfg.unitframes["uf_target_use_own_hp_font_settings"] = ns.uf_target_options.content.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_target_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_target_options.content.hp_font)
			LolzenUIcfg.unitframes["uf_target_hp_font_size"] = tonumber(ns.uf_target_options.content.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_target_hp_posx"] = tonumber(ns.uf_target_options.content.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_posy"] = tonumber(ns.uf_target_options.content.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.hp_anchor)]
			LolzenUIcfg.unitframes["uf_target_pp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_target_options.content.pp_font)
			LolzenUIcfg.unitframes["uf_target_pp_font_size"] = tonumber(ns.uf_target_options.content.pp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_target_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.pp_font_flag)]
			LolzenUIcfg.unitframes["uf_target_pp_posx"] = tonumber(ns.uf_target_options.content.pp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_pp_posy"] = tonumber(ns.uf_target_options.content.pp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.pp_anchor)]
			LolzenUIcfg.unitframes["uf_target_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.pp_anchor2)]
			LolzenUIcfg.unitframes["uf_target_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.pp_parent)]
			LolzenUIcfg.unitframes["uf_target_width"] = tonumber(ns.uf_target_options.content.width:GetText())
			LolzenUIcfg.unitframes["uf_target_height"] = tonumber(ns.uf_target_options.content.height:GetText())
			LolzenUIcfg.unitframes["uf_target_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.aura_type)]
			LolzenUIcfg.unitframes["uf_target_aura_posx"] = tonumber(ns.uf_target_options.content.aura_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_aura_posy"] = tonumber(ns.uf_target_options.content.aura_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.aura_anchor)]
			LolzenUIcfg.unitframes["uf_target_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.aura_anchor2)]
			LolzenUIcfg.unitframes["uf_target_aura_maxnum"] = tonumber(ns.uf_target_options.content.aura_maxnum:GetText())
			LolzenUIcfg.unitframes["uf_target_aura_spacing"] = tonumber(ns.uf_target_options.content.aura_spacing:GetText())
			LolzenUIcfg.unitframes["uf_target_aura_size"] = tonumber(ns.uf_target_options.content.aura_size:GetText())
			LolzenUIcfg.unitframes["uf_target_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.aura_growthx)]
			LolzenUIcfg.unitframes["uf_target_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.aura_growthy)]
			LolzenUIcfg.unitframes["uf_target_aura_show_only_player"] = ns.uf_target_options.content.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_target_aura_desature_nonplayer_auras"] = ns.uf_target_options.content.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_target_cb_standalone"] = ns.uf_target_options.content.cb4:GetChecked()
			LolzenUIcfg.unitframes["uf_target_cb_posx"] = tonumber(ns.uf_target_options.content.cb_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_posy"] = tonumber(ns.uf_target_options.content.cb_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_anchor1)]
			LolzenUIcfg.unitframes["uf_target_cb_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_anchor2)]
			LolzenUIcfg.unitframes["uf_target_cb_width"] = tonumber(ns.uf_target_options.content.cb_width:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_height"] = tonumber(ns.uf_target_options.content.cb_height:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_color"] = {ns.uf_target_options.content.cb_color:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_target_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_alpha)])
			LolzenUIcfg.unitframes["uf_target_cb_icon_size"] = tonumber(ns.uf_target_options.content.cb_icon_size:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_icon_posx"] = tonumber(ns.uf_target_options.content.cb_icon_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_icon_posy"] = tonumber(ns.uf_target_options.content.cb_icon_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_icon_anchor1)]
			LolzenUIcfg.unitframes["uf_target_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_icon_anchor2)]
			LolzenUIcfg.unitframes["uf_target_cb_time_posx"] = tonumber(ns.uf_target_options.content.cb_time_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_time_posy"] = tonumber(ns.uf_target_options.content.cb_time_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_time_anchor1)]
			LolzenUIcfg.unitframes["uf_target_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_time_anchor2)]
			LolzenUIcfg.unitframes["uf_target_cb_text_posx"] = tonumber(ns.uf_target_options.content.cb_text_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_text_posy"] = tonumber(ns.uf_target_options.content.cb_text_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_text_anchor1)]
			LolzenUIcfg.unitframes["uf_target_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_text_anchor2)]
			LolzenUIcfg.unitframes["uf_target_cb_font"] = UIDropDownMenu_GetSelectedName(ns.uf_target_options.content.cb_font)
			LolzenUIcfg.unitframes["uf_target_cb_font_size"] = tonumber(ns.uf_target_options.content.cb_font_size:GetText())
			LolzenUIcfg.unitframes["uf_target_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_target_options.content.cb_font_flag)]
			LolzenUIcfg.unitframes["uf_target_cb_font_color"] = {ns.uf_target_options.content.cb_font_color:GetVertexColor()}
		end

		ns["uf_target_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_target_posx"] = 250
			LolzenUIcfg.unitframes["uf_target_posy"] = -200
			LolzenUIcfg.unitframes["uf_target_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_target_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_target_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_target_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_target_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_target_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_target_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_target_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_target_pp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_target_pp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_target_pp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_target_pp_posx"] = 0
			LolzenUIcfg.unitframes["uf_target_pp_posy"] = 0
			LolzenUIcfg.unitframes["uf_target_pp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_target_pp_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_target_pp_parent"] = "hp"
			LolzenUIcfg.unitframes["uf_target_width"] = 220
			LolzenUIcfg.unitframes["uf_target_height"] = 21
			LolzenUIcfg.unitframes["uf_target_aura_show_type"] = "Debuffs"
			LolzenUIcfg.unitframes["uf_target_aura_posx"] = 0
			LolzenUIcfg.unitframes["uf_target_aura_posy"] = -30
			LolzenUIcfg.unitframes["uf_target_aura_anchor1"] = "TOP"
			LolzenUIcfg.unitframes["uf_target_aura_anchor2"] = "BOTTOM"
			LolzenUIcfg.unitframes["uf_target_aura_maxnum"] = 8
			LolzenUIcfg.unitframes["uf_target_aura_spacing"] = 4
			LolzenUIcfg.unitframes["uf_target_aura_size"] = 23
			LolzenUIcfg.unitframes["uf_target_aura_growth_x"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_target_aura_growth_y"] = "DOWN"
			LolzenUIcfg.unitframes["uf_target_aura_show_only_player"] = true
			LolzenUIcfg.unitframes["uf_target_aura_desature_nonplayer_auras"] = true
			LolzenUIcfg.unitframes["uf_target_cb_standalone"] = false
			LolzenUIcfg.unitframes["uf_target_cb_posx"] = 0
			LolzenUIcfg.unitframes["uf_target_cb_posy"] = -275
			LolzenUIcfg.unitframes["uf_target_cb_anchor1"] = "CENTER"
			LolzenUIcfg.unitframes["uf_target_cb_anchor2"] = "CENTER"
			LolzenUIcfg.unitframes["uf_target_cb_width"] = 220
			LolzenUIcfg.unitframes["uf_target_cb_height"] = 21
			LolzenUIcfg.unitframes["uf_target_cb_color"] = {0.8, 0, 0}
			LolzenUIcfg.unitframes["uf_target_cb_alpha"] = 0.2
			LolzenUIcfg.unitframes["uf_target_cb_icon_size"] = 33
			LolzenUIcfg.unitframes["uf_target_cb_icon_posx"] = -14
			LolzenUIcfg.unitframes["uf_target_cb_icon_posy"] = 6
			LolzenUIcfg.unitframes["uf_target_cb_icon_anchor1"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_target_cb_icon_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_target_cb_time_posx"] = 13
			LolzenUIcfg.unitframes["uf_target_cb_time_posy"] = 2
			LolzenUIcfg.unitframes["uf_target_cb_time_anchor1"] = "TOPLEFT"
			LolzenUIcfg.unitframes["uf_target_cb_time_anchor2"] = "TOPRIGHT"
			LolzenUIcfg.unitframes["uf_target_cb_text_posx"] = 2
			LolzenUIcfg.unitframes["uf_target_cb_text_posy"] = 1
			LolzenUIcfg.unitframes["uf_target_cb_text_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_target_cb_text_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_target_cb_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_target_cb_font_size"] = 12
			LolzenUIcfg.unitframes["uf_target_cb_font_flag"] = "OUTLINE"
			LolzenUIcfg.unitframes["uf_target_cb_font_color"] = {1, 1, 1}
			ReloadUI()
		end

		ns["uf_targettarget_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_targettarget_posx"] = tonumber(ns.uf_targettarget_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_posy"] = tonumber(ns.uf_targettarget_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_targettarget_options.anchor)]
			LolzenUIcfg.unitframes["uf_targettarget_use_own_hp_font_settings"] = ns.uf_targettarget_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_targettarget_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_targettarget_options.hp_font)
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"] = tonumber(ns.uf_targettarget_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_targettarget_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_targettarget_hp_posx"] = tonumber(ns.uf_targettarget_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_hp_posy"] = tonumber(ns.uf_targettarget_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_targettarget_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_targettarget_width"] = tonumber(ns.uf_targettarget_options.width:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_height"] = tonumber(ns.uf_targettarget_options.height:GetText())
		end

		ns["uf_targettarget_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_targettarget_posx"] = 300
			LolzenUIcfg.unitframes["uf_targettarget_posy"] = -177
			LolzenUIcfg.unitframes["uf_targettarget_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_targettarget_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_targettarget_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_targettarget_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_targettarget_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_targettarget_width"] = 120
			LolzenUIcfg.unitframes["uf_targettarget_height"] = 18
			ReloadUI()
		end

		ns["uf_party_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_party_enabled"] = ns.uf_party_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_party_use_vertical_layout"] = ns.uf_party_options.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_party_posx"] = tonumber(ns.uf_party_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_posy"] = tonumber(ns.uf_party_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_party_options.anchor)]
			LolzenUIcfg.unitframes["uf_party_use_own_hp_font_settings"] = ns.uf_party_options.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_party_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_party_options.hp_font)
			LolzenUIcfg.unitframes["uf_party_hp_font_size"] = tonumber(ns.uf_party_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_party_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_party_hp_posx"] = tonumber(ns.uf_party_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_posy"] = tonumber(ns.uf_party_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_party_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_party_width"] = tonumber(ns.uf_party_options.width:GetText())
			LolzenUIcfg.unitframes["uf_party_height"] = tonumber(ns.uf_party_options.height:GetText())
			LolzenUIcfg.unitframes["uf_party_showroleindicator"] = ns.uf_party_options.cb4:GetChecked()
			LolzenUIcfg.unitframes["uf_party_ri_size"] = tonumber(ns.uf_party_options.ri_size:GetText())
			LolzenUIcfg.unitframes["uf_party_ri_posx"] = tonumber(ns.uf_party_options.ri_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_ri_posy"] = tonumber(ns.uf_party_options.ri_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_party_options.ri_anchor)]
			LolzenUIcfg.unitframes["uf_party_rc_size"] = tonumber(ns.uf_party_options.rc_size:GetText())
			LolzenUIcfg.unitframes["uf_party_rc_posx"] = tonumber(ns.uf_party_options.rc_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_rc_posy"] = tonumber(ns.uf_party_options.rc_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_rc_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_party_options.rc_anchor)]
		end

		ns["uf_party_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_party_enabled"] = true
			LolzenUIcfg.unitframes["uf_party_use_vertical_layout"] = false
			LolzenUIcfg.unitframes["uf_party_posx"] = 0
			LolzenUIcfg.unitframes["uf_party_posy"] = 140
			LolzenUIcfg.unitframes["uf_party_anchor"] = "BOTTOM"
			LolzenUIcfg.unitframes["uf_party_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_party_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_party_hp_font_size"] = 13
			LolzenUIcfg.unitframes["uf_party_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_party_hp_posx"] = 5
			LolzenUIcfg.unitframes["uf_party_hp_posy"] = 0
			LolzenUIcfg.unitframes["uf_party_hp_anchor"] = "LEFT"
			LolzenUIcfg.unitframes["uf_party_width"] = 70
			LolzenUIcfg.unitframes["uf_party_height"] = 19
			LolzenUIcfg.unitframes["uf_party_showroleindicator"] = true
			LolzenUIcfg.unitframes["uf_party_ri_size"] = 16
			LolzenUIcfg.unitframes["uf_party_ri_posx"] = 0
			LolzenUIcfg.unitframes["uf_party_ri_posy"] = 0
			LolzenUIcfg.unitframes["uf_party_ri_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_party_rc_size"] = 16
			LolzenUIcfg.unitframes["uf_party_rc_posx"] = 10
			LolzenUIcfg.unitframes["uf_party_rc_posy"] = 10
			LolzenUIcfg.unitframes["uf_party_rc_anchor"] = "LEFT"
			ReloadUI()
		end

		ns["uf_raid_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_raid_enabled"] = ns.uf_raid_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_raid_posx"] = tonumber(ns.uf_raid_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_raid_posy"] = tonumber(ns.uf_raid_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_raid_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_raid_options.anchor)]
			LolzenUIcfg.unitframes["uf_raid_use_own_hp_font_settings"] = ns.uf_raid_options.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_raid_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_raid_options.hp_font)
			LolzenUIcfg.unitframes["uf_raid_hp_font_size"] = tonumber(ns.uf_raid_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_raid_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_raid_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_raid_hp_posx"] = tonumber(ns.uf_raid_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_raid_hp_posy"] = tonumber(ns.uf_raid_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_raid_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_raid_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_raid_width"] = tonumber(ns.uf_raid_options.width:GetText())
			LolzenUIcfg.unitframes["uf_raid_height"] = tonumber(ns.uf_raid_options.height:GetText())
			LolzenUIcfg.unitframes["uf_raid_showroleindicator"] = ns.uf_raid_options.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_raid_ri_size"] = tonumber(ns.uf_raid_options.ri_size:GetText())
			LolzenUIcfg.unitframes["uf_raid_ri_posx"] = tonumber(ns.uf_raid_options.ri_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_raid_ri_posy"] = tonumber(ns.uf_raid_options.ri_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_raid_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_raid_options.ri_anchor)]
			LolzenUIcfg.unitframes["uf_raid_rc_size"] = tonumber(ns.uf_raid_options.rc_size:GetText())
			LolzenUIcfg.unitframes["uf_raid_rc_posx"] = tonumber(ns.uf_raid_options.rc_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_raid_rc_posy"] = tonumber(ns.uf_raid_options.rc_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_raid_rc_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_raid_options.rc_anchor)]
		end

		ns["uf_raid_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_raid_enabled"] = true
			LolzenUIcfg.unitframes["uf_raid_posx"] = 20
			LolzenUIcfg.unitframes["uf_raid_posy"] = 0
			LolzenUIcfg.unitframes["uf_raid_anchor"] = "LEFT"
			LolzenUIcfg.unitframes["uf_raid_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_raid_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_raid_hp_font_size"] = 13
			LolzenUIcfg.unitframes["uf_raid_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_raid_hp_posx"] = 5
			LolzenUIcfg.unitframes["uf_raid_hp_posy"] = 0
			LolzenUIcfg.unitframes["uf_raid_hp_anchor"] = "LEFT"
			LolzenUIcfg.unitframes["uf_raid_width"] = 50
			LolzenUIcfg.unitframes["uf_raid_height"] = 19
			LolzenUIcfg.unitframes["uf_raid_showroleindicator"] = true
			LolzenUIcfg.unitframes["uf_raid_ri_size"] = 16
			LolzenUIcfg.unitframes["uf_raid_ri_posx"] = 0
			LolzenUIcfg.unitframes["uf_raid_ri_posy"] = 0
			LolzenUIcfg.unitframes["uf_raid_ri_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_raid_rc_size"] = 16
			LolzenUIcfg.unitframes["uf_raid_rc_posx"] = 10
			LolzenUIcfg.unitframes["uf_raid_rc_posy"] = 10
			LolzenUIcfg.unitframes["uf_raid_rc_anchor"] = "LEFT"
			ReloadUI()
		end

		ns["uf_pet_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_pet_posx"] = tonumber(ns.uf_pet_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_posy"] = tonumber(ns.uf_pet_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_pet_options.anchor)]
			LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"] = ns.uf_pet_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_pet_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_pet_options.hp_font)
			LolzenUIcfg.unitframes["uf_pet_hp_font_size"] = tonumber(ns.uf_pet_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_pet_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_pet_hp_posx"] = tonumber(ns.uf_pet_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_posy"] = tonumber(ns.uf_pet_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_pet_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_pet_width"] = tonumber(ns.uf_pet_options.width:GetText())
			LolzenUIcfg.unitframes["uf_pet_height"] = tonumber(ns.uf_pet_options.height:GetText())
		end

		ns["uf_pet_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_pet_posx"] = -300
			LolzenUIcfg.unitframes["uf_pet_posy"] = -177
			LolzenUIcfg.unitframes["uf_pet_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_pet_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_pet_hp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_pet_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_pet_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_pet_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_pet_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_pet_width"] = 120
			LolzenUIcfg.unitframes["uf_pet_height"] = 18
			ReloadUI()
		end

		ns["uf_boss_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_boss_posx"] = tonumber(ns.uf_boss_options.content.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_posy"] = tonumber(ns.uf_boss_options.content.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.anchor)]
			LolzenUIcfg.unitframes["uf_boss_width"] = tonumber(ns.uf_boss_options.content.width:GetText())
			LolzenUIcfg.unitframes["uf_boss_height"] = tonumber(ns.uf_boss_options.content.height:GetText())
			LolzenUIcfg.unitframes["uf_boss_additional_pos"] = ns.picker_growth[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.growth)]
			LolzenUIcfg.unitframes["uf_boss_additional_spacing"] = tonumber(ns.uf_boss_options.content.growth_spacing:GetText())
			LolzenUIcfg.unitframes["uf_boss_show_power"] = ns.uf_boss_options.content.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_boss_use_own_hp_font_settings"] = ns.uf_boss_options.content.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_boss_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_boss_options.content.hp_font)
			LolzenUIcfg.unitframes["uf_boss_hp_font_size"] = tonumber(ns.uf_boss_options.content.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_boss_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_boss_hp_posx"] = tonumber(ns.uf_boss_options.content.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_hp_posy"] = tonumber(ns.uf_boss_options.content.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.hp_anchor)]
			LolzenUIcfg.unitframes["uf_boss_pp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_boss_options.content.pp_font)
			LolzenUIcfg.unitframes["uf_boss_pp_font_size"] = tonumber(ns.uf_boss_options.content.pp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_boss_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.pp_font_flag)]
			LolzenUIcfg.unitframes["uf_boss_pp_posx"] = tonumber(ns.uf_boss_options.content.pp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_pp_posy"] = tonumber(ns.uf_boss_options.content.pp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.pp_anchor)]
			LolzenUIcfg.unitframes["uf_boss_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.pp_anchor2)]
			LolzenUIcfg.unitframes["uf_boss_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.pp_parent)]
			LolzenUIcfg.unitframes["uf_boss_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.aura_type)]
			LolzenUIcfg.unitframes["uf_boss_aura_posx"] = tonumber(ns.uf_boss_options.content.aura_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_aura_posy"] = tonumber(ns.uf_boss_options.content.aura_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.aura_anchor)]
			LolzenUIcfg.unitframes["uf_boss_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.aura_anchor2)]
			LolzenUIcfg.unitframes["uf_boss_aura_maxnum"] = tonumber(ns.uf_boss_options.content.aura_maxnum:GetText())
			LolzenUIcfg.unitframes["uf_boss_aura_spacing"] = tonumber(ns.uf_boss_options.content.aura_spacing:GetText())
			LolzenUIcfg.unitframes["uf_boss_aura_size"] = tonumber(ns.uf_boss_options.content.aura_size:GetText())
			LolzenUIcfg.unitframes["uf_boss_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.aura_growthx)]
			LolzenUIcfg.unitframes["uf_boss_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.aura_growthy)]
			LolzenUIcfg.unitframes["uf_boss_aura_show_only_player"] = ns.uf_boss_options.content.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_boss_aura_desature_nonplayer_auras"] = ns.uf_boss_options.content.cb4:GetChecked()
			LolzenUIcfg.unitframes["uf_boss_cb_color"] = {ns.uf_boss_options.content.cb_color:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_boss_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_alpha)])
			LolzenUIcfg.unitframes["uf_boss_cb_icon_size"] = tonumber(ns.uf_boss_options.content.cb_icon_size:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_icon_posx"] = tonumber(ns.uf_boss_options.content.cb_icon_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_icon_posy"] = tonumber(ns.uf_boss_options.content.cb_icon_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_icon_anchor1)]
			LolzenUIcfg.unitframes["uf_boss_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_icon_anchor2)]
			LolzenUIcfg.unitframes["uf_boss_cb_time_posx"] = tonumber(ns.uf_boss_options.content.cb_time_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_time_posy"] = tonumber(ns.uf_boss_options.content.cb_time_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_time_anchor1)]
			LolzenUIcfg.unitframes["uf_boss_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_time_anchor2)]
			LolzenUIcfg.unitframes["uf_boss_cb_text_posx"] = tonumber(ns.uf_boss_options.content.cb_text_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_text_posy"] = tonumber(ns.uf_boss_options.content.cb_text_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_text_anchor1)]
			LolzenUIcfg.unitframes["uf_boss_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_text_anchor2)]
			LolzenUIcfg.unitframes["uf_boss_cb_font"] = UIDropDownMenu_GetSelectedName(ns.uf_boss_options.content.cb_font)
			LolzenUIcfg.unitframes["uf_boss_cb_font_size"] = tonumber(ns.uf_boss_options.content.cb_font_size:GetText())
			LolzenUIcfg.unitframes["uf_boss_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.content.cb_font_flag)]
			LolzenUIcfg.unitframes["uf_boss_cb_font_color"] = {ns.uf_boss_options.content.cb_font_color:GetVertexColor()}
		end

		ns["uf_boss_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_boss_posx"] = 0
			LolzenUIcfg.unitframes["uf_boss_posy"] = -200
			LolzenUIcfg.unitframes["uf_boss_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_boss_width"] = 160
			LolzenUIcfg.unitframes["uf_boss_height"] = 11
			LolzenUIcfg.unitframes["uf_boss_additional_pos"] = "ABOVE"
			LolzenUIcfg.unitframes["uf_boss_additional_spacing"] = 30
			LolzenUIcfg.unitframes["uf_boss_show_power"] = false
			LolzenUIcfg.unitframes["uf_boss_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_boss_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_boss_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_boss_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_boss_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_boss_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_boss_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_boss_pp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_boss_pp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_boss_pp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_boss_pp_posx"] = 0
			LolzenUIcfg.unitframes["uf_boss_pp_posy"] = 0
			LolzenUIcfg.unitframes["uf_boss_pp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_boss_pp_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_boss_pp_parent"] = "hp"
			LolzenUIcfg.unitframes["uf_boss_aura_show_type"] = "None"
			LolzenUIcfg.unitframes["uf_boss_aura_posx"] = 0
			LolzenUIcfg.unitframes["uf_boss_aura_posy"] = -30
			LolzenUIcfg.unitframes["uf_boss_aura_anchor1"] = "TOP"
			LolzenUIcfg.unitframes["uf_boss_aura_anchor2"] = "BOTTOM"
			LolzenUIcfg.unitframes["uf_boss_aura_maxnum"] = 8
			LolzenUIcfg.unitframes["uf_boss_aura_spacing"] = 4
			LolzenUIcfg.unitframes["uf_boss_aura_size"] = 23
			LolzenUIcfg.unitframes["uf_boss_aura_growth_x"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_boss_aura_growth_y"] = "DOWN"
			LolzenUIcfg.unitframes["uf_boss_aura_show_only_player"] = true
			LolzenUIcfg.unitframes["uf_boss_aura_desature_nonplayer_auras"] = true
			LolzenUIcfg.unitframes["uf_boss_cb_color"] = {0.8, 0, 0}
			LolzenUIcfg.unitframes["uf_boss_cb_alpha"] = 0.2
			LolzenUIcfg.unitframes["uf_boss_cb_icon_size"] = 12
			LolzenUIcfg.unitframes["uf_boss_cb_icon_posx"] = -5
			LolzenUIcfg.unitframes["uf_boss_cb_icon_posy"] = 0
			LolzenUIcfg.unitframes["uf_boss_cb_icon_anchor1"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_boss_cb_icon_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_boss_cb_time_posx"] = -5
			LolzenUIcfg.unitframes["uf_boss_cb_time_posy"] = 1
			LolzenUIcfg.unitframes["uf_boss_cb_time_anchor1"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_boss_cb_time_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_boss_cb_text_posx"] = 2
			LolzenUIcfg.unitframes["uf_boss_cb_text_posy"] = 1
			LolzenUIcfg.unitframes["uf_boss_cb_text_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_boss_cb_text_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_boss_cb_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_boss_cb_font_size"] = 10
			LolzenUIcfg.unitframes["uf_boss_cb_font_flag"] = "OUTLINE"
			LolzenUIcfg.unitframes["uf_boss_cb_font_color"] = {1, 1, 1}
			ReloadUI()
		end

		ns["uf_focus_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_focus_posx"] = tonumber(ns.uf_focus_options.content.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_posy"] = tonumber(ns.uf_focus_options.content.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.anchor)]
			LolzenUIcfg.unitframes["uf_focus_use_own_hp_font_settings"] = ns.uf_focus_options.content.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_focus_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_focus_options.content.hp_font)
			LolzenUIcfg.unitframes["uf_focus_hp_font_size"] = tonumber(ns.uf_focus_options.content.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_focus_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_focus_hp_posx"] = tonumber(ns.uf_focus_options.content.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_hp_posy"] = tonumber(ns.uf_focus_options.content.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.hp_anchor)]
			LolzenUIcfg.unitframes["uf_focus_pp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_focus_options.content.pp_font)
			LolzenUIcfg.unitframes["uf_focus_pp_font_size"] = tonumber(ns.uf_focus_options.content.pp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_focus_pp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.pp_font_flag)]
			LolzenUIcfg.unitframes["uf_focus_pp_posx"] = tonumber(ns.uf_focus_options.content.pp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_pp_posy"] = tonumber(ns.uf_focus_options.content.pp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_pp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.pp_anchor)]
			LolzenUIcfg.unitframes["uf_focus_pp_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.pp_anchor2)]
			LolzenUIcfg.unitframes["uf_focus_pp_parent"] = ns.picker_uf_parent[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.pp_parent)]
			LolzenUIcfg.unitframes["uf_focus_width"] = tonumber(ns.uf_focus_options.content.width:GetText())
			LolzenUIcfg.unitframes["uf_focus_height"] = tonumber(ns.uf_focus_options.content.height:GetText())
			LolzenUIcfg.unitframes["uf_focus_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.aura_type)]
			LolzenUIcfg.unitframes["uf_focus_aura_posx"] = tonumber(ns.uf_focus_options.content.aura_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_aura_posy"] = tonumber(ns.uf_focus_options.content.aura_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.aura_anchor)]
			LolzenUIcfg.unitframes["uf_focus_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.aura_anchor2)]
			LolzenUIcfg.unitframes["uf_focus_aura_maxnum"] = tonumber(ns.uf_focus_options.content.aura_maxnum:GetText())
			LolzenUIcfg.unitframes["uf_focus_aura_spacing"] = tonumber(ns.uf_focus_options.content.aura_spacing:GetText())
			LolzenUIcfg.unitframes["uf_focus_aura_size"] = tonumber(ns.uf_focus_options.content.aura_size:GetText())
			LolzenUIcfg.unitframes["uf_focus_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.aura_growthx)]
			LolzenUIcfg.unitframes["uf_focus_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.aura_growthy)]
			LolzenUIcfg.unitframes["uf_focus_aura_show_only_player"] = ns.uf_focus_options.content.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_focus_aura_desature_nonplayer_auras"] = ns.uf_focus_options.content.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_focus_cb_color"] = {ns.uf_focus_options.content.cb_color:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_focus_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_alpha)])
			LolzenUIcfg.unitframes["uf_focus_cb_icon_size"] = tonumber(ns.uf_focus_options.content.cb_icon_size:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_icon_posx"] = tonumber(ns.uf_focus_options.content.cb_icon_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_icon_posy"] = tonumber(ns.uf_focus_options.content.cb_icon_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_icon_anchor1)]
			LolzenUIcfg.unitframes["uf_focus_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_icon_anchor2)]
			LolzenUIcfg.unitframes["uf_focus_cb_time_posx"] = tonumber(ns.uf_focus_options.content.cb_time_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_time_posy"] = tonumber(ns.uf_focus_options.content.cb_time_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_time_anchor1)]
			LolzenUIcfg.unitframes["uf_focus_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_time_anchor2)]
			LolzenUIcfg.unitframes["uf_focus_cb_text_posx"] = tonumber(ns.uf_focus_options.content.cb_text_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_text_posy"] = tonumber(ns.uf_focus_options.content.cb_text_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_text_anchor1)]
			LolzenUIcfg.unitframes["uf_focus_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_text_anchor2)]
			LolzenUIcfg.unitframes["uf_focus_cb_font"] = UIDropDownMenu_GetSelectedName(ns.uf_focus_options.content.cb_font)
			LolzenUIcfg.unitframes["uf_focus_cb_font_size"] = tonumber(ns.uf_focus_options.content.cb_font_size:GetText())
			LolzenUIcfg.unitframes["uf_focus_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_focus_options.content.cb_font_flag)]
			LolzenUIcfg.unitframes["uf_focus_cb_font_color"] = {ns.uf_focus_options.content.cb_font_color:GetVertexColor()}
		end

		ns["uf_focus_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_focus_posx"] = -250
			LolzenUIcfg.unitframes["uf_focus_posy"] = -230
			LolzenUIcfg.unitframes["uf_focus_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_focus_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_focus_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_focus_hp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_focus_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_focus_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_focus_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_focus_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_focus_pp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_focus_pp_font_size"] = 16
			LolzenUIcfg.unitframes["uf_focus_pp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_focus_pp_posx"] = 0
			LolzenUIcfg.unitframes["uf_focus_pp_posy"] = 0
			LolzenUIcfg.unitframes["uf_focus_pp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_focus_pp_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_focus_pp_parent"] = "hp"
			LolzenUIcfg.unitframes["uf_focus_width"] = 220
			LolzenUIcfg.unitframes["uf_focus_height"] = 11
			LolzenUIcfg.unitframes["uf_focus_aura_show_type"] = "Both"
			LolzenUIcfg.unitframes["uf_focus_aura_posx"] = 0
			LolzenUIcfg.unitframes["uf_focus_aura_posy"] = -30
			LolzenUIcfg.unitframes["uf_focus_aura_anchor1"] = "TOP"
			LolzenUIcfg.unitframes["uf_focus_aura_anchor2"] = "BOTTOM"
			LolzenUIcfg.unitframes["uf_focus_aura_maxnum"] = 8
			LolzenUIcfg.unitframes["uf_focus_aura_spacing"] = 4
			LolzenUIcfg.unitframes["uf_focus_aura_size"] = 23
			LolzenUIcfg.unitframes["uf_focus_aura_growth_x"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_focus_aura_growth_y"] = "DOWN"
			LolzenUIcfg.unitframes["uf_focus_aura_show_only_player"] = false
			LolzenUIcfg.unitframes["uf_focus_aura_desature_nonplayer_auras"] = false
			LolzenUIcfg.unitframes["uf_focus_cb_color"] = {0.8, 0, 0}
			LolzenUIcfg.unitframes["uf_focus_cb_alpha"] = 0.2
			LolzenUIcfg.unitframes["uf_focus_cb_icon_size"] = 12
			LolzenUIcfg.unitframes["uf_focus_cb_icon_posx"] = -5
			LolzenUIcfg.unitframes["uf_focus_cb_icon_posy"] = 0
			LolzenUIcfg.unitframes["uf_focus_cb_icon_anchor1"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_focus_cb_icon_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_focus_cb_time_posx"] = -5
			LolzenUIcfg.unitframes["uf_focus_cb_time_posy"] = 1
			LolzenUIcfg.unitframes["uf_focus_cb_time_anchor1"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_focus_cb_time_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_focus_cb_text_posx"] = 2
			LolzenUIcfg.unitframes["uf_focus_cb_text_posy"] = 1
			LolzenUIcfg.unitframes["uf_focus_cb_text_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_focus_cb_text_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_focus_cb_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_focus_cb_font_size"] = 10
			LolzenUIcfg.unitframes["uf_focus_cb_font_flag"] = "OUTLINE"
			LolzenUIcfg.unitframes["uf_focus_cb_font_color"] = {1, 1, 1}
			ReloadUI()
		end

		ns["uf_powercolor_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_power_colors"]["0"] = {ns.uf_powercolor_options.mana:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["1"] = {ns.uf_powercolor_options.rage:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["2"] = {ns.uf_powercolor_options.focus:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["3"] = {ns.uf_powercolor_options.energy:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["4"] = {ns.uf_powercolor_options.cp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["5"] = {ns.uf_powercolor_options.runes:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["6"] = {ns.uf_powercolor_options.rp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["7"] = {ns.uf_powercolor_options.soulshards:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["8"] = {ns.uf_powercolor_options.lp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["9"] = {ns.uf_powercolor_options.hp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["11"] = {ns.uf_powercolor_options.maelstrom:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["12"] = {ns.uf_powercolor_options.chi:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["13"] = {ns.uf_powercolor_options.insanity:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["16"] = {ns.uf_powercolor_options.ac:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["17"] = {ns.uf_powercolor_options.fury:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["18"] = {ns.uf_powercolor_options.pain:GetVertexColor()}
		end
		
		ns["uf_powercolor_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_power_colors"]["0"] = {48/255, 113/255, 191/255}
			LolzenUIcfg.unitframes["uf_power_colors"]["1"] = {1, 0, 0}
			LolzenUIcfg.unitframes["uf_power_colors"]["2"] = {255/255, 178/255, 0}
			LolzenUIcfg.unitframes["uf_power_colors"]["3"] = {1.00, 1.00, 34/255}
			LolzenUIcfg.unitframes["uf_power_colors"]["4"] = {1.00, 0.96, 0.41}
			LolzenUIcfg.unitframes["uf_power_colors"]["5"] = {0.50, 0.50, 0.50}
			LolzenUIcfg.unitframes["uf_power_colors"]["6"] = {0.00, 0.82, 1.00}
			LolzenUIcfg.unitframes["uf_power_colors"]["7"] = {0.50, 0.32, 0.55}
			LolzenUIcfg.unitframes["uf_power_colors"]["8"] = {0.30, 0.52, 0.90}
			LolzenUIcfg.unitframes["uf_power_colors"]["9"] = {0.95, 0.90, 0.60}
			LolzenUIcfg.unitframes["uf_power_colors"]["11"] = {51/255, 181/255, 229/225}
			LolzenUIcfg.unitframes["uf_power_colors"]["12"] = {0.71, 1.00, 0.92}
			LolzenUIcfg.unitframes["uf_power_colors"]["13"] = {0.84, 0.1, 0.87}
			LolzenUIcfg.unitframes["uf_power_colors"]["16"] = {0.10, 0.10, 0.98}
			LolzenUIcfg.unitframes["uf_power_colors"]["17"] = {0.788, 0.259, 0.992}
			LolzenUIcfg.unitframes["uf_power_colors"]["18"] = {1.00, 0.61, 0.00}
			ReloadUI()
		end
	end
end)