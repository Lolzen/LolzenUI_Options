--// options for minimap //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["minimap"] == true then

		local title = ns.createTitle("minimap")

		local about = ns.createDescription("minimap", "A clean Minimap")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

		local cb1 = ns.createCheckBox("minimap", "squareMinimap", "|cff5599ffsquare Minimap|r", LolzenUIcfg.minimap["minimap_square"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local header = ns.createHeader("minimap", "Position:")
		header:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -30)

		local pos_x_text = ns.createFontstring("minimap", "PosX:")
		pos_x_text:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("minimap", 30, 20, LolzenUIcfg.minimap["minimap_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("minimap", "PosY:")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 10, 0)

		local pos_y = ns.createInputbox("minimap", 30, 20, LolzenUIcfg.minimap["minimap_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("minimap", "Anchor:")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 10, 0)

		local anchor = ns.createPicker("minimap", "anchor", "clock_text_anchor_1", 110, LolzenUIcfg.minimap["minimap_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local applyButton = ns.createApplyButton("minimap")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.minimap["minimap_square"] = cb1:GetChecked()
			LolzenUIcfg.minimap["minimap_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.minimap["minimap_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.minimap["minimap_posy"] = tonumber(pos_y:GetText())
			ReloadUI()
		end)

		ns["minimap"].default = function(self)
			LolzenUIcfg.minimap["minimap_square"] = true
			LolzenUIcfg.minimap["minimap_anchor"] = "TOPRIGHT"
			LolzenUIcfg.minimap["minimap_posx"] = -15
			LolzenUIcfg.minimap["minimap_posy"] = -40
			ReloadUI()
		end
	end
end)