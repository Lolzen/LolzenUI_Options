--// options for objectivetracker //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["objectivetracker"] == true then

		local title = ns.createTitle("objectivetracker")

		local about = ns.createDescription("objectivetracker", LUI["desc_objectivetracker"])

		local cb1 = ns.createCheckBox("objectivetracker", "combatcollapse", "|cff5599ff"..L["objective_autocollapse"].."|r", LolzenUIcfg.objectivetracker["objectivetracker_combatcollapse"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local cb1_desc = ns.createFontstring("objectivetracker", L["objective_autocollapse_desc"])
		cb1_desc:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local cb2 = ns.createCheckBox("objectivetracker", "logincollapse", "|cff5599ff"..L["objective_auto_collapse_login"].."|r", LolzenUIcfg.objectivetracker["objectivetracker_logincollapse"])
		cb2:SetPoint("TOPLEFT", cb1_desc, "BOTTOMLEFT", 0, -8)

		local cb2_desc = ns.createFontstring("objectivetracker", L["objective_auto_collapse_login_desc"])
		cb2_desc:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		local pos_x_text = ns.createFontstring("objectivetracker", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", cb2_desc, "BOTTOMLEFT", 0, -20)

		local pos_x = ns.createInputbox("objectivetracker", 30, 20, LolzenUIcfg.objectivetracker["objectivetracker_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("objectivetracker", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("objectivetracker", 30, 20, LolzenUIcfg.objectivetracker["objectivetracker_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("objectivetracker", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("objectivetracker", "anchor", "objectivetracker_anchor", 110, LolzenUIcfg.objectivetracker["objectivetracker_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local scale_text = ns.createFontstring("objectivetracker", L["scale"]..":")
		scale_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -20)

		local scale = ns.createPicker("objectivetracker", "alpha", "objectivetrackerframe_scale", 45, LolzenUIcfg.objectivetracker["objectivetracker_scale"])
		scale:SetPoint("LEFT", scale_text, "RIGHT", -10, -3)

		local applyButton = ns.createApplyButton("objectivetracker")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.objectivetracker["objectivetracker_combatcollapse"] = cb1:GetChecked()
			LolzenUIcfg.objectivetracker["objectivetracker_logincollapse"] = cb2:GetChecked()
			LolzenUIcfg.objectivetracker["objectivetracker_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.objectivetracker["objectivetracker_posy"] = tonumber(pos_y:GetText())
			LolzenUIcfg.objectivetracker["objectivetracker_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.objectivetracker["objectivetracker_scale"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(scale)])
			ReloadUI()
		end)

		ns["objectivetracker"].default = function(self)
			LolzenUIcfg.objectivetracker = _G["LolzenUIdefaultcfg"].objectivetracker
			ReloadUI()
		end
	end
end)