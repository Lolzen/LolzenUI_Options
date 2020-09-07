--// options for tooltip //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["tooltip"] == true then

		local title = ns.createTitle("tooltip")

		local about = ns.createDescription("tooltip", LUI["desc_tooltip"])

		local cb1 = ns.createCheckBox("tooltip", "tt_factionicons", "|cff5599ff"..L["tt_show_factionicons"].."|r", LolzenUIcfg.tooltip["tip_show_factionicons"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)
		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.tooltip["tip_show_factionicons"] = cb1:GetChecked()
		end)

		local cb2 = ns.createCheckBox("tooltip", "tt_raidmark", "|cff5599ff"..L["show_raidmarks"].."|r", LolzenUIcfg.tooltip["tip_show_raidmark"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)
		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.tooltip["tip_show_raidmark"] = cb2:GetChecked()
		end)

		local cb3 = ns.createCheckBox("tooltip", "tt_talents", "|cff5599ff"..L["tt_show_talents"].."|r", LolzenUIcfg.tooltip["tip_display_talents"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)
		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.tooltip["tip_display_talents"] = cb3:GetChecked()
		end)

		local header1 = ns.createHeader("tooltip", L["Position"])
		header1:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -20)

		local pos_x_text = ns.createFontstring("tooltip", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local pos_x = ns.createInputbox("tooltip", 30, 20, LolzenUIcfg.tooltip["tip_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.tooltip["tip_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("tooltip", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 10, 0)

		local pos_y = ns.createInputbox("tooltip", 30, 20, LolzenUIcfg.tooltip["tip_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.tooltip["tip_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("tooltip", L["anchor"].."1:")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 10, 0)

		local anchor = ns.createPicker("tooltip", "anchor", "tooltip_anchor1", 110, LolzenUIcfg.tooltip["tip_anchor1"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)
		anchor.OnClick = function()
			LolzenUIcfg.tooltip["tip_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
		end

		local anchor_text2 = ns.createFontstring("tooltip", L["anchor"].."2:")
		anchor_text2:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local anchor2 = ns.createPicker("tooltip", "anchor", "tooltip_anchor2", 110, LolzenUIcfg.tooltip["tip_anchor2"])
		anchor2:SetPoint("LEFT", anchor_text2, "RIGHT", -10, -3)
		anchor2.OnClick = function()
			LolzenUIcfg.tooltip["tip_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
		end

		local header2 = ns.createHeader("tooltip", L["texture"])
		header2:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -20)

		local border_text = ns.createFontstring("tooltip", L["border"]..":")
		border_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local border = ns.createPicker("tooltip", "border", "tip_border", 120, LolzenUIcfg.tooltip["tip_border"])
		border:SetPoint("LEFT", border_text, "RIGHT", -10, -3)
		border.OnClick = function()
			LolzenUIcfg.tooltip["tip_border"] = UIDropDownMenu_GetSelectedName(border)
			LolzenUI.setTTBorder()
		end

		local statusbar_text = ns.createFontstring("tooltip", L["tt_healthbar_header"])
		statusbar_text:SetPoint("LEFT", border, "RIGHT", -5, 3)

		local statusbar = ns.createPicker("tooltip", "statusbar", "tip_statusbar", 120, LolzenUIcfg.tooltip["tip_healthbar_texture"])
		statusbar:SetPoint("LEFT", statusbar_text, "RIGHT", -10, -3)
		statusbar.OnClick = function()
			LolzenUIcfg.tooltip["tip_healthbar_texture"] = UIDropDownMenu_GetSelectedName(statusbar)
			LolzenUI.setTTHBTexture()
		end

		local header3 = ns.createHeader("tooltip", L["tt_flags_header"])
		header3:SetPoint("TOPLEFT", border_text, "BOTTOMLEFT", 0, -20)

		local afk_flag_text = ns.createFontstring("tooltip", L["afk_flag"]..":")
		afk_flag_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local afk_flag = ns.createInputbox("tooltip", 50, 20, LolzenUIcfg.tooltip["tip_statusflag_afk"])
		afk_flag:SetPoint("LEFT", afk_flag_text, "RIGHT", 10, 0)

		afk_flag:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		afk_flag:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.tooltip["tip_statusflag_afk"] = afk_flag:GetText()
			self.oldText = self:GetText()
		end)

		afk_flag:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		afk_flag:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local color_afk_text = ns.createFontstring("tooltip", L["color"]..":")
		color_afk_text:SetPoint("LEFT", afk_flag, "RIGHT", 10, 0)

		local color_afk = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_statusflag_afk_color"], "LolzenUI Standard")
		color_afk:SetPoint("LEFT", color_afk_text, "RIGHT", 10, 0)
		color_afk.setActualColors = function()
			LolzenUIcfg.tooltip["tip_statusflag_afk_color"] = {color_afk:GetVertexColor()}
		end

		local color_afk_f = ns.createColorPicker("tooltip", color_afk, LolzenUIcfg.tooltip["tip_statusflag_afk_color"])
		color_afk_f:SetAllPoints(color_afk)

		local dnd_flag_text = ns.createFontstring("tooltip", L["dnd_flag"]..":")
		dnd_flag_text:SetPoint("LEFT", color_afk, "RIGHT", 10, 0)

		local dnd_flag = ns.createInputbox("tooltip", 50, 20, LolzenUIcfg.tooltip["tip_statusflag_dnd"])
		dnd_flag:SetPoint("LEFT", dnd_flag_text, "RIGHT", 10, 0)

		dnd_flag:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		dnd_flag:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.tooltip["tip_statusflag_dnd"] = dnd_flag:GetText()
			self.oldText = self:GetText()
		end)

		dnd_flag:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		dnd_flag:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local color_dnd_text = ns.createFontstring("tooltip", L["color"]..":")
		color_dnd_text:SetPoint("LEFT", dnd_flag, "RIGHT", 10, 0)

		local color_dnd = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_statusflag_dnd_color"], "LolzenUI Standard")
		color_dnd:SetPoint("LEFT", color_dnd_text, "RIGHT", 10, 0)
		color_dnd.setActualColors = function()
			LolzenUIcfg.tooltip["tip_statusflag_dnd_color"] = {color_dnd:GetVertexColor()}
		end

		local color_dnd_f = ns.createColorPicker("tooltip", color_dnd, LolzenUIcfg.tooltip["tip_statusflag_dnd_color"])
		color_dnd_f:SetAllPoints(color_dnd)

		local off_flag_text = ns.createFontstring("tooltip", L["tt_offline_flag"])
		off_flag_text:SetPoint("LEFT", color_dnd, "RIGHT", 10, 0)

		local off_flag = ns.createInputbox("tooltip", 50, 20, LolzenUIcfg.tooltip["tip_statusflag_off"])
		off_flag:SetPoint("LEFT", off_flag_text, "RIGHT", 10, 0)

		off_flag:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		off_flag:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.tooltip["tip_statusflag_off"] = off_flag:GetText()
			self.oldText = self:GetText()
		end)

		off_flag:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		off_flag:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local color_off_text = ns.createFontstring("tooltip", L["color"]..":")
		color_off_text:SetPoint("LEFT", off_flag, "RIGHT", 10, 0)

		local color_off = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_statusflag_off_color"], "LolzenUI Standard")
		color_off:SetPoint("LEFT", color_off_text, "RIGHT", 10, 0)
		color_off.setActualColors = function()
			LolzenUIcfg.tooltip["tip_statusflag_off_color"] = {color_off:GetVertexColor()}
		end

		local color_off_f = ns.createColorPicker("tooltip", color_off, LolzenUIcfg.tooltip["tip_statusflag_off_color"])
		color_off_f:SetAllPoints(color_off)

		local header4 = ns.createHeader("tooltip", L["tt_player_guild_header"])
		header4:SetPoint("TOPLEFT", afk_flag_text, "BOTTOMLEFT", 0, -20)

		local cb4 = ns.createCheckBox("tooltip", "tip_global_guild_color", "|cff5599ff"..L["tt_use_guild_color_globally"].."|r", LolzenUIcfg.tooltip["tip_use_guild_color_globally"])
		cb4:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -8)
		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.tooltip["tip_use_guild_color_globally"] = cb4:GetChecked()
		end)

		local color_text = ns.createFontstring("tooltip", L["color"]..":")
		color_text:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, -8)

		local color = ns.createColorTexture("tooltip", 16, 16, LolzenUIcfg.tooltip["tip_own_guild_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)
		color.setActualColors = function()
			LolzenUIcfg.tooltip["tip_own_guild_color"] = {color:GetVertexColor()}
		end

		local color_f = ns.createColorPicker("tooltip", color, LolzenUIcfg.tooltip["tip_own_guild_color"])
		color_f:SetAllPoints(color)

		ns["tooltip"].default = function(self)
			LolzenUIcfg.tooltip = _G["LolzenUIdefaultcfg"].tooltip
			ReloadUI()
		end
	end
end)