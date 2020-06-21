--// options for pullcount //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L
local LSM = LibStub("LibSharedMedia-3.0")

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
		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.pullcount["pull_filter_guild"] = cb1:GetChecked()
			LolzenUI.setPCMsgFilterGuild()
		end)

		local cb2 = ns.createCheckBox("pullcount", "filter_party", "|cff5599ff"..L["count_party"].."|r", LolzenUIcfg.pullcount["pull_filter_party"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)
		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.pullcount["pull_filter_party"] = cb2:GetChecked()
			LolzenUI.setPCMsgFilterParty()
		end)

		local cb3 = ns.createCheckBox("pullcount", "filter_instance", "|cff5599ff"..L["count_instance"].."|r", LolzenUIcfg.pullcount["pull_filter_instance"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)
		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.pullcount["pull_filter_instance"] = cb3:GetChecked()
			LolzenUI.setPCMsgFilterInstance()
		end)

		local cb4 = ns.createCheckBox("pullcount", "filter_say", "|cff5599ff"..L["count_say"].."|r", LolzenUIcfg.pullcount["pull_filter_say"])
		cb4:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, 0)
		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.pullcount["pull_filter_say"] = cb4:GetChecked()
			LolzenUI.setPCMsgFilterSay()
		end)

		local cb5 = ns.createCheckBox("pullcount", "filter_channel", "|cff5599ff"..L["count_custom_channels"].."|r", LolzenUIcfg.pullcount["pull_filter_channel"])
		cb5:SetPoint("TOPLEFT", cb4, "BOTTOMLEFT", 0, 0)
		cb5:SetScript("OnClick", function(self)
			LolzenUIcfg.pullcount["pull_filter_channel"] = cb5:GetChecked()
			LolzenUI.setPCMsgFilterCustom()
		end)

		local header2 = ns.createHeader("pullcount", L["count_custom_message_to_react_header"]..":")
		header2:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, -20)

		local pull_message_count_text = ns.createFontstring("pullcount", L["count_countdown_message"]..":")
		pull_message_count_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local pull_message_countdown = ns.createInputbox("pullcount", 100, 20, LolzenUIcfg.pullcount["pull_msg_count"])
		pull_message_countdown:SetPoint("LEFT", pull_message_count_text, "RIGHT", 10, 0)

		pull_message_countdown:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pull_message_countdown:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.pullcount["pull_msg_count"] = pull_message_countdown:GetText()
			self.oldText = self:GetText()
		end)

		pull_message_countdown:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pull_message_countdown:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pull_message_text = ns.createFontstring("pullcount", "Pull message:")
		pull_message_text:SetPoint("LEFT", pull_message_countdown, "RIGHT", 10, 0)

		local count_notice = ns.createFontstring("pullcount", L["count_!n_represents"])
		count_notice:SetPoint("TOPLEFT", pull_message_count_text, "BOTTOMLEFT", 0, -8)

		local pull_message = ns.createInputbox("pullcount", 100, 20, LolzenUIcfg.pullcount["pull_msg_now"])
		pull_message:SetPoint("LEFT", pull_message_text, "RIGHT", 10, 0)

		pull_message:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pull_message:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.pullcount["pull_msg_now"] = pull_message:GetText()
			self.oldText = self:GetText()
		end)

		pull_message:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pull_message:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header3 = ns.createHeader("pullcount", L["count_range_header"])
		header3:SetPoint("TOPLEFT", count_notice, "BOTTOMLEFT", 0, -20)

		local pull_count_range_text = ns.createFontstring("pullcount", L["count_range"]..":")
		pull_count_range_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local pull_count_range = ns.createPicker("pullcount", "pullcount_range", "pull_count_range", 120, LolzenUIcfg.pullcount["pull_count_range"])
		pull_count_range:SetPoint("LEFT", pull_count_range_text, "RIGHT", -10, -3)
		pull_count_range.OnClick = function()
			LolzenUIcfg.pullcount["pull_count_range"] = tonumber(ns.picker_pull_range[UIDropDownMenu_GetSelectedID(pull_count_range)])
		end

		local pull_sound_count = {}
		for i=1, 10 do
			pull_sound_count[i] = ns.createFontstring("pullcount", L["count_file"]..": "..i)
			if i == 1 then
				pull_sound_count[i]:SetPoint("TOPLEFT", pull_count_range_text, "BOTTOMLEFT", 0, -13)
			else
				pull_sound_count[i]:SetPoint("TOPLEFT", pull_sound_count[i-1], "BOTTOMLEFT", 0, -13)
			end

			pull_sound_count[i].picker = ns.createPicker("pullcount", "sound", "pull_sound_"..i, 120, LolzenUIcfg.pullcount["pull_sound_"..i])
			pull_sound_count[i].picker.OnClick = function()
				LolzenUIcfg.pullcount["pull_sound_"..i] = UIDropDownMenu_GetSelectedName(pull_sound_count[i].picker)
				PlaySoundFile(LSM:Fetch("sound", LolzenUIcfg.pullcount["pull_sound_"..i]), "master")
			end
			pull_sound_count[i].picker:SetPoint("LEFT", pull_sound_count[i], "RIGHT", -10, -3)
		end

		local pull_now_text = ns.createFontstring("pullcount", L["count_file_pull"]..":")
		pull_now_text:SetPoint("LEFT", pull_sound_count[1].picker, "RIGHT", 0, 3)

		local pull_now = ns.createPicker("pullcount", "sound", "pull_sound_pull", 120, LolzenUIcfg.pullcount["pull_sound_pull"])
		pull_now:SetPoint("LEFT", pull_now_text, "RIGHT", -10, -3)
		pull_now.OnClick = function()
			LolzenUIcfg.pullcount["pull_sound_pull"] = UIDropDownMenu_GetSelectedName(pull_now)
			PlaySoundFile(LSM:Fetch("sound", LolzenUIcfg.pullcount["pull_sound_pull"]), "master")
		end

		local pull_abort_text = ns.createFontstring("pullcount", L["count_file_abort"]..":")
		pull_abort_text:SetPoint("TOPLEFT", pull_now_text, "BOTTOMLEFT", 0, -13)

		local pull_abort = ns.createPicker("pullcount", "sound", "pull_sound_abort", 120, LolzenUIcfg.pullcount["pull_sound_abort"])
		pull_abort:SetPoint("LEFT", pull_abort_text, "RIGHT", -10, -3)
		pull_abort.OnClick = function()
			LolzenUIcfg.pullcount["pull_sound_abort"] = UIDropDownMenu_GetSelectedName(pull_abort)
			PlaySoundFile(LSM:Fetch("sound", LolzenUIcfg.pullcount["pull_sound_abort"]), "master")
		end

		ns["pullcount"].default = function(self)
			LolzenUIcfg.pullcount = _G["LolzenUIdefaultcfg"].pullcount
			ReloadUI()
		end
	end
end)