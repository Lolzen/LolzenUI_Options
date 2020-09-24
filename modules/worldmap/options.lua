--// options for worldmap //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["worldmap"] == true then

		local title = ns.createTitle("worldmap")

		local about = ns.createDescription("worldmap", LUI["desc_worldmap"])

		local aboutBG = ns.createBackground("worldmap", 600, 106)
		aboutBG:SetPoint("TOPLEFT", about, "BOTTOMLEFT", -4, -14)
		aboutBG:SetFrameLevel(1)

		local scale_text = ns.createFontstring("worldmap", L["wm_scale"]..":")
		scale_text:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 4, -26)

		local scale = ns.createPicker("worldmap", "alpha", "worldmapframe_scale", 45, LolzenUIcfg.worldmap["worldmap_scale"])
		scale:SetPoint("LEFT", scale_text, "RIGHT", -10, -3)
		scale.OnClick = function()
			LolzenUIcfg.worldmap["worldmap_scale"] = tonumber(ns.picker_alpha[UIDropDownMenu_GetSelectedID(scale)])
			WorldMapFrame:SynchronizeDisplayState()
		end

		local cb1 = ns.createCheckBox("worldmap", "title_coordinates", "|cff5599ff"..L["wm_coordinates"].."|r", LolzenUIcfg.worldmap["worldmap_coordinates"])
		cb1:SetPoint("TOPLEFT", scale_text, "BOTTOMLEFT", -4, -8)
		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.worldmap["worldmap_coordinates"] = cb1:GetChecked()
			LolzenUI.setWMCoordinates()
		end)

		local color_text = ns.createFontstring("worldmap", L["wm_title_or_coordinates_color"]..":")
		color_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 4, -8)

		local color = ns.createColorTexture("worldmap", 16, 16, LolzenUIcfg.worldmap["worldmap_title_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)
		color.setActualColors = function()
			LolzenUIcfg.worldmap["worldmap_title_color"] = {color:GetVertexColor()}
			LolzenUI.setWMTitleColor()
		end

		local color_f = ns.createColorPicker("worldmap", color, LolzenUIcfg.worldmap["worldmap_title_color"])
		color_f:SetAllPoints(color)

		local cb2 = ns.createCheckBox("worldmap", "save_worldmap_position", "|cff5599ff"..L["save_worldmap_position"].."|r", LolzenUIcfg.worldmap["worldmap_save_position"])
		cb2:SetPoint("TOPLEFT", color_text, "BOTTOMLEFT", -4, -8)
		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.worldmap["worldmap_save_position"] = cb2:GetChecked()
		end)

		ns["worldmap"].default = function(self)
			LolzenUIcfg.worldmap = _G["LolzenUIdefaultcfg"].worldmap
			ReloadUI()
		end
	end
end)