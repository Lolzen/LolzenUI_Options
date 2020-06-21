--// options for orderhallbar //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["orderhallbar"] == true then

		local title = ns.createTitle("orderhallbar")

		local about = ns.createDescription("orderhallbar", LUI["desc_orderhallbar"])

		local cb1 = ns.createCheckBox("orderhallbar", "alwaysshow", "|cff5599ff"..L["ohb_always_show"].."|r", LolzenUIcfg.orderhallbar["ohb_always_show"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.orderhallbar["ohb_always_show"] = cb1:GetChecked()
			LolzenUI.setOHBVisibility()
		end)

		local header1 = ns.createHeader("orderhallbar", L["background"])
		header1:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -30)
		
		local ohb_bg_text = ns.createFontstring("orderhallbar", L["texture"]..":")
		ohb_bg_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local ohb_bg = ns.createPicker("orderhallbar", "background", "oh_bg_statusbar", 120, LolzenUIcfg.orderhallbar["ohb_background"])
		ohb_bg:SetPoint("LEFT", ohb_bg_text, "RIGHT", -10, -5)
		ohb_bg.OnClick = function()
			LolzenUIcfg.orderhallbar["ohb_background"] = UIDropDownMenu_GetSelectedName(ohb_bg)
			LolzenUI.setOHBBGTexture()
		end

		local color_text = ns.createFontstring("orderhallbar", L["color"]..":")
		color_text:SetPoint("LEFT", ohb_bg, "RIGHT", -5, 3)

		local color = ns.createColorTexture("orderhallbar", 16, 16, LolzenUIcfg.orderhallbar["ohb_background_color"], LolzenUIcfg.orderhallbar["ohb_background"])
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)
		color.setActualColors = function()
			LolzenUIcfg.orderhallbar["ohb_background_color"] = {color:GetVertexColor()}
			LolzenUI.setOHBBGColor()
		end

		local color_f = ns.createColorPicker("orderhallbar", color, LolzenUIcfg.orderhallbar["ohb_background_color"])
		color_f:SetAllPoints(color)

		local alpha_text = ns.createFontstring("orderhallbar", L["alpha"]..":")
		alpha_text:SetPoint("LEFT", color, "RIGHT", 10, 0)

		local alpha = ns.createPicker("orderhallbar", "alpha", "oh_bg_alpha", 45, LolzenUIcfg.orderhallbar["ohb_background_alpha"])
		alpha:SetPoint("LEFT", alpha_text, "RIGHT", -10, -5)
		alpha.OnClick = function()
			LolzenUIcfg.orderhallbar["ohb_background_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(alpha)])
			LolzenUI.setOHBBGAlpha()
		end

		local header2 = ns.createHeader("orderhallbar", L["ohb_zonetext_header"])
		header2:SetPoint("TOPLEFT", ohb_bg_text, "BOTTOMLEFT", 0, -30)

		local zone_color_text = ns.createFontstring("orderhallbar", L["color"]..":")
		zone_color_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local zone_color = ns.createColorTexture("orderhallbar", 16, 16, LolzenUIcfg.orderhallbar["ohb_zone_color"], LolzenUIcfg.orderhallbar["ohb_background"])
		zone_color:SetPoint("LEFT", zone_color_text, "RIGHT", 10, 0)
		zone_color.setActualColors = function()
			LolzenUIcfg.orderhallbar["ohb_zone_color"] = {zone_color:GetVertexColor()}
			LolzenUI.setOHBZoneFontColor()
		end

		local zone_color_f = ns.createColorPicker("orderhallbar", zone_color, LolzenUIcfg.orderhallbar["ohb_zone_color"])
		zone_color_f:SetAllPoints(zone_color)

		local zone_font_text = ns.createFontstring("orderhallbar", L["font"]..":")
		zone_font_text:SetPoint("TOPLEFT", zone_color_text, "BOTTOMLEFT", 0, -10)

		local zone_font = ns.createPicker("orderhallbar", "font", "orderhallbar_font", 120, LolzenUIcfg.orderhallbar["ohb_zone_font"])
		zone_font:SetPoint("LEFT", zone_font_text, "RIGHT", -10, -5)
		zone_font.OnClick = function()
			LolzenUIcfg.orderhallbar["ohb_zone_font"] = UIDropDownMenu_GetSelectedName(zone_font)
			LolzenUI.setOHBZoneFont()
		end

		local zone_font_size_text = ns.createFontstring("orderhallbar", L["size"]..":")
		zone_font_size_text:SetPoint("LEFT", zone_font, "RIGHT", -5, 3)

		local zone_font_size = ns.createInputbox("orderhallbar", 30, 20, LolzenUIcfg.orderhallbar["ohb_zone_font_size"])
		zone_font_size:SetPoint("LEFT", zone_font_size_text, "RIGHT", 10, 0)

		zone_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		zone_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.orderhallbar["ohb_zone_font_size"] = tonumber(zone_font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.setOHBZoneFont()
		end)

		zone_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		zone_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local zone_font_flag_text = ns.createFontstring("orderhallbar", L["flag"]..":")
		zone_font_flag_text:SetPoint("LEFT", zone_font_size, "RIGHT", 10, 0)

		local zone_font_flag = ns.createPicker("orderhallbar", "flag", "orderhallbar_font_flag", 120, LolzenUIcfg.orderhallbar["ohb_zone_font_flag"])
		zone_font_flag:SetPoint("LEFT", zone_font_flag_text, "RIGHT", -10, -5)
		zone_font_flag.OnClick = function()
			LolzenUIcfg.orderhallbar["ohb_zone_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(zone_font_flag)]
			LolzenUI.setOHBZoneFont()
		end

		local header3 = ns.createHeader("orderhallbar", L["ohb_currency_header"])
		header3:SetPoint("TOPLEFT", zone_font_text, "BOTTOMLEFT", 0, -30)

		local font_text = ns.createFontstring("orderhallbar", L["font"]..":")
		font_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local font = ns.createPicker("orderhallbar", "font", "orderhallbar_font", 120, LolzenUIcfg.orderhallbar["ohb_currency_font"])
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -5)
		font.OnClick = function()
			LolzenUIcfg.orderhallbar["ohb_currency_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUI.setOHBCurrencyFont()
		end

		local font_size_text = ns.createFontstring("orderhallbar", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("orderhallbar", 30, 20, LolzenUIcfg.orderhallbar["ohb_currency_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.orderhallbar["ohb_currency_font_size"] = tonumber(font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.setOHBCurrencyFont()
		end)

		font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_flag_text = ns.createFontstring("orderhallbar", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 10, 0)

		local font_flag = ns.createPicker("orderhallbar", "flag", "orderhallbar_font_flag", 120, LolzenUIcfg.orderhallbar["ohb_currency_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -5)
		font_flag.OnClick = function()
			LolzenUIcfg.orderhallbar["ohb_currency_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUI.setOHBCurrencyFont()
		end

		local icon_size_text = ns.createFontstring("orderhallbar", L["ohb_icon_size"]..":")
		icon_size_text:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -15)

		local icon_size = ns.createInputbox("orderhallbar", 30, 20, LolzenUIcfg.orderhallbar["ohb_currency_icon_size"])
		icon_size:SetPoint("LEFT", icon_size_text, "RIGHT", 10, 0)

		icon_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		icon_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.orderhallbar["ohb_currency_icon_size"] = tonumber(icon_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.setOHBCurrenyIconSize()
		end)

		icon_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		icon_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		ns["orderhallbar"].default = function(self)
			LolzenUIcfg.orderhallbar = _G["LolzenUIdefaultcfg"].orderhallbar
			ReloadUI()
		end
	end
end)