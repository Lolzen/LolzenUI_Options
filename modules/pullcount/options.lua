--// options for pullcount //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["pullcount"] == true then

		local title = ns.createTitle("pullcount")

		local about = ns.createDescription("pullcount", LUI["desc_pullcount"])

		local header1 = ns.createHeader("pullcount", L["count_play_sound_from"]..":")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local cb1 = ns.createCheckBox("pullcount", "filter_guild", "|cff5599ff"..L["count_guild"].."|r", LolzenUIcfg.pullcount["pull_filter_guild"])
		cb1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local cb2 = ns.createCheckBox("pullcount", "filter_party", "|cff5599ff"..L["count_party"].."|r", LolzenUIcfg.pullcount["pull_filter_party"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local cb3 = ns.createCheckBox("pullcount", "filter_instance", "|cff5599ff"..L["count_instance"].."|r", LolzenUIcfg.pullcount["pull_filter_instance"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		local cb4 = ns.createCheckBox("pullcount", "filter_say", "|cff5599ff"..L["count_say"].."|r", LolzenUIcfg.pullcount["pull_filter_say"])
		cb4:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, 0)

		local cb5 = ns.createCheckBox("pullcount", "filter_channel", "|cff5599ff"..L["count_custom_channels"].."|r", LolzenUIcfg.pullcount["pull_filter_channel"])
		cb5:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, 0)

		local header2 = ns.createHeader("pullcount", L["count_custom_message_to_react_header"]..":")
		header2:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, -20)

		local pull_message_count_text = ns.createFontstring("pullcount", L["count_countdown_message"]..":")
		pull_message_count_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local pull_message_countdown = ns.createInputbox("pullcount", 100, 20, LolzenUIcfg.pullcount["pull_msg_count"])
		pull_message_countdown:SetPoint("LEFT", pull_message_count_text, "RIGHT", 10, 0)

		local pull_message_text = ns.createFontstring("pullcount", "Pull message:")
		pull_message_text:SetPoint("LEFT", pull_message_countdown, "RIGHT", 10, 0)

		local count_notice = ns.createFontstring("pullcount", L["count_!n_represents"])
		count_notice:SetPoint("TOPLEFT", pull_message_count_text, "BOTTOMLEFT", 0, -8)

		local pull_message = ns.createInputbox("pullcount", 100, 20, LolzenUIcfg.pullcount["pull_msg_now"])
		pull_message:SetPoint("LEFT", pull_message_text, "RIGHT", 10, 0)

		local header3 = ns.createHeader("pullcount", L["count_range_header"].." "..L["count_range_notice"])
		header3:SetPoint("TOPLEFT", count_notice, "BOTTOMLEFT", 0, -20)

		local pull_count_range_text = ns.createFontstring("pullcount", L["count_range"]..":")
		pull_count_range_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local pull_count_range = ns.createInputbox("pullcount", 30, 20, LolzenUIcfg.pullcount["pull_count_range"])
		pull_count_range:SetPoint("LEFT", pull_count_range_text, "RIGHT", 10, 0)

		local pull_sound_count = {}
		for i=1, 10 do
			pull_sound_count[i] = ns.createFontstring("pullcount", L["count_file"]..": "..i)
			if i == 1 then
				pull_sound_count[i]:SetPoint("TOPLEFT", pull_count_range_text, "BOTTOMLEFT", 0, -20)
			else
				pull_sound_count[i]:SetPoint("TOPLEFT", pull_sound_count[i-1], "BOTTOMLEFT", 0, -10)
			end

			pull_sound_count[i].eb = ns.createInputbox("pullcount", 100, 20, LolzenUIcfg.pullcount["pull_sound_"..i])
			pull_sound_count[i].eb:SetPoint("LEFT", pull_sound_count[i], "RIGHT", 10, 0)
		end

		local pull_now_text = ns.createFontstring("pullcount", L["count_file_pull"]..":")
		pull_now_text:SetPoint("TOPLEFT", pull_sound_count[10], "BOTTOMLEFT", 0, -10)

		local pull_now = ns.createInputbox("pullcount", 100, 20, LolzenUIcfg.pullcount["pull_sound_pull"])
		pull_now:SetPoint("LEFT", pull_now_text, "RIGHT", 10, 0)

		local applyButton = ns.createApplyButton("pullcount")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.pullcount["pull_count_range"] = tonumber(pull_count_range:GetText())
			LolzenUIcfg.pullcount["pull_msg_count"] = pull_message_countdown:GetText()
			LolzenUIcfg.pullcount["pull_msg_now"] = pull_message:GetText()
			LolzenUIcfg.pullcount["pull_sound_1"] = pull_sound_count[1].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_2"] = pull_sound_count[2].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_3"] = pull_sound_count[3].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_4"] = pull_sound_count[4].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_5"] = pull_sound_count[5].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_6"] = pull_sound_count[6].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_7"] = pull_sound_count[7].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_8"] = pull_sound_count[8].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_9"] = pull_sound_count[9].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_10"] = pull_sound_count[10].eb:GetText()
			LolzenUIcfg.pullcount["pull_sound_pull"] = pull_now:GetText()
			LolzenUIcfg.pullcount["pull_filter_guild"] = cb1:GetChecked()
			LolzenUIcfg.pullcount["pull_filter_party"] = cb2:GetChecked()
			LolzenUIcfg.pullcount["pull_filter_instance"] = cb3:GetChecked()
			LolzenUIcfg.pullcount["pull_filter_say"] = cb4:GetChecked()
			LolzenUIcfg.pullcount["pull_filter_channel"] = cb5:GetChecked()
			ReloadUI()
		end)

		ns["pullcount"].default = function(self)
			LolzenUIcfg.pullcount = _G["LolzenUIdefaultcfg"].pullcount
			ReloadUI()
		end
	end
end)