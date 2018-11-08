local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- // Create a subcategory panel for Power Colors // --
		ns.uf_powercolor_options = CreateFrame("Frame", "unitframe_bosspanel", ns["unitframes"])
		ns.uf_powercolor_options.name = "   Power Colors"
		ns.uf_powercolor_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_powercolor_options)

		local title = ns.createTitle("uf_powercolor_options", "Unitframes module: Power Colors")

		local mana_text = ns.createFontstring("uf_powercolor_options", "Mana:")
		mana_text:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)

		local mana = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][0], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		mana:SetPoint("LEFT", mana_text, "RIGHT", 62, 0)

		local mana_f = ns.createColorPicker("uf_powercolor_options", mana, LolzenUIcfg.unitframes["uf_power_colors"][0])
		mana_f:SetAllPoints(mana)

		local rage_text = ns.createFontstring("uf_powercolor_options", "Rage:")
		rage_text:SetPoint("TOPLEFT", mana_text, "BOTTOMLEFT", 0, -10)

		local rage = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][1], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		rage:SetPoint("LEFT", rage_text, "RIGHT", 65, 0)

		local rage_f = ns.createColorPicker("uf_powercolor_options", rage, LolzenUIcfg.unitframes["uf_power_colors"][1])
		rage_f:SetAllPoints(rage)

		local focus_text = ns.createFontstring("uf_powercolor_options", "Focus:")
		focus_text:SetPoint("TOPLEFT", rage_text, "BOTTOMLEFT", 0, -10)

		local focus = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][2], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		focus:SetPoint("LEFT", focus_text, "RIGHT", 62, 0)

		local focus_f = ns.createColorPicker("uf_powercolor_options", focus, LolzenUIcfg.unitframes["uf_power_colors"][2])
		focus_f:SetAllPoints(focus)

		local energy_text = ns.createFontstring("uf_powercolor_options", "Energy:")
		energy_text:SetPoint("TOPLEFT", focus_text, "BOTTOMLEFT", 0, -10)

		local energy = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][3], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		energy:SetPoint("LEFT", energy_text, "RIGHT", 56, 0)

		local energy_f = ns.createColorPicker("uf_powercolor_options", energy, LolzenUIcfg.unitframes["uf_power_colors"][3])
		energy_f:SetAllPoints(energy)

		local cp_text = ns.createFontstring("uf_powercolor_options", "Combo Points:")
		cp_text:SetPoint("TOPLEFT", energy_text, "BOTTOMLEFT", 0, -10)

		local cp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][4], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		cp:SetPoint("LEFT", cp_text, "RIGHT", 20, 0)

		local cp_f = ns.createColorPicker("uf_powercolor_options", cp, LolzenUIcfg.unitframes["uf_power_colors"][4])
		cp_f:SetAllPoints(cp)

		local runes_text = ns.createFontstring("uf_powercolor_options", "Runes:")
		runes_text:SetPoint("TOPLEFT", cp_text, "BOTTOMLEFT", 0, -10)

		local runes = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][5], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		runes:SetPoint("LEFT", runes_text, "RIGHT", 61, 0)

		local runes_f = ns.createColorPicker("uf_powercolor_options", runes, LolzenUIcfg.unitframes["uf_power_colors"][5])
		runes_f:SetAllPoints(runes)

		local rp_text = ns.createFontstring("uf_powercolor_options", "Runic Power:")
		rp_text:SetPoint("TOPLEFT", runes_text, "BOTTOMLEFT", 0, -10)

		local rp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][6], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		rp:SetPoint("LEFT", rp_text, "RIGHT", 28, 0)

		local rp_f = ns.createColorPicker("uf_powercolor_options", rp, LolzenUIcfg.unitframes["uf_power_colors"][6])
		rp_f:SetAllPoints(rp)

		local soulshards_text = ns.createFontstring("uf_powercolor_options", "Soul Shards:")
		soulshards_text:SetPoint("TOPLEFT", rp_text, "BOTTOMLEFT", 0, -10)

		local soulshards = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][7], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		soulshards:SetPoint("LEFT", soulshards_text, "RIGHT", 32, 0)

		local soulshards_f = ns.createColorPicker("uf_powercolor_options", soulshards, LolzenUIcfg.unitframes["uf_power_colors"][7])
		soulshards_f:SetAllPoints(soulshards)

		local lp_text = ns.createFontstring("uf_powercolor_options", "Lunar Power:")
		lp_text:SetPoint("TOPLEFT", soulshards_text, "BOTTOMLEFT", 0, -10)

		local lp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][8], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		lp:SetPoint("LEFT", lp_text, "RIGHT", 28, 0)

		local lp_f = ns.createColorPicker("uf_powercolor_options", lp, LolzenUIcfg.unitframes["uf_power_colors"][8])
		lp_f:SetAllPoints(lp)

		local hp_text = ns.createFontstring("uf_powercolor_options", "Holy Power:")
		hp_text:SetPoint("TOPLEFT", lp_text, "BOTTOMLEFT", 0, -10)

		local hp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][9], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		hp:SetPoint("LEFT", hp_text, "RIGHT", 32, 0)

		local hp_f = ns.createColorPicker("uf_powercolor_options", hp, LolzenUIcfg.unitframes["uf_power_colors"][9])
		hp_f:SetAllPoints(hp)

		local maelstrom_text = ns.createFontstring("uf_powercolor_options", "Maelstrom:")
		maelstrom_text:SetPoint("TOPLEFT", hp_text, "BOTTOMLEFT", 0, -10)

		local maelstrom = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][11], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		maelstrom:SetPoint("LEFT", maelstrom_text, "RIGHT", 35, 0)

		local maelstrom_f = ns.createColorPicker("uf_powercolor_options", maelstrom, LolzenUIcfg.unitframes["uf_power_colors"][11])
		maelstrom_f:SetAllPoints(maelstrom)

		local chi_text = ns.createFontstring("uf_powercolor_options", "Chi:")
		chi_text:SetPoint("TOPLEFT", maelstrom_text, "BOTTOMLEFT", 0, -10)

		local chi = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][12], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		chi:SetPoint("LEFT", chi_text, "RIGHT", 75, 0)

		local chi_f = ns.createColorPicker("uf_powercolor_options", chi, LolzenUIcfg.unitframes["uf_power_colors"][12])
		chi_f:SetAllPoints(chi)

		local insanity_text = ns.createFontstring("uf_powercolor_options", "Insanity:")
		insanity_text:SetPoint("TOPLEFT", chi_text, "BOTTOMLEFT", 0, -10)

		local insanity = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][13], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		insanity:SetPoint("LEFT", insanity_text, "RIGHT", 51, 0)

		local insanity_f = ns.createColorPicker("uf_powercolor_options", insanity, LolzenUIcfg.unitframes["uf_power_colors"][13])
		insanity_f:SetAllPoints(insanity)

		local ac_text = ns.createFontstring("uf_powercolor_options", "Arcane Charges:")
		ac_text:SetPoint("TOPLEFT", insanity_text, "BOTTOMLEFT", 0, -10)

		local ac = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][16], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		ac:SetPoint("LEFT", ac_text, "RIGHT", 11, 0)

		local ac_f = ns.createColorPicker("uf_powercolor_options", ac, LolzenUIcfg.unitframes["uf_power_colors"][16])
		ac_f:SetAllPoints(ac)

		local fury_text = ns.createFontstring("uf_powercolor_options", "Fury:")
		fury_text:SetPoint("TOPLEFT", ac_text, "BOTTOMLEFT", 0, -10)

		local fury = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][17], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		fury:SetPoint("LEFT", fury_text, "RIGHT", 70, 0)

		local fury_f = ns.createColorPicker("uf_powercolor_options", fury, LolzenUIcfg.unitframes["uf_power_colors"][17])
		fury_f:SetAllPoints(fury)

		local pain_text = ns.createFontstring("uf_powercolor_options", "Pain:")
		pain_text:SetPoint("TOPLEFT", fury_text, "BOTTOMLEFT", 0, -10)

		local pain = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes["uf_power_colors"][18], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		pain:SetPoint("LEFT", pain_text, "RIGHT", 70, 0)

		local pain_f = ns.createColorPicker("uf_powercolor_options", pain, LolzenUIcfg.unitframes["uf_power_colors"][18])
		pain_f:SetAllPoints(pain)

		local applyButton = ns.createApplyButton("uf_powercolor_options")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.unitframes["uf_power_colors"][0] = {mana:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][1] = {rage:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][2] = {focus:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][3] = {energy:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][4] = {cp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][5] = {runes:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][6] = {rp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][7] = {soulshards:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][8] = {lp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][9] = {hp:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][11] = {maelstrom:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][12] = {chi:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][13] = {insanity:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][16] = {ac:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][17] = {fury:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_power_colors"][18] = {pain:GetVertexColor()}
			ReloadUI()
		end)

		ns["uf_powercolor_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_power_colors"][0] = {48/255, 113/255, 191/255}
			LolzenUIcfg.unitframes["uf_power_colors"][1] = {1, 0, 0}
			LolzenUIcfg.unitframes["uf_power_colors"][2] = {255/255, 178/255, 0}
			LolzenUIcfg.unitframes["uf_power_colors"][3] = {1.00, 1.00, 34/255}
			LolzenUIcfg.unitframes["uf_power_colors"][4] = {1.00, 0.96, 0.41}
			LolzenUIcfg.unitframes["uf_power_colors"][5] = {0.50, 0.50, 0.50}
			LolzenUIcfg.unitframes["uf_power_colors"][6] = {0.00, 0.82, 1.00}
			LolzenUIcfg.unitframes["uf_power_colors"][7] = {0.50, 0.32, 0.55}
			LolzenUIcfg.unitframes["uf_power_colors"][8] = {0.30, 0.52, 0.90}
			LolzenUIcfg.unitframes["uf_power_colors"][9] = {0.95, 0.90, 0.60}
			LolzenUIcfg.unitframes["uf_power_colors"][11] = {51/255, 181/255, 229/225}
			LolzenUIcfg.unitframes["uf_power_colors"][12] = {0.71, 1.00, 0.92}
			LolzenUIcfg.unitframes["uf_power_colors"][13] = {0.84, 0.1, 0.87}
			LolzenUIcfg.unitframes["uf_power_colors"][16] = {0.10, 0.10, 0.98}
			LolzenUIcfg.unitframes["uf_power_colors"][17] = {0.788, 0.259, 0.992}
			LolzenUIcfg.unitframes["uf_power_colors"][18] = {1.00, 0.61, 0.00}
			ReloadUI()
		end
	end
end)