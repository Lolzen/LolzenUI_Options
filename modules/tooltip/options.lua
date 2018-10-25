--// options for tooltip //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["tooltip"] == true then

		local title = ns.createTitle("tooltip")

		local about = ns.createDescription("tooltip", "Modifies the look of the Tooltip and adds a few features")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

		local cb1 = ns.createCheckBox("tooltip", "tt_factionicons", "|cff5599ffshow factionicons|r", LolzenUIcfg.tooltip["tip_show_factionicons"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local cb2 = ns.createCheckBox("tooltip", "tt_raidmark", "|cff5599ffshow raidmark|r", LolzenUIcfg.tooltip["tip_show_raidmark"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local cb3 = ns.createCheckBox("tooltip", "tt_talents", "|cff5599ffshow talents|r", LolzenUIcfg.tooltip["tip_display_talents"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		local header1 = ns.createHeader("tooltip", "Position:")
		header1:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -20)

		local pos_x_text = ns.createFontstring("tooltip", "PosX:")
		pos_x_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local pos_x = ns.createInputbox("tooltip", 30, 20, LolzenUIcfg.tooltip["tip_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("tooltip", "PosY:")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 10, 0)

		local pos_y = ns.createInputbox("tooltip", 30, 20, LolzenUIcfg.tooltip["tip_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("tooltip", "Anchor1:")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 10, 0)

		local anchor = ns.createPicker("tooltip", "anchor", "tooltip_anchor1", 110, LolzenUIcfg.tooltip["tip_anchor1"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local anchor_text2 = ns.createFontstring("tooltip", "Anchor2:")
		anchor_text2:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local anchor2 = ns.createPicker("tooltip", "anchor", "tooltip_anchor2", 110, LolzenUIcfg.tooltip["tip_anchor2"])
		anchor2:SetPoint("LEFT", anchor_text2, "RIGHT", -10, -3)

		local header2 = ns.createHeader("tooltip", "Textures:")
		header2:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -20)

		local border_text = ns.createFontstring("tooltip", "Border:")
		border_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local border = ns.createPicker("tooltip", "border", "tip_border", 120, LolzenUIcfg.tooltip["tip_border"])
		border:SetPoint("LEFT", border_text, "RIGHT", -10, -3)

		local statusbar_text = ns.createFontstring("tooltip", "Healthbar:")
		statusbar_text:SetPoint("LEFT", border, "RIGHT", -5, 3)

		local statusbar = ns.createPicker("tooltip", "statusbar", "tip_statusbar", 120, LolzenUIcfg.tooltip["tip_healthbar_texture"])
		statusbar:SetPoint("LEFT", statusbar_text, "RIGHT", -10, -3)

		local header3 = ns.createHeader("tooltip", "Status flags:")
		header3:SetPoint("TOPLEFT", border_text, "BOTTOMLEFT", 0, -20)

		local afk_flag_text = ns.createFontstring("tooltip", "AFK flag:")
		afk_flag_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local afk_flag = ns.createInputbox("tooltip", 50, 20, LolzenUIcfg.tooltip["tip_statusflag_afk"])
		afk_flag:SetPoint("LEFT", afk_flag_text, "RIGHT", 10, 0)

		local color_afk_text = ns.createFontstring("tooltip", "Color:")
		color_afk_text:SetPoint("LEFT", afk_flag, "RIGHT", 10, 0)

		local color_afk = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_statusflag_afk_color"], LolzenUIcfg.tooltip["tip_healthbar_texture"])
		color_afk:SetPoint("LEFT", color_afk_text, "RIGHT", 10, 0)

		local color_afk_f = ns.createColorPicker("tooltip", color_afk, LolzenUIcfg.tooltip["tip_statusflag_afk_color"])
		color_afk_f:SetAllPoints(color_afk)

		local dnd_flag_text = ns.createFontstring("tooltip", "DND flag:")
		dnd_flag_text:SetPoint("LEFT", color_afk, "RIGHT", 10, 0)

		local dnd_flag = ns.createInputbox("tooltip", 50, 20, LolzenUIcfg.tooltip["tip_statusflag_dnd"])
		dnd_flag:SetPoint("LEFT", dnd_flag_text, "RIGHT", 10, 0)

		local color_dnd_text = ns.createFontstring("tooltip", "Color:")
		color_dnd_text:SetPoint("LEFT", dnd_flag, "RIGHT", 10, 0)

		local color_dnd = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_statusflag_dnd_color"], LolzenUIcfg.tooltip["tip_healthbar_texture"])
		color_dnd:SetPoint("LEFT", color_dnd_text, "RIGHT", 10, 0)

		local color_dnd_f = ns.createColorPicker("tooltip", color_dnd, LolzenUIcfg.tooltip["tip_statusflag_dnd_color"])
		color_dnd_f:SetAllPoints(color_dnd)

		local off_flag_text = ns.createFontstring("tooltip", "Offline flag:")
		off_flag_text:SetPoint("LEFT", color_dnd, "RIGHT", 10, 0)

		local off_flag = ns.createInputbox("tooltip", 50, 20, LolzenUIcfg.tooltip["tip_statusflag_off"])
		off_flag:SetPoint("LEFT", off_flag_text, "RIGHT", 10, 0)

		local color_off_text = ns.createFontstring("tooltip", "Color:")
		color_off_text:SetPoint("LEFT", off_flag, "RIGHT", 10, 0)

		local color_off = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_statusflag_off_color"], LolzenUIcfg.tooltip["tip_healthbar_texture"])
		color_off:SetPoint("LEFT", color_off_text, "RIGHT", 10, 0)

		local color_off_f = ns.createColorPicker("tooltip", color_off, LolzenUIcfg.tooltip["tip_statusflag_off_color"])
		color_off_f:SetAllPoints(color_off)

		local header4 = ns.createHeader("tooltip", "Player Guild:")
		header4:SetPoint("TOPLEFT", afk_flag_text, "BOTTOMLEFT", 0, -20)

		local cb4 = ns.createCheckBox("tooltip", "tip_global_guild_color", "|cff5599ffuse guild color for any guild (not only your guild)|r", LolzenUIcfg.tooltip["tip_use_guild_color_globally"])
		cb4:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -8)

		local color_text = ns.createFontstring("tooltip", "Color:")
		color_text:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, -8)

		local color = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_own_guild_color"], LolzenUIcfg.tooltip["tip_healthbar_texture"])
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)

		local color_f = ns.createColorPicker("tooltip", color, LolzenUIcfg.tooltip["tip_own_guild_color"])
		color_f:SetAllPoints(color)

		local applyButton = ns.createApplyButton("tooltip")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.tooltip["tip_show_factionicons"] = cb1:GetChecked()
			LolzenUIcfg.tooltip["tip_show_raidmark"] = cb2:GetChecked()
			LolzenUIcfg.tooltip["tip_display_talents"] = cb3:GetChecked()
			LolzenUIcfg.tooltip["tip_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.tooltip["tip_posy"] = tonumber(pos_y:GetText())
			LolzenUIcfg.tooltip["tip_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.tooltip["tip_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			LolzenUIcfg.tooltip["tip_border"] = UIDropDownMenu_GetSelectedName(border)
			LolzenUIcfg.tooltip["tip_healthbar_texture"] = UIDropDownMenu_GetSelectedName(statusbar)
			LolzenUIcfg.tooltip["tip_statusflag_afk"] = afk_flag:GetText()
			LolzenUIcfg.tooltip["tip_statusflag_afk_color"] = {color_afk:GetVertexColor()}
			LolzenUIcfg.tooltip["tip_statusflag_dnd"] = dnd_flag:GetText()
			LolzenUIcfg.tooltip["tip_statusflag_dnd_color"] = {color_dnd:GetVertexColor()}
			LolzenUIcfg.tooltip["tip_statusflag_off"] = off_flag:GetText()
			LolzenUIcfg.tooltip["tip_statusflag_off_color"] = {color_off:GetVertexColor()}
			LolzenUIcfg.tooltip["tip_own_guild_color"] = {color:GetVertexColor()}
			LolzenUIcfg.tooltip["tip_use_guild_color_globally"] = cb4:GetChecked()
			ReloadUI()
		end)

		ns["tooltip"].default = function(self)
			LolzenUIcfg.tooltip["tip_show_factionicons"] = true
			LolzenUIcfg.tooltip["tip_show_raidmark"] = true
			LolzenUIcfg.tooltip["tip_display_talents"] = true
			LolzenUIcfg.tooltip["tip_posx"] = -13
			LolzenUIcfg.tooltip["tip_posy"] = 43
			LolzenUIcfg.tooltip["tip_anchor1"] = "BOTTOMRIGHT"
			LolzenUIcfg.tooltip["tip_anchor2"] = "BOTTOMRIGHT"
			LolzenUIcfg.tooltip["tip_border"] = "LolzenUI Standard"
			LolzenUIcfg.tooltip["tip_healthbar_texture"] = "LolzenUI Standard"
			LolzenUIcfg.tooltip["tip_statusflag_afk"] = "AFK|"
			LolzenUIcfg.tooltip["tip_statusflag_afk_color"] = {1, 1, 1}
			LolzenUIcfg.tooltip["tip_statusflag_dnd"] = "DND|"
			LolzenUIcfg.tooltip["tip_statusflag_dnd_color"] = {1, 1, 1}
			LolzenUIcfg.tooltip["tip_statusflag_off"] = "(Off)"
			LolzenUIcfg.tooltip["tip_statusflag_off_color"] = {1, 1, 1}
			LolzenUIcfg.tooltip["tip_own_guild_color"] = {0, 5, 1}
			LolzenUIcfg.tooltip["tip_use_guild_color_globally"] = false
			ReloadUI()
		end
	end
end)