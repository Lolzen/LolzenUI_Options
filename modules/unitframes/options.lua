--// options for unitframes //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		local title = ns.createTitle("unitframes")

		local about = ns.createDescription("unitframes", "Unitframes")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
		
		local cb1 = ns.createCheckBox("unitframes", "uf_hp_perc", "|cff5599ffuse hp percentage|r", LolzenUIcfg.unitframes["uf_use_hp_percent"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)
		
		local cb2 = ns.createCheckBox("unitframes", "uf_siVal", "|cff5599ffuse short values (34m5, 3k2, etc)|r", LolzenUIcfg.unitframes["uf_use_sivalue"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -0)
		
		cb1:SetScript("OnClick", function(self)
			if cb1:GetChecked() == true then
				cb2:Disable()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
			else
				cb2:Enable()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r")
			end
		end)

		if cb1:GetChecked() == true then
			cb2:Disable()
			uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
		else
			cb2:Enable()
		end
		
		local texture_text = ns.createFonstring("unitframes", "Texture:")
		texture_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -15)

		local texture = ns.createPicker("unitframes", "statusbar", "uf_statusbar", 120, LolzenUIcfg.unitframes["uf_statusbar_texture"])
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)
		
		local border_text = ns.createFonstring("unitframes", "Border:")
		border_text:SetPoint("LEFT", texture, "RIGHT", -5, 3)

		local border = ns.createPicker("unitframes", "border", "uf_border", 120, LolzenUIcfg.unitframes["uf_border"])
		border:SetPoint("LEFT", border_text, "RIGHT", -10, -3)
		
		local header1 = ns.createHeader("unitframes", "Raidmark indicator")
		header1:SetPoint("TOPLEFT", texture_text, "BOTTOMLEFT", 0, -30)
		
		local rt_size_text = ns.createFonstring("unitframes", "Size:")
		rt_size_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -10)

		local rt_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_size"])
		rt_size:SetPoint("LEFT", rt_size_text, "RIGHT", 10, 0)

		local rt_pos_x_text = ns.createFonstring("unitframes", "PosX:")
		rt_pos_x_text:SetPoint("LEFT", rt_size, "RIGHT", 10, 0)

		local rt_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_posx"])
		rt_pos_x:SetPoint("LEFT", rt_pos_x_text, "RIGHT", 10, 0)

		local rt_pos_y_text = ns.createFonstring("unitframes", "PosY:")
		rt_pos_y_text:SetPoint("LEFT", rt_pos_x, "RIGHT", 10, 0)

		local rt_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_ri_posy"])
		rt_pos_y:SetPoint("LEFT", rt_pos_y_text, "RIGHT", 10, 0)

		local rt_anchor_text = ns.createFonstring("unitframes", "Anchor:")
		rt_anchor_text:SetPoint("LEFT", rt_pos_y, "RIGHT", 10, 0)

		local rt_anchor = ns.createPicker("unitframes", "anchor", "uf_rt_anchor", 110, LolzenUIcfg.unitframes["uf_ri_anchor"])
		rt_anchor:SetPoint("LEFT", rt_anchor_text, "RIGHT", -10, -3)
		
		local header2 = ns.createHeader("unitframes", "Lead indicator")
		header2:SetPoint("TOPLEFT", rt_size_text, "BOTTOMLEFT", 0, -30)
		
		local lead_size_text = ns.createFonstring("unitframes", "Size:")
		lead_size_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		local lead_size = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_size"])
		lead_size:SetPoint("LEFT", lead_size_text, "RIGHT", 10, 0)

		local lead_pos_x_text = ns.createFonstring("unitframes", "PosX:")
		lead_pos_x_text:SetPoint("LEFT", lead_size, "RIGHT", 10, 0)

		local lead_pos_x = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_posx"])
		lead_pos_x:SetPoint("LEFT", lead_pos_x_text, "RIGHT", 10, 0)

		local lead_pos_y_text = ns.createFonstring("unitframes", "PosY:")
		lead_pos_y_text:SetPoint("LEFT", lead_pos_x, "RIGHT", 10, 0)

		local lead_pos_y = ns.createInputbox("unitframes", 30, 20, LolzenUIcfg.unitframes["uf_lead_posy"])
		lead_pos_y:SetPoint("LEFT", lead_pos_y_text, "RIGHT", 10, 0)

		local lead_anchor_text = ns.createFonstring("unitframes", "Anchor:")
		lead_anchor_text:SetPoint("LEFT", lead_pos_y, "RIGHT", 10, 0)

		local lead_anchor = ns.createPicker("unitframes", "anchor", "uf_lead_anchor", 110, LolzenUIcfg.unitframes["uf_lead_anchor"])
		lead_anchor:SetPoint("LEFT", lead_anchor_text, "RIGHT", -10, -3)
		
		local header3 = ns.createHeader("unitframes", "Fadeout")
		header3:SetPoint("TOPLEFT", lead_size_text, "BOTTOMLEFT", 0, -30)
		
		local cb2 = ns.createCheckBox("unitframes", "uf_fadeout", "|cff5599fffadeout out of reach unitframes|r", LolzenUIcfg.unitframes["uf_fade_outofreach"])
		cb2:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)
		
		local fadeout_alpha_text = ns.createFonstring("unitframes", "out of reach alpha (party/raid members):")
		fadeout_alpha_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -8)

		local fadout_alpha = ns.createPicker("unitframes", "alpha", "uf_fadout_alpha", 45, LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"])
		fadout_alpha:SetPoint("LEFT", fadeout_alpha_text, "RIGHT", -10, -3)
		
		-- // Create a subcategory panel for Player // --
		ns.uf_player_options = CreateFrame("Frame", "unitframe_playerpanel", ns["unitframes"])
		ns.uf_player_options.name = "   Player"
		ns.uf_player_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_player_options)

		local player_title = ns.uf_player_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		player_title:SetPoint("TOPLEFT", ns.uf_player_options, 16, -16)
		player_title:SetText("|cff5599ffUnitframes module: Player Options|r")
		
		local player_pos_x_text = ns.createFonstring("uf_player_options", "PosX:")
		player_pos_x_text:SetPoint("TOPLEFT", player_title, "BOTTOMLEFT", 0, -20)

		local player_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_posx"])
		player_pos_x:SetPoint("LEFT", player_pos_x_text, "RIGHT", 10, 0)

		local player_pos_y_text = ns.createFonstring("uf_player_options", "PosY:")
		player_pos_y_text:SetPoint("LEFT", player_pos_x, "RIGHT", 5, 0)

		local player_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_posy"])
		player_pos_y:SetPoint("LEFT", player_pos_y_text, "RIGHT", 10, 0)

		local player_anchor_text = ns.createFonstring("uf_player_options", "Anchor:")
		player_anchor_text:SetPoint("LEFT", player_pos_y, "RIGHT", 5, 0)

		local player_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_anchor", 110, LolzenUIcfg.unitframes["uf_player_anchor"])
		player_anchor:SetPoint("LEFT", player_anchor_text, "RIGHT", -10, -3)
		
		local player_header1 = ns.createHeader("uf_player_options", "Healthpoints")
		player_header1:SetPoint("TOPLEFT", player_pos_x_text, 0, -30)
		
		local player_hp_pos_x_text = ns.createFonstring("uf_player_options", "PosX:")
		player_hp_pos_x_text:SetPoint("TOPLEFT", player_header1, "BOTTOMLEFT", 0, -8)
		
		local player_hp_pos_x = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_posx"])
		player_hp_pos_x:SetPoint("LEFT", player_hp_pos_x_text, "RIGHT", 10, 0)
		
		local player_hp_pos_y_text = ns.createFonstring("uf_player_options", "PosY:")
		player_hp_pos_y_text:SetPoint("LEFT", player_hp_pos_x, "RIGHT", 5, 0)

		local player_hp_pos_y = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_posy"])
		player_hp_pos_y:SetPoint("LEFT", player_hp_pos_y_text, "RIGHT", 10, 0)
		
		local player_hp_anchor_text = ns.createFonstring("uf_player_options", "Anchor:")
		player_hp_anchor_text:SetPoint("LEFT", player_hp_pos_y, "RIGHT", 5, 0)

		local player_hp_anchor = ns.createPicker("uf_player_options", "anchor", "uf_player_hp_anchor", 110, LolzenUIcfg.unitframes["uf_player_hp_anchor"])
		player_hp_anchor:SetPoint("LEFT", player_hp_anchor_text, "RIGHT", -10, -3)
		
		local player_hp_font_text = ns.createFonstring("uf_player_options", "Font:")
		player_hp_font_text:SetPoint("TOPLEFT", player_hp_pos_x_text, 0, -25)
		
		local player_hp_font = ns.createPicker("uf_player_options", "font", "uf_player_hp_font", 120, LolzenUIcfg.unitframes["uf_player_hp_font"])
		player_hp_font:SetPoint("LEFT", player_hp_font_text, "RIGHT", -10, -3)
		
		local player_hp_font_size_text = ns.createFonstring("uf_player_options", "Font size:")
		player_hp_font_size_text:SetPoint("LEFT", player_hp_font, "RIGHT", -5, 3)

		local player_hp_font_size = ns.createInputbox("uf_player_options", 30, 20, LolzenUIcfg.unitframes["uf_player_hp_font_size"])
		player_hp_font_size:SetPoint("LEFT", player_hp_font_size_text, "RIGHT", 10, 0)

		local player_hp_font_flag_text = ns.createFonstring("uf_player_options", "Font flag:")
		player_hp_font_flag_text:SetPoint("LEFT", player_hp_font_size, "RIGHT", 10, 0)

		local player_hp_font_flag = ns.createPicker("uf_player_options", "flag", "uf_player_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_player_hp_font_flag"])
		player_hp_font_flag:SetPoint("LEFT", player_hp_font_flag_text, "RIGHT", -10, -3)
		
		-- // Create a subcategory panel for Target // --
		ns.uf_target_options = CreateFrame("Frame", "unitframe_targetpanel", ns["unitframes"])
		ns.uf_target_options.name = "   Target"
		ns.uf_target_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_target_options)

		local target_title = ns.uf_target_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		target_title:SetPoint("TOPLEFT", ns.uf_target_options, 16, -16)
		target_title:SetText("|cff5599ffUnitframes module: Target Options|r")
		
		local target_pos_x_text = ns.createFonstring("uf_target_options", "PosX:")
		target_pos_x_text:SetPoint("TOPLEFT", target_title, "BOTTOMLEFT", 0, -20)

		local target_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_posx"])
		target_pos_x:SetPoint("LEFT", target_pos_x_text, "RIGHT", 10, 0)

		local target_pos_y_text = ns.createFonstring("uf_target_options", "PosY:")
		target_pos_y_text:SetPoint("LEFT", target_pos_x, "RIGHT", 5, 0)

		local target_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_posy"])
		target_pos_y:SetPoint("LEFT", target_pos_y_text, "RIGHT", 10, 0)

		local target_anchor_text = ns.createFonstring("uf_target_options", "Anchor:")
		target_anchor_text:SetPoint("LEFT", target_pos_y, "RIGHT", 5, 0)

		local target_anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_anchor", 110, LolzenUIcfg.unitframes["uf_target_anchor"])
		target_anchor:SetPoint("LEFT", target_anchor_text, "RIGHT", -10, -3)
		
		local target_header1 = ns.createHeader("uf_target_options", "Healthpoints")
		target_header1:SetPoint("TOPLEFT", target_pos_x_text, 0, -30)
		
		local target_hp_pos_x_text = ns.createFonstring("uf_target_options", "PosX:")
		target_hp_pos_x_text:SetPoint("TOPLEFT", target_header1, "BOTTOMLEFT", 0, -8)
		
		local target_hp_pos_x = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_posx"])
		target_hp_pos_x:SetPoint("LEFT", target_hp_pos_x_text, "RIGHT", 10, 0)
		
		local target_hp_pos_y_text = ns.createFonstring("uf_target_options", "PosY:")
		target_hp_pos_y_text:SetPoint("LEFT", target_hp_pos_x, "RIGHT", 5, 0)

		local target_hp_pos_y = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_posy"])
		target_hp_pos_y:SetPoint("LEFT", target_hp_pos_y_text, "RIGHT", 10, 0)
		
		local target_hp_anchor_text = ns.createFonstring("uf_target_options", "Anchor:")
		target_hp_anchor_text:SetPoint("LEFT", target_hp_pos_y, "RIGHT", 5, 0)

		local target_hp_anchor = ns.createPicker("uf_target_options", "anchor", "uf_target_hp_anchor", 110, LolzenUIcfg.unitframes["uf_target_hp_anchor"])
		target_hp_anchor:SetPoint("LEFT", target_hp_anchor_text, "RIGHT", -10, -3)
		
		local target_hp_font_text = ns.createFonstring("uf_target_options", "Font:")
		target_hp_font_text:SetPoint("TOPLEFT", target_hp_pos_x_text, 0, -25)
		
		local target_hp_font = ns.createPicker("uf_target_options", "font", "uf_target_hp_font", 120, LolzenUIcfg.unitframes["uf_target_hp_font"])
		target_hp_font:SetPoint("LEFT", target_hp_font_text, "RIGHT", -10, -3)
		
		local target_hp_font_size_text = ns.createFonstring("uf_target_options", "Font size:")
		target_hp_font_size_text:SetPoint("LEFT", target_hp_font, "RIGHT", -5, 3)

		local target_hp_font_size = ns.createInputbox("uf_target_options", 30, 20, LolzenUIcfg.unitframes["uf_target_hp_font_size"])
		target_hp_font_size:SetPoint("LEFT", target_hp_font_size_text, "RIGHT", 10, 0)

		local target_hp_font_flag_text = ns.createFonstring("uf_target_options", "Font flag:")
		target_hp_font_flag_text:SetPoint("LEFT", target_hp_font_size, "RIGHT", 10, 0)

		local target_hp_font_flag = ns.createPicker("uf_target_options", "flag", "uf_target_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_target_hp_font_flag"])
		target_hp_font_flag:SetPoint("LEFT", target_hp_font_flag_text, "RIGHT", -10, -3)
		
		-- // Create a subcategory panel for Targettarget // --
		ns.uf_targettarget_options = CreateFrame("Frame", "unitframe_targettargetpanel", ns["unitframes"])
		ns.uf_targettarget_options.name = "   Targettarget"
		ns.uf_targettarget_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_targettarget_options)

		local targettarget_title = ns.uf_targettarget_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		targettarget_title:SetPoint("TOPLEFT", ns.uf_targettarget_options, 16, -16)
		targettarget_title:SetText("|cff5599ffUnitframes module: Targettarget Options|r")
		
		local targettarget_pos_x_text = ns.createFonstring("uf_targettarget_options", "PosX:")
		targettarget_pos_x_text:SetPoint("TOPLEFT", targettarget_title, "BOTTOMLEFT", 0, -20)

		local targettarget_pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_posx"])
		targettarget_pos_x:SetPoint("LEFT", targettarget_pos_x_text, "RIGHT", 10, 0)

		local targettarget_pos_y_text = ns.createFonstring("uf_targettarget_options", "PosY:")
		targettarget_pos_y_text:SetPoint("LEFT", targettarget_pos_x, "RIGHT", 5, 0)

		local targettarget_pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_posy"])
		targettarget_pos_y:SetPoint("LEFT", targettarget_pos_y_text, "RIGHT", 10, 0)

		local targettarget_anchor_text = ns.createFonstring("uf_targettarget_options", "Anchor:")
		targettarget_anchor_text:SetPoint("LEFT", targettarget_pos_y, "RIGHT", 5, 0)

		local targettarget_anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_anchor", 110, LolzenUIcfg.unitframes["uf_targettarget_anchor"])
		targettarget_anchor:SetPoint("LEFT", targettarget_anchor_text, "RIGHT", -10, -3)
		
		local targettarget_header1 = ns.createHeader("uf_targettarget_options", "Healthpoints")
		targettarget_header1:SetPoint("TOPLEFT", targettarget_pos_x_text, 0, -30)
		
		local targettarget_hp_pos_x_text = ns.createFonstring("uf_targettarget_options", "PosX:")
		targettarget_hp_pos_x_text:SetPoint("TOPLEFT", targettarget_header1, "BOTTOMLEFT", 0, -8)
		
		local targettarget_hp_pos_x = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_posx"])
		targettarget_hp_pos_x:SetPoint("LEFT", targettarget_hp_pos_x_text, "RIGHT", 10, 0)
		
		local targettarget_hp_pos_y_text = ns.createFonstring("uf_targettarget_options", "PosY:")
		targettarget_hp_pos_y_text:SetPoint("LEFT", targettarget_hp_pos_x, "RIGHT", 5, 0)

		local targettarget_hp_pos_y = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_posy"])
		targettarget_hp_pos_y:SetPoint("LEFT", targettarget_hp_pos_y_text, "RIGHT", 10, 0)
		
		local targettarget_hp_anchor_text = ns.createFonstring("uf_targettarget_options", "Anchor:")
		targettarget_hp_anchor_text:SetPoint("LEFT", targettarget_hp_pos_y, "RIGHT", 5, 0)

		local targettarget_hp_anchor = ns.createPicker("uf_targettarget_options", "anchor", "uf_targettarget_hp_anchor", 110, LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"])
		targettarget_hp_anchor:SetPoint("LEFT", targettarget_hp_anchor_text, "RIGHT", -10, -3)
		
		local targettarget_hp_font_text = ns.createFonstring("uf_targettarget_options", "Font:")
		targettarget_hp_font_text:SetPoint("TOPLEFT", targettarget_hp_pos_x_text, 0, -25)
		
		local targettarget_hp_font = ns.createPicker("uf_targettarget_options", "font", "uf_targettarget_hp_font", 120, LolzenUIcfg.unitframes["uf_targettarget_hp_font"])
		targettarget_hp_font:SetPoint("LEFT", targettarget_hp_font_text, "RIGHT", -10, -3)
		
		local targettarget_hp_font_size_text = ns.createFonstring("uf_targettarget_options", "Font size:")
		targettarget_hp_font_size_text:SetPoint("LEFT", targettarget_hp_font, "RIGHT", -5, 3)

		local targettarget_hp_font_size = ns.createInputbox("uf_targettarget_options", 30, 20, LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"])
		targettarget_hp_font_size:SetPoint("LEFT", targettarget_hp_font_size_text, "RIGHT", 10, 0)

		local targettarget_hp_font_flag_text = ns.createFonstring("uf_targettarget_options", "Font flag:")
		targettarget_hp_font_flag_text:SetPoint("LEFT", targettarget_hp_font_size, "RIGHT", 10, 0)

		local targettarget_hp_font_flag = ns.createPicker("uf_targettarget_options", "flag", "uf_targettarget_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_targettarget_hp_font_flag"])
		targettarget_hp_font_flag:SetPoint("LEFT", targettarget_hp_font_flag_text, "RIGHT", -10, -3)
		
		-- // Create a subcategory panel for Party // --
		ns.uf_party_options = CreateFrame("Frame", "unitframe_partypanel", ns["unitframes"])
		ns.uf_party_options.name = "   Party"
		ns.uf_party_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_party_options)

		local party_title = ns.uf_party_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		party_title:SetPoint("TOPLEFT", ns.uf_party_options, 16, -16)
		party_title:SetText("|cff5599ffUnitframes module: Party Options|r")
		
		local party_title = ns.uf_party_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		party_title:SetPoint("TOPLEFT", ns.uf_party_options, 16, -16)
		party_title:SetText("|cff5599ffUnitframes module: party Options|r")
		
		local party_pos_x_text = ns.createFonstring("uf_party_options", "PosX:")
		party_pos_x_text:SetPoint("TOPLEFT", party_title, "BOTTOMLEFT", 0, -20)

		local party_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_posx"])
		party_pos_x:SetPoint("LEFT", party_pos_x_text, "RIGHT", 10, 0)

		local party_pos_y_text = ns.createFonstring("uf_party_options", "PosY:")
		party_pos_y_text:SetPoint("LEFT", party_pos_x, "RIGHT", 5, 0)

		local party_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_posy"])
		party_pos_y:SetPoint("LEFT", party_pos_y_text, "RIGHT", 10, 0)

		local party_anchor_text = ns.createFonstring("uf_party_options", "Anchor:")
		party_anchor_text:SetPoint("LEFT", party_pos_y, "RIGHT", 5, 0)

		local party_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_anchor", 110, LolzenUIcfg.unitframes["uf_party_anchor"])
		party_anchor:SetPoint("LEFT", party_anchor_text, "RIGHT", -10, -3)
		
		local party_header1 = ns.createHeader("uf_party_options", "Healthpoints")
		party_header1:SetPoint("TOPLEFT", party_pos_x_text, 0, -30)
		
		local party_hp_pos_x_text = ns.createFonstring("uf_party_options", "PosX:")
		party_hp_pos_x_text:SetPoint("TOPLEFT", party_header1, "BOTTOMLEFT", 0, -8)
		
		local party_hp_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posx"])
		party_hp_pos_x:SetPoint("LEFT", party_hp_pos_x_text, "RIGHT", 10, 0)
		
		local party_hp_pos_y_text = ns.createFonstring("uf_party_options", "PosY:")
		party_hp_pos_y_text:SetPoint("LEFT", party_hp_pos_x, "RIGHT", 5, 0)

		local party_hp_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posy"])
		party_hp_pos_y:SetPoint("LEFT", party_hp_pos_y_text, "RIGHT", 10, 0)
		
		local party_hp_anchor_text = ns.createFonstring("uf_party_options", "Anchor:")
		party_hp_anchor_text:SetPoint("LEFT", party_hp_pos_y, "RIGHT", 5, 0)

		local party_hp_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_hp_anchor", 110, LolzenUIcfg.unitframes["uf_party_hp_anchor"])
		party_hp_anchor:SetPoint("LEFT", party_hp_anchor_text, "RIGHT", -10, -3)
		
		local party_hp_font_text = ns.createFonstring("uf_party_options", "Font:")
		party_hp_font_text:SetPoint("TOPLEFT", party_hp_pos_x_text, 0, -25)
		
		local party_hp_font = ns.createPicker("uf_party_options", "font", "uf_party_hp_font", 120, LolzenUIcfg.unitframes["uf_party_hp_font"])
		party_hp_font:SetPoint("LEFT", party_hp_font_text, "RIGHT", -10, -3)
		
		local party_hp_font_size_text = ns.createFonstring("uf_party_options", "Font size:")
		party_hp_font_size_text:SetPoint("LEFT", party_hp_font, "RIGHT", -5, 3)

		local party_hp_font_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_font_size"])
		party_hp_font_size:SetPoint("LEFT", party_hp_font_size_text, "RIGHT", 10, 0)

		local party_hp_font_flag_text = ns.createFonstring("uf_party_options", "Font flag:")
		party_hp_font_flag_text:SetPoint("LEFT", party_hp_font_size, "RIGHT", 10, 0)

		local party_hp_font_flag = ns.createPicker("uf_party_options", "flag", "uf_party_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_party_hp_font_flag"])
		party_hp_font_flag:SetPoint("LEFT", party_hp_font_flag_text, "RIGHT", -10, -3)
		
		-- // Create a subcategory panel for Raid // --
		ns.uf_raid_options = CreateFrame("Frame", "unitframe_raidpanel", ns["unitframes"])
		ns.uf_raid_options.name = "   Raid"
		ns.uf_raid_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_raid_options)

		local raid_title = ns.uf_raid_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		raid_title:SetPoint("TOPLEFT", ns.uf_raid_options, 16, -16)
		raid_title:SetText("|cff5599ffUnitframes module: Raid Options|r")
		
		local raid_pos_x_text = ns.createFonstring("uf_raid_options", "PosX:")
		raid_pos_x_text:SetPoint("TOPLEFT", raid_title, "BOTTOMLEFT", 0, -20)

		local raid_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_posx"])
		raid_pos_x:SetPoint("LEFT", raid_pos_x_text, "RIGHT", 10, 0)

		local raid_pos_y_text = ns.createFonstring("uf_raid_options", "PosY:")
		raid_pos_y_text:SetPoint("LEFT", raid_pos_x, "RIGHT", 5, 0)

		local raid_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_posy"])
		raid_pos_y:SetPoint("LEFT", raid_pos_y_text, "RIGHT", 10, 0)

		local raid_anchor_text = ns.createFonstring("uf_raid_options", "Anchor:")
		raid_anchor_text:SetPoint("LEFT", raid_pos_y, "RIGHT", 5, 0)

		local raid_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_anchor", 110, LolzenUIcfg.unitframes["uf_raid_anchor"])
		raid_anchor:SetPoint("LEFT", raid_anchor_text, "RIGHT", -10, -3)
		
		local raid_header1 = ns.createHeader("uf_raid_options", "Healthpoints")
		raid_header1:SetPoint("TOPLEFT", raid_pos_x_text, 0, -30)
		
		local raid_hp_pos_x_text = ns.createFonstring("uf_raid_options", "PosX:")
		raid_hp_pos_x_text:SetPoint("TOPLEFT", raid_header1, "BOTTOMLEFT", 0, -8)
		
		local raid_hp_pos_x = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_posx"])
		raid_hp_pos_x:SetPoint("LEFT", raid_hp_pos_x_text, "RIGHT", 10, 0)
		
		local raid_hp_pos_y_text = ns.createFonstring("uf_raid_options", "PosY:")
		raid_hp_pos_y_text:SetPoint("LEFT", raid_hp_pos_x, "RIGHT", 5, 0)

		local raid_hp_pos_y = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_posy"])
		raid_hp_pos_y:SetPoint("LEFT", raid_hp_pos_y_text, "RIGHT", 10, 0)
		
		local raid_hp_anchor_text = ns.createFonstring("uf_raid_options", "Anchor:")
		raid_hp_anchor_text:SetPoint("LEFT", raid_hp_pos_y, "RIGHT", 5, 0)

		local raid_hp_anchor = ns.createPicker("uf_raid_options", "anchor", "uf_raid_hp_anchor", 110, LolzenUIcfg.unitframes["uf_raid_hp_anchor"])
		raid_hp_anchor:SetPoint("LEFT", raid_hp_anchor_text, "RIGHT", -10, -3)
		
		local raid_hp_font_text = ns.createFonstring("uf_raid_options", "Font:")
		raid_hp_font_text:SetPoint("TOPLEFT", raid_hp_pos_x_text, 0, -25)
		
		local raid_hp_font = ns.createPicker("uf_raid_options", "font", "uf_raid_hp_font", 120, LolzenUIcfg.unitframes["uf_raid_hp_font"])
		raid_hp_font:SetPoint("LEFT", raid_hp_font_text, "RIGHT", -10, -3)
		
		local raid_hp_font_size_text = ns.createFonstring("uf_raid_options", "Font size:")
		raid_hp_font_size_text:SetPoint("LEFT", raid_hp_font, "RIGHT", -5, 3)

		local raid_hp_font_size = ns.createInputbox("uf_raid_options", 30, 20, LolzenUIcfg.unitframes["uf_raid_hp_font_size"])
		raid_hp_font_size:SetPoint("LEFT", raid_hp_font_size_text, "RIGHT", 10, 0)

		local raid_hp_font_flag_text = ns.createFonstring("uf_raid_options", "Font flag:")
		raid_hp_font_flag_text:SetPoint("LEFT", raid_hp_font_size, "RIGHT", 10, 0)

		local raid_hp_font_flag = ns.createPicker("uf_raid_options", "flag", "uf_raid_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_raid_hp_font_flag"])
		raid_hp_font_flag:SetPoint("LEFT", raid_hp_font_flag_text, "RIGHT", -10, -3)
		
		-- // Create a subcategory panel for Pet // --
		ns.uf_pet_options = CreateFrame("Frame", "unitframe_petpanel", ns["unitframes"])
		ns.uf_pet_options.name = "   Pet"
		ns.uf_pet_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_pet_options)

		local pet_title = ns.uf_pet_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		pet_title:SetPoint("TOPLEFT", ns.uf_pet_options, 16, -16)
		pet_title:SetText("|cff5599ffUnitframes module: Pet Options|r")
		
		local pet_pos_x_text = ns.createFonstring("uf_pet_options", "PosX:")
		pet_pos_x_text:SetPoint("TOPLEFT", pet_title, "BOTTOMLEFT", 0, -20)

		local pet_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_posx"])
		pet_pos_x:SetPoint("LEFT", pet_pos_x_text, "RIGHT", 10, 0)

		local pet_pos_y_text = ns.createFonstring("uf_pet_options", "PosY:")
		pet_pos_y_text:SetPoint("LEFT", pet_pos_x, "RIGHT", 5, 0)

		local pet_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_posy"])
		pet_pos_y:SetPoint("LEFT", pet_pos_y_text, "RIGHT", 10, 0)

		local pet_anchor_text = ns.createFonstring("uf_pet_options", "Anchor:")
		pet_anchor_text:SetPoint("LEFT", pet_pos_y, "RIGHT", 5, 0)

		local pet_anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_anchor", 110, LolzenUIcfg.unitframes["uf_pet_anchor"])
		pet_anchor:SetPoint("LEFT", pet_anchor_text, "RIGHT", -10, -3)
		
		local pet_header1 = ns.createHeader("uf_pet_options", "Healthpoints")
		pet_header1:SetPoint("TOPLEFT", pet_pos_x_text, 0, -30)
		
		local pet_hp_pos_x_text = ns.createFonstring("uf_pet_options", "PosX:")
		pet_hp_pos_x_text:SetPoint("TOPLEFT", pet_header1, "BOTTOMLEFT", 0, -8)
		
		local pet_hp_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posx"])
		pet_hp_pos_x:SetPoint("LEFT", pet_hp_pos_x_text, "RIGHT", 10, 0)
		
		local pet_hp_pos_y_text = ns.createFonstring("uf_pet_options", "PosY:")
		pet_hp_pos_y_text:SetPoint("LEFT", pet_hp_pos_x, "RIGHT", 5, 0)

		local pet_hp_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posy"])
		pet_hp_pos_y:SetPoint("LEFT", pet_hp_pos_y_text, "RIGHT", 10, 0)
		
		local pet_hp_anchor_text = ns.createFonstring("uf_pet_options", "Anchor:")
		pet_hp_anchor_text:SetPoint("LEFT", pet_hp_pos_y, "RIGHT", 5, 0)

		local pet_hp_anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_hp_anchor", 110, LolzenUIcfg.unitframes["uf_pet_hp_anchor"])
		pet_hp_anchor:SetPoint("LEFT", pet_hp_anchor_text, "RIGHT", -10, -3)
		
		local pet_hp_font_text = ns.createFonstring("uf_pet_options", "Font:")
		pet_hp_font_text:SetPoint("TOPLEFT", pet_hp_pos_x_text, 0, -25)
		
		local pet_hp_font = ns.createPicker("uf_pet_options", "font", "uf_pet_hp_font", 120, LolzenUIcfg.unitframes["uf_pet_hp_font"])
		pet_hp_font:SetPoint("LEFT", pet_hp_font_text, "RIGHT", -10, -3)
		
		local pet_hp_font_size_text = ns.createFonstring("uf_pet_options", "Font size:")
		pet_hp_font_size_text:SetPoint("LEFT", pet_hp_font, "RIGHT", -5, 3)

		local pet_hp_font_size = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_font_size"])
		pet_hp_font_size:SetPoint("LEFT", pet_hp_font_size_text, "RIGHT", 10, 0)

		local pet_hp_font_flag_text = ns.createFonstring("uf_pet_options", "Font flag:")
		pet_hp_font_flag_text:SetPoint("LEFT", pet_hp_font_size, "RIGHT", 10, 0)

		local pet_hp_font_flag = ns.createPicker("uf_pet_options", "flag", "uf_pet_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_pet_hp_font_flag"])
		pet_hp_font_flag:SetPoint("LEFT", pet_hp_font_flag_text, "RIGHT", -10, -3)
		
		ns["unitframes"].okay = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_use_sivalue"] = cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_statusbar_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUIcfg.unitframes["uf_border"] = UIDropDownMenu_GetSelectedName(border)
			LolzenUIcfg.unitframes["uf_ri_size"] = tonumber(rt_size:GetText())
			LolzenUIcfg.unitframes["uf_ri_posx"] = tonumber(rt_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_ri_posy"] = tonumber(rt_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(rt_anchor)]
			LolzenUIcfg.unitframes["uf_lead_size"] = tonumber(lead_size:GetText())
			LolzenUIcfg.unitframes["uf_lead_posx"] = tonumber(lead_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_lead_posy"] = tonumber(lead_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_lead_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(lead_anchor)]
			LolzenUIcfg.unitframes["uf_fade_outofreach"] = cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(fadeout_alpha)])
		end
		
		ns["unitframes"].default = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = false
			LolzenUIcfg.unitframes["uf_use_sivalue"] = true
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
			ReloadUI()
		end
		
		ns["uf_player_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_player_posx"] = tonumber(player_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_posy"] = tonumber(player_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(player_anchor)]
			LolzenUIcfg.unitframes["uf_player_hp_font"] = UIDropDownMenu_GetSelectedName(player_hp_font)
			LolzenUIcfg.unitframes["uf_player_hp_font_size"] = tonumber(player_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_player_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(player_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_player_hp_posx"] = tonumber(player_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_player_hp_posy"] = tonumber(player_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_player_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(player_hp_anchor)]
		end
		
		ns["uf_player_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_player_posx"] = -250
			LolzenUIcfg.unitframes["uf_player_posy"] = -200
			LolzenUIcfg.unitframes["uf_player_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_player_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_player_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_player_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_player_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_player_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_player_hp_anchor"] = "RIGHT"
			ReloadUI()
		end
		
		ns["uf_target_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_target_posx"] = tonumber(target_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_posy"] = tonumber(target_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(target_anchor)]
			LolzenUIcfg.unitframes["uf_target_hp_font"] = UIDropDownMenu_GetSelectedName(target_hp_font)
			LolzenUIcfg.unitframes["uf_target_hp_font_size"] = tonumber(target_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(target_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_target_hp_posx"] = tonumber(target_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_posy"] = tonumber(target_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_target_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(target_hp_anchor)]
		end
		
		ns["uf_target_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_target_posx"] = 250
			LolzenUIcfg.unitframes["uf_target_posy"] = -200
			LolzenUIcfg.unitframes["uf_target_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_target_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_target_hp_font_size"] = 24
			LolzenUIcfg.unitframes["uf_target_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_target_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_target_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_target_hp_anchor"] = "RIGHT"
			ReloadUI()
		end
		
		ns["uf_targettarget_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_targettarget_posx"] = tonumber(targettarget_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_posy"] = tonumber(targettarget_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(targettarget_anchor)]
			LolzenUIcfg.unitframes["uf_targettarget_hp_font"] = UIDropDownMenu_GetSelectedName(targettarget_hp_font)
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"] = tonumber(targettarget_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(targettarget_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_targettarget_hp_posx"] = tonumber(targettarget_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_hp_posy"] = tonumber(targettarget_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(targettarget_hp_anchor)]
		end
		
		ns["uf_targettarget_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_targettarget_posx"] = 300
			LolzenUIcfg.unitframes["uf_targettarget_posy"] = -177
			LolzenUIcfg.unitframes["uf_targettarget_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_targettarget_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_targettarget_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_targettarget_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_targettarget_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_targettarget_hp_anchor"] = "RIGHT"
			ReloadUI()
		end
		
		ns["uf_party_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_party_posx"] = tonumber(party_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_posy"] = tonumber(party_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(party_anchor)]
			LolzenUIcfg.unitframes["uf_party_hp_font"] = UIDropDownMenu_GetSelectedName(party_hp_font)
			LolzenUIcfg.unitframes["uf_party_hp_font_size"] = tonumber(party_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(party_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_party_hp_posx"] = tonumber(party_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_posy"] = tonumber(party_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(party_hp_anchor)]
		end
		
		ns["uf_party_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_party_posx"] = 0
			LolzenUIcfg.unitframes["uf_party_posy"] = 140
			LolzenUIcfg.unitframes["uf_party_anchor"] = "BOTTOM"
			LolzenUIcfg.unitframes["uf_party_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_party_hp_font_size"] = 13
			LolzenUIcfg.unitframes["uf_party_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_party_hp_posx"] = 5
			LolzenUIcfg.unitframes["uf_party_hp_posy"] = 0
			LolzenUIcfg.unitframes["uf_party_hp_anchor"] = "LEFT"
			ReloadUI()
		end
		
		ns["uf_raid_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_raid_posx"] = tonumber(raid_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_raid_posy"] = tonumber(raid_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_raid_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(raid_anchor)]
			LolzenUIcfg.unitframes["uf_raid_hp_font"] = UIDropDownMenu_GetSelectedName(raid_hp_font)
			LolzenUIcfg.unitframes["uf_raid_hp_font_size"] = tonumber(raid_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_raid_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(raid_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_raid_hp_posx"] = tonumber(raid_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_raid_hp_posy"] = tonumber(raid_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_raid_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(raid_hp_anchor)]
		end
		
		ns["uf_raid_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_raid_posx"] = 20
			LolzenUIcfg.unitframes["uf_raid_posy"] = 0
			LolzenUIcfg.unitframes["uf_raid_anchor"] = "LEFT"
			LolzenUIcfg.unitframes["uf_raid_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_raid_hp_font_size"] = 13
			LolzenUIcfg.unitframes["uf_raid_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_raid_hp_posx"] = 5
			LolzenUIcfg.unitframes["uf_raid_hp_posy"] = 0
			LolzenUIcfg.unitframes["uf_raid_hp_anchor"] = "LEFT"
			ReloadUI()
		end
		
		ns["uf_pet_options"].okay = function(self)
			LolzenUIcfg.unitframes["uf_pet_posx"] = tonumber(pet_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_posy"] = tonumber(pet_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pet_anchor)]
			LolzenUIcfg.unitframes["uf_pet_hp_font"] = UIDropDownMenu_GetSelectedName(pet_hp_font)
			LolzenUIcfg.unitframes["uf_pet_hp_font_size"] = tonumber(pet_hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(pet_hp_font_flag)]
			LolzenUIcfg.unitframes["uf_pet_hp_posx"] = tonumber(pet_hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_posy"] = tonumber(pet_hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(pet_hp_anchor)]
		end
		
		ns["uf_pet_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_pet_posx"] = -300
			LolzenUIcfg.unitframes["uf_pet_posy"] = -177
			LolzenUIcfg.unitframes["uf_pet_anchor"] = "CENTER"
			LolzenUIcfg.unitframes["uf_pet_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_pet_hp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_pet_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_pet_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_pet_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_pet_hp_anchor"] = "RIGHT"
			ReloadUI()
		end
	end
end)