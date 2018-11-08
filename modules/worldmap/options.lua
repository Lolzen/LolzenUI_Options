--// options for worldmap //--

local _, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["worldmap"] == true then

		local title = ns.createTitle("worldmap")

		local about = ns.createDescription("worldmap", "Modifies & Enhances the Worldmap")

		local scale_text = ns.createFontstring("worldmap", "Worldmap Scale (minimized) [range: 0.1 - 1]:")
		scale_text:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local scale = ns.createInputbox("worldmap", 30, 20, LolzenUIcfg.worldmap["worldmap_scale"])
		scale:SetPoint("LEFT", scale_text, "RIGHT", 10, 0)

		local cb1 = ns.createCheckBox("worldmap", "title_coordinates", "|cff5599ffEnable Mouse Coordinates|r", LolzenUIcfg.worldmap["worldmap_coordinates"])
		cb1:SetPoint("TOPLEFT", scale_text, "BOTTOMLEFT", 0, -8)

		local color_text = ns.createFontstring("worldmap", "Title Text/Coordinates Color:")
		color_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local color = ns.createColorTexture("worldmap", 16, 16, LolzenUIcfg.worldmap["worldmap_title_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)

		local color_f = ns.createColorPicker("worldmap", color, LolzenUIcfg.worldmap["worldmap_title_color"])
		color_f:SetAllPoints(color)

		local cb2 = ns.createCheckBox("worldmap", "save_worldmap_position", "|cff5599ffSave WorldMap position|r", LolzenUIcfg.worldmap["worldmap_save_position"])
		cb2:SetPoint("TOPLEFT", color_text, "BOTTOMLEFT", 0, -8)

		local applyButton = ns.createApplyButton("worldmap")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.worldmap["worldmap_scale"] = tonumber(scale:GetText())
			LolzenUIcfg.worldmap["worldmap_coordinates"] = cb1:GetChecked()
			LolzenUIcfg.worldmap["worldmap_title_color"] = {color:GetVertexColor()}
			LolzenUIcfg.worldmap["worldmap_save_position"] = cb2:GetChecked()
			ReloadUI()
		end)

		ns["worldmap"].default = function(self)
			LolzenUIcfg.worldmap["worldmap_scale"] = 1
			LolzenUIcfg.worldmap["worldmap_coordinates"] = true
			LolzenUIcfg.worldmap["worldmap_title_color"] = {51/255, 181/255, 229/255}
			LolzenUIcfg.worldmap["worldmap_save_position"] = true
			ReloadUI()
		end
	end
end)