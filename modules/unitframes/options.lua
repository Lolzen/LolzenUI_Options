--// options for unitframes //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		ns.unitframes.title = ns.createTitle("unitframes")

		ns.unitframes.about = ns.createDescription("unitframes", "Unitframes")
		ns.unitframes.about:SetPoint("TOPLEFT", ns.unitframes.title, "BOTTOMLEFT", 0, -8)
		
		ns.unitframes.cb1 = ns.createCheckBox("unitframes", "uf_hp_perc", "|cff5599ffuse hp percentage|r", LolzenUIcfg.unitframes["uf_use_hp_percent"])
		ns.unitframes.cb1:SetPoint("TOPLEFT", ns.unitframes.about, "BOTTOMLEFT", 0, -20)
		
		ns.unitframes.cb2 = ns.createCheckBox("unitframes", "uf_siVal", "|cff5599ffuse short values (34m5, 3k2, etc)|r", LolzenUIcfg.unitframes["uf_use_sivalue"])
		ns.unitframes.cb2:SetPoint("TOPLEFT", ns.unitframes.cb1, "BOTTOMLEFT", 0, -0)
		
		ns.unitframes.cb1:SetScript("OnClick", function(self)
			if ns.unitframes.cb1:GetChecked() == true then
				ns.unitframes.cb2:Disable()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
			else
				ns.unitframes.cb2:Enable()
				uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r")
			end
		end)

		if ns.unitframes.cb1:GetChecked() == true then
			ns.unitframes.cb2:Disable()
			uf_siValText:SetText("|cff5599ffuse short values (34m5, 3k2, etc)|r |cffff5555disable hp percentage for this option|r")
		else
			ns.unitframes.cb2:Enable()
		end
		
		ns.unitframes.texture_text = ns.createFonstring("unitframes", "Texture:")
		ns.unitframes.texture_text:SetPoint("TOPLEFT", ns.unitframes.cb2, "BOTTOMLEFT", 0, -15)

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
		
		ns.unitframes.cb3 = ns.createCheckBox("unitframes", "uf_fadeout", "|cff5599fffadeout out of reach unitframes|r", LolzenUIcfg.unitframes["uf_fade_outofreach"])
		ns.unitframes.cb3:SetPoint("TOPLEFT", ns.unitframes.header3, "BOTTOMLEFT", 0, -8)
		
		ns.unitframes.fadeout_alpha_text = ns.createFonstring("unitframes", "out of reach alpha (party/raid members):")
		ns.unitframes.fadeout_alpha_text:SetPoint("TOPLEFT", ns.unitframes.cb3, "BOTTOMLEFT", 0, -8)

		ns.unitframes.fadeout_alpha = ns.createPicker("unitframes", "alpha", "uf_fadout_alpha", 45, LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"])
		ns.unitframes.fadeout_alpha:SetPoint("LEFT", ns.unitframes.fadeout_alpha_text, "RIGHT", -10, -3)
		
		ns.unitframes.header4 = ns.createHeader("unitframes", "Power Colors")
		ns.unitframes.header4:SetPoint("TOPLEFT", ns.unitframes.fadeout_alpha_text, "BOTTOMLEFT", 0, -30)
		
		ns.unitframes.power_color_mana_text = ns.createFonstring("unitframes", "Mana:")
		ns.unitframes.power_color_mana_text:SetPoint("TOPLEFT", ns.unitframes.header4, "BOTTOMLEFT", 0, -8)

		ns.unitframes.power_color_mana = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["0"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_mana:SetPoint("LEFT", ns.unitframes.power_color_mana_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_mana_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_mana, LolzenUIcfg.unitframes["uf_power_colors"]["0"])
		ns.unitframes.power_color_mana_f:SetAllPoints(ns.unitframes.power_color_mana)
		
		ns.unitframes.power_color_rage_text = ns.createFonstring("unitframes", "Rage:")
		ns.unitframes.power_color_rage_text:SetPoint("LEFT", ns.unitframes.power_color_mana, "RIGHT", 10, 0)

		ns.unitframes.power_color_rage = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["1"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_rage:SetPoint("LEFT", ns.unitframes.power_color_rage_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_rage_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_rage, LolzenUIcfg.unitframes["uf_power_colors"]["1"])
		ns.unitframes.power_color_rage_f:SetAllPoints(ns.unitframes.power_color_rage)
		
		ns.unitframes.power_color_focus_text = ns.createFonstring("unitframes", "Focus:")
		ns.unitframes.power_color_focus_text:SetPoint("LEFT", ns.unitframes.power_color_rage, "RIGHT", 10, 0)

		ns.unitframes.power_color_focus = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["2"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_focus:SetPoint("LEFT", ns.unitframes.power_color_focus_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_focus_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_focus, LolzenUIcfg.unitframes["uf_power_colors"]["2"])
		ns.unitframes.power_color_focus_f:SetAllPoints(ns.unitframes.power_color_focus)
		
		ns.unitframes.power_color_energy_text = ns.createFonstring("unitframes", "Energy:")
		ns.unitframes.power_color_energy_text:SetPoint("LEFT", ns.unitframes.power_color_focus, "RIGHT", 10, 0)

		ns.unitframes.power_color_energy = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["3"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_energy:SetPoint("LEFT", ns.unitframes.power_color_energy_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_energy_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_energy, LolzenUIcfg.unitframes["uf_power_colors"]["3"])
		ns.unitframes.power_color_energy_f:SetAllPoints(ns.unitframes.power_color_energy)
		
		ns.unitframes.power_color_cp_text = ns.createFonstring("unitframes", "Combo Points:")
		ns.unitframes.power_color_cp_text:SetPoint("TOPLEFT", ns.unitframes.power_color_mana_text, "BOTTOMLEFT", 0, -8)
		
		ns.unitframes.power_color_cp = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["4"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_cp:SetPoint("LEFT", ns.unitframes.power_color_cp_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_cp_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_cp, LolzenUIcfg.unitframes["uf_power_colors"]["4"])
		ns.unitframes.power_color_cp_f:SetAllPoints(ns.unitframes.power_color_cp)
		
		ns.unitframes.power_color_runes_text = ns.createFonstring("unitframes", "Runes:")
		ns.unitframes.power_color_runes_text:SetPoint("LEFT", ns.unitframes.power_color_cp, "RIGHT", 10, 0)

		ns.unitframes.power_color_runes = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["5"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_runes:SetPoint("LEFT", ns.unitframes.power_color_runes_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_runes_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_runes, LolzenUIcfg.unitframes["uf_power_colors"]["5"])
		ns.unitframes.power_color_runes_f:SetAllPoints(ns.unitframes.power_color_runes)
		
		ns.unitframes.power_color_rp_text = ns.createFonstring("unitframes", "Runic Power:")
		ns.unitframes.power_color_rp_text:SetPoint("LEFT", ns.unitframes.power_color_runes, "RIGHT", 10, 0)

		ns.unitframes.power_color_rp = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["6"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_rp:SetPoint("LEFT", ns.unitframes.power_color_rp_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_rp_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_rp, LolzenUIcfg.unitframes["uf_power_colors"]["6"])
		ns.unitframes.power_color_rp_f:SetAllPoints(ns.unitframes.power_color_rp)
		
		ns.unitframes.power_color_soulshards_text = ns.createFonstring("unitframes", "Soul Shards:")
		ns.unitframes.power_color_soulshards_text:SetPoint("LEFT", ns.unitframes.power_color_rp, "RIGHT", 10, 0)

		ns.unitframes.power_color_soulshards = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["7"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_soulshards:SetPoint("LEFT", ns.unitframes.power_color_soulshards_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_soulshards_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_soulshards, LolzenUIcfg.unitframes["uf_power_colors"]["7"])
		ns.unitframes.power_color_soulshards_f:SetAllPoints(ns.unitframes.power_color_soulshards)
		
		ns.unitframes.power_color_lp_text = ns.createFonstring("unitframes", "Lunar Power:")
		ns.unitframes.power_color_lp_text:SetPoint("TOPLEFT", ns.unitframes.power_color_cp_text, "BOTTOMLEFT", 0, -8)

		ns.unitframes.power_color_lp = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["8"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_lp:SetPoint("LEFT", ns.unitframes.power_color_lp_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_lp_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_lp, LolzenUIcfg.unitframes["uf_power_colors"]["8"])
		ns.unitframes.power_color_lp_f:SetAllPoints(ns.unitframes.power_color_lp)
		
		ns.unitframes.power_color_hp_text = ns.createFonstring("unitframes", "Holy Power:")
		ns.unitframes.power_color_hp_text:SetPoint("LEFT", ns.unitframes.power_color_lp, "RIGHT", 10, 0)

		ns.unitframes.power_color_hp = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["9"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_hp:SetPoint("LEFT", ns.unitframes.power_color_hp_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_hp_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_hp, LolzenUIcfg.unitframes["uf_power_colors"]["9"])
		ns.unitframes.power_color_hp_f:SetAllPoints(ns.unitframes.power_color_hp)
		
		ns.unitframes.power_color_maelstrom_text = ns.createFonstring("unitframes", "Maelstrom:")
		ns.unitframes.power_color_maelstrom_text:SetPoint("LEFT", ns.unitframes.power_color_hp, "RIGHT", 10, 0)

		ns.unitframes.power_color_maelstrom = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["11"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_maelstrom:SetPoint("LEFT", ns.unitframes.power_color_maelstrom_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_maelstrom_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_maelstrom, LolzenUIcfg.unitframes["uf_power_colors"]["11"])
		ns.unitframes.power_color_maelstrom_f:SetAllPoints(ns.unitframes.power_color_maelstrom)
		
		ns.unitframes.power_color_chi_text = ns.createFonstring("unitframes", "Chi:")
		ns.unitframes.power_color_chi_text:SetPoint("LEFT", ns.unitframes.power_color_maelstrom, "RIGHT", 10, 0)

		ns.unitframes.power_color_chi = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["12"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_chi:SetPoint("LEFT", ns.unitframes.power_color_chi_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_chi_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_chi, LolzenUIcfg.unitframes["uf_power_colors"]["12"])
		ns.unitframes.power_color_chi_f:SetAllPoints(ns.unitframes.power_color_chi)
		
		ns.unitframes.power_color_insanity_text = ns.createFonstring("unitframes", "Insanity:")
		ns.unitframes.power_color_insanity_text:SetPoint("TOPLEFT", ns.unitframes.power_color_lp_text, "BOTTOMLEFT", 0, -8)

		ns.unitframes.power_color_insanity = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["13"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_insanity:SetPoint("LEFT", ns.unitframes.power_color_insanity_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_insanity_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_insanity, LolzenUIcfg.unitframes["uf_power_colors"]["13"])
		ns.unitframes.power_color_insanity_f:SetAllPoints(ns.unitframes.power_color_insanity)
		
		ns.unitframes.power_color_ac_text = ns.createFonstring("unitframes", "Arcane Charges:")
		ns.unitframes.power_color_ac_text:SetPoint("LEFT", ns.unitframes.power_color_insanity, "RIGHT", 10, 0)

		ns.unitframes.power_color_ac = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["16"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_ac:SetPoint("LEFT", ns.unitframes.power_color_ac_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_ac_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_ac, LolzenUIcfg.unitframes["uf_power_colors"]["16"])
		ns.unitframes.power_color_ac_f:SetAllPoints(ns.unitframes.power_color_ac)
		
		ns.unitframes.power_color_fury_text = ns.createFonstring("unitframes", "Fury:")
		ns.unitframes.power_color_fury_text:SetPoint("LEFT", ns.unitframes.power_color_ac, "RIGHT", 10, 0)

		ns.unitframes.power_color_fury = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["17"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_fury:SetPoint("LEFT", ns.unitframes.power_color_fury_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_fury_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_fury, LolzenUIcfg.unitframes["uf_power_colors"]["17"])
		ns.unitframes.power_color_fury_f:SetAllPoints(ns.unitframes.power_color_fury)
		
		ns.unitframes.power_color_pain_text = ns.createFonstring("unitframes", "Pain:")
		ns.unitframes.power_color_pain_text:SetPoint("LEFT", ns.unitframes.power_color_fury, "RIGHT", 10, 0)

		ns.unitframes.power_color_pain = ns.createColorTexture("unitframes", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"]["18"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ns.unitframes.power_color_pain:SetPoint("LEFT", ns.unitframes.power_color_pain_text, "RIGHT", 10, 0)

		ns.unitframes.power_color_pain_f = ns.createColorPicker("unitframes", ns.unitframes.power_color_pain, LolzenUIcfg.unitframes["uf_power_colors"]["18"])
		ns.unitframes.power_color_pain_f:SetAllPoints(ns.unitframes.power_color_pain)
		
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
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = ns.unitframes.cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_use_sivalue"] = ns.unitframes.cb2:GetChecked()
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
			LolzenUIcfg.unitframes["uf_fade_outofreach"] = ns.unitframes.cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_fade_outofreach_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(ns.unitframes.fadeout_alpha)])
			LolzenUIcfg.unitframes["uf_power_colors"]["0"] = {ns.unitframes.power_color_mana:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["1"] = {ns.unitframes.power_color_rage:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["2"] = {ns.unitframes.power_color_focus:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["3"] = {ns.unitframes.power_color_energy:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["4"] = {ns.unitframes.power_color_cp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["5"] = {ns.unitframes.power_color_runes:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["6"] = {ns.unitframes.power_color_rp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["7"] = {ns.unitframes.power_color_soulshards:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["8"] = {ns.unitframes.power_color_lp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["9"] = {ns.unitframes.power_color_hp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["11"] = {ns.unitframes.power_color_maelstrom:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["12"] = {ns.unitframes.power_color_chi:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["13"] = {ns.unitframes.power_color_insanity:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["16"] = {ns.unitframes.power_color_ac:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["17"] = {ns.unitframes.power_color_fury:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"]["18"] = {ns.unitframes.power_color_pain:GetVertexColor()}
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