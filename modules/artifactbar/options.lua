--// options for artifactbar //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L
local LSM = LibStub("LibSharedMedia-3.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["artifactbar"] == true then

		local title = ns.createTitle("artifactbar")

		local about = ns.createDescription("artifactbar", LUI["desc_artifactbar"])

		local header1 = ns.createHeader("artifactbar", L["frame"])
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local header1BG = ns.createBackground("artifactbar", 600, 154)
		header1BG:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", -4, -4)
		header1BG:SetFrameLevel(1)

		local height_text = ns.createFontstring("artifactbar", L["height"]..":")
		height_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -16)

		local height = ns.createInputbox("artifactbar", 30, 20, LolzenUIcfg.artifactbar["artifactbar_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_height"] = tonumber(self:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarHeight()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local width_text = ns.createFontstring("artifactbar", L["width"]..":")
		width_text:SetPoint("LEFT", height, "RIGHT", 10, 0)

		local width = ns.createInputbox("artifactbar", 40, 20, LolzenUIcfg.artifactbar["artifactbar_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_width"] = tonumber(self:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarWidth()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local alpha_text = ns.createFontstring("artifactbar", L["alpha"]..":")
		alpha_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local alpha = ns.createPicker("artifactbar", "alpha", "artifactbar_alpha", 45, LolzenUIcfg.artifactbar["artifactbar_alpha"])
		alpha:SetPoint("LEFT", alpha_text, "RIGHT", -10, -3)
		alpha.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(alpha)])
			LolzenUI.SetArtifactBarAlpha()
		end

		local bg_alpha_text = ns.createFontstring("artifactbar", L["bgalpha"]..":")
		bg_alpha_text:SetPoint("LEFT", alpha, "RIGHT", -5, 3)

		local bg_alpha = ns.createPicker("artifactbar", "alpha", "artifactbar_bg_alpha", 45, LolzenUIcfg.artifactbar["artifactbar_bg_alpha"])
		bg_alpha:SetPoint("LEFT", bg_alpha_text, "RIGHT", -10, -3)
		bg_alpha.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_bg_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(bg_alpha)])
			LolzenUI.SetArtifactBarBackgroundAlpha()
		end

		local pos_x_text = ns.createFontstring("artifactbar", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", height_text, "BOTTOMLEFT", 0, -15)

		local pos_x = ns.createInputbox("artifactbar", 30, 20, LolzenUIcfg.artifactbar["artifactbar_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarPosition()
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)
		
		local pos_y_text = ns.createFontstring("artifactbar", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("artifactbar", 30, 20, LolzenUIcfg.artifactbar["artifactbar_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarPosition()
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("artifactbar", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("artifactbar", "anchor", "artifactbar_anchor_bar", 110, LolzenUIcfg.artifactbar["artifactbar_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)
		anchor.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUI.SetArtifactBarPosition()
		end

		local parent_text = ns.createFontstring("artifactbar", L["parent"]..":")
		parent_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local parent = ns.createInputbox("artifactbar", 100, 20, LolzenUIcfg.artifactbar["artifactbar_parent"])
		parent:SetPoint("LEFT", parent_text, "RIGHT", 10, 0)

		parent:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		parent:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_parent"] = parent:GetText()
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarPosition()
		end)

		parent:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		parent:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local texture_text = ns.createFontstring("artifactbar", L["texture"]..":")
		texture_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -15)

		local texture = ns.createPicker("artifactbar", "statusbar", "artifactbar_statusbar", 120, LolzenUIcfg.artifactbar["artifactbar_texture"])
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)
		texture.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUI.SetArtifactBarTexture()
			self.color:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.artifactbar["artifactbar_texture"]))
		end

		local color_text = ns.createFontstring("artifactbar", L["color"]..":")
		color_text:SetPoint("TOPLEFT", texture_text, "BOTTOMLEFT", 0, -15)

		local color = ns.createColorTexture("artifactbar", 16, 16, LolzenUIcfg.artifactbar["artifactbar_color"], LolzenUIcfg.artifactbar["artifactbar_texture"])
		color:SetPoint("LEFT", color_text, "RIGHT", 14, 0)
		self.color = color
		color.setActualColors = function()
			LolzenUIcfg.artifactbar["artifactbar_color"] = {color:GetVertexColor()}
			LolzenUI.SetArtifactRGBColor()
		end

		local color_f = ns.createColorPicker("artifactbar", color, LolzenUIcfg.artifactbar["artifactbar_color"])
		color_f:SetAllPoints(color)

		local cb1 = ns.createCheckBox("artifactbar", "pxborder", "|cff5599ff"..L["af_draw_1px"].."|r", LolzenUIcfg.artifactbar["artifactbar_1px_border"])
		cb1:SetPoint("TOPLEFT", color_text, "BOTTOMLEFT", 0, -8)

		local cb2 = ns.createCheckBox("artifactbar", "pxborder_round", "|cff5599ff"..L["af_1px_round"].."|r", LolzenUIcfg.artifactbar["artifactbar_1px_border_round"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)
		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.artifactbar["artifactbar_1px_border_round"] = self:GetChecked()
			LolzenUI.SetArtifactBorder()
		end)

		cb1:SetScript("OnClick", function(self)
			if cb1:GetChecked() == false then
				cb2:Disable()
				pxborder_roundText:SetText("|cff555555"..L["af_1px_round"].."|r |cffff5555"..L["af_1px_notice"].."|r")
			else
				cb2:Enable()
				pxborder_roundText:SetText("|cff5599ff"..L["af_1px_round"].."|r")
			end
			LolzenUIcfg.artifactbar["artifactbar_1px_border"] = self:GetChecked()
			LolzenUI.SetArtifactBorder()
		end)

		if cb1:GetChecked() == false then
			cb2:Disable()
			pxborder_roundText:SetText("|cff555555"..L["af_1px_round"].."|r |cffff5555"..L["af_1px_notice"].."|r")
		else
			cb2:Enable()
		end

		local header2 = ns.createHeader("artifactbar", L["font"])
		header2:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -6)

		local header2BG = ns.createBackground("artifactbar", 600, 80)
		header2BG:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", -4, -4)
		header2BG:SetFrameLevel(1)

		local font_pos_x_text = ns.createFontstring("artifactbar", L["PosX"]..":")
		font_pos_x_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 4, -16)

		local font_pos_x = ns.createInputbox("artifactbar", 30, 20, LolzenUIcfg.artifactbar["artifactbar_text_posx"])
		font_pos_x:SetPoint("LEFT", font_pos_x_text, "RIGHT", 10, 0)

		font_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_text_posx"] = tonumber(font_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarTextPosition()
		end)

		font_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_pos_y_text = ns.createFontstring("artifactbar", L["PosY"]..":")
		font_pos_y_text:SetPoint("LEFT", font_pos_x, "RIGHT", 5, 0)

		local font_pos_y = ns.createInputbox("artifactbar", 30, 20, LolzenUIcfg.artifactbar["artifactbar_text_posy"])
		font_pos_y:SetPoint("LEFT", font_pos_y_text, "RIGHT", 10, 0)

		font_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_text_posy"] = tonumber(font_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarTextPosition()
		end)

		font_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_anchor_text = ns.createFontstring("artifactbar", L["anchor"]..":")
		font_anchor_text:SetPoint("LEFT", font_pos_y, "RIGHT", 5, 0)

		local font_anchor = ns.createPicker("artifactbar", "anchor", "ilvl_anchor_1", 110, LolzenUIcfg.artifactbar["artifactbar_text_anchor1"])
		font_anchor:SetPoint("LEFT", font_anchor_text, "RIGHT", -10, -3)
		font_anchor.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_text_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(font_anchor)]
			LolzenUI.SetArtifactBarTextPosition()
		end

		local font_color_text = ns.createFontstring("artifactbar", L["color"]..":")
		font_color_text:SetPoint("LEFT", font_anchor, "RIGHT", -5, 3)

		local font_color = ns.createColorTexture("artifactbar", 16, 16, LolzenUIcfg.artifactbar["artifactbar_font_color"], "LolzenUI Standard")
		font_color:SetPoint("LEFT", font_color_text, "RIGHT", 10, 0)
		font_color.setActualColors = function()
			LolzenUIcfg.artifactbar["artifactbar_font_color"] = {font_color:GetVertexColor()}
			LolzenUI.SetArtifactRGBTextColor()
		end

		local font_color_f = ns.createColorPicker("artifactbar", font_color, LolzenUIcfg.artifactbar["artifactbar_font_color"])
		font_color_f:SetAllPoints(font_color)

		local font_text = ns.createFontstring("artifactbar", L["font"]..":")
		font_text:SetPoint("TOPLEFT", font_pos_x_text, "BOTTOMLEFT", 0, -15)

		local font = ns.createPicker("artifactbar", "font", "artifactbar_font", 120, LolzenUIcfg.artifactbar["artifactbar_font"])
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)
		font.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUI.SetArtifactBarFont()
		end

		local font_size_text = ns.createFontstring("artifactbar", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("artifactbar", 30, 20, LolzenUIcfg.artifactbar["artifactbar_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.artifactbar["artifactbar_font_size"] = tonumber(font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetArtifactBarFont()
		end)

		font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_flag_text = ns.createFontstring("artifactbar", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 5, 0)

		local font_flag = ns.createPicker("artifactbar", "flag", "artifactbar_font_flag", 120, LolzenUIcfg.artifactbar["artifactbar_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)
		font_flag.OnClick = function()
			LolzenUIcfg.artifactbar["artifactbar_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUI.SetArtifactBarFont()
		end

		local cb3 = ns.createCheckBox("artifactbar", "af_text_hover", "|cff5599ff"..L["af_mouseover_text"].."|r", LolzenUIcfg.artifactbar["artifactbar_mouseover_text"])
		cb3:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", -4, -8)
		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.artifactbar["artifactbar_mouseover_text"] = self:GetChecked()
			LolzenUI.SetArtifactTextVisible()
		end)

		ns["artifactbar"].default = function(self)
			LolzenUIcfg.artifactbar = _G["LolzenUIdefaultcfg"].artifactbar
			ReloadUI()
		end
	end
end)