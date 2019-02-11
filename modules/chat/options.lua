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

		local scrollFrame = ns.createScrollFrame("chat", 250)

		local cb1 = ns.createCheckBox("chat", "chat_custom_stamps", "|cff5599ff"..L["chat_short_chatstamps"].."|r", LolzenUIcfg.chat["chat_custom_channel_stamps"], "content")
		cb1:SetPoint("TOPLEFT", ns.chat.content, 16, 0)

		local cb2 = ns.createCheckBox("chat", "chat_brackets", "|cff5599ff"..L["chat_strip_brackets"].."|r", LolzenUIcfg.chat["chat_strip_brackets"], "content")
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local cb3 = ns.createCheckBox("chat", "chat_timestamp", "|cff5599ff"..L["chat_show_timestamps"].."|r", LolzenUIcfg.chat["chat_timestamp"], "content")
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		local cb4 = ns.createCheckBox("chat", "chat_fading", "|cff5599ff"..L["chat_disable_fading"].."|r", LolzenUIcfg.chat["chat_disable_fading"], "content")
		cb4:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, 0)

		local cb5 = ns.createCheckBox("chat", "chat_auto_who", "|cff5599ff"..L["chat_auto_who"].."|r", LolzenUIcfg.chat["chat_auto_who"], "content")
		cb5:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, 0)

		local cb6 = ns.createCheckBox("chat", "chat_afkdnd_once", "|cff5599ff"..L["chat_afk_dnd_once"].."|r", LolzenUIcfg.chat["chat_show_afkdnd_once"], "content")
		cb6:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, 0)

		local cb7 = ns.createCheckBox("chat", "chat_strip_say_yell", "|cff5599ff"..L["chat_strip_say_and_yell"].."|r", LolzenUIcfg.chat["chat_strip_say_and_yell"], "content")
		cb7:SetPoint("TOPLEFT", cb6, "BOTTOMLEFT", 0, 0)

		local cb8 = ns.createCheckBox("chat", "chat_shorten_channels", "|cff5599ff"..L["chat_short_channel_names"].."|r", LolzenUIcfg.chat["chat_shorten_channels"], "content")
		cb8:SetPoint("TOPLEFT", cb7, "BOTTOMLEFT", 0, 0)

		local header1 = ns.createHeader("chat", L["frame"], "content")
		header1:SetPoint("TOPLEFT", cb8, "BOTTOMLEFT", 0, -20)

		local pos_x_text = ns.createFontstring("chat", L["PosX"]..":", "content")
		pos_x_text:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_posx"], "content")
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("chat", L["PosY"]..":", "content")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_posy"], "content")
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("chat", L["anchor"].."1:", "content")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("chat", "anchor", "chat_anchor1", 110, LolzenUIcfg.chat["chat_anchor1"], "content")
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local anchor2_text = ns.createFontstring("chat", L["anchor"].."2:", "content")
		anchor2_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local anchor2 = ns.createPicker("chat", "anchor", "chat_anchor2", 110, LolzenUIcfg.chat["chat_anchor2"], "content")
		anchor2:SetPoint("LEFT", anchor2_text, "RIGHT", -10, -3)

		local header2 = ns.createHeader("chat", L["font"], "content")
		header2:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -30)

		local cb9 = ns.createCheckBox("chat", "chat_font_shadow", "|cff5599ff"..L["chat_font_shadow"].."|r", LolzenUIcfg.chat["chat_font_shadow"], "content")
		cb9:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -10)

		local font_text = ns.createFontstring("chat", L["font"]..":", "content")
		font_text:SetPoint("TOPLEFT", cb9, "BOTTOMLEFT", 0, -10)

		local font = ns.createPicker("chat", "font", "chat_font", 120, LolzenUIcfg.chat["chat_font"], "content")
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)

		local font_size_text = ns.createFontstring("chat", L["size"]..":", "content")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_font_size"], "content")
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		local font_flag_text = ns.createFontstring("chat", L["flag"]..":", "content")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 10, 0)

		local font_flag = ns.createPicker("chat", "flag", "chat_font_flag", 120, LolzenUIcfg.chat["chat_font_flag"], "content")
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)

		local spacing_text = ns.createFontstring("chat", L["spacing"]..":", "content")
		spacing_text:SetPoint("LEFT", font_flag, "RIGHT", -5, 3)

		local spacing = ns.createInputbox("chat", 30, 20, LolzenUIcfg.chat["chat_font_spacing"], "content")
		spacing:SetPoint("LEFT", spacing_text, "RIGHT", 10, 0)

		local header3 = ns.createHeader("chat", L["background"], "content")
		header3:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -30)

		local cb10 = ns.createCheckBox("chat", "chat_backgound", "|cff5599ff"..L["chat_background"].."|r", LolzenUIcfg.chat["chat_background"], "content")
		cb10:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -10)

		local texture_text = ns.createFontstring("chat", L["texture"]..":", "content")
		texture_text:SetPoint("TOPLEFT", cb10, "BOTTOMLEFT", 0, -10)

		local texture = ns.createPicker("chat", "background", "chat_background", 120, LolzenUIcfg.chat["chat_background_texture"], "content")
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)

		local alpha_text = ns.createFontstring("chat", L["alpha"]..":", "content")
		alpha_text:SetPoint("LEFT", texture, "RIGHT", -5, 3)

		local alpha = ns.createPicker("chat", "alpha", "chat_bg_alpha", 45, LolzenUIcfg.chat["chat_background_alpha"], "content")
		alpha:SetPoint("LEFT", alpha_text, "RIGHT", -10, -3)

		local border_text = ns.createFontstring("chat", L["border"]..":", "content")
		border_text:SetPoint("LEFT", alpha, "RIGHT", -5, 3)

		local border = ns.createPicker("chat", "border", "chat_border", 120, LolzenUIcfg.chat["chat_background_border"], "content")
		border:SetPoint("LEFT", border_text, "RIGHT", -10, -3)

		local header4 = ns.createHeader("chat", L["chat_header_flags_and_sticky_channels"], "content")
		header4:SetPoint("TOPLEFT", texture_text, "BOTTOMLEFT", 0, -30)

		local chat_afkflag_text = ns.createFontstring("chat", L["afk_flag"]..":", "content")
		chat_afkflag_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -10)

		local chat_afkflag = ns.createInputbox("chat", 50, 20, LolzenUIcfg.chat["chat_flag_afk"], "content")
		chat_afkflag:SetPoint("LEFT", chat_afkflag_text, "RIGHT", 10, 0)

		local chat_dndflag_text = ns.createFontstring("chat", L["dnd_flag"]..":", "content")
		chat_dndflag_text:SetPoint("TOPLEFT", chat_afkflag_text, "BOTTOMLEFT", 0, -15)

		local chat_dndflag = ns.createInputbox("chat", 50, 20, LolzenUIcfg.chat["chat_flag_dnd"], "content")
		chat_dndflag:SetPoint("LEFT", chat_dndflag_text, "RIGHT", 10, 0)

		local sticky_say = ns.createCheckBox("chat", "sticky_say", "|cff5599ff"..L["chat_sticky_say"].."|r", LolzenUIcfg.chat["chat_sticky_say"], "content")
		sticky_say:SetPoint("TOPLEFT", chat_dndflag_text, "BOTTOMLEFT", 0, -10)

		local sticky_yell = ns.createCheckBox("chat", "sticky_yell", "|cff5599ff"..L["chat_sticky_yell"].."|r", LolzenUIcfg.chat["chat_sticky_yell"], "content")
		sticky_yell:SetPoint("TOPLEFT", sticky_say, "BOTTOMLEFT", 0, 0)

		local sticky_party = ns.createCheckBox("chat", "sticky_party", "|cff5599ff"..L["chat_sticky_party"].."|r", LolzenUIcfg.chat["chat_sticky_party"], "content")
		sticky_party:SetPoint("TOPLEFT", sticky_yell, "BOTTOMLEFT", 0, 0)

		local sticky_guild = ns.createCheckBox("chat", "sticky_guild", "|cff5599ff"..L["chat_sticky_guild"].."|r", LolzenUIcfg.chat["chat_sticky_guild"], "content")
		sticky_guild:SetPoint("TOPLEFT", sticky_party, "BOTTOMLEFT", 0, 0)

		local sticky_officer = ns.createCheckBox("chat", "sticky_officer", "|cff5599ff"..L["chat_sticky_officer"].."|r", LolzenUIcfg.chat["chat_sticky_officer"], "content")
		sticky_officer:SetPoint("TOPLEFT", sticky_guild, "BOTTOMLEFT", 0, 0)

		local sticky_raid = ns.createCheckBox("chat", "sticky_raid", "|cff5599ff"..L["chat_sticky_raid"].."|r", LolzenUIcfg.chat["chat_sticky_raid"], "content")
		sticky_raid:SetPoint("TOPLEFT", sticky_officer, "BOTTOMLEFT", 0, 0)

		local sticky_raidwarning  = ns.createCheckBox("chat", "sticky_raidwarning", "|cff5599ff"..L["chat_sticky_raidwarning"].."|r", LolzenUIcfg.chat["chat_sticky_raidwarning"], "content")
		sticky_raidwarning :SetPoint("TOPLEFT", sticky_raid, "BOTTOMLEFT", 0, 0)

		local sticky_whisper = ns.createCheckBox("chat", "sticky_whisper", "|cff5599ff"..L["chat_sticky_whisper"].."|r", LolzenUIcfg.chat["chat_sticky_whisper"], "content")
		sticky_whisper:SetPoint("TOPLEFT", sticky_raidwarning, "BOTTOMLEFT", 0, 0)

		local sticky_channel = ns.createCheckBox("chat", "sticky_channel", "|cff5599ff"..L["chat_sticky_channel"].."|r", LolzenUIcfg.chat["chat_sticky_channel"], "content")
		sticky_channel:SetPoint("TOPLEFT", sticky_whisper, "BOTTOMLEFT", 0, 0)

		local applyButton = ns.createApplyButton("chat")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.chat["chat_custom_channel_stamps"] = cb1:GetChecked()
			LolzenUIcfg.chat["chat_strip_brackets"] = cb2:GetChecked()
			LolzenUIcfg.chat["chat_timestamp"] = cb3:GetChecked()
			LolzenUIcfg.chat["chat_disable_fading"] = cb4:GetChecked()
			LolzenUIcfg.chat["chat_auto_who"] = cb5:GetChecked()
			LolzenUIcfg.chat["chat_show_afkdnd_once"] = cb6:GetChecked()
			LolzenUIcfg.chat["chat_strip_say_and_yell"] = cb7:GetChecked()
			LolzenUIcfg.chat["chat_shorten_channels"] = cb8:GetChecked()
			LolzenUIcfg.chat["chat_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.chat["chat_posy"] = tonumber(pos_y:GetText())
			LolzenUIcfg.chat["chat_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.chat["chat_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			LolzenUIcfg.chat["chat_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUIcfg.chat["chat_font_size"] = tonumber(font_size:GetText())
			LolzenUIcfg.chat["chat_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUIcfg.chat["chat_font_spacing"] = tonumber(spacing:GetText())
			LolzenUIcfg.chat["chat_font_shadow"] = cb9:GetChecked()
			LolzenUIcfg.chat["chat_background"] = cb10:GetChecked()
			LolzenUIcfg.chat["chat_background_texture"] = UIDropDownMenu_GetSelectedName(texture)
			LolzenUIcfg.chat["chat_background_alpha"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(alpha)])
			LolzenUIcfg.chat["chat_background_border"] = UIDropDownMenu_GetSelectedName(border)
			LolzenUIcfg.chat["chat_sticky_say"] = sticky_say:GetChecked()
			LolzenUIcfg.chat["chat_sticky_yell"] = sticky_yell:GetChecked()
			LolzenUIcfg.chat["chat_sticky_party"] = sticky_party:GetChecked()
			LolzenUIcfg.chat["chat_sticky_guild"] = sticky_guild:GetChecked()
			LolzenUIcfg.chat["chat_sticky_officer"] = sticky_officer:GetChecked()
			LolzenUIcfg.chat["chat_sticky_raid"] = sticky_raid:GetChecked()
			LolzenUIcfg.chat["chat_sticky_raidwarning"] = sticky_raidwarning:GetChecked()
			LolzenUIcfg.chat["chat_sticky_whisper"] = sticky_whisper:GetChecked()
			LolzenUIcfg.chat["chat_sticky_channel"] = sticky_channel:GetChecked()
			LolzenUIcfg.chat["chat_flag_afk"] = chat_afkflag:GetText()
			LolzenUIcfg.chat["chat_flag_dnd"] = chat_dndflag:GetText()
			ReloadUI()
		end)

		ns["chat"].default = function(self)
			LolzenUIcfg.chat = _G["LolzenUIdefaultcfg"].chat
			ReloadUI()
		end
	end
end)