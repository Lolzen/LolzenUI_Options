--// options for unitframes //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		ns.unitframes.title = ns.createTitle("unitframes")

		ns.unitframes.about = ns.createDescription("unitframes", "General Unitframe Options")
		ns.unitframes.about:SetPoint("TOPLEFT", ns.unitframes.title, "BOTTOMLEFT", 0, -8)

		ns.unitframes.cb1 = ns.createCheckBox("unitframes", "uf_hp_perc", "|cff5599ffuse hp percentage|r", LolzenUIcfg.unitframes["uf_use_hp_percent"])
		ns.unitframes.cb1:SetPoint("TOPLEFT", ns.unitframes.about, "BOTTOMLEFT", 0, -20)

		ns.unitframes.cb2 = ns.createCheckBox("unitframes", "uf_siVal", "|cff5599ffuse short values (34m5, 3k2, etc)|r", LolzenUIcfg.unitframes["uf_use_sivalue"])
		ns.unitframes.cb2:SetPoint("TOPLEFT", ns.unitframes.cb1, "BOTTOMLEFT", 0, -0)

		ns.unitframes.cb3 = ns.createCheckBox("unitframes", "uf_siVal_dot", "|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r", LolzenUIcfg.unitframes["uf_use_dot_format"])
		ns.unitframes.cb3:SetPoint("TOPLEFT", ns.unitframes.cb2, "BOTTOMLEFT", 0, -0)

		ns.unitframes.cb1:SetScript("OnClick", function(self)
			if ns.unitframes.cb1:GetChecked() == true then
				ns.unitframes.cb2:Disable()
				ns.unitframes.cb3:Disable()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
				uf_siVal_dotText:SetText("|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r |cffff5555disable hp percentage for this option|r")
			else
				ns.unitframes.cb2:Enable()
				ns.unitframes.cb3:Enable()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r")
				uf_siVal_dotText:SetText("|cff5599ffuse dot divider for short values (34.5m, 3.2k, etc)|r")
			end
		end)

		if ns.unitframes.cb1:GetChecked() == true then
			ns.unitframes.cb2:Disable()
			uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
		else
			ns.unitframes.cb2:Enable()
		end

		ns.unitframes.texture_text = ns.createFonstring("unitframes", "Texture:")
		ns.unitframes.texture_text:SetPoint("TOPLEFT", ns.unitframes.cb3, "BOTTOMLEFT", 0, -15)

		ns.unitframes.texture = ns.createPicker("unitframes", "statusbar", "uf_statusbar", 120, LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.texture:SetPoint("LEFT", ns.unitframes.texture_text, "RIGHT", -10, -3)

		ns.unitframes.border_text = ns.createFonstring("unitframes", "Border:")
		ns.unitframes.border_text:SetPoint("LEFT", ns.unitframes.texture, "RIGHT", -5, 3)

		ns.unitframes.border = ns.createPicker("unitframes", "border", "uf_border", 120, LolzenUIcfg.unitframes["uf_border"])
		ns.unitframes.border:SetPoint("LEFT", ns.unitframes.border_text, "RIGHT", -10, -3)

		ns.unitframes.header1 = ns.createHeader("unitframes", "Raidmark indicator")
		ns.unitframes.header1:SetPoint("TOPLEFT", ns.unitframes.texture_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.rt_size_text = ns.createFonstring("unitframes", "Size:")
		ns.unitframes.rt_size_text:SetPoint("TOPLEFT", ns.unitframes.header1, "BOTTOMLEFT", 0, -10)

		ns.unitframes.rt_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_size"])
		ns.unitframes.rt_size:SetPoint("LEFT", ns.unitframes.rt_size_text, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_x_text = ns.createFonstring("unitframes", "PosX:")
		ns.unitframes.rt_pos_x_text:SetPoint("LEFT", ns.unitframes.rt_size, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_posx"])
		ns.unitframes.rt_pos_x:SetPoint("LEFT", ns.unitframes.rt_pos_x_text, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_y_text = ns.createFonstring("unitframes", "PosY:")
		ns.unitframes.rt_pos_y_text:SetPoint("LEFT", ns.unitframes.rt_pos_x, "RIGHT", 10, 0)

		ns.unitframes.rt_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_posy"])
		ns.unitframes.rt_pos_y:SetPoint("LEFT", ns.unitframes.rt_pos_y_text, "RIGHT", 10, 0)

		ns.unitframes.rt_anchor_text = ns.createFonstring("unitframes", "Anchor:")
		ns.unitframes.rt_anchor_text:SetPoint("LEFT", ns.unitframes.rt_pos_y, "RIGHT", 10, 0)

		ns.unitframes.rt_anchor = ns.createPicker("unitframes", "anchor", "uf_rt_anchor", 110, LolzenUIcfg.unitframes["uf_ri_anchor"])
		ns.unitframes.rt_anchor:SetPoint("LEFT", ns.unitframes.rt_anchor_text, "RIGHT", -10, -3)

		ns.unitframes.header2 = ns.createHeader("unitframes", "Lead indicator")
		ns.unitframes.header2:SetPoint("TOPLEFT", ns.unitframes.rt_size_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.lead_size_text = ns.createFonstring("unitframes", "Size:")
		ns.unitframes.lead_size_text:SetPoint("TOPLEFT", ns.unitframes.header2, "BOTTOMLEFT", 0, -10)

		ns.unitframes.lead_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_size"])
		ns.unitframes.lead_size:SetPoint("LEFT", ns.unitframes.lead_size_text, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_x_text = ns.createFonstring("unitframes", "PosX:")
		ns.unitframes.lead_pos_x_text:SetPoint("LEFT", ns.unitframes.lead_size, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_posx"])
		ns.unitframes.lead_pos_x:SetPoint("LEFT", ns.unitframes.lead_pos_x_text, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_y_text = ns.createFonstring("unitframes", "PosY:")
		ns.unitframes.lead_pos_y_text:SetPoint("LEFT", ns.unitframes.lead_pos_x, "RIGHT", 10, 0)

		ns.unitframes.lead_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_posy"])
		ns.unitframes.lead_pos_y:SetPoint("LEFT", ns.unitframes.lead_pos_y_text, "RIGHT", 10, 0)

		ns.unitframes.lead_anchor_text = ns.createFonstring("unitframes", "Anchor:")
		ns.unitframes.lead_anchor_text:SetPoint("LEFT", ns.unitframes.lead_pos_y, "RIGHT", 10, 0)

		ns.unitframes.lead_anchor = ns.createPicker("unitframes", "anchor", "uf_lead_anchor", 110, LolzenUIcfg.unitframes["uf_lead_anchor"])
		ns.unitframes.lead_anchor:SetPoint("LEFT", ns.unitframes.lead_anchor_text, "RIGHT", -10, -3)

		ns.unitframes.header3 = ns.createHeader("unitframes", "Fadeout")
		ns.unitframes.header3:SetPoint("TOPLEFT", ns.unitframes.lead_size_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.cb4 = ns.createCheckBox("unitframes", "uf_fadeout", "|cff5599fffadeout out of reach unitframes|r", LolzenUIcfg.unitframes["uf_fade_outofreach"])
		ns.unitframes.cb4:SetPoint("TOPLEFT", ns.unitframes.header3, "BOTTOMLEFT", 0, -8)

		ns.unitframes.fadeout_alpha_text = ns.createFonstring("unitframes", "out of reach alpha (party/raid members):")
		ns.unitframes.fadeout_alpha_text:SetPoint("TOPLEFT", ns.unitframes.cb4, "BOTTOMLEFT", 0, -8)

		ns.unitframes.fadeout_alpha = ns.createPicker("unitframes", "alpha", "uf_fadout_alpha", 45, LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"])
		ns.unitframes.fadeout_alpha:SetPoint("LEFT", ns.unitframes.fadeout_alpha_text, "RIGHT", -10, -3)

		ns.unitframes.header4 = ns.createHeader("unitframes", "General Healthpoints Font options (can be overwritten per unit specific settings)")
		ns.unitframes.header4:SetPoint("TOPLEFT", ns.unitframes.fadeout_alpha_text, "BOTTOMLEFT", 0, -30)

		ns.unitframes.general_hp_pos_x_text = ns.createFonstring("unitframes", "PosX:")
		ns.unitframes.general_hp_pos_x_text:SetPoint("TOPLEFT", ns.unitframes.header4, "BOTTOMLEFT", 0, -10)

		ns.unitframes.general_hp_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_general_hp_posx"])
		ns.unitframes.general_hp_pos_x:SetPoint("LEFT", ns.unitframes.general_hp_pos_x_text, "RIGHT", 10, 0)

		ns.unitframes.general_hp_pos_y_text = ns.createFonstring("unitframes", "PosY:")
		ns.unitframes.general_hp_pos_y_text:SetPoint("LEFT", ns.unitframes.general_hp_pos_x, "RIGHT", 5, 0)

		ns.unitframes.general_hp_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_general_hp_posy"])
		ns.unitframes.general_hp_pos_y:SetPoint("LEFT", ns.unitframes.general_hp_pos_y_text, "RIGHT", 10, 0)

		ns.unitframes.general_hp_anchor_text = ns.createFonstring("unitframes", "Anchor:")
		ns.unitframes.general_hp_anchor_text:SetPoint("LEFT", ns.unitframes.general_hp_pos_y, "RIGHT", 5, 0)

		ns.unitframes.general_hp_anchor = ns.createPicker("unitframes", "anchor", "uf_general_hp_anchor", 110, LolzenUIcfg.unitframes["uf_general_hp_anchor"])
		ns.unitframes.general_hp_anchor:SetPoint("LEFT", ns.unitframes.general_hp_anchor_text, "RIGHT", -10, -3)

		ns.unitframes.general_hp_font_text = ns.createFonstring("unitframes", "Font:")
		ns.unitframes.general_hp_font_text:SetPoint("TOPLEFT", ns.unitframes.general_hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.unitframes.general_hp_font = ns.createPicker("unitframes", "font", "uf_general_hp_font", 120, LolzenUIcfg.unitframes["uf_general_hp_font"])
		ns.unitframes.general_hp_font:SetPoint("LEFT", ns.unitframes.general_hp_font_text, "RIGHT", -10, -3)

		ns.unitframes.general_hp_font_size_text = ns.createFonstring("unitframes", "Font size:")
		ns.unitframes.general_hp_font_size_text:SetPoint("LEFT", ns.unitframes.general_hp_font, "RIGHT", -5, 3)

		ns.unitframes.general_hp_font_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_general_hp_font_size"])
		ns.unitframes.general_hp_font_size:SetPoint("LEFT", ns.unitframes.general_hp_font_size_text, "RIGHT", 10, 0)

		ns.unitframes.general_hp_font_flag_text = ns.createFonstring("unitframes", "Font flag:")
		ns.unitframes.general_hp_font_flag_text:SetPoint("LEFT", ns.unitframes.general_hp_font_size, "RIGHT", 10, 0)

		ns.unitframes.general_hp_font_flag = ns.createPicker("unitframes", "flag", "uf_general_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_general_hp_font_flag"])
		ns.unitframes.general_hp_font_flag:SetPoint("LEFT", ns.unitframes.general_hp_font_flag_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Player // --
		ns.uf_player_options = CreateFrame("Frame", "unitframe_playerpanel", ns["unitframes"])
		ns.uf_player_options.name = "   Player"
		ns.uf_player_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_player_options)

		ns.uf_player_options.title = ns.uf_player_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_player_options.title:SetPoint("TOPLEFT", ns.uf_player_options, 16, -16)
		ns.uf_player_options.title:SetText("|cff5599ffUnitframes module: Player Options|r")

		ns.uf_player_options.pos_x_text = ns.createFonstring("uf_player_options", "PosX:")
		ns.uf_player_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_player_options.pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_posx"])
		ns.uf_player_options.pos_x:SetPoint("LEFT", ns.uf_player_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.pos_y_text = ns.createFonstring("uf_player_options", "PosY:")
		ns.uf_player_options.pos_y_text:SetPoint("LEFT", ns.uf_player_options.pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_posy"])
		ns.uf_player_options.pos_y:SetPoint("LEFT", ns.uf_player_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.anchor_text = ns.createFonstring("uf_player_options", "Anchor:")
		ns.uf_player_options.anchor_text:SetPoint("LEFT", ns.uf_player_options.pos_y, "RIGHT", 5, 0)

		ns.uf_player_options.anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_anchor", 110, LolzenUIcfg.unitframes["uf_player_anchor"])
		ns.uf_player_options.anchor:SetPoint("LEFT", ns.uf_player_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_player_options.width_text = ns.createFonstring("uf_player_options", "Width:")
		ns.uf_player_options.width_text:SetPoint("TOPLEFT", ns.uf_player_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_player_options.width = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes["uf_player_width"])
		ns.uf_player_options.width:SetPoint("LEFT", ns.uf_player_options.width_text, "RIGHT", 10, 0)

		ns.uf_player_options.height_text = ns.createFonstring("uf_player_options", "Height:")
		ns.uf_player_options.height_text:SetPoint("LEFT", ns.uf_player_options.width, "RIGHT", 10, 0)

		ns.uf_player_options.height = ns.createInputbox("uf_player_options", 40, 20, LolzenUIcfg.unitframes["uf_player_height"])
		ns.uf_player_options.height:SetPoint("LEFT", ns.uf_player_options.height_text, "RIGHT", 10, 0)

		ns.uf_player_options.header1 = ns.createHeader("uf_player_options", "Healthpoints")
		ns.uf_player_options.header1:SetPoint("TOPLEFT", ns.uf_player_options.width_text, 0, -30)

		ns.uf_player_options.cb1 = ns.createCheckBox("uf_player_options", "uf_player_use_custom_font_hp", "|cff5599ffoverwrite the general font options for player healthpoints|r", LolzenUIcfg.unitframes["uf_player_use_own_hp_font_settings"])
		ns.uf_player_options.cb1:SetPoint("TOPLEFT", ns.uf_player_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_player_options.hp_pos_x_text = ns.createFonstring("uf_player_options", "PosX:")
		ns.uf_player_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_player_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_player_options.hp_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_posx"])
		ns.uf_player_options.hp_pos_x:SetPoint("LEFT", ns.uf_player_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.hp_pos_y_text = ns.createFonstring("uf_player_options", "PosY:")
		ns.uf_player_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_player_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.hp_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_posy"])
		ns.uf_player_options.hp_pos_y:SetPoint("LEFT", ns.uf_player_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.hp_anchor_text = ns.createFonstring("uf_player_options", "Anchor:")
		ns.uf_player_options.hp_anchor_text:SetPoint("LEFT", ns.uf_player_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_player_options.hp_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_hp_anchor", 110, LolzenUIcfg.unitframes["uf_player_hp_anchor"])
		ns.uf_player_options.hp_anchor:SetPoint("LEFT", ns.uf_player_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_player_options.hp_font_text = ns.createFonstring("uf_player_options", "Font:")
		ns.uf_player_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_player_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_player_options.hp_font = ns.createPicker("uf_player_options", "font", "uf_player_hp_font", 120, LolzenUIcfg.unitframes["uf_player_hp_font"])
		ns.uf_player_options.hp_font:SetPoint("LEFT", ns.uf_player_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_player_options.hp_font_size_text = ns.createFonstring("uf_player_options", "Font size:")
		ns.uf_player_options.hp_font_size_text:SetPoint("LEFT", ns.uf_player_options.hp_font, "RIGHT", -5, 3)

		ns.uf_player_options.hp_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_font_size"])
		ns.uf_player_options.hp_font_size:SetPoint("LEFT", ns.uf_player_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_player_options.hp_font_flag_text = ns.createFonstring("uf_player_options", "Font flag:")
		ns.uf_player_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_player_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_player_options.hp_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_player_hp_font_flag"])
		ns.uf_player_options.hp_font_flag:SetPoint("LEFT", ns.uf_player_options.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_player_options.header2 = ns.createHeader("uf_player_options", "Class Power & Runes")
		ns.uf_player_options.header2:SetPoint("TOPLEFT", ns.uf_player_options.hp_font_text, 0, -30)

		ns.uf_player_options.classpower_anchor1_text = ns.createFonstring("uf_player_options", "Anchor1:")
		ns.uf_player_options.classpower_anchor1_text:SetPoint("TOPLEFT", ns.uf_player_options.header2, "BOTTOMLEFT", 0, -13)

		ns.uf_player_options.classpower_anchor1 = ns.createPicker("uf_player_options", "anchor", "uf_player_classpower_anchor1", 110, LolzenUIcfg.unitframes["uf_player_classpower_anchor1"])
		ns.uf_player_options.classpower_anchor1:SetPoint("LEFT", ns.uf_player_options.classpower_anchor1_text, "RIGHT", -10, -3)

		ns.uf_player_options.classpower_anchor2_text = ns.createFonstring("uf_player_options", "Anchor2:")
		ns.uf_player_options.classpower_anchor2_text:SetPoint("LEFT", ns.uf_player_options.classpower_anchor1, "RIGHT", -5, 3)

		ns.uf_player_options.classpower_anchor2 = ns.createPicker("uf_player_options", "anchor", "uf_player_classpower_anchor2", 110, LolzenUIcfg.unitframes["uf_player_classpower_anchor2"])
		ns.uf_player_options.classpower_anchor2:SetPoint("LEFT", ns.uf_player_options.classpower_anchor2_text, "RIGHT", -10, -3)

		ns.uf_player_options.classpower_pos_x_text = ns.createFonstring("uf_player_options", "PosX:")
		ns.uf_player_options.classpower_pos_x_text:SetPoint("LEFT", ns.uf_player_options.classpower_anchor2, "RIGHT", -5, 3)

		ns.uf_player_options.classpower_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_classpower_posx"])
		ns.uf_player_options.classpower_pos_x:SetPoint("LEFT", ns.uf_player_options.classpower_pos_x_text, "RIGHT", 10, 0)

		ns.uf_player_options.classpower_pos_y_text = ns.createFonstring("uf_player_options", "PosY:")
		ns.uf_player_options.classpower_pos_y_text:SetPoint("LEFT", ns.uf_player_options.classpower_pos_x, "RIGHT", 5, 0)

		ns.uf_player_options.classpower_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_classpower_posy"])
		ns.uf_player_options.classpower_pos_y:SetPoint("LEFT", ns.uf_player_options.classpower_pos_y_text, "RIGHT", 10, 0)

		ns.uf_player_options.classpower_border_text = ns.createFonstring("uf_player_options", "Border:")
		ns.uf_player_options.classpower_border_text:SetPoint("TOPLEFT", ns.uf_player_options.classpower_anchor1_text, "BOTTOMLEFT", 0, -15)

		ns.uf_player_options.classpower_border = ns.createPicker("uf_player_options", "border", "uf_player_classbar_border", 120, LolzenUIcfg.unitframes["uf_player_classpower_border"])
		ns.uf_player_options.classpower_border:SetPoint("LEFT", ns.uf_player_options.classpower_border_text, "RIGHT", -10, -3)

		ns.uf_player_options.classpower_spacing_text = ns.createFonstring("uf_player_options", "Spacing:")
		ns.uf_player_options.classpower_spacing_text:SetPoint("LEFT", ns.uf_player_options.classpower_border, "RIGHT", -5, 3)

		ns.uf_player_options.classpower_spacing = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_classpower_spacing"])
		ns.uf_player_options.classpower_spacing:SetPoint("LEFT", ns.uf_player_options.classpower_spacing_text, "RIGHT", 10, 0)

		-- // Create a subcategory panel for Target // --
		ns.uf_target_options = CreateFrame("Frame", "unitframe_targetpanel", ns["unitframes"])
		ns.uf_target_options.name = "   Target"
		ns.uf_target_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_target_options)

		ns.uf_target_options.title = ns.uf_target_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_target_options.title:SetPoint("TOPLEFT", ns.uf_target_options, 16, -16)
		ns.uf_target_options.title:SetText("|cff5599ffUnitframes module: Target Options|r")

		ns.uf_target_options.pos_x_text = ns.createFonstring("uf_target_options", "PosX:")
		ns.uf_target_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_target_options.pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_posx"])
		ns.uf_target_options.pos_x:SetPoint("LEFT", ns.uf_target_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.pos_y_text = ns.createFonstring("uf_target_options", "PosY:")
		ns.uf_target_options.pos_y_text:SetPoint("LEFT", ns.uf_target_options.pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_posy"])
		ns.uf_target_options.pos_y:SetPoint("LEFT", ns.uf_target_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.anchor_text = ns.createFonstring("uf_target_options", "Anchor:")
		ns.uf_target_options.anchor_text:SetPoint("LEFT", ns.uf_target_options.pos_y, "RIGHT", 5, 0)

		ns.uf_target_options.anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_anchor", 110, LolzenUIcfg.unitframes["uf_target_anchor"])
		ns.uf_target_options.anchor:SetPoint("LEFT", ns.uf_target_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_target_options.width_text = ns.createFonstring("uf_target_options", "Width:")
		ns.uf_target_options.width_text:SetPoint("TOPLEFT", ns.uf_target_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_target_options.width = ns.createInputbox("uf_target_options", 40, 20, LolzenUIcfg.unitframes["uf_target_width"])
		ns.uf_target_options.width:SetPoint("LEFT", ns.uf_target_options.width_text, "RIGHT", 10, 0)

		ns.uf_target_options.height_text = ns.createFonstring("uf_target_options", "Height:")
		ns.uf_target_options.height_text:SetPoint("LEFT", ns.uf_target_options.width, "RIGHT", 10, 0)

		ns.uf_target_options.height = ns.createInputbox("uf_target_options", 40, 20, LolzenUIcfg.unitframes["uf_target_height"])
		ns.uf_target_options.height:SetPoint("LEFT", ns.uf_target_options.height_text, "RIGHT", 10, 0)

		ns.uf_target_options.header1 = ns.createHeader("uf_target_options", "Healthpoints")
		ns.uf_target_options.header1:SetPoint("TOPLEFT", ns.uf_target_options.width_text, 0, -30)

		ns.uf_target_options.cb1 = ns.createCheckBox("uf_target_options", "uf_target_use_custom_font_hp", "|cff5599ffoverwrite the general font options for target healthpoints|r", LolzenUIcfg.unitframes["uf_target_use_own_hp_font_settings"])
		ns.uf_target_options.cb1:SetPoint("TOPLEFT", ns.uf_target_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.hp_pos_x_text = ns.createFonstring("uf_target_options", "PosX:")
		ns.uf_target_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_target_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_target_options.hp_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_posx"])
		ns.uf_target_options.hp_pos_x:SetPoint("LEFT", ns.uf_target_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_target_options.hp_pos_y_text = ns.createFonstring("uf_target_options", "PosY:")
		ns.uf_target_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_target_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_target_options.hp_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_posy"])
		ns.uf_target_options.hp_pos_y:SetPoint("LEFT", ns.uf_target_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_target_options.hp_anchor_text = ns.createFonstring("uf_target_options", "Anchor:")
		ns.uf_target_options.hp_anchor_text:SetPoint("LEFT", ns.uf_target_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_target_options.hp_anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_hp_anchor", 110, LolzenUIcfg.unitframes["uf_target_hp_anchor"])
		ns.uf_target_options.hp_anchor:SetPoint("LEFT", ns.uf_target_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_target_options.hp_font_text = ns.createFonstring("uf_target_options", "Font:")
		ns.uf_target_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_target_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_target_options.hp_font = ns.createPicker("uf_target_options", "font", "uf_target_hp_font", 120, LolzenUIcfg.unitframes["uf_target_hp_font"])
		ns.uf_target_options.hp_font:SetPoint("LEFT", ns.uf_target_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_target_options.hp_font_size_text = ns.createFonstring("uf_target_options", "Font size:")
		ns.uf_target_options.hp_font_size_text:SetPoint("LEFT", ns.uf_target_options.hp_font, "RIGHT", -5, 3)

		ns.uf_target_options.hp_font_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_font_size"])
		ns.uf_target_options.hp_font_size:SetPoint("LEFT", ns.uf_target_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_target_options.hp_font_flag_text = ns.createFonstring("uf_target_options", "Font flag:")
		ns.uf_target_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_target_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_target_options.hp_font_flag = ns.createPicker("uf_target_options", "flag", "uf_target_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_target_hp_font_flag"])
		ns.uf_target_options.hp_font_flag:SetPoint("LEFT", ns.uf_target_options.hp_font_flag_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Targettarget // --
		ns.uf_targettarget_options = CreateFrame("Frame", "unitframe_targettargetpanel", ns["unitframes"])
		ns.uf_targettarget_options.name = "   Targettarget"
		ns.uf_targettarget_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_targettarget_options)

		ns.uf_targettarget_options.title = ns.uf_targettarget_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_targettarget_options.title:SetPoint("TOPLEFT", ns.uf_targettarget_options, 16, -16)
		ns.uf_targettarget_options.title:SetText("|cff5599ffUnitframes module: Targettarget Options|r")

		ns.uf_targettarget_options.pos_x_text = ns.createFonstring("uf_targettarget_options", "PosX:")
		ns.uf_targettarget_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_targettarget_options.pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_posx"])
		ns.uf_targettarget_options.pos_x:SetPoint("LEFT", ns.uf_targettarget_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.pos_y_text = ns.createFonstring("uf_targettarget_options", "PosY:")
		ns.uf_targettarget_options.pos_y_text:SetPoint("LEFT", ns.uf_targettarget_options.pos_x, "RIGHT", 5, 0)

		ns.uf_targettarget_options.pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_posy"])
		ns.uf_targettarget_options.pos_y:SetPoint("LEFT", ns.uf_targettarget_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.anchor_text = ns.createFonstring("uf_targettarget_options", "Anchor:")
		ns.uf_targettarget_options.anchor_text:SetPoint("LEFT", ns.uf_targettarget_options.pos_y, "RIGHT", 5, 0)

		ns.uf_targettarget_options.anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_anchor", 110, LolzenUIcfg.unitframes["uf_targettarget_anchor"])
		ns.uf_targettarget_options.anchor:SetPoint("LEFT", ns.uf_targettarget_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_targettarget_options.width_text = ns.createFonstring("uf_targettarget_options", "Width:")
		ns.uf_targettarget_options.width_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_targettarget_options.width = ns.createInputbox("uf_targettarget_options", 40, 20, LolzenUIcfg.unitframes["uf_targettarget_width"])
		ns.uf_targettarget_options.width:SetPoint("LEFT", ns.uf_targettarget_options.width_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.height_text = ns.createFonstring("uf_targettarget_options", "Height:")
		ns.uf_targettarget_options.height_text:SetPoint("LEFT", ns.uf_targettarget_options.width, "RIGHT", 10, 0)

		ns.uf_targettarget_options.height = ns.createInputbox("uf_targettarget_options", 40, 20, LolzenUIcfg.unitframes["uf_targettarget_height"])
		ns.uf_targettarget_options.height:SetPoint("LEFT", ns.uf_targettarget_options.height_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.header1 = ns.createHeader("uf_targettarget_options", "Healthpoints")
		ns.uf_targettarget_options.header1:SetPoint("TOPLEFT", ns.uf_targettarget_options.width_text, 0, -30)

		ns.uf_targettarget_options.cb1 = ns.createCheckBox("uf_targettarget_options", "uf_targettarget_use_custom_font_hp", "|cff5599ffoverwrite the general font options for targettarget healthpoints|r", LolzenUIcfg.unitframes["uf_targettarget_use_own_hp_font_settings"])
		ns.uf_targettarget_options.cb1:SetPoint("TOPLEFT", ns.uf_targettarget_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_targettarget_options.hp_pos_x_text = ns.createFonstring("uf_targettarget_options", "PosX:")
		ns.uf_targettarget_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_targettarget_options.hp_pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_posx"])
		ns.uf_targettarget_options.hp_pos_x:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_pos_y_text = ns.createFonstring("uf_targettarget_options", "PosY:")
		ns.uf_targettarget_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_targettarget_options.hp_pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_posy"])
		ns.uf_targettarget_options.hp_pos_y:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_anchor_text = ns.createFonstring("uf_targettarget_options", "Anchor:")
		ns.uf_targettarget_options.hp_anchor_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_targettarget_options.hp_anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_hp_anchor", 110, LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"])
		ns.uf_targettarget_options.hp_anchor:SetPoint("LEFT", ns.uf_targettarget_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_targettarget_options.hp_font_text = ns.createFonstring("uf_targettarget_options", "Font:")
		ns.uf_targettarget_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_targettarget_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_targettarget_options.hp_font = ns.createPicker("uf_targettarget_options", "font", "uf_targettarget_hp_font", 120, LolzenUIcfg.unitframes["uf_targettarget_hp_font"])
		ns.uf_targettarget_options.hp_font:SetPoint("LEFT", ns.uf_targettarget_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_targettarget_options.hp_font_size_text = ns.createFonstring("uf_targettarget_options", "Font size:")
		ns.uf_targettarget_options.hp_font_size_text:SetPoint("LEFT", ns.uf_targettarget_options.hp_font, "RIGHT", -5, 3)

		ns.uf_targettarget_options.hp_font_size = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"])
		ns.uf_targettarget_options.hp_font_size:SetPoint("LEFT", ns.uf_targettarget_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_targettarget_options.hp_font_flag_text = ns.createFonstring("uf_targettarget_options", "Font flag:")
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

		ns.uf_party_options.pos_x_text = ns.createFonstring("uf_party_options", "PosX:")
		ns.uf_party_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_party_options.cb2, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_posx"])
		ns.uf_party_options.pos_x:SetPoint("LEFT", ns.uf_party_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.pos_y_text = ns.createFonstring("uf_party_options", "PosY:")
		ns.uf_party_options.pos_y_text:SetPoint("LEFT", ns.uf_party_options.pos_x, "RIGHT", 5, 0)

		ns.uf_party_options.pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_posy"])
		ns.uf_party_options.pos_y:SetPoint("LEFT", ns.uf_party_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.anchor_text = ns.createFonstring("uf_party_options", "Anchor:")
		ns.uf_party_options.anchor_text:SetPoint("LEFT", ns.uf_party_options.pos_y, "RIGHT", 5, 0)

		ns.uf_party_options.anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_anchor", 110, LolzenUIcfg.unitframes["uf_party_anchor"])
		ns.uf_party_options.anchor:SetPoint("LEFT", ns.uf_party_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_party_options.width_text = ns.createFonstring("uf_party_options", "Width:")
		ns.uf_party_options.width_text:SetPoint("TOPLEFT", ns.uf_party_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_party_options.width = ns.createInputbox("uf_party_options", 40, 20, LolzenUIcfg.unitframes["uf_party_width"])
		ns.uf_party_options.width:SetPoint("LEFT", ns.uf_party_options.width_text, "RIGHT", 10, 0)

		ns.uf_party_options.height_text = ns.createFonstring("uf_party_options", "Height:")
		ns.uf_party_options.height_text:SetPoint("LEFT", ns.uf_party_options.width, "RIGHT", 10, 0)

		ns.uf_party_options.height = ns.createInputbox("uf_party_options", 40, 20, LolzenUIcfg.unitframes["uf_party_height"])
		ns.uf_party_options.height:SetPoint("LEFT", ns.uf_party_options.height_text, "RIGHT", 10, 0)

		ns.uf_party_options.header1 = ns.createHeader("uf_party_options", "Healthpoints")
		ns.uf_party_options.header1:SetPoint("TOPLEFT", ns.uf_party_options.width_text, 0, -30)

		ns.uf_party_options.cb3 = ns.createCheckBox("uf_party_options", "uf_party_use_custom_font_hp", "|cff5599ffoverwrite the general font options for party healthpoints|r", LolzenUIcfg.unitframes["uf_party_use_own_hp_font_settings"])
		ns.uf_party_options.cb3:SetPoint("TOPLEFT", ns.uf_party_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.hp_pos_x_text = ns.createFonstring("uf_party_options", "PosX:")
		ns.uf_party_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_party_options.cb3, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.hp_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posx"])
		ns.uf_party_options.hp_pos_x:SetPoint("LEFT", ns.uf_party_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.hp_pos_y_text = ns.createFonstring("uf_party_options", "PosY:")
		ns.uf_party_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_party_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_party_options.hp_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posy"])
		ns.uf_party_options.hp_pos_y:SetPoint("LEFT", ns.uf_party_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.hp_anchor_text = ns.createFonstring("uf_party_options", "Anchor:")
		ns.uf_party_options.hp_anchor_text:SetPoint("LEFT", ns.uf_party_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_party_options.hp_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_hp_anchor", 110, LolzenUIcfg.unitframes["uf_party_hp_anchor"])
		ns.uf_party_options.hp_anchor:SetPoint("LEFT", ns.uf_party_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_party_options.hp_font_text = ns.createFonstring("uf_party_options", "Font:")
		ns.uf_party_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_party_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_party_options.hp_font = ns.createPicker("uf_party_options", "font", "uf_party_hp_font", 120, LolzenUIcfg.unitframes["uf_party_hp_font"])
		ns.uf_party_options.hp_font:SetPoint("LEFT", ns.uf_party_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_party_options.hp_font_size_text = ns.createFonstring("uf_party_options", "Font size:")
		ns.uf_party_options.hp_font_size_text:SetPoint("LEFT", ns.uf_party_options.hp_font, "RIGHT", -5, 3)

		ns.uf_party_options.hp_font_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_font_size"])
		ns.uf_party_options.hp_font_size:SetPoint("LEFT", ns.uf_party_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_party_options.hp_font_flag_text = ns.createFonstring("uf_party_options", "Font flag:")
		ns.uf_party_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_party_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_party_options.hp_font_flag = ns.createPicker("uf_party_options", "flag", "uf_party_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_party_hp_font_flag"])
		ns.uf_party_options.hp_font_flag:SetPoint("LEFT", ns.uf_party_options.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_party_options.header2 = ns.createHeader("uf_party_options", "Role Indicator")
		ns.uf_party_options.header2:SetPoint("TOPLEFT", ns.uf_party_options.hp_font_text, 0, -30)

		ns.uf_party_options.cb4 = ns.createCheckBox("uf_party_options", "uf_party_ri", "|cff5599ffshow role indicator|r", LolzenUIcfg.unitframes["uf_party_showroleindicator"])
		ns.uf_party_options.cb4:SetPoint("TOPLEFT", ns.uf_party_options.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.ri_size_text = ns.createFonstring("uf_party_options", "Size:")
		ns.uf_party_options.ri_size_text:SetPoint("TOPLEFT", ns.uf_party_options.cb4, "BOTTOMLEFT", 0, -8)

		ns.uf_party_options.ri_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_size"])
		ns.uf_party_options.ri_size:SetPoint("LEFT", ns.uf_party_options.ri_size_text, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_x_text = ns.createFonstring("uf_party_options", "PosX:")
		ns.uf_party_options.ri_pos_x_text:SetPoint("LEFT", ns.uf_party_options.ri_size, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_posx"])
		ns.uf_party_options.ri_pos_x:SetPoint("LEFT", ns.uf_party_options.ri_pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_y_text = ns.createFonstring("uf_party_options", "PosY:")
		ns.uf_party_options.ri_pos_y_text:SetPoint("LEFT", ns.uf_party_options.ri_pos_x, "RIGHT", 10, 0)

		ns.uf_party_options.ri_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_posy"])
		ns.uf_party_options.ri_pos_y:SetPoint("LEFT", ns.uf_party_options.ri_pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.ri_anchor_text = ns.createFonstring("uf_party_options", "Anchor:")
		ns.uf_party_options.ri_anchor_text:SetPoint("LEFT", ns.uf_party_options.ri_pos_y, "RIGHT", 10, 0)

		ns.uf_party_options.ri_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_ri_anchor", 120, LolzenUIcfg.unitframes["uf_party_ri_anchor"])
		ns.uf_party_options.ri_anchor:SetPoint("LEFT", ns.uf_party_options.ri_anchor_text, "RIGHT", -10, -3)

		ns.uf_party_options.header3 = ns.createHeader("uf_party_options", "Readycheck Indicator")
		ns.uf_party_options.header3:SetPoint("TOPLEFT", ns.uf_party_options.ri_size_text, 0, -30)

		ns.uf_party_options.rc_size_text = ns.createFonstring("uf_party_options", "Size:")
		ns.uf_party_options.rc_size_text:SetPoint("TOPLEFT", ns.uf_party_options.header3, "BOTTOMLEFT", 0, -15)

		ns.uf_party_options.rc_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_size"])
		ns.uf_party_options.rc_size:SetPoint("LEFT", ns.uf_party_options.rc_size_text, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_x_text = ns.createFonstring("uf_party_options", "PosX:")
		ns.uf_party_options.rc_pos_x_text:SetPoint("LEFT", ns.uf_party_options.rc_size, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_posx"])
		ns.uf_party_options.rc_pos_x:SetPoint("LEFT", ns.uf_party_options.rc_pos_x_text, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_y_text = ns.createFonstring("uf_party_options", "PosY:")
		ns.uf_party_options.rc_pos_y_text:SetPoint("LEFT", ns.uf_party_options.rc_pos_x, "RIGHT", 10, 0)

		ns.uf_party_options.rc_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_posy"])
		ns.uf_party_options.rc_pos_y:SetPoint("LEFT", ns.uf_party_options.rc_pos_y_text, "RIGHT", 10, 0)

		ns.uf_party_options.rc_anchor_text = ns.createFonstring("uf_party_options", "Anchor:")
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

		ns.uf_raid_options.pos_x_text = ns.createFonstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_raid_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_posx"])
		ns.uf_raid_options.pos_x:SetPoint("LEFT", ns.uf_raid_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.pos_y_text = ns.createFonstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.pos_y_text:SetPoint("LEFT", ns.uf_raid_options.pos_x, "RIGHT", 5, 0)

		ns.uf_raid_options.pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_posy"])
		ns.uf_raid_options.pos_y:SetPoint("LEFT", ns.uf_raid_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.anchor_text = ns.createFonstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.anchor_text:SetPoint("LEFT", ns.uf_raid_options.pos_y, "RIGHT", 5, 0)

		ns.uf_raid_options.anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_anchor", 110, LolzenUIcfg.unitframes["uf_raid_anchor"])
		ns.uf_raid_options.anchor:SetPoint("LEFT", ns.uf_raid_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_raid_options.width_text = ns.createFonstring("uf_raid_options", "Width:")
		ns.uf_raid_options.width_text:SetPoint("TOPLEFT", ns.uf_raid_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_raid_options.width = ns.createInputbox("uf_raid_options", 40, 20, LolzenUIcfg.unitframes["uf_raid_width"])
		ns.uf_raid_options.width:SetPoint("LEFT", ns.uf_raid_options.width_text, "RIGHT", 10, 0)

		ns.uf_raid_options.height_text = ns.createFonstring("uf_raid_options", "Height:")
		ns.uf_raid_options.height_text:SetPoint("LEFT", ns.uf_raid_options.width, "RIGHT", 10, 0)

		ns.uf_raid_options.height = ns.createInputbox("uf_raid_options", 40, 20, LolzenUIcfg.unitframes["uf_raid_height"])
		ns.uf_raid_options.height:SetPoint("LEFT", ns.uf_raid_options.height_text, "RIGHT", 10, 0)

		ns.uf_raid_options.header1 = ns.createHeader("uf_raid_options", "Healthpoints")
		ns.uf_raid_options.header1:SetPoint("TOPLEFT", ns.uf_raid_options.width_text, 0, -30)

		ns.uf_raid_options.cb2 = ns.createCheckBox("uf_raid_options", "uf_raid_use_custom_font_hp", "|cff5599ffoverwrite the general font options for raid healthpoints|r", LolzenUIcfg.unitframes["uf_raid_use_own_hp_font_settings"])
		ns.uf_raid_options.cb2:SetPoint("TOPLEFT", ns.uf_raid_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.hp_pos_x_text = ns.createFonstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_raid_options.cb2, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.hp_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_posx"])
		ns.uf_raid_options.hp_pos_x:SetPoint("LEFT", ns.uf_raid_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_pos_y_text = ns.createFonstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_raid_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_raid_options.hp_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_posy"])
		ns.uf_raid_options.hp_pos_y:SetPoint("LEFT", ns.uf_raid_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_anchor_text = ns.createFonstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.hp_anchor_text:SetPoint("LEFT", ns.uf_raid_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_raid_options.hp_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_hp_anchor", 110, LolzenUIcfg.unitframes["uf_raid_hp_anchor"])
		ns.uf_raid_options.hp_anchor:SetPoint("LEFT", ns.uf_raid_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_raid_options.hp_font_text = ns.createFonstring("uf_raid_options", "Font:")
		ns.uf_raid_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_raid_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_raid_options.hp_font = ns.createPicker("uf_raid_options", "font", "uf_raid_hp_font", 120, LolzenUIcfg.unitframes["uf_raid_hp_font"])
		ns.uf_raid_options.hp_font:SetPoint("LEFT", ns.uf_raid_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_raid_options.hp_font_size_text = ns.createFonstring("uf_raid_options", "Font size:")
		ns.uf_raid_options.hp_font_size_text:SetPoint("LEFT", ns.uf_raid_options.hp_font, "RIGHT", -5, 3)

		ns.uf_raid_options.hp_font_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_font_size"])
		ns.uf_raid_options.hp_font_size:SetPoint("LEFT", ns.uf_raid_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_font_flag_text = ns.createFonstring("uf_raid_options", "Font flag:")
		ns.uf_raid_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_raid_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_raid_options.hp_font_flag = ns.createPicker("uf_raid_options", "flag", "uf_raid_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_raid_hp_font_flag"])
		ns.uf_raid_options.hp_font_flag:SetPoint("LEFT", ns.uf_raid_options.hp_font_flag_text, "RIGHT", -10, -3)

		ns.uf_raid_options.header2 = ns.createHeader("uf_raid_options", "Role Indicator")
		ns.uf_raid_options.header2:SetPoint("TOPLEFT", ns.uf_raid_options.hp_font_text, 0, -30)

		ns.uf_raid_options.cb3 = ns.createCheckBox("uf_raid_options", "uf_raid_ri", "|cff5599ffshow role indicator|r", LolzenUIcfg.unitframes["uf_raid_showroleindicator"])
		ns.uf_raid_options.cb3:SetPoint("TOPLEFT", ns.uf_raid_options.header2, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.ri_size_text = ns.createFonstring("uf_raid_options", "Size:")
		ns.uf_raid_options.ri_size_text:SetPoint("TOPLEFT", ns.uf_raid_options.cb3, "BOTTOMLEFT", 0, -8)

		ns.uf_raid_options.ri_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_ri_size"])
		ns.uf_raid_options.ri_size:SetPoint("LEFT", ns.uf_raid_options.ri_size_text, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_x_text = ns.createFonstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.ri_pos_x_text:SetPoint("LEFT", ns.uf_raid_options.ri_size, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_ri_posx"])
		ns.uf_raid_options.ri_pos_x:SetPoint("LEFT", ns.uf_raid_options.ri_pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_y_text = ns.createFonstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.ri_pos_y_text:SetPoint("LEFT", ns.uf_raid_options.ri_pos_x, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_ri_posy"])
		ns.uf_raid_options.ri_pos_y:SetPoint("LEFT", ns.uf_raid_options.ri_pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_anchor_text = ns.createFonstring("uf_raid_options", "Anchor:")
		ns.uf_raid_options.ri_anchor_text:SetPoint("LEFT", ns.uf_raid_options.ri_pos_y, "RIGHT", 10, 0)

		ns.uf_raid_options.ri_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_ri_anchor", 120, LolzenUIcfg.unitframes["uf_raid_ri_anchor"])
		ns.uf_raid_options.ri_anchor:SetPoint("LEFT", ns.uf_raid_options.ri_anchor_text, "RIGHT", -10, -3)

		ns.uf_raid_options.header3 = ns.createHeader("uf_raid_options", "Readycheck Indicator")
		ns.uf_raid_options.header3:SetPoint("TOPLEFT", ns.uf_raid_options.ri_size_text, 0, -30)

		ns.uf_raid_options.rc_size_text = ns.createFonstring("uf_raid_options", "Size:")
		ns.uf_raid_options.rc_size_text:SetPoint("TOPLEFT", ns.uf_raid_options.header3, "BOTTOMLEFT", 0, -15)

		ns.uf_raid_options.rc_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_rc_size"])
		ns.uf_raid_options.rc_size:SetPoint("LEFT", ns.uf_raid_options.rc_size_text, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_x_text = ns.createFonstring("uf_raid_options", "PosX:")
		ns.uf_raid_options.rc_pos_x_text:SetPoint("LEFT", ns.uf_raid_options.rc_size, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_rc_posx"])
		ns.uf_raid_options.rc_pos_x:SetPoint("LEFT", ns.uf_raid_options.rc_pos_x_text, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_y_text = ns.createFonstring("uf_raid_options", "PosY:")
		ns.uf_raid_options.rc_pos_y_text:SetPoint("LEFT", ns.uf_raid_options.rc_pos_x, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_rc_posy"])
		ns.uf_raid_options.rc_pos_y:SetPoint("LEFT", ns.uf_raid_options.rc_pos_y_text, "RIGHT", 10, 0)

		ns.uf_raid_options.rc_anchor_text = ns.createFonstring("uf_raid_options", "Anchor:")
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

		ns.uf_pet_options.pos_x_text = ns.createFonstring("uf_pet_options", "PosX:")
		ns.uf_pet_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_pet_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_pet_options.pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_posx"])
		ns.uf_pet_options.pos_x:SetPoint("LEFT", ns.uf_pet_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_pet_options.pos_y_text = ns.createFonstring("uf_pet_options", "PosY:")
		ns.uf_pet_options.pos_y_text:SetPoint("LEFT", ns.uf_pet_options.pos_x, "RIGHT", 5, 0)

		ns.uf_pet_options.pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_posy"])
		ns.uf_pet_options.pos_y:SetPoint("LEFT", ns.uf_pet_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_pet_options.anchor_text = ns.createFonstring("uf_pet_options", "Anchor:")
		ns.uf_pet_options.anchor_text:SetPoint("LEFT", ns.uf_pet_options.pos_y, "RIGHT", 5, 0)

		ns.uf_pet_options.anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_anchor", 110, LolzenUIcfg.unitframes["uf_pet_anchor"])
		ns.uf_pet_options.anchor:SetPoint("LEFT", ns.uf_pet_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_pet_options.width_text = ns.createFonstring("uf_pet_options", "Width:")
		ns.uf_pet_options.width_text:SetPoint("TOPLEFT", ns.uf_pet_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_pet_options.width = ns.createInputbox("uf_pet_options", 40, 20, LolzenUIcfg.unitframes["uf_pet_width"])
		ns.uf_pet_options.width:SetPoint("LEFT", ns.uf_pet_options.width_text, "RIGHT", 10, 0)

		ns.uf_pet_options.height_text = ns.createFonstring("uf_pet_options", "Height:")
		ns.uf_pet_options.height_text:SetPoint("LEFT", ns.uf_pet_options.width, "RIGHT", 10, 0)

		ns.uf_pet_options.height = ns.createInputbox("uf_pet_options", 40, 20, LolzenUIcfg.unitframes["uf_pet_height"])
		ns.uf_pet_options.height:SetPoint("LEFT", ns.uf_pet_options.height_text, "RIGHT", 10, 0)

		ns.uf_pet_options.header1 = ns.createHeader("uf_pet_options", "Healthpoints")
		ns.uf_pet_options.header1:SetPoint("TOPLEFT", ns.uf_pet_options.width_text, 0, -30)

		ns.uf_pet_options.cb1 = ns.createCheckBox("uf_pet_options", "uf_pet_use_custom_font_hp", "|cff5599ffoverwrite the general font options for pet healthpoints|r", LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"])
		ns.uf_pet_options.cb1:SetPoint("TOPLEFT", ns.uf_pet_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_pet_options.hp_pos_x_text = ns.createFonstring("uf_pet_options", "PosX:")
		ns.uf_pet_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_pet_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_pet_options.hp_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posx"])
		ns.uf_pet_options.hp_pos_x:SetPoint("LEFT", ns.uf_pet_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_pos_y_text = ns.createFonstring("uf_pet_options", "PosY:")
		ns.uf_pet_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_pet_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_pet_options.hp_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posy"])
		ns.uf_pet_options.hp_pos_y:SetPoint("LEFT", ns.uf_pet_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_anchor_text = ns.createFonstring("uf_pet_options", "Anchor:")
		ns.uf_pet_options.hp_anchor_text:SetPoint("LEFT", ns.uf_pet_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_pet_options.hp_anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_hp_anchor", 110, LolzenUIcfg.unitframes["uf_pet_hp_anchor"])
		ns.uf_pet_options.hp_anchor:SetPoint("LEFT", ns.uf_pet_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_pet_options.hp_font_text = ns.createFonstring("uf_pet_options", "Font:")
		ns.uf_pet_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_pet_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_pet_options.hp_font = ns.createPicker("uf_pet_options", "font", "uf_pet_hp_font", 120, LolzenUIcfg.unitframes["uf_pet_hp_font"])
		ns.uf_pet_options.hp_font:SetPoint("LEFT", ns.uf_pet_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_pet_options.hp_font_size_text = ns.createFonstring("uf_pet_options", "Font size:")
		ns.uf_pet_options.hp_font_size_text:SetPoint("LEFT", ns.uf_pet_options.hp_font, "RIGHT", -5, 3)

		ns.uf_pet_options.hp_font_size = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_font_size"])
		ns.uf_pet_options.hp_font_size:SetPoint("LEFT", ns.uf_pet_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_font_flag_text = ns.createFonstring("uf_pet_options", "Font flag:")
		ns.uf_pet_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_pet_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_pet_options.hp_font_flag = ns.createPicker("uf_pet_options", "flag", "uf_pet_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_pet_hp_font_flag"])
		ns.uf_pet_options.hp_font_flag:SetPoint("LEFT", ns.uf_pet_options.hp_font_flag_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Boss // --
		ns.uf_boss_options = CreateFrame("Frame", "unitframe_bosspanel", ns["unitframes"])
		ns.uf_boss_options.name = "   Boss"
		ns.uf_boss_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_boss_options)

		ns.uf_boss_options.title = ns.uf_boss_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_boss_options.title:SetPoint("TOPLEFT", ns.uf_boss_options, 16, -16)
		ns.uf_boss_options.title:SetText("|cff5599ffUnitframes module: Boss Options|r")

		ns.uf_boss_options.pos_x_text = ns.createFonstring("uf_boss_options", "PosX:")
		ns.uf_boss_options.pos_x_text:SetPoint("TOPLEFT", ns.uf_boss_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_boss_options.pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_posx"])
		ns.uf_boss_options.pos_x:SetPoint("LEFT", ns.uf_boss_options.pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.pos_y_text = ns.createFonstring("uf_boss_options", "PosY:")
		ns.uf_boss_options.pos_y_text:SetPoint("LEFT", ns.uf_boss_options.pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_posy"])
		ns.uf_boss_options.pos_y:SetPoint("LEFT", ns.uf_boss_options.pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.anchor_text = ns.createFonstring("uf_boss_options", "Anchor:")
		ns.uf_boss_options.anchor_text:SetPoint("LEFT", ns.uf_boss_options.pos_y, "RIGHT", 5, 0)

		ns.uf_boss_options.anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_anchor", 110, LolzenUIcfg.unitframes["uf_boss_anchor"])
		ns.uf_boss_options.anchor:SetPoint("LEFT", ns.uf_boss_options.anchor_text, "RIGHT", -10, -3)

		ns.uf_boss_options.width_text = ns.createFonstring("uf_boss_options", "Width:")
		ns.uf_boss_options.width_text:SetPoint("TOPLEFT", ns.uf_boss_options.pos_x_text, "BOTTOMLEFT", 0, -10)

		ns.uf_boss_options.width = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes["uf_boss_width"])
		ns.uf_boss_options.width:SetPoint("LEFT", ns.uf_boss_options.width_text, "RIGHT", 10, 0)

		ns.uf_boss_options.height_text = ns.createFonstring("uf_boss_options", "Height:")
		ns.uf_boss_options.height_text:SetPoint("LEFT", ns.uf_boss_options.width, "RIGHT", 10, 0)

		ns.uf_boss_options.height = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes["uf_boss_height"])
		ns.uf_boss_options.height:SetPoint("LEFT", ns.uf_boss_options.height_text, "RIGHT", 10, 0)

		ns.uf_boss_options.growth_text = ns.createFonstring("uf_boss_options", "Additional Bossframe placement:")
		ns.uf_boss_options.growth_text:SetPoint("TOPLEFT", ns.uf_boss_options.width_text, "BOTTOMLEFT", 0, -10)

		ns.uf_boss_options.growth = ns.createPicker("uf_boss_options", "growth", "uf_boss_additional_boss_anchor", 110, LolzenUIcfg.unitframes["uf_boss_additional_pos"])
		ns.uf_boss_options.growth:SetPoint("LEFT", ns.uf_boss_options.growth_text, "RIGHT", -10, -3)

		ns.uf_boss_options.growth_spacing_text = ns.createFonstring("uf_boss_options", "Spacing:") --ns.uf_boss_options.growth
		ns.uf_boss_options.growth_spacing_text:SetPoint("LEFT", ns.uf_boss_options.growth, "RIGHT", -10, 3)

		ns.uf_boss_options.growth_spacing = ns.createInputbox("uf_boss_options", 40, 20, LolzenUIcfg.unitframes["uf_boss_additional_spacing"])
		ns.uf_boss_options.growth_spacing:SetPoint("LEFT", ns.uf_boss_options.growth_spacing_text, "RIGHT", 10, 0)

		ns.uf_boss_options.header1 = ns.createHeader("uf_boss_options", "Healthpoints")
		ns.uf_boss_options.header1:SetPoint("TOPLEFT", ns.uf_boss_options.growth_text, 0, -30)

		ns.uf_boss_options.cb1 = ns.createCheckBox("uf_boss_options", "uf_boss_use_custom_font_hp", "|cff5599ffoverwrite the general font options for boss healthpoints|r", LolzenUIcfg.unitframes["uf_boss_use_own_hp_font_settings"])
		ns.uf_boss_options.cb1:SetPoint("TOPLEFT", ns.uf_boss_options.header1, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.hp_pos_x_text = ns.createFonstring("uf_boss_options", "PosX:")
		ns.uf_boss_options.hp_pos_x_text:SetPoint("TOPLEFT", ns.uf_boss_options.cb1, "BOTTOMLEFT", 0, -8)

		ns.uf_boss_options.hp_pos_x = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_hp_posx"])
		ns.uf_boss_options.hp_pos_x:SetPoint("LEFT", ns.uf_boss_options.hp_pos_x_text, "RIGHT", 10, 0)

		ns.uf_boss_options.hp_pos_y_text = ns.createFonstring("uf_boss_options", "PosY:")
		ns.uf_boss_options.hp_pos_y_text:SetPoint("LEFT", ns.uf_boss_options.hp_pos_x, "RIGHT", 5, 0)

		ns.uf_boss_options.hp_pos_y = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_hp_posy"])
		ns.uf_boss_options.hp_pos_y:SetPoint("LEFT", ns.uf_boss_options.hp_pos_y_text, "RIGHT", 10, 0)

		ns.uf_boss_options.hp_anchor_text = ns.createFonstring("uf_boss_options", "Anchor:")
		ns.uf_boss_options.hp_anchor_text:SetPoint("LEFT", ns.uf_boss_options.hp_pos_y, "RIGHT", 5, 0)

		ns.uf_boss_options.hp_anchor = ns.createPicker("uf_boss_options", "anchor", "uf_boss_hp_anchor", 110, LolzenUIcfg.unitframes["uf_boss_hp_anchor"])
		ns.uf_boss_options.hp_anchor:SetPoint("LEFT", ns.uf_boss_options.hp_anchor_text, "RIGHT", -10, -3)

		ns.uf_boss_options.hp_font_text = ns.createFonstring("uf_boss_options", "Font:")
		ns.uf_boss_options.hp_font_text:SetPoint("TOPLEFT", ns.uf_boss_options.hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		ns.uf_boss_options.hp_font = ns.createPicker("uf_boss_options", "font", "uf_boss_hp_font", 120, LolzenUIcfg.unitframes["uf_boss_hp_font"])
		ns.uf_boss_options.hp_font:SetPoint("LEFT", ns.uf_boss_options.hp_font_text, "RIGHT", -10, -3)

		ns.uf_boss_options.hp_font_size_text = ns.createFonstring("uf_boss_options", "Font size:")
		ns.uf_boss_options.hp_font_size_text:SetPoint("LEFT", ns.uf_boss_options.hp_font, "RIGHT", -5, 3)

		ns.uf_boss_options.hp_font_size = ns.createInputbox("uf_boss_options", 30, 20, LolzenUIcfg.unitframes["uf_boss_hp_font_size"])
		ns.uf_boss_options.hp_font_size:SetPoint("LEFT", ns.uf_boss_options.hp_font_size_text, "RIGHT", 10, 0)

		ns.uf_boss_options.hp_font_flag_text = ns.createFonstring("uf_boss_options", "Font flag:")
		ns.uf_boss_options.hp_font_flag_text:SetPoint("LEFT", ns.uf_boss_options.hp_font_size, "RIGHT", 10, 0)

		ns.uf_boss_options.hp_font_flag = ns.createPicker("uf_boss_options", "flag", "uf_boss_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_boss_hp_font_flag"])
		ns.uf_boss_options.hp_font_flag:SetPoint("LEFT", ns.uf_boss_options.hp_font_flag_text, "RIGHT", -10, -3)

		-- // Create a subcategory panel for Power Colors // --
		ns.uf_powercolor_options = CreateFrame("Frame", "unitframe_playerpanel", ns["unitframes"])
		ns.uf_powercolor_options.name = "   Power Colors"
		ns.uf_powercolor_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_powercolor_options)

		ns.uf_powercolor_options.title = ns.uf_powercolor_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		ns.uf_powercolor_options.title:SetPoint("TOPLEFT", ns.uf_powercolor_options, 16, -16)
		ns.uf_powercolor_options.title:SetText("|cff5599ffUnitframes module: Power Colors|r")

		ns.uf_powercolor_options.mana_text = ns.createFonstring("uf_powercolor_options", "Mana:")
		ns.uf_powercolor_options.mana_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.title, "BOTTOMLEFT", 0, -30)

		ns.uf_powercolor_options.mana = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["0"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.mana:SetPoint("LEFT", ns.uf_powercolor_options.mana_text, "RIGHT", 62, 0)

		ns.uf_powercolor_options.mana_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.mana, LolzenUIcfg.unitframes["uf_power_colors"]["0"])
		ns.uf_powercolor_options.mana_f:SetAllPoints(ns.uf_powercolor_options.mana)

		ns.uf_powercolor_options.rage_text = ns.createFonstring("uf_powercolor_options", "Rage:")
		ns.uf_powercolor_options.rage_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.mana_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.rage = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["1"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.rage:SetPoint("LEFT", ns.uf_powercolor_options.rage_text, "RIGHT", 65, 0)

		ns.uf_powercolor_options.rage_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.rage, LolzenUIcfg.unitframes["uf_power_colors"]["1"])
		ns.uf_powercolor_options.rage_f:SetAllPoints(ns.uf_powercolor_options.rage)

		ns.uf_powercolor_options.focus_text = ns.createFonstring("uf_powercolor_options", "Focus:")
		ns.uf_powercolor_options.focus_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.rage_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.focus = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["2"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.focus:SetPoint("LEFT", ns.uf_powercolor_options.focus_text, "RIGHT", 62, 0)

		ns.uf_powercolor_options.focus_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.focus, LolzenUIcfg.unitframes["uf_power_colors"]["2"])
		ns.uf_powercolor_options.focus_f:SetAllPoints(ns.uf_powercolor_options.focus)

		ns.uf_powercolor_options.energy_text = ns.createFonstring("uf_powercolor_options", "Energy:")
		ns.uf_powercolor_options.energy_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.focus_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.energy = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["3"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.energy:SetPoint("LEFT", ns.uf_powercolor_options.energy_text, "RIGHT", 56, 0)

		ns.uf_powercolor_options.energy_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.energy, LolzenUIcfg.unitframes["uf_power_colors"]["3"])
		ns.uf_powercolor_options.energy_f:SetAllPoints(ns.uf_powercolor_options.energy)

		ns.uf_powercolor_options.cp_text = ns.createFonstring("uf_powercolor_options", "Combo Points:")
		ns.uf_powercolor_options.cp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.energy_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.cp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["4"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.cp:SetPoint("LEFT", ns.uf_powercolor_options.cp_text, "RIGHT", 20, 0)

		ns.uf_powercolor_options.cp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.cp, LolzenUIcfg.unitframes["uf_power_colors"]["4"])
		ns.uf_powercolor_options.cp_f:SetAllPoints(ns.uf_powercolor_options.cp)

		ns.uf_powercolor_options.runes_text = ns.createFonstring("uf_powercolor_options", "Runes:")
		ns.uf_powercolor_options.runes_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.cp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.runes = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["5"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.runes:SetPoint("LEFT", ns.uf_powercolor_options.runes_text, "RIGHT", 61, 0)

		ns.uf_powercolor_options.runes_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.runes, LolzenUIcfg.unitframes["uf_power_colors"]["5"])
		ns.uf_powercolor_options.runes_f:SetAllPoints(ns.uf_powercolor_options.runes)

		ns.uf_powercolor_options.rp_text = ns.createFonstring("uf_powercolor_options", "Runic Power:")
		ns.uf_powercolor_options.rp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.runes_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.rp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["6"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.rp:SetPoint("LEFT", ns.uf_powercolor_options.rp_text, "RIGHT", 28, 0)

		ns.uf_powercolor_options.rp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.rp, LolzenUIcfg.unitframes["uf_power_colors"]["6"])
		ns.uf_powercolor_options.rp_f:SetAllPoints(ns.uf_powercolor_options.rp)

		ns.uf_powercolor_options.soulshards_text = ns.createFonstring("uf_powercolor_options", "Soul Shards:")
		ns.uf_powercolor_options.soulshards_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.rp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.soulshards = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["7"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.soulshards:SetPoint("LEFT", ns.uf_powercolor_options.soulshards_text, "RIGHT", 32, 0)

		ns.uf_powercolor_options.soulshards_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.soulshards, LolzenUIcfg.unitframes["uf_power_colors"]["7"])
		ns.uf_powercolor_options.soulshards_f:SetAllPoints(ns.uf_powercolor_options.soulshards)

		ns.uf_powercolor_options.lp_text = ns.createFonstring("uf_powercolor_options", "Lunar Power:")
		ns.uf_powercolor_options.lp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.soulshards_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.lp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["8"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.lp:SetPoint("LEFT", ns.uf_powercolor_options.lp_text, "RIGHT", 28, 0)

		ns.uf_powercolor_options.lp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.lp, LolzenUIcfg.unitframes["uf_power_colors"]["8"])
		ns.uf_powercolor_options.lp_f:SetAllPoints(ns.uf_powercolor_options.lp)

		ns.uf_powercolor_options.hp_text = ns.createFonstring("uf_powercolor_options", "Holy Power:")
		ns.uf_powercolor_options.hp_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.lp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.hp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["9"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.hp:SetPoint("LEFT", ns.uf_powercolor_options.hp_text, "RIGHT", 32, 0)

		ns.uf_powercolor_options.hp_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.hp, LolzenUIcfg.unitframes["uf_power_colors"]["9"])
		ns.uf_powercolor_options.hp_f:SetAllPoints(ns.uf_powercolor_options.hp)

		ns.uf_powercolor_options.maelstrom_text = ns.createFonstring("uf_powercolor_options", "Maelstrom:")
		ns.uf_powercolor_options.maelstrom_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.hp_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.maelstrom = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["11"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.maelstrom:SetPoint("LEFT", ns.uf_powercolor_options.maelstrom_text, "RIGHT", 35, 0)

		ns.uf_powercolor_options.maelstrom_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.maelstrom, LolzenUIcfg.unitframes["uf_power_colors"]["11"])
		ns.uf_powercolor_options.maelstrom_f:SetAllPoints(ns.uf_powercolor_options.maelstrom)

		ns.uf_powercolor_options.chi_text = ns.createFonstring("uf_powercolor_options", "Chi:")
		ns.uf_powercolor_options.chi_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.maelstrom_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.chi = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["12"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.chi:SetPoint("LEFT", ns.uf_powercolor_options.chi_text, "RIGHT", 75, 0)

		ns.uf_powercolor_options.chi_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.chi, LolzenUIcfg.unitframes["uf_power_colors"]["12"])
		ns.uf_powercolor_options.chi_f:SetAllPoints(ns.uf_powercolor_options.chi)

		ns.uf_powercolor_options.insanity_text = ns.createFonstring("uf_powercolor_options", "Insanity:")
		ns.uf_powercolor_options.insanity_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.chi_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.insanity = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["13"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.insanity:SetPoint("LEFT", ns.uf_powercolor_options.insanity_text, "RIGHT", 51, 0)

		ns.uf_powercolor_options.insanity_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.insanity, LolzenUIcfg.unitframes["uf_power_colors"]["13"])
		ns.uf_powercolor_options.insanity_f:SetAllPoints(ns.uf_powercolor_options.insanity)

		ns.uf_powercolor_options.ac_text = ns.createFonstring("uf_powercolor_options", "Arcane Charges:")
		ns.uf_powercolor_options.ac_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.insanity_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.ac = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["16"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.ac:SetPoint("LEFT", ns.uf_powercolor_options.ac_text, "RIGHT", 11, 0)

		ns.uf_powercolor_options.ac_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.ac, LolzenUIcfg.unitframes["uf_power_colors"]["16"])
		ns.uf_powercolor_options.ac_f:SetAllPoints(ns.uf_powercolor_options.ac)

		ns.uf_powercolor_options.fury_text = ns.createFonstring("uf_powercolor_options", "Fury:")
		ns.uf_powercolor_options.fury_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.ac_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.fury = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["17"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.fury:SetPoint("LEFT", ns.uf_powercolor_options.fury_text, "RIGHT", 70, 0)

		ns.uf_powercolor_options.fury_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.fury, LolzenUIcfg.unitframes["uf_power_colors"]["17"])
		ns.uf_powercolor_options.fury_f:SetAllPoints(ns.uf_powercolor_options.fury)

		ns.uf_powercolor_options.pain_text = ns.createFonstring("uf_powercolor_options", "Pain:")
		ns.uf_powercolor_options.pain_text:SetPoint("TOPLEFT", ns.uf_powercolor_options.fury_text, "BOTTOMLEFT", 0, -10)

		ns.uf_powercolor_options.pain = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["18"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.uf_powercolor_options.pain:SetPoint("LEFT", ns.uf_powercolor_options.pain_text, "RIGHT", 70, 0)

		ns.uf_powercolor_options.pain_f = ns.createColorPicker("uf_powercolor_options", ns.uf_powercolor_options.pain, LolzenUIcfg.unitframes["uf_power_colors"]["18"])
		ns.uf_powercolor_options.pain_f:SetAllPoints(ns.uf_powercolor_options.pain)

		ns["unitframes"].okay = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = ns.unitframes.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_use_sivalue"] = ns.unitframes.cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_use_dot_format"] = ns.unitframes.cb3:GetChecked()
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
			LolzenUIcfg.unitframes["uf_fade_outofreach"] = ns.unitframes.cb4:GetChecked()
			LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.unitframes.fadeout_alpha)])
			LolzenUIcfg.unitframes["uf_general_hpfont_size"] = tonumber(ns.unitframes.general_font_size_health:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_font"] = UIDropDownMenu_GetSelectedName(ns.unitframes.general_hp_font)
			LolzenUIcfg.unitframes["uf_general_powerfont_size"] = tonumber(ns.unitframes.general_font_size_power:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.unitframes.general_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_general_hp_posx"] = tonumber(ns.unitframes.general_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_posy"] = tonumber(ns.unitframes.general_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_general_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.unitframes.general_hp_anchor)]
		end

		ns["unitframes"].default = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = false
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
			LolzenUIcfg.unitframes["uf_general_hpfont_size"] = 24
			LolzenUIcfg.unitframes["uf_general_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_general_powerfont_size"] = 18
			LolzenUIcfg.unitframes["uf_general_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_general_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_general_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_general_hp_anchor"] = "RIGHT"
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
			LolzenUIcfg.unitframes["uf_player_width"] = tonumber(ns.uf_player_options.width:GetText())
			LolzenUIcfg.unitframes["uf_player_height"] = tonumber(ns.uf_player_options.height:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_border"] = UIDropDownMenu_GetSelectedName(ns.uf_player_options.classpower_border)
			LolzenUIcfg.unitframes["uf_player_classpower_spacing"] = tonumber(ns.uf_player_options.classpower_spacing:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_posx"] = tonumber(ns.uf_player_options.classpower_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_posy"] = tonumber(ns.uf_player_options.classpower_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_classpower_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.classpower_anchor1)]
			LolzenUIcfg.unitframes["uf_player_classpower_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_player_options.classpower_anchor2)]
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
			LolzenUIcfg.unitframes["uf_player_width"] = 220
			LolzenUIcfg.unitframes["uf_player_height"] = 21
			LolzenUIcfg.unitframes["uf_player_classpower_border"] = "Blizzard Tooltip"
			LolzenUIcfg.unitframes["uf_player_classpower_spacing"] = 5
			LolzenUIcfg.unitframes["uf_player_classpower_posx"] = 0
			LolzenUIcfg.unitframes["uf_player_classpower_posy"] = -5
			LolzenUIcfg.unitframes["uf_player_classpower_anchor1"] = "TOPLEFT"
			LolzenUIcfg.unitframes["uf_player_classpower_anchor2"] = "BOTTOMLEFT"
			ReloadUI()
		end

		ns["uf_target_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_target_posx"] = tonumber(ns.uf_target_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_posy"] = tonumber(ns.uf_target_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.anchor)]
			LolzenUIcfg.unitframes["uf_target_use_own_hp_font_settings"] = ns.uf_target_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_target_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_target_options.hp_font)
			LolzenUIcfg.unitframes["uf_target_hp_font_size"] = tonumber(ns.uf_target_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_target_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_target_hp_posx"] = tonumber(ns.uf_target_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_posy"] = tonumber(ns.uf_target_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_target_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_target_width"] = tonumber(ns.uf_target_options.width:GetText())
			LolzenUIcfg.unitframes["uf_target_height"] = tonumber(ns.uf_target_options.height:GetText())
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
			LolzenUIcfg.unitframes["uf_target_width"] = 220
			LolzenUIcfg.unitframes["uf_target_height"] = 21
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
			LolzenUIcfg.unitframes["uf_boss_additional_pos"] = ns.picker_growth[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.growth)]
			LolzenUIcfg.unitframes["uf_boss_additional_spacing"] = tonumber(ns.uf_boss_options.growth_spacing:GetText())
			LolzenUIcfg.unitframes["uf_boss_posx"] = tonumber(ns.uf_boss_options.pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_posy"] = tonumber(ns.uf_boss_options.pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.anchor)]
			LolzenUIcfg.unitframes["uf_boss_use_own_hp_font_settings"] = ns.uf_boss_options.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_boss_hp_font"] = UIDropDownMenu_GetSelectedName(ns.uf_boss_options.hp_font)
			LolzenUIcfg.unitframes["uf_boss_hp_font_size"] = tonumber(ns.uf_boss_options.hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_boss_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.hp_font_flag)]
			LolzenUIcfg.unitframes["uf_boss_hp_posx"] = tonumber(ns.uf_boss_options.hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_boss_hp_posy"] = tonumber(ns.uf_boss_options.hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_boss_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ns.uf_boss_options.hp_anchor)]
			LolzenUIcfg.unitframes["uf_boss_width"] = tonumber(ns.uf_boss_options.width:GetText())
			LolzenUIcfg.unitframes["uf_boss_height"] = tonumber(ns.uf_boss_options.height:GetText())
		end

		ns["uf_boss_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_boss_additional_pos"] = "ABOVE"
			LolzenUIcfg.unitframes["uf_boss_additional_spacing"] = 5
			LolzenUIcfg.unitframes["uf_boss_posx"] = 0
			LolzenUIcfg.unitframes["uf_boss_posy"] = -200
			LolzenUIcfg.unitframes["uf_boss_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_boss_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_boss_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_boss_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_boss_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_boss_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_boss_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_boss_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_boss_width"] = 220
			LolzenUIcfg.unitframes["uf_boss_height"] = 21
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