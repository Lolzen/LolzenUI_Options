local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- // Create a subcategory panel for Power Colors // --
		ns.uf_powercolor_options = CreateFrame("Frame", "unitframe_powercolorpanel", ns["unitframes"])
		ns.uf_powercolor_options.name = "   "..L["sub_panel_unitframes_powercolors"]
		ns.uf_powercolor_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_powercolor_options)

		local title = ns.createTitle("uf_powercolor_options", L["sub_panel_unitframes_powercolors_title"])

		local mana_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_mana"]..":")
		mana_text:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)

		local mana = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[0], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		mana:SetPoint("LEFT", mana_text, "RIGHT", 100, 0)
		mana.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[0] = {mana:GetVertexColor()}
			LolzenUI.SetUFPowerColorMana()
		end

		local mana_f = ns.createColorPicker("uf_powercolor_options", mana, LolzenUIcfg.unitframes.powercolors[0])
		mana_f:SetAllPoints(mana)

		local rage_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_rage"]..":")
		rage_text:SetPoint("TOPLEFT", mana_text, "BOTTOMLEFT", 0, -10)

		local rage = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[1], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		rage:SetPoint("TOP", mana, "BOTTOM", 0, -4)
		rage.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[1] = {rage:GetVertexColor()}
			LolzenUI.SetUFPowerColorRage()
		end

		local rage_f = ns.createColorPicker("uf_powercolor_options", rage, LolzenUIcfg.unitframes.powercolors[1])
		rage_f:SetAllPoints(rage)

		local focus_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_focus"]..":")
		focus_text:SetPoint("TOPLEFT", rage_text, "BOTTOMLEFT", 0, -10)

		local focus = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[2], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		focus:SetPoint("TOP", rage, "BOTTOM", 0, -4)
		focus.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[2] = {focus:GetVertexColor()}
			LolzenUI.SetUFPowerColorFocus()
		end

		local focus_f = ns.createColorPicker("uf_powercolor_options", focus, LolzenUIcfg.unitframes.powercolors[2])
		focus_f:SetAllPoints(focus)

		local energy_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_energy"]..":")
		energy_text:SetPoint("TOPLEFT", focus_text, "BOTTOMLEFT", 0, -10)

		local energy = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[3], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		energy:SetPoint("TOP", focus, "BOTTOM", 0, -4)
		energy.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[3] = {energy:GetVertexColor()}
			LolzenUI.SetUFPowerColorEnergy()
		end

		local energy_f = ns.createColorPicker("uf_powercolor_options", energy, LolzenUIcfg.unitframes.powercolors[3])
		energy_f:SetAllPoints(energy)

		local cp_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_combopoints"]..":")
		cp_text:SetPoint("TOPLEFT", energy_text, "BOTTOMLEFT", 0, -10)

		local cp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[4], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		cp:SetPoint("TOP", energy, "BOTTOM", 0, -4)
		cp.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[4] = {cp:GetVertexColor()}
			LolzenUI.SetUFPowerColorCP()
		end

		local cp_f = ns.createColorPicker("uf_powercolor_options", cp, LolzenUIcfg.unitframes.powercolors[4])
		cp_f:SetAllPoints(cp)

		local runes_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_runes"]..":")
		runes_text:SetPoint("TOPLEFT", cp_text, "BOTTOMLEFT", 0, -10)

		local runes = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[5], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		runes:SetPoint("TOP", cp, "BOTTOM", 0, -4)
		runes.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[5] = {runes:GetVertexColor()}
			LolzenUI.SetUFPowerColorRunes()
		end

		local runes_f = ns.createColorPicker("uf_powercolor_options", runes, LolzenUIcfg.unitframes.powercolors[5])
		runes_f:SetAllPoints(runes)

		local rp_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_runicpower"]..":")
		rp_text:SetPoint("TOPLEFT", runes_text, "BOTTOMLEFT", 0, -10)

		local rp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[6], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		rp:SetPoint("TOP", runes, "BOTTOM", 0, -4)
		rp.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[6] = {rp:GetVertexColor()}
			LolzenUI.SetUFPowerColorRunePower()
		end

		local rp_f = ns.createColorPicker("uf_powercolor_options", rp, LolzenUIcfg.unitframes.powercolors[6])
		rp_f:SetAllPoints(rp)

		local soulshards_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_soulshards"]..":")
		soulshards_text:SetPoint("TOPLEFT", rp_text, "BOTTOMLEFT", 0, -10)

		local soulshards = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[7], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		soulshards:SetPoint("TOP", rp, "BOTTOM", 0, -4)
		soulshards.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[7] = {soulshards:GetVertexColor()}
			LolzenUI.SetUFPowerColorSoulshards()
		end

		local soulshards_f = ns.createColorPicker("uf_powercolor_options", soulshards, LolzenUIcfg.unitframes.powercolors[7])
		soulshards_f:SetAllPoints(soulshards)

		local lp_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_lunarpower"]..":")
		lp_text:SetPoint("TOPLEFT", soulshards_text, "BOTTOMLEFT", 0, -10)

		local lp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[8], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		lp:SetPoint("TOP", soulshards, "BOTTOM", 0, -4)
		lp.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[8] = {lp:GetVertexColor()}
			LolzenUI.SetUFPowerColorLunarPower()
		end

		local lp_f = ns.createColorPicker("uf_powercolor_options", lp, LolzenUIcfg.unitframes.powercolors[8])
		lp_f:SetAllPoints(lp)

		local hp_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_holypower"]..":")
		hp_text:SetPoint("TOPLEFT", lp_text, "BOTTOMLEFT", 0, -10)

		local hp = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[9], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		hp:SetPoint("TOP", lp, "BOTTOM", 0, -4)
		hp.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[9] = {hp:GetVertexColor()}
			LolzenUI.SetUFPowerColorHolyPower()
		end

		local hp_f = ns.createColorPicker("uf_powercolor_options", hp, LolzenUIcfg.unitframes.powercolors[9])
		hp_f:SetAllPoints(hp)

		local maelstrom_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_maelstrom"]..":")
		maelstrom_text:SetPoint("TOPLEFT", hp_text, "BOTTOMLEFT", 0, -10)

		local maelstrom = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[11], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		maelstrom:SetPoint("TOP", hp, "BOTTOM", 0, -4)
		maelstrom.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[11] = {maelstrom:GetVertexColor()}
			LolzenUI.SetUFPowerColorMaelstrom()
		end

		local maelstrom_f = ns.createColorPicker("uf_powercolor_options", maelstrom, LolzenUIcfg.unitframes.powercolors[11])
		maelstrom_f:SetAllPoints(maelstrom)

		local chi_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_chi"]..":")
		chi_text:SetPoint("TOPLEFT", maelstrom_text, "BOTTOMLEFT", 0, -10)

		local chi = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[12], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		chi:SetPoint("TOP", maelstrom, "BOTTOM", 0, -4)
		chi.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[12] = {chi:GetVertexColor()}
			LolzenUI.SetUFPowerColorChi()
		end

		local chi_f = ns.createColorPicker("uf_powercolor_options", chi, LolzenUIcfg.unitframes.powercolors[12])
		chi_f:SetAllPoints(chi)

		local insanity_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_insanity"]..":")
		insanity_text:SetPoint("TOPLEFT", chi_text, "BOTTOMLEFT", 0, -10)

		local insanity = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[13], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		insanity:SetPoint("TOP", chi, "BOTTOM", 0, -4)
		insanity.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[13] = {insanity:GetVertexColor()}
			LolzenUI.SetUFPowerColorInsanity()
		end

		local insanity_f = ns.createColorPicker("uf_powercolor_options", insanity, LolzenUIcfg.unitframes.powercolors[13])
		insanity_f:SetAllPoints(insanity)

		local ac_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_arcanecharges"]..":")
		ac_text:SetPoint("TOPLEFT", insanity_text, "BOTTOMLEFT", 0, -10)

		local ac = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[16], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		ac:SetPoint("TOP", insanity, "BOTTOM", 0, -4)
		ac.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[16] = {ac:GetVertexColor()}
			LolzenUI.SetUFPowerColorArcaneCharges()
		end

		local ac_f = ns.createColorPicker("uf_powercolor_options", ac, LolzenUIcfg.unitframes.powercolors[16])
		ac_f:SetAllPoints(ac)

		local fury_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_fury"]..":")
		fury_text:SetPoint("TOPLEFT", ac_text, "BOTTOMLEFT", 0, -10)

		local fury = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[17], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		fury:SetPoint("TOP", ac, "BOTTOM", 0, -4)
		fury.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[17] = {fury:GetVertexColor()}
			LolzenUI.SetUFPowerColorFury()
		end

		local fury_f = ns.createColorPicker("uf_powercolor_options", fury, LolzenUIcfg.unitframes.powercolors[17])
		fury_f:SetAllPoints(fury)

		local pain_text = ns.createFontstring("uf_powercolor_options", L["sub_panel_unitframes_powercolors_pain"]..":")
		pain_text:SetPoint("TOPLEFT", fury_text, "BOTTOMLEFT", 0, -10)

		local pain = ns.createColorTexture("uf_powercolor_options", 16, 16, LolzenUIcfg.unitframes.powercolors[18], LolzenUIcfg.unitframes.general["uf_statusbar_texture"])
		pain:SetPoint("TOP",fury, "BOTTOM", 0, -4)
		pain.setActualColors = function()
			LolzenUIcfg.unitframes.powercolors[18] = {pain:GetVertexColor()}
			LolzenUI.SetUFPowerColorPain()
		end

		local pain_f = ns.createColorPicker("uf_powercolor_options", pain, LolzenUIcfg.unitframes.powercolors[18])
		pain_f:SetAllPoints(pain)

		ns["uf_powercolor_options"].default = function(self)
			LolzenUIcfg.unitframes.powercolors = _G["LolzenUIdefaultcfg"].unitframes.powercolors
			ReloadUI()
		end
	end
end)