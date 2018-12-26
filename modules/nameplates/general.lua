--// options for nameplates //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L
local LSM = LibStub("LibSharedMedia-3.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["nameplates"] == true then

		local title = ns.createTitle("nameplates")

		local about = ns.createDescription("nameplates", LUI["desc_nameplates"])

		local header1 = ns.createHeader("nameplates", L["Preview"]..":")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local prev_np_frame = CreateFrame("Frame", nil, ns["nameplates"])
		prev_np_frame:SetSize(LolzenUIcfg.nameplates["np_width"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_height"]*LolzenUIcfg.nameplates["np_selected_scale"])
		prev_np_frame:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -10)

		local prev_np = prev_np_frame:CreateTexture(nil, "BACKGROUND")
		prev_np:SetAllPoints(prev_np_frame)
		prev_np:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates["np_texture"]))
		prev_np:SetVertexColor(0.6, 0.1, 0)

		local prev_np_lvlname = prev_np_frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates["np_lvlname_font"]), LolzenUIcfg.nameplates["np_lvlname_font_size"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_lvlname_font_flag"])
		prev_np_lvlname:SetText("|cffffff00110|r + Random Name")
		prev_np_lvlname:SetPoint(LolzenUIcfg.nameplates["np_lvlname_anchor"], prev_np_frame, LolzenUIcfg.nameplates["np_lvlname_posx"], LolzenUIcfg.nameplates["np_lvlname_posy"])

		local prev_np_threatglow = CreateFrame("Frame", nil, ns["nameplates"])
		prev_np_threatglow:SetFrameStrata("BACKGROUND")
		prev_np_threatglow:SetBackdrop({
			edgeFile ="Interface\\AddOns\\LolzenUI\\media\\glow", edgeSize = 5,
			insets = {left = 4, right = 4, top = 4, bottom = 4}
		})
		prev_np_threatglow:SetPoint("TOPLEFT", prev_np, -5, 5)
		prev_np_threatglow:SetPoint("BOTTOMRIGHT", prev_np, 5, -5)
		prev_np_threatglow:SetBackdropBorderColor(6, 0, 0)

		local prev_np_targetindicator = prev_np_frame:CreateTexture(nil, "OVERLAY")
		prev_np_targetindicator:SetTexture("Interface\\AddOns\\LolzenUI\\media\\target-glow")
		prev_np_targetindicator:SetPoint("CENTER", prev_np, 0, -3*LolzenUIcfg.nameplates["np_selected_scale"])
		prev_np_targetindicator:SetSize(LolzenUIcfg.nameplates["np_width"]*LolzenUIcfg.nameplates["np_selected_scale"], LolzenUIcfg.nameplates["np_height"]*LolzenUIcfg.nameplates["np_selected_scale"])
		prev_np_targetindicator:SetVertexColor(48/255, 113/255, 191/255)

		local prev_np_raidmark = prev_np_frame:CreateTexture(nil, "OVERLAY")
		prev_np_raidmark:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8")
		prev_np_raidmark:SetPoint(LolzenUIcfg.nameplates["np_raidmark_anchor"], prev_np, LolzenUIcfg.nameplates["np_raidmark_posx"], LolzenUIcfg.nameplates["np_raidmark_posy"])
		prev_np_raidmark:SetSize(LolzenUIcfg.nameplates["np_raidmark_size"], LolzenUIcfg.nameplates["np_raidmark_size"])

		local cb1 = ns.createCheckBox("nameplates", "targetindicator", "|cff5599ff"..L["np_show_targetindicator"].."|r", LolzenUIcfg.nameplates["np_targetindicator"])
		cb1:SetPoint("TOPLEFT", prev_np, "BOTTOMLEFT", 0, -20)

		cb1:SetScript("OnClick", function(self)
			if cb1:GetChecked() == false then
				prev_np_targetindicator:Hide()
			else
				prev_np_targetindicator:Show()
			end
		end)

		if cb1:GetChecked() == false then
			prev_np_targetindicator:Hide()
		else
			prev_np_targetindicator:Show()
		end

		local cb2 = ns.createCheckBox("nameplates", "threatindicator", "|cff5599ff"..L["np_show_threat_border"].."|r", LolzenUIcfg.nameplates["np_threatindicator"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		cb2:SetScript("OnClick", function(self)
			if cb2:GetChecked() == false then
				prev_np_threatglow:Hide()
			else
				prev_np_threatglow:Show()
			end
		end)

		if cb2:GetChecked() == false then
			prev_np_threatglow:Hide()
		else
			prev_np_threatglow:Show()
		end

		local header2 = ns.createHeader("nameplates", L["np_nameplates_general_header"])
		header2:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -20)

		local height_text = ns.createFontstring("nameplates", L["height"]..":")
		height_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		local height = ns.createInputbox("nameplates", 40, 20, LolzenUIcfg.nameplates["np_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		local width_text = ns.createFontstring("nameplates", L["width"]..":")
		width_text:SetPoint("LEFT", height, "RIGHT", 10, 0)

		local width = ns.createInputbox("nameplates", 40, 20, LolzenUIcfg.nameplates["np_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		local texture_text = ns.createFontstring("nameplates", L["texture"]..":")
		texture_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local texture = ns.createPicker("nameplates", "statusbar", "np_statusbar", 120, LolzenUIcfg.nameplates["np_texture"])
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)

		local selected_text = ns.createFontstring("nameplates", L["np_target_nameplate_scale"]..":")
		selected_text:SetPoint("LEFT", texture, "RIGHT", -5, 3)

		local selected = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_selected_scale"])
		selected:SetPoint("LEFT", selected_text, "RIGHT", 10, 0)

		local header3 = ns.createHeader("nameplates", L["np_level_and_name_header"])
		header3:SetPoint("TOPLEFT", height_text, "BOTTOMLEFT", 0, -30)

		local lvlname_font_text = ns.createFontstring("nameplates", L["font"]..":")
		lvlname_font_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -10)

		local lvlname_font = ns.createPicker("nameplates", "font", "lvlname_font", 120, LolzenUIcfg.nameplates["np_lvlname_font"])
		lvlname_font:SetPoint("LEFT", lvlname_font_text, "RIGHT", -10, -3)

		local lvlname_font_size_text = ns.createFontstring("nameplates", L["size"]..":")
		lvlname_font_size_text:SetPoint("LEFT", lvlname_font, "RIGHT", -10, 3)

		local lvlname_font_size = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_lvlname_font_size"])
		lvlname_font_size:SetPoint("LEFT", lvlname_font_size_text, "RIGHT", 10, 0)

		local lvlname_font_flag_text = ns.createFontstring("nameplates", L["flag"]..":")
		lvlname_font_flag_text:SetPoint("LEFT", lvlname_font_size, "RIGHT", 10, 0)

		local lvlname_font_flag = ns.createPicker("nameplates", "flag", "lvlname_font_flag", 120, LolzenUIcfg.nameplates["np_lvlname_font_flag"])
		lvlname_font_flag:SetPoint("LEFT", lvlname_font_flag_text, "RIGHT", -10, -3)

		local lvlname_pos_x_text = ns.createFontstring("nameplates", L["PosX"]..":")
		lvlname_pos_x_text:SetPoint("TOPLEFT", lvlname_font_text, "BOTTOMLEFT", 0, -15)

		local lvlname_pos_x = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_lvlname_posx"])
		lvlname_pos_x:SetPoint("LEFT", lvlname_pos_x_text, "RIGHT", 10, 0)

		local lvlname_pos_y_text = ns.createFontstring("nameplates", L["PosY"]..":")
		lvlname_pos_y_text:SetPoint("LEFT", lvlname_pos_x, "RIGHT", 5, 0)

		local lvlname_pos_y = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_lvlname_posy"])
		lvlname_pos_y:SetPoint("LEFT", lvlname_pos_y_text, "RIGHT", 10, 0)

		local lvlname_anchor_text = ns.createFontstring("nameplates", L["anchor"]..":")
		lvlname_anchor_text:SetPoint("LEFT", lvlname_pos_y, "RIGHT", 10, 0)

		local lvlname_anchor = ns.createPicker("nameplates", "anchor", "nameplates_lvlname_anchor1", 110, LolzenUIcfg.nameplates["np_lvlname_anchor"])
		lvlname_anchor:SetPoint("LEFT", lvlname_anchor_text, "RIGHT", -10, -3)

		local header4 = ns.createHeader("nameplates", L["raidmarks"])
		header4:SetPoint("TOPLEFT", lvlname_pos_x_text, "BOTTOMLEFT", 0, -30)

		local cb3 = ns.createCheckBox("nameplates", "raidtargetindicator", "|cff5599ff"..L["show_raidmarks"].."|r", LolzenUIcfg.nameplates["np_raidtargetindicator"])
		cb3:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -5)

		cb3:SetScript("OnClick", function(self)
			if cb3:GetChecked() == false then
				prev_np_raidmark:Hide()
			else
				prev_np_raidmark:Show()
			end
		end)

		if cb3:GetChecked() == false then
			prev_np_raidmark:Hide()
		else
			prev_np_raidmark:Show()
		end

		local rt_size_text = ns.createFontstring("nameplates", L["size"]..":")
		rt_size_text:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, 0)

		local rt_size = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_raidmark_size"])
		rt_size:SetPoint("LEFT", rt_size_text, "RIGHT", 10, 0)

		local rt_pos_x_text = ns.createFontstring("nameplates", L["PosX"]..":")
		rt_pos_x_text:SetPoint("LEFT", rt_size, "RIGHT", 10, 0)

		local rt_pos_x = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_raidmark_posx"])
		rt_pos_x:SetPoint("LEFT", rt_pos_x_text, "RIGHT", 10, 0)

		local rt_pos_y_text = ns.createFontstring("nameplates", L["PosY"]..":")
		rt_pos_y_text:SetPoint("LEFT", rt_pos_x, "RIGHT", 5, 0)

		local rt_pos_y = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_raidmark_posy"])
		rt_pos_y:SetPoint("LEFT", rt_pos_y_text, "RIGHT", 10, 0)

		local rt_anchor_text = ns.createFontstring("nameplates", L["anchor"]..":")
		rt_anchor_text:SetPoint("LEFT", rt_pos_y, "RIGHT", 10, 0)

		local rt_anchor = ns.createPicker("nameplates", "anchor", "nameplates_raidmark_anchor", 110, LolzenUIcfg.nameplates["np_raidmark_anchor"])
		rt_anchor:SetPoint("LEFT", rt_anchor_text, "RIGHT", -10, -3)

		local header5 = ns.createHeader("nameplates", L["auras"])
		header5:SetPoint("TOPLEFT", rt_size_text, 0, -30)

		local aura_type_text = ns.createFontstring("nameplates", L["show"]..":")
		aura_type_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 0, -8)

		local aura_type = ns.createPicker("nameplates", "uf_auratype", "np_aura_type", 70, LolzenUIcfg.nameplates["np_aura_show_type"])
		aura_type:SetPoint("LEFT", aura_type_text, "RIGHT", -10, -3)

		local aura_maxnum_text = ns.createFontstring("nameplates", L["show_max_0_to_40"]..":")
		aura_maxnum_text:SetPoint("LEFT", aura_type, "RIGHT", -5, 3)

		local aura_maxnum = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_aura_maxnum"])
		aura_maxnum:SetPoint("LEFT", aura_maxnum_text, "RIGHT", 10, 0)

		local aura_spacing_text = ns.createFontstring("nameplates", L["spacing"]..":")
		aura_spacing_text:SetPoint("LEFT", aura_maxnum, "RIGHT", 10, 0)

		local aura_spacing = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_aura_spacing"])
		aura_spacing:SetPoint("LEFT", aura_spacing_text, "RIGHT", 10, 0)

		local aura_size_text = ns.createFontstring("nameplates", L["size"]..":")
		aura_size_text:SetPoint("LEFT", aura_spacing, "RIGHT", 10, 0)

		local aura_size = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_aura_size"])
		aura_size:SetPoint("LEFT", aura_size_text, "RIGHT", 10, 0)

		local aura_pos_x_text = ns.createFontstring("nameplates", L["PosX"]..":")
		aura_pos_x_text:SetPoint("TOPLEFT", aura_type_text, "BOTTOMLEFT", 0, -15)

		local aura_pos_x = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_aura_posx"])
		aura_pos_x:SetPoint("LEFT", aura_pos_x_text, "RIGHT", 10, 0)

		local aura_pos_y_text = ns.createFontstring("nameplates", L["PosY"]..":")
		aura_pos_y_text:SetPoint("LEFT", aura_pos_x, "RIGHT", 5, 0)

		local aura_pos_y = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates["np_aura_posy"])
		aura_pos_y:SetPoint("LEFT", aura_pos_y_text, "RIGHT", 10, 0)

		local aura_anchor_text = ns.createFontstring("nameplates", L["anchor"].."1:")
		aura_anchor_text:SetPoint("LEFT", aura_pos_y, "RIGHT", 5, 0)

		local aura_anchor = ns.createPicker("nameplates", "anchor", "np_aura_anchor", 90, LolzenUIcfg.nameplates["np_aura_anchor1"])
		aura_anchor:SetPoint("LEFT", aura_anchor_text, "RIGHT", -10, -3)

		local aura_anchor2_text = ns.createFontstring("nameplates", L["anchor"].."2:")
		aura_anchor2_text:SetPoint("LEFT", aura_anchor, "RIGHT", -10, 3)

		local aura_anchor2 = ns.createPicker("nameplates", "anchor", "np_aura_anchor2", 90, LolzenUIcfg.nameplates["np_aura_anchor2"])
		aura_anchor2:SetPoint("LEFT", aura_anchor2_text, "RIGHT", -10, -3)

		local aura_growthx_text = ns.createFontstring("nameplates", L["growth_x"]..":")
		aura_growthx_text:SetPoint("TOPLEFT", aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		local aura_growthx = ns.createPicker("nameplates", "uf_auragrowth_x", "np_aura_growthx", 70, LolzenUIcfg.nameplates["np_aura_growth_x"])
		aura_growthx:SetPoint("LEFT", aura_growthx_text, "RIGHT", -10, -3)

		local aura_growthy_text = ns.createFontstring("nameplates", L["growth_y"]..":")
		aura_growthy_text:SetPoint("LEFT", aura_growthx, "RIGHT", -5, 3)

		local aura_growthy = ns.createPicker("nameplates", "uf_auragrowth_y", "np_aura_growthy", 70, LolzenUIcfg.nameplates["np_aura_growth_y"])
		aura_growthy:SetPoint("LEFT", aura_growthy_text, "RIGHT", -10, -3)

		local cb5 = ns.createCheckBox("nameplates", "np_show_only_player_auras", "|cff5599ff"..L["show_only_player_auras"].."|r", LolzenUIcfg.nameplates["np_aura_show_only_player"])
		cb5:SetPoint("TOPLEFT", aura_growthx_text, "BOTTOMLEFT", 0, -8)

		local cb6 = ns.createCheckBox("nameplates", "np_desature_nonplayer_auras", "|cff5599ff"..L["desature_auras_not_by_player"].."|r", LolzenUIcfg.nameplates["np_aura_desature_nonplayer_auras"])
		cb6:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, 0)

		cb5:SetScript("OnClick", function(self)
			if cb5:GetChecked() == true then
				cb6:Hide()
			else
				cb6:Show()
			end
		end)

		if cb5:GetChecked() == true then
			cb6:Hide()
		else
			cb6:Show()
		end

		local applyButton = ns.createApplyButton("nameplates")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.nameplates["np_targetindicator"] = cb1:GetChecked()
			LolzenUIcfg.nameplates["np_threatindicator"] = cb2:GetChecked()
			LolzenUIcfg.nameplates["np_raidtargetindicator"] = cb3:GetChecked()
			LolzenUIcfg.nameplates["np_width"] = tonumber(width:GetText())
			LolzenUIcfg.nameplates["np_height"] = tonumber(height:GetText())
			LolzenUIcfg.nameplates["np_selected_scale"] = tonumber(selected:GetText())
			LolzenUIcfg.nameplates["np_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUIcfg.nameplates["np_lvlname_font"] = UIDropDownMenu_GetSelectedName(lvlname_font)
			LolzenUIcfg.nameplates["np_lvlname_font_size"] = tonumber(lvlname_font_size:GetText())
			LolzenUIcfg.nameplates["np_lvlname_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(lvlname_font_flag)]
			LolzenUIcfg.nameplates["np_lvlname_posx"] = tonumber(lvlname_pos_x:GetText())
			LolzenUIcfg.nameplates["np_lvlname_posy"] = tonumber(lvlname_pos_y:GetText())
			LolzenUIcfg.nameplates["np_lvlname_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(lvlname_anchor)]
			LolzenUIcfg.nameplates["np_raidmark_size"] = tonumber(rt_size:GetText())
			LolzenUIcfg.nameplates["np_raidmark_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(rt_anchor)]
			LolzenUIcfg.nameplates["np_raidmark_posx"] = tonumber(rt_pos_x:GetText())
			LolzenUIcfg.nameplates["np_raidmark_posy"] = tonumber(rt_pos_y:GetText())
			LolzenUIcfg.nameplates["np_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(aura_type)]
			LolzenUIcfg.nameplates["np_aura_maxnum"] = tonumber(aura_maxnum:GetText())
			LolzenUIcfg.nameplates["np_aura_spacing"] = tonumber(aura_spacing:GetText())
			LolzenUIcfg.nameplates["np_aura_size"] = tonumber(aura_size:GetText())
			LolzenUIcfg.nameplates["np_aura_posx"] = tonumber(aura_pos_x:GetText())
			LolzenUIcfg.nameplates["np_aura_posy"] = tonumber(aura_pos_y:GetText())
			LolzenUIcfg.nameplates["np_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor)]
			LolzenUIcfg.nameplates["np_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor2)]
			LolzenUIcfg.nameplates["np_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(aura_growthx)]
			LolzenUIcfg.nameplates["np_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(aura_growthy)]
			LolzenUIcfg.nameplates["np_aura_show_only_player"] = cb5:GetChecked()
			LolzenUIcfg.nameplates["np_aura_desature_nonplayer_auras"] = cb6:GetChecked()
			ReloadUI()
		end)

		ns["nameplates"].default = function(self)
			LolzenUIcfg.nameplates["np_targetindicator"] = true
			LolzenUIcfg.nameplates["np_threatindicator"] = true
			LolzenUIcfg.nameplates["np_raidtargetindicator"] = true
			LolzenUIcfg.nameplates["np_width"] = 100
			LolzenUIcfg.nameplates["np_height"] = 4
			LolzenUIcfg.nameplates["np_selected_scale"] = 1.4
			LolzenUIcfg.nameplates["np_texture"] = "LolzenUI Standard"
			LolzenUIcfg.nameplates["np_lvlname_font"] = "DroidSansBold"
			LolzenUIcfg.nameplates["np_lvlname_font_size"] = 6
			LolzenUIcfg.nameplates["np_lvlname_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.nameplates["np_lvlname_posx"] = 0
			LolzenUIcfg.nameplates["np_lvlname_posy"] = 3
			LolzenUIcfg.nameplates["np_lvlname_anchor"] = "CENTER"
			LolzenUIcfg.nameplates["np_raidmark_size"] = 16
			LolzenUIcfg.nameplates["np_raidmark_anchor"] = "TOPRIGHT"
			LolzenUIcfg.nameplates["np_raidmark_posx"] = -2
			LolzenUIcfg.nameplates["np_raidmark_posy"] = 14
			LolzenUIcfg.nameplates["np_aura_show_type"] = "None"
			LolzenUIcfg.nameplates["np_aura_maxnum"] = 8
			LolzenUIcfg.nameplates["np_aura_spacing"] = 4
			LolzenUIcfg.nameplates["np_aura_size"] = 14
			LolzenUIcfg.nameplates["np_aura_posx"] = 0
			LolzenUIcfg.nameplates["np_aura_posy"] = 10
			LolzenUIcfg.nameplates["np_aura_anchor1"] = "BOTTOM"
			LolzenUIcfg.nameplates["np_aura_anchor2"] = "TOP"
			LolzenUIcfg.nameplates["np_aura_growth_x"] = "RIGHT"
			LolzenUIcfg.nameplates["np_aura_growth_y"] = "UP"
			LolzenUIcfg.nameplates["np_aura_show_only_player"] = true
			LolzenUIcfg.nameplates["np_aura_desature_nonplayer_auras"] = true
			ReloadUI()
		end
	end
end)