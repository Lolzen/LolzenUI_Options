--// options for xpbar //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["xpbar"] == true then

		local title = ns.createTitle("xpbar")

		local about = ns.createDescription("xpbar", LUI["desc_xpbar"])

		local header1 = ns.createHeader("xpbar", L["frame"])
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local height_text = ns.createFontstring("xpbar", L["height"]..":")
		height_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local height = ns.createInputbox("xpbar", 30, 20, LolzenUIcfg.xpbar["xpbar_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		local width_text = ns.createFontstring("xpbar", L["width"]..":")
		width_text:SetPoint("LEFT", height, "RIGHT", 10, 0)

		local width = ns.createInputbox("xpbar", 40, 20, LolzenUIcfg.xpbar["xpbar_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		local alpha_text = ns.createFontstring("xpbar", L["alpha"]..":")
		alpha_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local alpha = ns.createPicker("xpbar", "alpha", "xpbar_alpha", 45, LolzenUIcfg.xpbar["xpbar_alpha"])
		alpha:SetPoint("LEFT", alpha_text, "RIGHT", -10, -3)

		local bg_alpha_text = ns.createFontstring("xpbar", L["bgalpha"]..":")
		bg_alpha_text:SetPoint("LEFT", alpha, "RIGHT", -5, 3)

		local bg_alpha = ns.createPicker("xpbar", "alpha", "xpbar_bg_alpha", 45, LolzenUIcfg.xpbar["xpbar_bg_alpha"])
		bg_alpha:SetPoint("LEFT", bg_alpha_text, "RIGHT", -10, -3)

		local pos_x_text = ns.createFontstring("xpbar", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", height_text, "BOTTOMLEFT", 0, -15)

		local pos_x = ns.createInputbox("xpbar", 30, 20, LolzenUIcfg.xpbar["xpbar_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("xpbar", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("xpbar", 30, 20, LolzenUIcfg.xpbar["xpbar_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("xpbar", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("xpbar", "anchor", "xpbar_anchor_bar", 110, LolzenUIcfg.xpbar["xpbar_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local parent_text = ns.createFontstring("xpbar", L["parent"]..":")
		parent_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local parent = ns.createInputbox("xpbar", 100, 20, LolzenUIcfg.xpbar["xpbar_parent"])
		parent:SetPoint("LEFT", parent_text, "RIGHT", 10, 0)

		local texture_text = ns.createFontstring("xpbar", L["texture"]..":")
		texture_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -15)

		local texture = ns.createPicker("xpbar", "statusbar", "xpbar_statusbar", 120, LolzenUIcfg.xpbar["xpbar_texture"])
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)

		local color_text = ns.createFontstring("xpbar", L["xp_regular_xp_color"]..":")
		color_text:SetPoint("TOPLEFT", texture_text, "BOTTOMLEFT", 0, -15)

		local color = ns.createColorTexture("xpbar", 16, 16, LolzenUIcfg.xpbar["xpbar_xp_color"], LolzenUIcfg.xpbar["xpbar_texture"])
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)

		local color_f = ns.createColorPicker("xpbar", color, LolzenUIcfg.xpbar["xpbar_xp_color"])
		color_f:SetAllPoints(color)

		local color_text2 = ns.createFontstring("xpbar", L["xp_rested_xp_color"]..":")
		color_text2:SetPoint("LEFT", color, "RIGHT", 15, 0)

		local color2 = ns.createColorTexture("xpbar", 16, 16, LolzenUIcfg.xpbar["xpbar_xp_rested_color"], LolzenUIcfg.xpbar["xpbar_texture"])
		color2:SetPoint("LEFT", color_text2, "RIGHT", 10, 0)

		local color_f2 = ns.createColorPicker("xpbar", color2, LolzenUIcfg.xpbar["xpbar_xp_rested_color"])
		color_f2:SetAllPoints(color2)

		local color_text3 = ns.createFontstring("xpbar", L["xp_pvp_color"]..":")
		color_text3:SetPoint("LEFT", color2, "RIGHT", 15, 0)

		local color3 = ns.createColorTexture("xpbar", 16, 16, LolzenUIcfg.xpbar["xpbar_pvp_color"], LolzenUIcfg.xpbar["xpbar_texture"])
		color3:SetPoint("LEFT", color_text3, "RIGHT", 10, 0)

		local color_f3 = ns.createColorPicker("xpbar", color3, LolzenUIcfg.xpbar["xpbar_pvp_color"])
		color_f3:SetAllPoints(color3)

		local color_text4 = ns.createFontstring("xpbar", L["xp_paragon_color"]..":")
		color_text4:SetPoint("LEFT", color3, "RIGHT", 15, 0)

		local color4 = ns.createColorTexture("xpbar", 16, 16, LolzenUIcfg.xpbar["xpbar_paragon_color"], LolzenUIcfg.xpbar["xpbar_texture"])
		color4:SetPoint("LEFT", color_text4, "RIGHT", 10, 0)

		local color_f4 = ns.createColorPicker("xpbar", color4, LolzenUIcfg.xpbar["xpbar_paragon_color"])
		color_f4:SetAllPoints(color4)

		local cb1 = ns.createCheckBox("xpbar", "pxborder_xp", "|cff5599ff"..L["xp_draw_1px"].."|r", LolzenUIcfg.xpbar["xpbar_1px_border"])
		cb1:SetPoint("TOPLEFT", color_text, "BOTTOMLEFT", 0, -8)

		local cb2 = ns.createCheckBox("xpbar", "pxborder_round_xp", "|cff5599ff"..L["xp_1px_round"].."|r", LolzenUIcfg.xpbar["xpbar_1px_border_round"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		cb1:SetScript("OnClick", function(self)
			if cb1:GetChecked() == false then
				cb2:Disable()
				pxborder_round_xpText:SetText("|cff555555"..L["xp_1px_round"].."|r |cffff5555"..L["xp_1px_notice"].."|r")
			else
				cb2:Enable()
				pxborder_round_xpText:SetText("|cff5599ff"..L["xp_1px_round"].."|r")
			end
		end)

		if cb1:GetChecked() == false then
			cb2:Disable()
			pxborder_round_xpText:SetText("|cff555555"..L["xp_1px_round"].."|r |cffff5555"..L["xp_1px_notice"].."|r")
		else
			cb2:Enable()
		end

		local header2 = ns.createHeader("xpbar", L["font"])
		header2:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -30)

		local font_pos_x_text = ns.createFontstring("xpbar", L["PosX"]..":")
		font_pos_x_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		local font_pos_x = ns.createInputbox("xpbar", 30, 20, LolzenUIcfg.xpbar["xpbar_text_posx"])
		font_pos_x:SetPoint("LEFT", font_pos_x_text, "RIGHT", 10, 0)

		local font_pos_y_text = ns.createFontstring("xpbar", L["PosY"]..":")
		font_pos_y_text:SetPoint("LEFT", font_pos_x, "RIGHT", 5, 0)

		local font_pos_y = ns.createInputbox("xpbar", 30, 20, LolzenUIcfg.xpbar["xpbar_text_posy"])
		font_pos_y:SetPoint("LEFT", font_pos_y_text, "RIGHT", 10, 0)

		local font_anchor_text = ns.createFontstring("xpbar", L["anchor"]..":")
		font_anchor_text:SetPoint("LEFT", font_pos_y, "RIGHT", 5, 0)

		local font_anchor = ns.createPicker("xpbar", "anchor", "xpbar_text_anchor_1", 110, LolzenUIcfg.xpbar["xpbar_text_anchor1"])
		font_anchor:SetPoint("LEFT", font_anchor_text, "RIGHT", -10, -3)

		local font_color_text = ns.createFontstring("xpbar", L["color"]..":")
		font_color_text:SetPoint("LEFT", font_anchor, "RIGHT", -5, 3)

		local font_color = ns.createColorTexture("xpbar", 16, 16, LolzenUIcfg.xpbar["xpbar_font_color"], LolzenUIcfg.xpbar["xpbar_texture"])
		font_color:SetPoint("LEFT", font_color_text, "RIGHT", 10, 0)

		local font_color_f = ns.createColorPicker("xpbar", text_color, LolzenUIcfg.xpbar["xpbar_font_color"])
		font_color_f:SetAllPoints(font_color)

		local font_text = ns.createFontstring("xpbar", L["font"]..":")
		font_text:SetPoint("TOPLEFT", font_pos_x_text, "BOTTOMLEFT", 0, -15)

		local font = ns.createPicker("xpbar", "font", "xpbar_font", 120, LolzenUIcfg.xpbar["xpbar_font"])
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)

		local font_size_text = ns.createFontstring("xpbar", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("xpbar", 30, 20, LolzenUIcfg.xpbar["xpbar_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		local font_flag_text = ns.createFontstring("xpbar", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 5, 0)

		local font_flag = ns.createPicker("xpbar", "flag", "xpbar_font_flag", 120, LolzenUIcfg.xpbar["xpbar_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)

		local cb3 = ns.createCheckBox("xpbar", "xp_text_hover", "|cff5599ff"..L["xp_mouseover_text"].."|r", LolzenUIcfg.xpbar["xpbar_mouseover_text"])
		cb3:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -8)

		local applyButton = ns.createApplyButton("xpbar")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.xpbar["xpbar_height"] = tonumber(height:GetText())
			LolzenUIcfg.xpbar["xpbar_width"] = tonumber(width:GetText())
			LolzenUIcfg.xpbar["xpbar_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.xpbar["xpbar_parent"] = parent:GetText()
			LolzenUIcfg.xpbar["xpbar_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.xpbar["xpbar_posy"] = tonumber(pos_y:GetText())
			LolzenUIcfg.xpbar["xpbar_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUIcfg.xpbar["xpbar_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(alpha)])
			LolzenUIcfg.xpbar["xpbar_bg_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(bg_alpha)])
			LolzenUIcfg.xpbar["xpbar_xp_color"] = {color:GetVertexColor()}
			LolzenUIcfg.xpbar["xpbar_xp_rested_color"] = {color2:GetVertexColor()}
			LolzenUIcfg.xpbar["xpbar_pvp_color"] = {color3:GetVertexColor()}
			LolzenUIcfg.xpbar["xpbar_paragon_color"] = {color4:GetVertexColor()}
			LolzenUIcfg.xpbar["xpbar_1px_border"] = cb1:GetChecked()
			LolzenUIcfg.xpbar["xpbar_1px_border_round"] = cb2:GetChecked()
			LolzenUIcfg.xpbar["xpbar_mouseover_text"] = cb3:GetChecked()
			LolzenUIcfg.xpbar["xpbar_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUIcfg.xpbar["xpbar_font_size"] = tonumber(font_size:GetText())
			LolzenUIcfg.xpbar["xpbar_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUIcfg.xpbar["xpbar_font_color"] = {font_color:GetVertexColor()}
			LolzenUIcfg.xpbar["xpbar_text_posx"] = tonumber(font_pos_x:GetText())
			LolzenUIcfg.xpbar["xpbar_text_posy"] = tonumber(font_pos_y:GetText())
			LolzenUIcfg.xpbar["xpbar_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(font_anchor)]
			ReloadUI()
		end)

		ns["xpbar"].default = function(self)
			LolzenUIcfg.xpbar["xpbar_height"] = 4
			LolzenUIcfg.xpbar["xpbar_width"] = 378
			LolzenUIcfg.xpbar["xpbar_anchor"] = "BOTTOM"
			LolzenUIcfg.xpbar["xpbar_parent"] = "UIParent"
			LolzenUIcfg.xpbar["xpbar_posx"] = 0
			LolzenUIcfg.xpbar["xpbar_posy"] = 5
			LolzenUIcfg.xpbar["xpbar_texture"] = "LolzenUI Standard"
			LolzenUIcfg.xpbar["xpbar_alpha"] = 0.4
			LolzenUIcfg.xpbar["xpbar_bg_alpha"] = 0.5
			LolzenUIcfg.xpbar["xpbar_xp_color"] = {0.6, 0, 0.6}
			LolzenUIcfg.xpbar["xpbar_xp_rested_color"] = {46/255, 103/255, 208/255}
			LolzenUIcfg.xpbar["xpbar_pvp_color"] = {1, 0.4, 0}
			LolzenUIcfg.xpbar["xpbar_paragon_color"] = {0, 187/255, 255/255}
			LolzenUIcfg.xpbar["xpbar_1px_border"] = true
			LolzenUIcfg.xpbar["xpbar_1px_border_round"] = true
			LolzenUIcfg.xpbar["xpbar_mouseover_text"] = true
			LolzenUIcfg.xpbar["xpbar_font"] = "DroidSansBold"
			LolzenUIcfg.xpbar["xpbar_font_size"] = 10
			LolzenUIcfg.xpbar["xpbar_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.xpbar["xpbar_font_color"] = {1, 1, 1}
			LolzenUIcfg.xpbar["xpbar_text_posx"] = 0
			LolzenUIcfg.xpbar["xpbar_text_posy"] = 8
			LolzenUIcfg.xpbar["xpbar_text_anchor1"] = "TOP"
			ReloadUI()
		end
	end
end)