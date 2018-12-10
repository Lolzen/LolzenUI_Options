local _, ns = ...
local LSM = LibStub("LibSharedMedia-3.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["nameplates"] == true then

		-- // Create a subcategory panel for Castbar // --
		ns.np_castbar_options = CreateFrame("Frame", "nameplates_castbarpanel", ns["nameplates"])
		ns.np_castbar_options.name = "   Castbar"
		ns.np_castbar_options.parent = "nameplates"
		InterfaceOptions_AddCategory(ns.np_castbar_options)

		local cb_title = ns.createTitle("np_castbar_options", "Nameplates module: Castbar Options")

		local cb_header1 = ns.createHeader("np_castbar_options", "Preview:")
		cb_header1:SetPoint("TOPLEFT", cb_title, "BOTTOMLEFT", 0, -40)

		local cb_prev_np_frame = CreateFrame("Frame", nil, ns["np_castbar_options"])
		cb_prev_np_frame:SetSize(LolzenUIcfg.nameplates["np_width"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_height"]*LolzenUIcfg.nameplates["np_selected_scale"])
		cb_prev_np_frame:SetPoint("TOPLEFT", cb_header1, "BOTTOMLEFT", 20, -10)

		local cb_prev_np = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np:SetAllPoints(cb_prev_np_frame)
		cb_prev_np:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates["np_texture"]))
		cb_prev_np:SetVertexColor(0.6, 0.1, 0)

		local cb_prev_np_lvlname = cb_prev_np_frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		cb_prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates["np_lvlname_font"]), LolzenUIcfg.nameplates["np_lvlname_font_size"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_lvlname_font_flag"])
		cb_prev_np_lvlname:SetText("|cffffff00110|r + Random Name")
		cb_prev_np_lvlname:SetPoint("CENTER", cb_prev_np_frame, 0, 3)

		local cb_prev_np_cb = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np_cb:SetSize(LolzenUIcfg.nameplates["np_cb_width"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_cb_height"]*LolzenUIcfg.nameplates["np_selected_scale"])
		cb_prev_np_cb:SetPoint(LolzenUIcfg.nameplates["np_cb_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates["np_cb_anchor2"], LolzenUIcfg.nameplates["np_cb_posx"], LolzenUIcfg.nameplates["np_cb_posy"])
		cb_prev_np_cb:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates["np_cb_texture"]))

		local cb_prev_np_spark = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np_spark:SetSize(LolzenUIcfg.nameplates["np_spark_width"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_spark_height"]*LolzenUIcfg.nameplates["np_selected_scale"])
		cb_prev_np_spark:SetPoint("RIGHT", cb_prev_np_cb, "RIGHT", LolzenUIcfg.nameplates["np_spark_width"]*LolzenUIcfg.nameplates["np_selected_scale"]/2, 0)
		cb_prev_np_spark:SetBlendMode("ADD")
		cb_prev_np_spark:SetTexture('Interface\\CastingBar\\UI-CastingBar-Spark')

		local cb_prev_np_icon = ns.createButtonTexture("np_castbar_options", LolzenUIcfg.nameplates["np_cbicon_size"]*LolzenUIcfg.nameplates["np_selected_scale"], GetSpellTexture(214815), nil)
		cb_prev_np_icon:SetPoint(LolzenUIcfg.nameplates["np_cbicon_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates["np_cbicon_anchor2"], LolzenUIcfg.nameplates["np_cbicon_posx"], LolzenUIcfg.nameplates["np_cbicon_posy"])

		local cb_prev_np_shield = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np_shield:SetSize(LolzenUIcfg.nameplates["np_cbicon_size"]*3*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_cbicon_size"]*3*LolzenUIcfg.nameplates["np_selected_scale"])
		cb_prev_np_shield:SetTexture("Interface\\AddOns\\LolzenUI\\media\\shield")
		cb_prev_np_shield:SetPoint("CENTER", cb_prev_np_icon, 0, 0)

		local cb_prev_np_time = ns.createFontstring("np_castbar_options", "3.0")
		cb_prev_np_time:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates["np_cbtime_font"]), LolzenUIcfg.nameplates["np_cbtime_font_size"]*LolzenUIcfg.nameplates["np_selected_scale"] , LolzenUIcfg.nameplates["np_cbtime_font_flag"])
		cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates["np_cbtime_anchor2"], LolzenUIcfg.nameplates["np_cbtime_posx"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_cbtime_posy"]*LolzenUIcfg.nameplates["np_selected_scale"])

		local cb_prev_np_text = ns.createFontstring("np_castbar_options", "Random Castname")
		cb_prev_np_text:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates["np_cbtext_font"]), LolzenUIcfg.nameplates["np_cbtext_font_size"]*LolzenUIcfg.nameplates["np_selected_scale"] , LolzenUIcfg.nameplates["np_cbtext_font_flag"])
		cb_prev_np_text:SetPoint("RIGHT", cb_prev_np_cb, "RIGHT", -2*LolzenUIcfg.nameplates["np_selected_scale"], -5*LolzenUIcfg.nameplates["np_selected_scale"])

		local cb_pos_x_text = ns.createFontstring("np_castbar_options", "PosX:")
		cb_pos_x_text:SetPoint("TOPLEFT", cb_prev_np_frame, "BOTTOMLEFT", -20, -30)

		local cb_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cb_posx"])
		cb_pos_x:SetPoint("LEFT", cb_pos_x_text, "RIGHT", 10, 0)

		local cb_pos_y_text = ns.createFontstring("np_castbar_options", "PosY:")
		cb_pos_y_text:SetPoint("LEFT", cb_pos_x, "RIGHT", 10, 0)

		local cb_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cb_posy"])
		cb_pos_y:SetPoint("LEFT", cb_pos_y_text, "RIGHT", 10, 0)

		local cb_anchor_text = ns.createFontstring("np_castbar_options", "Anchor1:")
		cb_anchor_text:SetPoint("LEFT", cb_pos_y, "RIGHT", 10, 0)

		local cb_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_anchor_bar1", 110, LolzenUIcfg.nameplates["np_cb_anchor"])
		cb_anchor:SetPoint("LEFT", cb_anchor_text, "RIGHT", -10, -3)

		local cb_anchor_text2 = ns.createFontstring("np_castbar_options", "Anchor2:")
		cb_anchor_text2:SetPoint("LEFT", cb_anchor, "RIGHT", -5, 3)

		local cb_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_anchor_bar2", 110, LolzenUIcfg.nameplates["np_cb_anchor2"])
		cb_anchor2:SetPoint("LEFT", cb_anchor_text2, "RIGHT", -10, -3)

		local cb_texture_text = ns.createFontstring("np_castbar_options", "Texture:")
		cb_texture_text:SetPoint("TOPLEFT", cb_pos_x_text, "BOTTOMLEFT", 0, -15)

		local cb_texture = ns.createPicker("np_castbar_options", "statusbar", "np_cb_statusbar", 120, LolzenUIcfg.nameplates["np_cb_texture"])
		cb_texture:SetPoint("LEFT", cb_texture_text, "RIGHT", -10, -3)

		local cb_height_text = ns.createFontstring("np_castbar_options", "Height:")
		cb_height_text:SetPoint("LEFT", cb_texture, "RIGHT", -5, 3)

		local cb_height = ns.createInputbox("np_castbar_options", 40, 20, LolzenUIcfg.nameplates["np_cb_height"])
		cb_height:SetPoint("LEFT", cb_height_text, "RIGHT", 10, 0)

		local cb_width_text = ns.createFontstring("np_castbar_options", "Width:")
		cb_width_text:SetPoint("LEFT", cb_height, "RIGHT", 10, 0)

		local cb_width = ns.createInputbox("np_castbar_options", 40, 20, LolzenUIcfg.nameplates["np_cb_width"])
		cb_width:SetPoint("LEFT", cb_width_text, "RIGHT", 10, 0)

		local cb_header2 = ns.createHeader("np_castbar_options", "Spark")
		cb_header2:SetPoint("TOPLEFT", cb_texture_text, "BOTTOMLEFT", 0, -30)

		local cb_spark_height_text = ns.createFontstring("np_castbar_options", "Height:")
		cb_spark_height_text:SetPoint("TOPLEFT", cb_header2, "BOTTOMLEFT", 0, -10)

		local cb_spark_height = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_spark_height"])
		cb_spark_height:SetPoint("LEFT", cb_spark_height_text, "RIGHT", 10, 0)

		local cb_spark_width_text = ns.createFontstring("np_castbar_options", "Width:")
		cb_spark_width_text:SetPoint("LEFT", cb_spark_height, "RIGHT", 10, 0)

		local cb_spark_width = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_spark_width"])
		cb_spark_width:SetPoint("LEFT", cb_spark_width_text, "RIGHT", 10, 0)

		local cb_header3 = ns.createHeader("np_castbar_options", "Icon")
		cb_header3:SetPoint("TOPLEFT", cb_spark_height_text, "BOTTOMLEFT", 0, -30)

		local cb_icon_size_text = ns.createFontstring("np_castbar_options", "Size:")
		cb_icon_size_text:SetPoint("TOPLEFT", cb_header3, "BOTTOMLEFT", 0, -10)

		local cb_icon_size = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbicon_size"])
		cb_icon_size:SetPoint("LEFT", cb_icon_size_text, "RIGHT", 10, 0)

		local cb_icon_pos_x_text = ns.createFontstring("np_castbar_options", "PosX:")
		cb_icon_pos_x_text:SetPoint("LEFT", cb_icon_size, "RIGHT", 5, 0)

		local cb_icon_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbicon_posx"])
		cb_icon_pos_x:SetPoint("LEFT", cb_icon_pos_x_text, "RIGHT", 10, 0)

		local cb_icon_pos_y_text = ns.createFontstring("np_castbar_options", "PosY:")
		cb_icon_pos_y_text:SetPoint("LEFT", cb_icon_pos_x, "RIGHT", 5, 0)

		local cb_icon_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbicon_posy"])
		cb_icon_pos_y:SetPoint("LEFT", cb_icon_pos_y_text, "RIGHT", 10, 0)

		local cb_icon_anchor_text = ns.createFontstring("np_castbar_options", "Anchor1:")
		cb_icon_anchor_text:SetPoint("LEFT", cb_icon_pos_y, "RIGHT", 10, 0)

		local cb_icon_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_icon_anchor1", 110, LolzenUIcfg.nameplates["np_cbicon_anchor"])
		cb_icon_anchor:SetPoint("LEFT", cb_icon_anchor_text, "RIGHT", -10, -3)

		local cb_icon_anchor_text2 = ns.createFontstring("np_castbar_options", "Anchor2:")
		cb_icon_anchor_text2:SetPoint("LEFT", cb_icon_anchor, "RIGHT", -5, 3)

		local cb_icon_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_icon_anchor2", 110, LolzenUIcfg.nameplates["np_cbicon_anchor2"])
		cb_icon_anchor2:SetPoint("LEFT", cb_icon_anchor_text2, "RIGHT", -10, -3)

		local cb_header4 = ns.createHeader("np_castbar_options", "Time")
		cb_header4:SetPoint("TOPLEFT", cb_icon_size_text, "BOTTOMLEFT", 0, -30)

		local cb_time_font_text = ns.createFontstring("np_castbar_options", "Font:")
		cb_time_font_text:SetPoint("TOPLEFT", cb_header4, "BOTTOMLEFT", 0, -10)

		local cb_time_font = ns.createPicker("np_castbar_options", "font", "cb_time_font", 120, LolzenUIcfg.nameplates["np_cbtime_font"])
		cb_time_font:SetPoint("LEFT", cb_time_font_text, "RIGHT", -10, -3)

		local cb_time_font_size_text = ns.createFontstring("np_castbar_options", "Size:")
		cb_time_font_size_text:SetPoint("LEFT", cb_time_font, "RIGHT", -10, 3)

		local cb_time_font_size = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbtime_font_size"])
		cb_time_font_size:SetPoint("LEFT", cb_time_font_size_text, "RIGHT", 10, 0)

		local cb_time_font_flag_text = ns.createFontstring("np_castbar_options", "Flag:")
		cb_time_font_flag_text:SetPoint("LEFT", cb_time_font_size, "RIGHT", 10, 0)

		local cb_time_font_flag = ns.createPicker("np_castbar_options", "flag", "cb_time_font_flag", 120, LolzenUIcfg.nameplates["np_cbtime_font_flag"])
		cb_time_font_flag:SetPoint("LEFT", cb_time_font_flag_text, "RIGHT", -10, -3)

		local cb_time_pos_x_text = ns.createFontstring("np_castbar_options", "PosX:")
		cb_time_pos_x_text:SetPoint("TOPLEFT", cb_time_font_text, "BOTTOMLEFT", 0, -15)

		local cb_time_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbtime_posx"])
		cb_time_pos_x:SetPoint("LEFT", cb_time_pos_x_text, "RIGHT", 10, 0)

		local cb_time_pos_y_text = ns.createFontstring("np_castbar_options", "PosY:")
		cb_time_pos_y_text:SetPoint("LEFT", cb_time_pos_x, "RIGHT", 5, 0)

		local cb_time_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbtime_posy"])
		cb_time_pos_y:SetPoint("LEFT", cb_time_pos_y_text, "RIGHT", 10, 0)

		local cb_time_anchor_text = ns.createFontstring("np_castbar_options", "Anchor1:")
		cb_time_anchor_text:SetPoint("LEFT", cb_time_pos_y, "RIGHT", 10, 0)

		local cb_time_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_time_anchor1", 110, LolzenUIcfg.nameplates["np_cbtime_anchor"])
		cb_time_anchor:SetPoint("LEFT", cb_time_anchor_text, "RIGHT", -10, -3)

		local cb_time_anchor_text2 = ns.createFontstring("np_castbar_options", "Anchor2:")
		cb_time_anchor_text2:SetPoint("LEFT", cb_time_anchor, "RIGHT", -5, 3)

		local cb_time_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_time_anchor2", 110, LolzenUIcfg.nameplates["np_cbtime_anchor2"])
		cb_time_anchor2:SetPoint("LEFT", cb_time_anchor_text2, "RIGHT", -10, -3)

		local cb_header5 = ns.createHeader("np_castbar_options", "Text")
		cb_header5:SetPoint("TOPLEFT", cb_time_pos_x_text, "BOTTOMLEFT", 0, -30)

		local cb_text_font_text = ns.createFontstring("np_castbar_options", "Font:")
		cb_text_font_text:SetPoint("TOPLEFT", cb_header5, "BOTTOMLEFT", 0, -10)

		local cb_text_font = ns.createPicker("np_castbar_options", "font", "cb_text_font", 120, LolzenUIcfg.nameplates["np_cbtext_font"])
		cb_text_font:SetPoint("LEFT", cb_text_font_text, "RIGHT", -10, -3)

		local cb_text_font_size_text = ns.createFontstring("np_castbar_options", "Size:")
		cb_text_font_size_text:SetPoint("LEFT", cb_text_font, "RIGHT", -10, 3)

		local cb_text_font_size = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbtext_font_size"])
		cb_text_font_size:SetPoint("LEFT", cb_text_font_size_text, "RIGHT", 10, 0)

		local cb_text_font_flag_text = ns.createFontstring("np_castbar_options", "Flag:")
		cb_text_font_flag_text:SetPoint("LEFT", cb_text_font_size, "RIGHT", 10, 0)

		local cb_text_font_flag = ns.createPicker("np_castbar_options", "flag", "cb_text_font_flag", 120, LolzenUIcfg.nameplates["np_cbtext_font_flag"])
		cb_text_font_flag:SetPoint("LEFT", cb_text_font_flag_text, "RIGHT", -10, -3)

		local cb_text_pos_x_text = ns.createFontstring("np_castbar_options", "PosX:")
		cb_text_pos_x_text:SetPoint("TOPLEFT", cb_text_font_text, "BOTTOMLEFT", 0, -15)

		local cb_text_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbtext_posx"])
		cb_text_pos_x:SetPoint("LEFT", cb_text_pos_x_text, "RIGHT", 10, 0)

		local cb_text_pos_y_text = ns.createFontstring("np_castbar_options", "PosY:")
		cb_text_pos_y_text:SetPoint("LEFT", cb_text_pos_x, "RIGHT", 5, 0)

		local cb_text_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates["np_cbtext_posy"])
		cb_text_pos_y:SetPoint("LEFT", cb_text_pos_y_text, "RIGHT", 10, 0)

		local cb_text_anchor_text = ns.createFontstring("np_castbar_options", "Anchor1:")
		cb_text_anchor_text:SetPoint("LEFT", cb_text_pos_y, "RIGHT", 10, 0)

		local cb_text_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_text_anchor1", 110, LolzenUIcfg.nameplates["np_cbtext_anchor"])
		cb_text_anchor:SetPoint("LEFT", cb_text_anchor_text, "RIGHT", -10, -3)

		local cb_text_anchor_text2 = ns.createFontstring("np_castbar_options", "Anchor2:")
		cb_text_anchor_text2:SetPoint("LEFT", cb_text_anchor, "RIGHT", -5, 3)

		local cb_text_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_text_anchor2", 110, LolzenUIcfg.nameplates["np_cbtext_anchor2"])
		cb_text_anchor2:SetPoint("LEFT", cb_text_anchor_text2, "RIGHT", -10, -3)

		local applyButton = ns.createApplyButton("np_castbar_options")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.nameplates["np_cb_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_anchor)]
			LolzenUIcfg.nameplates["np_cb_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_anchor2)]
			LolzenUIcfg.nameplates["np_cb_posx"] = tonumber(cb_pos_x:GetText())
			LolzenUIcfg.nameplates["np_cb_posy"] = tonumber(cb_pos_y:GetText())
			LolzenUIcfg.nameplates["np_cb_height"] = tonumber(cb_height:GetText())
			LolzenUIcfg.nameplates["np_cb_width"] = tonumber(cb_width:GetText())
			LolzenUIcfg.nameplates["np_cb_texture"] = UIDropDownMenu_GetSelectedName(cb_texture)
			LolzenUIcfg.nameplates["np_spark_height"] = tonumber(cb_spark_height:GetText())
			LolzenUIcfg.nameplates["np_spark_width"] = tonumber(cb_spark_width:GetText())
			LolzenUIcfg.nameplates["np_cbicon_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor)]
			LolzenUIcfg.nameplates["np_cbicon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			LolzenUIcfg.nameplates["np_cbicon_posx"] = tonumber(cb_icon_pos_x:GetText())
			LolzenUIcfg.nameplates["np_cbicon_posy"] = tonumber(cb_icon_pos_y:GetText())
			LolzenUIcfg.nameplates["np_cbicon_size"] = tonumber(cb_icon_size:GetText())
			LolzenUIcfg.nameplates["np_cbtime_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor)]
			LolzenUIcfg.nameplates["np_cbtime_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			LolzenUIcfg.nameplates["np_cbtime_posx"] = tonumber(cb_time_pos_x:GetText())
			LolzenUIcfg.nameplates["np_cbtime_posy"] = tonumber(cb_time_pos_y:GetText())
			LolzenUIcfg.nameplates["np_cbtime_font"] = UIDropDownMenu_GetSelectedName(cb_time_font)
			LolzenUIcfg.nameplates["np_cbtime_font_size"] = tonumber(cb_time_font_size:GetText())
			LolzenUIcfg.nameplates["np_cbtime_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_time_font_flag)]
			LolzenUIcfg.nameplates["np_cbtext_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor)]
			LolzenUIcfg.nameplates["np_cbtext_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			LolzenUIcfg.nameplates["np_cbtext_posx"] = tonumber(cb_text_pos_x:GetText())
			LolzenUIcfg.nameplates["np_cbtext_posy"] = tonumber(cb_text_pos_y:GetText())
			LolzenUIcfg.nameplates["np_cbtext_font"] = UIDropDownMenu_GetSelectedName(cb_text_font)
			LolzenUIcfg.nameplates["np_cbtext_font_size"] = tonumber(cb_text_font_size:GetText())
			LolzenUIcfg.nameplates["np_cbtext_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_text_font_flag)]
			ReloadUI()
		end)

		ns["np_castbar_options"].default = function(self)
			LolzenUIcfg.nameplates["np_cb_anchor"] = "TOP"
			LolzenUIcfg.nameplates["np_cb_anchor2"] = "BOTTOM"
			LolzenUIcfg.nameplates["np_cb_posx"] = 0
			LolzenUIcfg.nameplates["np_cb_posy"] = 1
			LolzenUIcfg.nameplates["np_cb_height"] = 1
			LolzenUIcfg.nameplates["np_cb_width"] = 100
			LolzenUIcfg.nameplates["np_cb_texture"] = "LolzenUI Standard"
			LolzenUIcfg.nameplates["np_spark_height"] = 4
			LolzenUIcfg.nameplates["np_spark_width"] = 6
			LolzenUIcfg.nameplates["np_cbicon_anchor"] = "RIGHT"
			LolzenUIcfg.nameplates["np_cbicon_anchor2"] = "LEFT"
			LolzenUIcfg.nameplates["np_cbicon_posx"] = -4
			LolzenUIcfg.nameplates["np_cbicon_posy"] = 0
			LolzenUIcfg.nameplates["np_cbicon_size"] = 8
			LolzenUIcfg.nameplates["np_cbtime_anchor"] = "LEFT"
			LolzenUIcfg.nameplates["np_cbtime_anchor2"] = "LEFT"
			LolzenUIcfg.nameplates["np_cbtime_posx"] = 2
			LolzenUIcfg.nameplates["np_cbtime_posy"] = -5
			LolzenUIcfg.nameplates["np_cbtime_font"] = "DroidSansBold"
			LolzenUIcfg.nameplates["np_cbtime_font_size"] = 6
			LolzenUIcfg.nameplates["np_cbtime_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.nameplates["np_cbtext_anchor"] = "RIGHT"
			LolzenUIcfg.nameplates["np_cbtext_anchor2"] = "RIGHT"
			LolzenUIcfg.nameplates["np_cbtext_posx"] = -2
			LolzenUIcfg.nameplates["np_cbtext_posy"] = -5
			LolzenUIcfg.nameplates["np_cbtext_font"] = "DroidSansBold"
			LolzenUIcfg.nameplates["np_cbtext_font_size"] = 6
			LolzenUIcfg.nameplates["np_cbtext_font_flag"] = "THINOUTLINE"
			ReloadUI()
		end
	end
end)