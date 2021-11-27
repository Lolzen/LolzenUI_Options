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

		local aboutBG = ns.createBackground("objectivetracker", 600, 132)
		aboutBG:SetPoint("TOPLEFT", about, "BOTTOMLEFT", -4, -14)
		aboutBG:SetFrameLevel(1)

		local cb1 = ns.createCheckBox("objectivetracker", "combatcollapse", "|cff5599ff"..L["objective_autocollapse"].."|r", LolzenUIcfg.objectivetracker["objectivetracker_combatcollapse"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.objectivetracker["objectivetracker_combatcollapse"] = cb1:GetChecked()
		end)

		local cb1_desc = ns.createFontstring("objectivetracker", L["objective_autocollapse_desc"])
		cb1_desc:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 4, 0)

		local cb2 = ns.createCheckBox("objectivetracker", "logincollapse", "|cff5599ff"..L["objective_auto_collapse_login"].."|r", LolzenUIcfg.objectivetracker["objectivetracker_logincollapse"])
		cb2:SetPoint("TOPLEFT", cb1_desc, "BOTTOMLEFT", -4, -8)

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.objectivetracker["objectivetracker_logincollapse"] = cb2:GetChecked()
		end)

		local cb2_desc = ns.createFontstring("objectivetracker", L["objective_auto_collapse_login_desc"])
		cb2_desc:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 4, 0)

		local cb3 = ns.createCheckBox("objectivetracker", "dungeoncollapse", "|cff5599ff"..L["objective_auto_collapse_dungeon"].."|r", LolzenUIcfg.objectivetracker["objectivetracker_dungeoncollapse"])
		cb3:SetPoint("TOPLEFT", cb2_desc, "BOTTOMLEFT", -4, -8)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.objectivetracker["objectivetracker_dungeoncollapse"] = cb3:GetChecked()
		end)

		local cb3_desc = ns.createFontstring("objectivetracker", L["objective_auto_collapse_dungeon_desc"])
		cb3_desc:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 4, 0)

		local header2BG = ns.createBackground("objectivetracker", 600, 70)
		header2BG:SetPoint("TOPLEFT", cb3_desc, "BOTTOMLEFT", -8, -8)
		header2BG:SetFrameLevel(1)

		local pos_x_text = ns.createFontstring("objectivetracker", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", cb3_desc, "BOTTOMLEFT", 0, -20)

		local pos_x = ns.createInputbox("objectivetracker", 30, 20, LolzenUIcfg.objectivetracker["objectivetracker_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.objectivetracker["objectivetracker_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.setOTPos()
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("objectivetracker", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("objectivetracker", 30, 20, LolzenUIcfg.objectivetracker["objectivetracker_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.objectivetracker["objectivetracker_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.setOTPos()
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("objectivetracker", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("objectivetracker", "anchor", "objectivetracker_anchor", 110, LolzenUIcfg.objectivetracker["objectivetracker_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)
		anchor.OnClick = function()
			LolzenUIcfg.objectivetracker["objectivetracker_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUI.setOTPos()
		end

		local scale_text = ns.createFontstring("objectivetracker", L["scale"]..":")
		scale_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -20)

		local scale = ns.createPicker("objectivetracker", "alpha", "objectivetrackerframe_scale", 45, LolzenUIcfg.objectivetracker["objectivetracker_scale"])
		scale:SetPoint("LEFT", scale_text, "RIGHT", -10, -3)
		scale.OnClick = function()
			LolzenUIcfg.objectivetracker["objectivetracker_scale"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(scale)])
			LolzenUI.setOTScale()
		end

		ns["objectivetracker"].default = function(self)
			LolzenUIcfg.objectivetracker = _G["LolzenUIdefaultcfg"].objectivetracker
			ReloadUI()
		end
	end
end)