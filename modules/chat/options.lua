--// options for chat //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["chat"] == true then

		local title = ns.createTitle("chat")

		local about = ns.createDescription("chat", LUI["desc_chat"])

		local scrollFrame = ns.createScrollFrame("chat", 270)

		local cb1 = ns.createCheckBox("chat", "chat_custom_stamps", "|cff5599ff"..L["chat_short_chatstamps"].."|r", LolzenUIcfg.chat["chat_custom_channel_stamps"], "content")
		cb1:SetPoint("TOPLEFT", ns.chat.content, 16, -20)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_custom_channel_stamps"] = cb1:GetChecked()
			LolzenUI.SetChatChannelStamps()
		end)

		local cb1BG = ns.createBackground("chat", 580, 170, "content")
		cb1BG:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", -4, 26)
		cb1BG:SetFrameLevel(1)

		local cb2 = ns.createCheckBox("chat", "chat_brackets", "|cff5599ff"..L["chat_strip_brackets"].."|r", LolzenUIcfg.chat["chat_strip_brackets"], "content")
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_strip_brackets"] = cb2:GetChecked()
		end)

		local cb3 = ns.createCheckBox("chat", "chat_timestamp", "|cff5599ff"..L["chat_show_timestamps"].."|r", LolzenUIcfg.chat["chat_timestamp"], "content")
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		cb3:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(cb3, "ANCHOR_BOTTOMRIGHT")
			GameTooltip:SetText(L["chat_timestamp_notice"], 1, 1, 1, 1, true)
			GameTooltip:Show()
		end)

		cb3:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
		
		cb3:SetScript("OnClick", function(self)
			if GetCVar("showTimestamps") ~= "none" and self:GetChecked() == true then
				SetCVar("showTimestamps", "none")
			end
			LolzenUIcfg.chat["chat_timestamp"] = cb3:GetChecked()
		end)

		if GetCVar("showTimestamps") ~= "none" then
			cb3:SetChecked(false)
		end

		local cb4 = ns.createCheckBox("chat", "chat_fading", "|cff5599ff"..L["chat_disable_fading"].."|r", LolzenUIcfg.chat["chat_disable_fading"], "content")
		cb4:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, 0)

		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_disable_fading"] = cb4:GetChecked()
			LolzenUI.SetChatFading()
		end)

		local cb5 = ns.createCheckBox("chat", "chat_afkdnd_once", "|cff5599ff"..L["chat_afk_dnd_once"].."|r", LolzenUIcfg.chat["chat_show_afkdnd_once"], "content")
		cb5:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, 0)

		cb5:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_show_afkdnd_once"] = cb5:GetChecked()
		end)

		local cb6 = ns.createCheckBox("chat", "chat_strip_say_yell", "|cff5599ff"..L["chat_strip_say_and_yell"].."|r", LolzenUIcfg.chat["chat_strip_say_and_yell"], "content")
		cb6:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, 0)

		cb6:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_strip_say_and_yell"] = cb6:GetChecked()
		end)

		local cb7 = ns.createCheckBox("chat", "chat_shorten_channels", "|cff5599ff"..L["chat_short_channel_names"].."|r", LolzenUIcfg.chat["chat_shorten_channels"], "content")
		cb7:SetPoint("TOPLEFT", cb6, "BOTTOMLEFT", 0, 0)

		cb7:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_shorten_channels"] = cb7:GetChecked()
		end)

		local header1 = ns.createHeader("chat", L["frame"], "content")
		header1:SetPoint("TOPLEFT", cb7, "BOTTOMLEFT", 0, -5)

		local header1BG = ns.createBackground("chat", 580, 40, "content")
		header1BG:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", -4, -4)
		header1BG:SetFrameLevel(1)

		local pos_x_text = ns.createFontstring("chat", L["PosX"]..":", "content")
		pos_x_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 4, -18)

		local pos_x = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_posx"], "content")
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.chat["chat_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetChatPosition()
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("chat", L["PosY"]..":", "content")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_posy"], "content")
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.chat["chat_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetChatPosition()
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("chat", L["anchor"].."1:", "content")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("chat", "anchor", "chat_anchor1", 110, LolzenUIcfg.chat["chat_anchor1"], "content")
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)
		anchor.OnClick = function()
			LolzenUIcfg.chat["chat_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUI.SetChatPosition()
		end

		local anchor2_text = ns.createFontstring("chat", L["anchor"].."2:", "content")
		anchor2_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local anchor2 = ns.createPicker("chat", "anchor", "chat_anchor2", 110, LolzenUIcfg.chat["chat_anchor2"], "content")
		anchor2:SetPoint("LEFT", anchor2_text, "RIGHT", -10, -3)
		anchor2.OnClick = function()
			LolzenUIcfg.chat["chat_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			LolzenUI.SetChatPosition()
		end

		local header2 = ns.createHeader("chat", L["font"], "content")
		header2:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", -4, -20)

		local header2BG = ns.createBackground("chat", 580, 66, "content")
		header2BG:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", -4, -4)
		header2BG:SetFrameLevel(1)

		local cb9 = ns.createCheckBox("chat", "chat_font_shadow", "|cff5599ff"..L["chat_font_shadow"].."|r", LolzenUIcfg.chat["chat_font_shadow"], "content")
		cb9:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		cb9:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_font_shadow"] = cb9:GetChecked()
			LolzenUI.SetChatShadow()
		end)

		local font_text = ns.createFontstring("chat", L["font"]..":", "content")
		font_text:SetPoint("TOPLEFT", cb9, "BOTTOMLEFT", 4, -10)

		local font = ns.createPicker("chat", "font", "chat_font", 120, LolzenUIcfg.chat["chat_font"], "content")
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)
		font.OnClick = function()
			LolzenUIcfg.chat["chat_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUI.SetChatFont()
		end

		local font_size_text = ns.createFontstring("chat", L["size"]..":", "content")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_font_size"], "content")
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.chat["chat_font_size"] = tonumber(font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetChatFont()
		end)

		font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_flag_text = ns.createFontstring("chat", L["flag"]..":", "content")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 10, 0)

		local font_flag = ns.createPicker("chat", "flag", "chat_font_flag", 120, LolzenUIcfg.chat["chat_font_flag"], "content")
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)
		font_flag.OnClick = function()
			LolzenUIcfg.chat["chat_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUI.SetChatFont()
		end

		local spacing_text = ns.createFontstring("chat", L["spacing"]..":", "content")
		spacing_text:SetPoint("LEFT", font_flag, "RIGHT", -5, 3)

		local spacing = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_font_spacing"], "content")
		spacing:SetPoint("LEFT", spacing_text, "RIGHT", 10, 0)

		spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		spacing:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.chat["chat_font_spacing"] = tonumber(spacing:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetChatFont()
		end)

		spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header3 = ns.createHeader("chat", L["background"], "content")
		header3:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", -4, -20)

		local header3BG = ns.createBackground("chat", 580, 66, "content")
		header3BG:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", -4, -4)
		header3BG:SetFrameLevel(1)

		local cb10 = ns.createCheckBox("chat", "chat_backgound", "|cff5599ff"..L["chat_background"].."|r", LolzenUIcfg.chat["chat_background"], "content")
		cb10:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -10)

		cb10:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_background"] = cb10:GetChecked()
			LolzenUI.SetChatBackgroundVisible()
		end)

		local texture_text = ns.createFontstring("chat", L["texture"]..":", "content")
		texture_text:SetPoint("TOPLEFT", cb10, "BOTTOMLEFT", 4, -10)

		local texture = ns.createPicker("chat", "background", "chat_background", 120, LolzenUIcfg.chat["chat_background_texture"], "content")
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)
		texture.OnClick = function()
			LolzenUIcfg.chat["chat_background_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUI.SetChatBackgroundTexture()
		end

		local alpha_text = ns.createFontstring("chat", L["alpha"]..":", "content")
		alpha_text:SetPoint("LEFT", texture, "RIGHT", -5, 3)

		local alpha = ns.createPicker("chat", "alpha", "chat_bg_alpha", 45, LolzenUIcfg.chat["chat_background_alpha"], "content")
		alpha:SetPoint("LEFT", alpha_text, "RIGHT", -10, -3)
		alpha.OnClick = function()
			LolzenUIcfg.chat["chat_background_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(alpha)])
			LolzenUI.SetChatBackgroundAlpha()
		end

		local border_text = ns.createFontstring("chat", L["border"]..":", "content")
		border_text:SetPoint("LEFT", alpha, "RIGHT", -5, 3)

		local border = ns.createPicker("chat", "border", "chat_border", 120, LolzenUIcfg.chat["chat_background_border"], "content")
		border:SetPoint("LEFT", border_text, "RIGHT", -10, -3)
		border.OnClick = function()
			LolzenUIcfg.chat["chat_background_border"] = UIDropDownMenu_GetSelectedName(border)
			LolzenUI.SetChatBackgroundBorder()
		end

		local header4 = ns.createHeader("chat", L["chat_header_link_color"], "content")
		header4:SetPoint("TOPLEFT", texture_text, "BOTTOMLEFT", -4, -20)

		local header4BG = ns.createBackground("chat", 580, 33, "content")
		header4BG:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", -4, -4)
		header4BG:SetFrameLevel(1)

		local color_text = ns.createFontstring("chat", L["color"]..":", "content")
		color_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 4, -15)

		local color = ns.createColorTexture("chat", 16, 16, LolzenUIcfg.chat["chat_link_color"], "LolzenUI Standard", "content")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)
		color.setActualColors = function()
			LolzenUIcfg.chat["chat_link_color"] = {color:GetVertexColor()}
		end

		local color_f = ns.createColorPicker("chat", color, LolzenUIcfg.chat["chat_link_color"])
		color_f:SetAllPoints(color)

		local header5 = ns.createHeader("chat", L["chat_header_flags_and_sticky_channels"], "content")
		header5:SetPoint("TOPLEFT", color_text, "BOTTOMLEFT", -4, -20)

		local header5BG = ns.createBackground("chat", 580, 274, "content")
		header5BG:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", -4, -4)
		header5BG:SetFrameLevel(1)

		local chat_afkflag_text = ns.createFontstring("chat", L["afk_flag"]..":", "content")
		chat_afkflag_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 4, -14)

		local chat_afkflag = ns.createInputbox("chat", 50, 20, LolzenUIcfg.chat["chat_flag_afk"], "content")
		chat_afkflag:SetPoint("LEFT", chat_afkflag_text, "RIGHT", 10, 0)

		chat_afkflag:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		chat_afkflag:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.chat["chat_flag_afk"] = chat_afkflag:GetText()
			self.oldText = self:GetText()
			LolzenUI.SetChatFlags()
		end)

		chat_afkflag:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		chat_afkflag:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local chat_dndflag_text = ns.createFontstring("chat", L["dnd_flag"]..":", "content")
		chat_dndflag_text:SetPoint("TOPLEFT", chat_afkflag_text, "BOTTOMLEFT", 0, -15)

		local chat_dndflag = ns.createInputbox("chat", 50, 20, LolzenUIcfg.chat["chat_flag_dnd"], "content")
		chat_dndflag:SetPoint("LEFT", chat_dndflag_text, "RIGHT", 10, 0)

		chat_dndflag:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		chat_dndflag:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.chat["chat_flag_dnd"] = chat_dndflag:GetText()
			self.oldText = self:GetText()
			LolzenUI.SetChatFlags()
		end)

		chat_dndflag:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		chat_dndflag:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local sticky_say = ns.createCheckBox("chat", "sticky_say", "|cff5599ff"..L["chat_sticky_say"].."|r", LolzenUIcfg.chat["chat_sticky_say"], "content")
		sticky_say:SetPoint("TOPLEFT", chat_dndflag_text, "BOTTOMLEFT", -4, -10)

		sticky_say:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_say"] = sticky_say:GetChecked()
			LolzenUI.SetChatStickySay()
		end)

		local sticky_yell = ns.createCheckBox("chat", "sticky_yell", "|cff5599ff"..L["chat_sticky_yell"].."|r", LolzenUIcfg.chat["chat_sticky_yell"], "content")
		sticky_yell:SetPoint("TOPLEFT", sticky_say, "BOTTOMLEFT", 0, 0)

		sticky_yell:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_yell"] = sticky_yell:GetChecked()
			LolzenUI.SetChatStickyYell()
		end)

		local sticky_party = ns.createCheckBox("chat", "sticky_party", "|cff5599ff"..L["chat_sticky_party"].."|r", LolzenUIcfg.chat["chat_sticky_party"], "content")
		sticky_party:SetPoint("TOPLEFT", sticky_yell, "BOTTOMLEFT", 0, 0)

		sticky_party:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_party"] = sticky_party:GetChecked()
			LolzenUI.SetChatStickyParty()
		end)

		local sticky_guild = ns.createCheckBox("chat", "sticky_guild", "|cff5599ff"..L["chat_sticky_guild"].."|r", LolzenUIcfg.chat["chat_sticky_guild"], "content")
		sticky_guild:SetPoint("TOPLEFT", sticky_party, "BOTTOMLEFT", 0, 0)

		sticky_guild:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_guild"] = sticky_guild:GetChecked()
			LolzenUI.SetChatStickyGuild()
		end)

		local sticky_officer = ns.createCheckBox("chat", "sticky_officer", "|cff5599ff"..L["chat_sticky_officer"].."|r", LolzenUIcfg.chat["chat_sticky_officer"], "content")
		sticky_officer:SetPoint("TOPLEFT", sticky_guild, "BOTTOMLEFT", 0, 0)

		sticky_officer:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_officer"] = sticky_officer:GetChecked()
			LolzenUI.SetChatStickyOfficer()
		end)

		local sticky_raid = ns.createCheckBox("chat", "sticky_raid", "|cff5599ff"..L["chat_sticky_raid"].."|r", LolzenUIcfg.chat["chat_sticky_raid"], "content")
		sticky_raid:SetPoint("TOPLEFT", sticky_officer, "BOTTOMLEFT", 0, 0)

		sticky_raid:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_raid"] = sticky_raid:GetChecked()
			LolzenUI.SetChatStickyRaid()
		end)

		local sticky_raidwarning = ns.createCheckBox("chat", "sticky_raidwarning", "|cff5599ff"..L["chat_sticky_raidwarning"].."|r", LolzenUIcfg.chat["chat_sticky_raidwarning"], "content")
		sticky_raidwarning:SetPoint("TOPLEFT", sticky_raid, "BOTTOMLEFT", 0, 0)

		sticky_raidwarning:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_raidwarning"] = sticky_raidwarning:GetChecked()
			LolzenUI.SetChatStickyRaidWarning()
		end)

		local sticky_whisper = ns.createCheckBox("chat", "sticky_whisper", "|cff5599ff"..L["chat_sticky_whisper"].."|r", LolzenUIcfg.chat["chat_sticky_whisper"], "content")
		sticky_whisper:SetPoint("TOPLEFT", sticky_raidwarning, "BOTTOMLEFT", 0, 0)

		sticky_whisper:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_whisper"] = sticky_whisper:GetChecked()
			LolzenUI.SetChatStickyWhisper()
		end)

		local sticky_channel = ns.createCheckBox("chat", "sticky_channel", "|cff5599ff"..L["chat_sticky_channel"].."|r", LolzenUIcfg.chat["chat_sticky_channel"], "content")
		sticky_channel:SetPoint("TOPLEFT", sticky_whisper, "BOTTOMLEFT", 0, 0)

		sticky_channel:SetScript("OnClick", function(self)
			LolzenUIcfg.chat["chat_sticky_channel"] = sticky_channel:GetChecked()
			LolzenUI.SetChatStickyChannel()
		end)

		ns["chat"].default = function(self)
			LolzenUIcfg.chat = _G["LolzenUIdefaultcfg"].chat
			ReloadUI()
		end
	end
end)