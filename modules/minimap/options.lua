--// options for minimap //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["minimap"] == true then

		local title = ns.createTitle("minimap")

		local about = ns.createDescription("minimap", LUI["desc_minimap"])

		local cb1 = ns.createCheckBox("minimap", "squareMinimap", "|cff5599ff"..L["mm_square"].."|r", LolzenUIcfg.minimap["minimap_square"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.minimap["minimap_square"] = cb1:GetChecked()
			LolzenUI.setMiniMapShape()
		end)

		local header = ns.createHeader("minimap", L["Position"])
		header:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -30)

		local pos_x_text = ns.createFontstring("minimap", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("minimap", 30, 20, LolzenUIcfg.minimap["minimap_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.minimap["minimap_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.setMiniMapPosition()
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("minimap", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 10, 0)

		local pos_y = ns.createInputbox("minimap", 30, 20, LolzenUIcfg.minimap["minimap_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.minimap["minimap_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.setMiniMapPosition()
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("minimap", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 10, 0)

		local anchor = ns.createPicker("minimap", "anchor", "minimap_anchor", 110, LolzenUIcfg.minimap["minimap_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		anchor.OnClick = function()
			LolzenUIcfg.minimap["minimap_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUI.setMiniMapPosition()
		end

		ns["minimap"].default = function(self)
			LolzenUIcfg.minimap = _G["LolzenUIdefaultcfg"].minimap
			ReloadUI()
		end
	end
end)