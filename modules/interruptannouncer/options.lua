--// options for interruptannouncer //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["interruptannouncer"] == true then

		local title = ns.createTitle("interruptannouncer")

		local about = ns.createDescription("interruptannouncer", LUI["desc_interruptannouncer"])

		local cb1 = ns.createCheckBox("interruptannouncer", "instanceannounce", "|cff5599ff"..L["ia_announce_intance"].."|r", LolzenUIcfg.interruptannouncer["interruptannoucer_instance"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local cb2 = ns.createCheckBox("interruptannouncer", "partyannounce", "|cff5599ff"..L["ia_announce_party"].."|r", LolzenUIcfg.interruptannouncer["interruptannoucer_party"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local cb3 = ns.createCheckBox("interruptannouncer", "sayannounce", "|cff5599ff"..L["ia_announce_say"].."|r", LolzenUIcfg.interruptannouncer["interruptannoucer_say"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		local msg_text = ns.createFontstring("interruptannouncer", L["ia_message"]..":")
		msg_text:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -13)

		local msg = ns.createInputbox("interruptannouncer", 400, 20, LUI["ia_announce_message_text_interrupted"])
		msg:SetPoint("LEFT", msg_text, "RIGHT", 10, 0)

		local msg_desc = ns.createFontstring("interruptannouncer", L["ia_message_description"])
		msg_desc:SetPoint("TOPLEFT", msg_text, "BOTTOMLEFT", 0, -8)

		local applyButton = ns.createApplyButton("interruptannouncer")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.interruptannouncer["interruptannoucer_instance"] = cb1:GetChecked()
			LolzenUIcfg.interruptannouncer["interruptannoucer_party"] = cb2:GetChecked()
			LolzenUIcfg.interruptannouncer["interruptannoucer_say"] = cb3:GetChecked()
			LolzenUIcfg.interruptannouncer["interruptannouncer_msg"] = msg:GetText()
			ReloadUI()
		end)

		ns["interruptannouncer"].default = function(self)
			LolzenUIcfg.interruptannouncer = _G["LolzenUIdefaultcfg"].interruptannouncer
			ReloadUI()
		end
	end
end)