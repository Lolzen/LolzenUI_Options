local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["unitframes"] == true then

		-- // Create a subcategory panel for Pet // --
		ns.uf_pet_options = CreateFrame("Frame", "unitframe_petpanel", ns["unitframes"])
		ns.uf_pet_options.name = "   "..L["sub_panel_unitframes_pet"]
		ns.uf_pet_options.parent = LUI["unitframes"]
		InterfaceOptions_AddCategory(ns.uf_pet_options)

		local title = ns.createTitle("uf_pet_options", L["sub_panel_unitframes_pet_title"])

		local width_text = ns.createFontstring("uf_pet_options", L["width"]..":")
		width_text:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -30)

		local width = ns.createInputbox("uf_pet_options", 40, 20, LolzenUIcfg.unitframes["uf_pet_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		local height_text = ns.createFontstring("uf_pet_options", L["height"]..":")
		height_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local height = ns.createInputbox("uf_pet_options", 40, 20, LolzenUIcfg.unitframes["uf_pet_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		local header1 = ns.createHeader("uf_pet_options", L["uf_healthpoints"])
		header1:SetPoint("TOPLEFT", width_text, 0, -30)

		local cb1 = ns.createCheckBox("uf_pet_options", "uf_pet_use_custom_font_hp", "|cff5599ff"..L["uf_healthpoints_overwrite_global_settings"].."|r", LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"])
		cb1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local hp_pos_x_text = ns.createFontstring("uf_pet_options", L["PosX"]..":")
		hp_pos_x_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local hp_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posx"])
		hp_pos_x:SetPoint("LEFT", hp_pos_x_text, "RIGHT", 10, 0)

		local hp_pos_y_text = ns.createFontstring("uf_pet_options", L["PosY"]..":")
		hp_pos_y_text:SetPoint("LEFT", hp_pos_x, "RIGHT", 5, 0)

		local hp_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_posy"])
		hp_pos_y:SetPoint("LEFT", hp_pos_y_text, "RIGHT", 10, 0)

		local hp_anchor_text = ns.createFontstring("uf_pet_options", L["anchor"]..":")
		hp_anchor_text:SetPoint("LEFT", hp_pos_y, "RIGHT", 5, 0)

		local hp_anchor = ns.createPicker("uf_pet_options", "anchor", "uf_pet_hp_anchor", 110, LolzenUIcfg.unitframes["uf_pet_hp_anchor"])
		hp_anchor:SetPoint("LEFT", hp_anchor_text, "RIGHT", -10, -3)

		local hp_font_text = ns.createFontstring("uf_pet_options", L["font"]..":")
		hp_font_text:SetPoint("TOPLEFT", hp_pos_x_text, "BOTTOMLEFT", 0, -15)

		local hp_font = ns.createPicker("uf_pet_options", "font", "uf_pet_hp_font", 120, LolzenUIcfg.unitframes["uf_pet_hp_font"])
		hp_font:SetPoint("LEFT", hp_font_text, "RIGHT", -10, -3)

		local hp_font_size_text = ns.createFontstring("uf_pet_options", L["size"]..":")
		hp_font_size_text:SetPoint("LEFT", hp_font, "RIGHT", -5, 3)

		local hp_font_size = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_hp_font_size"])
		hp_font_size:SetPoint("LEFT", hp_font_size_text, "RIGHT", 10, 0)

		local hp_font_flag_text = ns.createFontstring("uf_pet_options", L["flag"]..":")
		hp_font_flag_text:SetPoint("LEFT", hp_font_size, "RIGHT", 10, 0)

		local hp_font_flag = ns.createPicker("uf_pet_options", "flag", "uf_pet_hp_font_flag", 120, LolzenUIcfg.unitframes["uf_pet_hp_font_flag"])
		hp_font_flag:SetPoint("LEFT", hp_font_flag_text, "RIGHT", -10, -3)

		local header2 = ns.createHeader("uf_pet_options", L["uf_castbar"])
		header2:SetPoint("TOPLEFT", hp_font_text, 0, -30)

		local cb_color_text = ns.createFontstring("uf_pet_options", L["color"]..":")
		cb_color_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local cb_color = ns.createColorTexture("uf_pet_options", 16, 16, LolzenUIcfg.unitframes["uf_pet_cb_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		cb_color:SetPoint("LEFT", cb_color_text, "RIGHT", 10, 0)

		local cb_color_f = ns.createColorPicker("uf_pet_options", cb_color, LolzenUIcfg.unitframes["uf_pet_cb_color"])
		cb_color_f:SetAllPoints(cb_color)

		local cb_alpha_text = ns.createFontstring("uf_pet_options", L["alpha"]..":")
		cb_alpha_text:SetPoint("LEFT", cb_color, "RIGHT", 10, 0)

		local cb_alpha = ns.createPicker("uf_pet_options", "alpha", "uf_pet_cb_alpha", 45, LolzenUIcfg.unitframes["uf_pet_cb_alpha"])
		cb_alpha:SetPoint("LEFT", cb_alpha_text, "RIGHT", -10, -3)

		local header3 = ns.createHeader("uf_pet_options", L["icon"]..":")
		header3:SetPoint("TOPLEFT", cb_color_text, "BOTTOMLEFT", 0, -12)

		local cb_icon_size_text = ns.createFontstring("uf_pet_options", L["size"]..":")
		cb_icon_size_text:SetPoint("TOPLEFT",header3, "BOTTOMLEFT", 0, -8)

		local cb_icon_size = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_icon_size"])
		cb_icon_size:SetPoint("LEFT", cb_icon_size_text, "RIGHT", 10, 0)

		local cb_icon_pos_x_text = ns.createFontstring("uf_pet_options", L["PosX"]..":")
		cb_icon_pos_x_text:SetPoint("LEFT", cb_icon_size, "RIGHT", 10, 0)

		local cb_icon_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_icon_posx"])
		cb_icon_pos_x:SetPoint("LEFT", cb_icon_pos_x_text, "RIGHT", 10, 0)

		local cb_icon_pos_y_text = ns.createFontstring("uf_pet_options", L["PosY"]..":")
		cb_icon_pos_y_text:SetPoint("LEFT", cb_icon_pos_x, "RIGHT", 5, 0)

		local cb_icon_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_icon_posy"])
		cb_icon_pos_y:SetPoint("LEFT", cb_icon_pos_y_text, "RIGHT", 10, 0)

		local cb_icon_anchor1_text = ns.createFontstring("uf_pet_options", L["anchor"].."1:")
		cb_icon_anchor1_text:SetPoint("LEFT", cb_icon_pos_y, "RIGHT", 10, 0)

		local cb_icon_anchor1 = ns.createPicker("uf_pet_options", "anchor", "uf_pet_cb_icon_anchor1", 70, LolzenUIcfg.unitframes["uf_pet_cb_icon_anchor1"])
		cb_icon_anchor1:SetPoint("LEFT", cb_icon_anchor1_text, "RIGHT", -10, -3)

		local cb_icon_anchor2_text = ns.createFontstring("uf_pet_options", L["anchor"].."2:")
		cb_icon_anchor2_text:SetPoint("LEFT", cb_icon_anchor1, "RIGHT", -5, 3)

		local cb_icon_anchor2 = ns.createPicker("uf_pet_options", "anchor", "uf_pet_cb_icon_anchor2", 70, LolzenUIcfg.unitframes["uf_pet_cb_icon_anchor2"])
		cb_icon_anchor2:SetPoint("LEFT", cb_icon_anchor2_text, "RIGHT", -10, -3)

		local cb2 = ns.createCheckBox("uf_pet_options", "uf_pet_use_castbar_icon_cut", "|cff5599ff"..L["uf_trim_castbar_icon"].."|r", LolzenUIcfg.unitframes["uf_pet_cb_icon_cut"])
		cb2:SetPoint("TOPLEFT", cb_icon_size_text, "BOTTOMLEFT", 0, -8)

		local header4 = ns.createHeader("uf_pet_options", L["time"]..":")
		header4:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -8)

		local cb_time_pos_x_text = ns.createFontstring("uf_pet_options", L["PosX"]..":")
		cb_time_pos_x_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -8)

		local cb_time_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_time_posx"])
		cb_time_pos_x:SetPoint("LEFT", cb_time_pos_x_text, "RIGHT", 10, 0)

		local cb_time_pos_y_text = ns.createFontstring("uf_pet_options", L["PosY"]..":")
		cb_time_pos_y_text:SetPoint("LEFT", cb_time_pos_x, "RIGHT", 5, 0)

		local cb_time_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_time_posy"])
		cb_time_pos_y:SetPoint("LEFT", cb_time_pos_y_text, "RIGHT", 10, 0)

		local cb_time_anchor1_text = ns.createFontstring("uf_pet_options", L["anchor"].."1:")
		cb_time_anchor1_text:SetPoint("LEFT", cb_time_pos_y, "RIGHT", 10, 0)

		local cb_time_anchor1 = ns.createPicker("uf_pet_options", "anchor", "uf_pet_cb_time_anchor1", 110, LolzenUIcfg.unitframes["uf_pet_cb_time_anchor1"])
		cb_time_anchor1:SetPoint("LEFT", cb_time_anchor1_text, "RIGHT", -10, -3)

		local cb_time_anchor2_text = ns.createFontstring("uf_pet_options", L["anchor"].."2:")
		cb_time_anchor2_text:SetPoint("LEFT", cb_time_anchor1, "RIGHT", -5, 3)

		local cb_time_anchor2 = ns.createPicker("uf_pet_options", "anchor", "uf_pet_cb_time_anchor2", 110, LolzenUIcfg.unitframes["uf_pet_cb_time_anchor2"])
		cb_time_anchor2:SetPoint("LEFT", cb_time_anchor2_text, "RIGHT", -10, -3)

		local header5 = ns.createHeader("uf_pet_options", L["text"]..":")
		header5:SetPoint("TOPLEFT", cb_time_pos_x_text, "BOTTOMLEFT", 0, -13)

		local cb_text_pos_x_text = ns.createFontstring("uf_pet_options", L["PosX"]..":")
		cb_text_pos_x_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 0, -8)

		local cb_text_pos_x = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_text_posx"])
		cb_text_pos_x:SetPoint("LEFT", cb_text_pos_x_text, "RIGHT", 10, 0)

		local cb_text_pos_y_text = ns.createFontstring("uf_pet_options", L["PosY"]..":")
		cb_text_pos_y_text:SetPoint("LEFT", cb_text_pos_x, "RIGHT", 5, 0)

		local cb_text_pos_y = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_text_posy"])
		cb_text_pos_y:SetPoint("LEFT", cb_text_pos_y_text, "RIGHT", 10, 0)

		local cb_text_anchor1_text = ns.createFontstring("uf_pet_options", L["anchor"].."1:")
		cb_text_anchor1_text:SetPoint("LEFT", cb_text_pos_y, "RIGHT", 10, 0)

		local cb_text_anchor1 = ns.createPicker("uf_pet_options", "anchor", "uf_pet_cb_text_anchor1", 110, LolzenUIcfg.unitframes["uf_pet_cb_text_anchor1"])
		cb_text_anchor1:SetPoint("LEFT", cb_text_anchor1_text, "RIGHT", -10, -3)

		local cb_text_anchor2_text = ns.createFontstring("uf_pet_options", L["anchor"].."2:")
		cb_text_anchor2_text:SetPoint("LEFT", cb_text_anchor1, "RIGHT", -5, 3)

		local cb_text_anchor2 = ns.createPicker("uf_pet_options", "anchor", "uf_pet_cb_text_anchor2", 110, LolzenUIcfg.unitframes["uf_pet_cb_text_anchor2"])
		cb_text_anchor2:SetPoint("LEFT", cb_text_anchor2_text, "RIGHT", -10, -3)

		local header6 = ns.createHeader("uf_pet_options", L["uf_time_and_spellname_header"]..":")
		header6:SetPoint("TOPLEFT", cb_text_pos_x_text, "BOTTOMLEFT", 0, -13)

		local cb_font = ns.createPicker("uf_pet_options", "font", "uf_pet_cb_font", 120, LolzenUIcfg.unitframes["uf_pet_cb_font"])
		cb_font:SetPoint("TOPLEFT", header6, "BOTTOMLEFT", -20, -8)

		local cb_font_size_text = ns.createFontstring("uf_pet_options", L["size"]..":")
		cb_font_size_text:SetPoint("LEFT", cb_font, "RIGHT", -5, 3)

		local cb_font_size = ns.createInputbox("uf_pet_options", 30, 20, LolzenUIcfg.unitframes["uf_pet_cb_font_size"])
		cb_font_size:SetPoint("LEFT", cb_font_size_text, "RIGHT", 10, 0)

		local cb_font_flag_text = ns.createFontstring("uf_pet_options", L["flag"]..":")
		cb_font_flag_text:SetPoint("LEFT", cb_font_size, "RIGHT", 10, 0)

		local cb_font_flag = ns.createPicker("uf_pet_options", "flag", "uf_pet_cb_font_flag", 120, LolzenUIcfg.unitframes["uf_pet_cb_font_flag"])
		cb_font_flag:SetPoint("LEFT", cb_font_flag_text, "RIGHT", -10, -3)

		local cb_font_color_text = ns.createFontstring("uf_pet_options", L["color"]..":")
		cb_font_color_text:SetPoint("LEFT", cb_font_flag, "RIGHT", -10, 3)

		local cb_font_color = ns.createColorTexture("uf_pet_options", 16, 16, LolzenUIcfg.unitframes["uf_pet_cb_font_color"], LolzenUIcfg.unitframes["uf_statusbar_texture"])
		cb_font_color:SetPoint("LEFT", cb_font_color_text, "RIGHT", 10, 0)

		local cb_font_color_f = ns.createColorPicker("uf_pet_options", cb_font_color, LolzenUIcfg.unitframes["uf_pet_cb_font_color"])
		cb_font_color_f:SetAllPoints(cb_font_color)

		local applyButton = ns.createApplyButton("uf_pet_options")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"] = cb1:GetChecked()
			LolzenUIcfg.unitframes["uf_pet_hp_font"] = UIDropDownMenu_GetSelectedName(hp_font)
			LolzenUIcfg.unitframes["uf_pet_hp_font_size"] = tonumber(hp_font_size:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(hp_font_flag)]
			LolzenUIcfg.unitframes["uf_pet_hp_posx"] = tonumber(hp_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_posy"] = tonumber(hp_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_hp_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(hp_anchor)]
			LolzenUIcfg.unitframes["uf_pet_width"] = tonumber(width:GetText())
			LolzenUIcfg.unitframes["uf_pet_height"] = tonumber(height:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_color"] = {cb_color:GetVertexColor()}
			LolzenUIcfg.unitframes["uf_pet_cb_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(cb_alpha)])
			LolzenUIcfg.unitframes["uf_pet_cb_icon_cut"] = cb2:GetChecked()
			LolzenUIcfg.unitframes["uf_pet_cb_icon_size"] = tonumber(cb_icon_size:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_icon_posx"] = tonumber(cb_icon_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_icon_posy"] = tonumber(cb_icon_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_icon_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor1)]
			LolzenUIcfg.unitframes["uf_pet_cb_icon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			LolzenUIcfg.unitframes["uf_pet_cb_time_posx"] = tonumber(cb_time_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_time_posy"] = tonumber(cb_time_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_time_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor1)]
			LolzenUIcfg.unitframes["uf_pet_cb_time_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			LolzenUIcfg.unitframes["uf_pet_cb_text_posx"] = tonumber(cb_text_pos_x:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_text_posy"] = tonumber(cb_text_pos_y:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor1)]
			LolzenUIcfg.unitframes["uf_pet_cb_text_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			LolzenUIcfg.unitframes["uf_pet_cb_font"] = UIDropDownMenu_GetSelectedName(cb_font)
			LolzenUIcfg.unitframes["uf_pet_cb_font_size"] = tonumber(cb_font_size:GetText())
			LolzenUIcfg.unitframes["uf_pet_cb_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_font_flag)]
			LolzenUIcfg.unitframes["uf_pet_cb_font_color"] = {cb_font_color:GetVertexColor()}
			ReloadUI()
		end)

		ns["uf_pet_options"].default = function(self)
			LolzenUIcfg.unitframes["uf_pet_use_own_hp_font_settings"] = true
			LolzenUIcfg.unitframes["uf_pet_hp_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_pet_hp_font_size"] = 18
			LolzenUIcfg.unitframes["uf_pet_hp_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.unitframes["uf_pet_hp_posx"] = -2
			LolzenUIcfg.unitframes["uf_pet_hp_posy"] = 8
			LolzenUIcfg.unitframes["uf_pet_hp_anchor"] = "RIGHT"
			LolzenUIcfg.unitframes["uf_pet_width"] = 120
			LolzenUIcfg.unitframes["uf_pet_height"] = 18
			LolzenUIcfg.unitframes["uf_pet_cb_icon_cut"] = true
			LolzenUIcfg.unitframes["uf_pet_cb_icon_size"] = 28
			LolzenUIcfg.unitframes["uf_pet_cb_icon_posx"] = 5
			LolzenUIcfg.unitframes["uf_pet_cb_icon_posy"] = 0
			LolzenUIcfg.unitframes["uf_pet_cb_icon_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_pet_cb_icon_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_pet_cb_time_posx"] = -3
			LolzenUIcfg.unitframes["uf_pet_cb_time_posy"] = 1
			LolzenUIcfg.unitframes["uf_pet_cb_time_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_pet_cb_time_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_pet_cb_text_posx"] = 43
			LolzenUIcfg.unitframes["uf_pet_cb_text_posy"] = 1
			LolzenUIcfg.unitframes["uf_pet_cb_text_anchor1"] = "LEFT"
			LolzenUIcfg.unitframes["uf_pet_cb_text_anchor2"] = "LEFT"
			LolzenUIcfg.unitframes["uf_pet_cb_font"] = "DroidSansBold"
			LolzenUIcfg.unitframes["uf_pet_cb_font_size"] = 12
			LolzenUIcfg.unitframes["uf_pet_cb_font_flag"] = "OUTLINE"
			LolzenUIcfg.unitframes["uf_pet_cb_font_color"] = {1, 1, 1}
			ReloadUI()
		end
	end
end)