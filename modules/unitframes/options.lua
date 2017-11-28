--// options for unitframes //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		local title = ns.createTitle("unitframes")

		local about = ns.createDescription("unitframes", "Unitframes")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
		
		local cb1 = ns.createCheckBox("unitframes", "uf_siVal", "|cff5599ffuse short values (34m5, 3k2, etc)|r", LolzenUIcfg.unitframes["uf_use_sivalue"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)
		
		local texture_text = ns.createFonstring("unitframes", "Texture:")
		texture_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -15)

		local texture = ns.createInputbox("unitframes", 100, 20, LolzenUIcfg.unitframes["uf_statusbar_texture"])
		texture:SetPoint("LEFT", texture_text, "RIGHT", 10, 0)
		
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
		
		ns["unitframes"].okay = function(self)
			LolzenUIcfg.unitframes["uf_use_sivalue"] = cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_statusbar_texture"] = texture:GetText()
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
			LolzenUIcfg.unitframes["uf_use_sivalue"] = true
			LolzenUIcfg.unitframes["uf_statusbar_texture"] = "statusbar"
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
	end
end)