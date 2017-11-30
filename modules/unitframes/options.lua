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
		
		-- // Create a subcategory panel for Target // --
		ns.uf_target_options = CreateFrame("Frame", "unitframe_targetpanel", ns["unitframes"])
		ns.uf_target_options.name = "   Target"
		ns.uf_target_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_target_options)

		local target_title = ns.uf_target_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		target_title:SetPoint("TOPLEFT", ns.uf_target_options, 16, -16)
		target_title:SetText("|cff5599ffUnitframes module: Target Options|r")
		
		-- // Create a subcategory panel for Targettarget // --
		ns.uf_targettarget_options = CreateFrame("Frame", "unitframe_targettargetpanel", ns["unitframes"])
		ns.uf_targettarget_options.name = "   Targettarget"
		ns.uf_targettarget_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_targettarget_options)

		local targettarget_title = ns.uf_targettarget_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		targettarget_title:SetPoint("TOPLEFT", ns.uf_targettarget_options, 16, -16)
		targettarget_title:SetText("|cff5599ffUnitframes module: Targettarget Options|r")
		
		-- // Create a subcategory panel for Party // --
		ns.uf_party_options = CreateFrame("Frame", "unitframe_partypanel", ns["unitframes"])
		ns.uf_party_options.name = "   Party"
		ns.uf_party_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_party_options)

		local party_title = ns.uf_party_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		party_title:SetPoint("TOPLEFT", ns.uf_party_options, 16, -16)
		party_title:SetText("|cff5599ffUnitframes module: Party Options|r")
		
		-- // Create a subcategory panel for Raid // --
		ns.uf_raid_options = CreateFrame("Frame", "unitframe_raidpanel", ns["unitframes"])
		ns.uf_raid_options.name = "   Raid"
		ns.uf_raid_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_raid_options)

		local raid_title = ns.uf_raid_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		raid_title:SetPoint("TOPLEFT", ns.uf_raid_options, 16, -16)
		raid_title:SetText("|cff5599ffUnitframes module: Raid Options|r")
		
		-- // Create a subcategory panel for Pet // --
		ns.uf_pet_options = CreateFrame("Frame", "unitframe_petpanel", ns["unitframes"])
		ns.uf_pet_options.name = "   Pet"
		ns.uf_pet_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_pet_options)

		local pet_title = ns.uf_pet_options:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
		pet_title:SetPoint("TOPLEFT", ns.uf_pet_options, 16, -16)
		pet_title:SetText("|cff5599ffUnitframes module: Pet Options|r")
		
		ns["unitframes"].okay = function(self)
			LolzenUIcfg.unitframes["uf_use_hp_percent"] = cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_use_sivalue"] = cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_statusbar_texture"] = UIDropDownMenu_GetSelectedName(texture)
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
		end
		
		ns["uf_player_options"].default = function(self)
			ReloadUI()
		end
		
		ns["uf_target_options"].okay = function(self)
		end
		
		ns["uf_target_options"].default = function(self)
			ReloadUI()
		end
		
		ns["uf_targettarget_options"].okay = function(self)
		end
		
		ns["uf_targettarget_options"].default = function(self)
			ReloadUI()
		end
		
		ns["uf_party_options"].okay = function(self)
		end
		
		ns["uf_party_options"].default = function(self)
			ReloadUI()
		end
		
		ns["uf_raid_options"].okay = function(self)
		end
		
		ns["uf_raid_options"].default = function(self)
			ReloadUI()
		end
		
		ns["uf_pet_options"].okay = function(self)
		end
		
		ns["uf_pet_options"].default = function(self)
			ReloadUI()
		end
	end
end)