local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- // Create a subcategory panel for Party // --
		ns.uf_party_options = CreateFrame("Frame", "unitframe_partypanel", ns["unitframes"])
		ns.uf_party_options.name = "   Party"
		ns.uf_party_options.parent = "unitframes"
		InterfaceOptions_AddCategory(ns.uf_party_options)

		local title = ns.createTitle("uf_party_options", "Unitframes module: Party Options")

		local cb1 = ns.createCheckBox("uf_party_options", "uf_party_enabled", "|cff5599ffuse LolzenUI partyframes (disable for alternatives/blizzard default)|r", LolzenUIcfg.unitframes["uf_party_enabled"])
		cb1:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)

		local cb2 = ns.createCheckBox("uf_party_options", "uf_party_vertical", "|cff5599ffuse vertical Layout|r", LolzenUIcfg.unitframes["uf_party_use_vertical_layout"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local width_text = ns.createFontstring("uf_party_options", "Width:")
		width_text:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -8)

		local width = ns.createInputbox("uf_party_options", 40, 20, LolzenUIcfg.unitframes["uf_party_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		local height_text = ns.createFontstring("uf_party_options", "Height:")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local height = ns.createInputbox("uf_party_options", 40, 20, LolzenUIcfg.unitframes["uf_party_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		local header1 = ns.createHeader("uf_party_options", "Healthpoints")
		header1:SetPoint("TOPLEFT", width_text, 0, -30)

		local cb3 = ns.createCheckBox("uf_party_options", "uf_party_use_custom_font_hp", "|cff5599ffoverwrite the general font options for party healthpoints|r", LolzenUIcfg.unitframes["uf_party_use_own_hp_font_settings"])
		cb3:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local hp_pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		hp_pos_x_text:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -8)

		local hp_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posx"])
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		local hp_pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_posy"])
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		local hp_anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_hp_anchor", 110, LolzenUIcfg.unitframes["uf_party_hp_anchor"])
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)

		local hp_font_text = ns.createFontstring("uf_party_options", "Font:")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_party_options", "font", "uf_party_hp_font", 120, LolzenUIcfg.unitframes["uf_party_hp_font"])
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)

		local hp_font_size_text = ns.createFontstring("uf_party_options", "Font size:")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_hp_font_size"])
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		local hp_font_flag_text = ns.createFontstring("uf_party_options", "Font flag:")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_party_options", "flag", "uf_party_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_party_hp_font_flag"])
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)

		local header2 = ns.createHeader("uf_party_options", "Role Indicator")
		header2:SetPoint("TOPLEFT", hp_font_text, 0, -30)

		local cb4 = ns.createCheckBox("uf_party_options", "uf_party_ri", "|cff5599ffshow role indicator|r", LolzenUIcfg.unitframes["uf_party_showroleindicator"])
		cb4:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local ri_size_text = ns.createFontstring("uf_party_options", "Size:")
		ri_size_text:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, -8)

		local ri_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_size"])
		ri_size:SetPoint("LEFT", ri_size_text, "RIGHT", 10, 0)

		local ri_pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		ri_pos_x_text:SetPoint("LEFT", ri_size, "RIGHT", 10, 0)

		local ri_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_posx"])
		ri_pos_x:SetPoint("LEFT", ri_pos_x_text, "RIGHT", 10, 0)

		local ri_pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		ri_pos_y_text:SetPoint("LEFT", ri_pos_x, "RIGHT", 10, 0)

		local ri_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_ri_posy"])
		ri_pos_y:SetPoint("LEFT", ri_pos_y_text, "RIGHT", 10, 0)

		local ri_anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		ri_anchor_text:SetPoint("LEFT", ri_pos_y, "RIGHT", 10, 0)

		local ri_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_ri_anchor", 120, LolzenUIcfg.unitframes["uf_party_ri_anchor"])
		ri_anchor:SetPoint("LEFT", ri_anchor_text, "RIGHT", -10, -3)

		local header3 = ns.createHeader("uf_party_options", "Readycheck Indicator")
		header3:SetPoint("TOPLEFT", ri_size_text, 0, -30)

		local rc_size_text = ns.createFontstring("uf_party_options", "Size:")
		rc_size_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -15)

		local rc_size = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_size"])
		rc_size:SetPoint("LEFT", rc_size_text, "RIGHT", 10, 0)

		local rc_pos_x_text = ns.createFontstring("uf_party_options", "PosX:")
		rc_pos_x_text:SetPoint("LEFT", rc_size, "RIGHT", 10, 0)

		local rc_pos_x = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_posx"])
		rc_pos_x:SetPoint("LEFT", rc_pos_x_text, "RIGHT", 10, 0)

		local rc_pos_y_text = ns.createFontstring("uf_party_options", "PosY:")
		rc_pos_y_text:SetPoint("LEFT", rc_pos_x, "RIGHT", 10, 0)

		local rc_pos_y = ns.createInputbox("uf_party_options", 30, 20, LolzenUIcfg.unitframes["uf_party_rc_posy"])
		rc_pos_y:SetPoint("LEFT", rc_pos_y_text, "RIGHT", 10, 0)

		local rc_anchor_text = ns.createFontstring("uf_party_options", "Anchor:")
		rc_anchor_text:SetPoint("LEFT", rc_pos_y, "RIGHT", 10, 0)

		local rc_anchor = ns.createPicker("uf_party_options", "anchor", "uf_party_rc_anchor", 120, LolzenUIcfg.unitframes["uf_party_rc_anchor"])
		rc_anchor:SetPoint("LEFT", rc_anchor_text, "RIGHT", -10, -3)

		local applyButton = ns.createApplyButton("uf_party_options")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.unitframes["uf_party_enabled"] = cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_party_use_vertical_layout"] = cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_party_use_own_hp_font_settings"] = cb3:GetChecked()
			LolzenUIcfg.unitframes["uf_party_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUIcfg.unitframes["uf_party_hp_font_size"] = tonumber(hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUIcfg.unitframes["uf_party_hp_posx"] = tonumber(hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_posy"] = tonumber(hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUIcfg.unitframes["uf_party_width"] = tonumber(width:GetText())
			LolzenUIcfg.unitframes["uf_party_height"] = tonumber(height:GetText())
			LolzenUIcfg.unitframes["uf_party_showroleindicator"] = cb4:GetChecked()
			LolzenUIcfg.unitframes["uf_party_ri_size"] = tonumber(ri_size:GetText())
			LolzenUIcfg.unitframes["uf_party_ri_posx"] = tonumber(ri_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_ri_posy"] = tonumber(ri_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_ri_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(ri_anchor)]
			LolzenUIcfg.unitframes["uf_party_rc_size"] = tonumber(rc_size:GetText())
			LolzenUIcfg.unitframes["uf_party_rc_posx"] = tonumber(rc_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_party_rc_posy"] = tonumber(rc_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_party_rc_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(rc_anchor)]
			ReloadUI()
		end)

		ns["uf_party_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_party_enabled"] = true
			LolzenUIcfg.unitframes["uf_party_use_vertical_layout"] = false
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
	end
end)