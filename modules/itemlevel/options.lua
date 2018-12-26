--// options for itemlevel //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["itemlevel"] == true then

		local title = ns.createTitle("itemlevel")

		local about = ns.createDescription("itemlevel", LUI["desc_itemlevel"])

		local cb1 = ns.createCheckBox("itemlevel", "Character", "|cff5599ff"..L["ilvl_show_on_characterframe"].."|r", LolzenUIcfg.itemlevel["ilvl_characterframe"])
		cb1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local cb2 = ns.createCheckBox("itemlevel", "Inspect", "|cff5599ff"..L["ilvl_show_on_inspectframe"].."|r", LolzenUIcfg.itemlevel["ilvl_inspectframe"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		local cb3 = ns.createCheckBox("itemlevel", "Bags", "|cff5599ff"..L["ilvl_show_on_bags"].."|r", LolzenUIcfg.itemlevel["ilvl_bags"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		local header = ns.createHeader("itemlevel", L["ilvl_header_text"])
		header:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -13)

		local pos_x_text = ns.createFontstring("itemlevel", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("itemlevel", 30, 20, LolzenUIcfg.itemlevel["ilvl_font_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("itemlevel", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("itemlevel", 30, 20, LolzenUIcfg.itemlevel["ilvl_font_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("itemlevel", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("itemlevel", "anchor", "ilvl_anchor_1", 110, LolzenUIcfg.itemlevel["ilvl_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local color_text = ns.createFontstring("itemlevel", L["color"]..":")
		color_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local color = ns.createColorTexture("itemlevel", 16, 16, LolzenUIcfg.itemlevel["ilvl_font_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)

		local color_f = ns.createColorPicker("itemlevel", color, LolzenUIcfg.itemlevel["ilvl_font_color"])
		color_f:SetAllPoints(color)

		local font_text = ns.createFontstring("itemlevel", L["font"]..":")
		font_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -15)

		local font = ns.createPicker("itemlevel", "font", "itemlevel_font", 120, LolzenUIcfg.itemlevel["ilvl_font"])
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)

		local font_size_text = ns.createFontstring("itemlevel", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("itemlevel", 30, 20, LolzenUIcfg.itemlevel["ilvl_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		local font_flag_text = ns.createFontstring("itemlevel", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 5, 0)

		local font_flag = ns.createPicker("itemlevel", "flag", "itemlevel_font_flag", 120, LolzenUIcfg.itemlevel["ilvl_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)
		
		local cb4 = ns.createCheckBox("itemlevel", "itemquality_colors", "|cff5599ff"..L["ilvl_use_quality_color"].."|r", LolzenUIcfg.itemlevel["ilvl_use_itemquality_color"])
		cb4:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -8)

		local applyButton = ns.createApplyButton("itemlevel")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.itemlevel["ilvl_characterframe"] = cb1:GetChecked()
			LolzenUIcfg.itemlevel["ilvl_inspectframe"] = cb2:GetChecked()
			LolzenUIcfg.itemlevel["ilvl_bags"] = cb3:GetChecked()
			LolzenUIcfg.itemlevel["ilvl_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.itemlevel["ilvl_font_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.itemlevel["ilvl_font_posy"] = tonumber(pos_y:GetText())
			LolzenUIcfg.itemlevel["ilvl_font_color"] = {color:GetVertexColor()}
			LolzenUIcfg.itemlevel["ilvl_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUIcfg.itemlevel["ilvl_font_size"] = tonumber(font_size:GetText())
			LolzenUIcfg.itemlevel["ilvl_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUIcfg.itemlevel["ilvl_use_itemquality_color"] = cb4:GetChecked()
			ReloadUI()
		end)

		ns["itemlevel"].default = function(self)
			LolzenUIcfg.itemlevel["ilvl_characterframe"] = true
			LolzenUIcfg.itemlevel["ilvl_inspectframe"] = true
			LolzenUIcfg.itemlevel["ilvl_bags"] = true
			LolzenUIcfg.itemlevel["ilvl_anchor"] = "TOP"
			LolzenUIcfg.itemlevel["ilvl_font_posx"] = 0
			LolzenUIcfg.itemlevel["ilvl_font_posy"] = -5
			LolzenUIcfg.itemlevel["ilvl_font_color"] = {0, 1, 0}
			LolzenUIcfg.itemlevel["ilvl_font"] = "DroidSans"
			LolzenUIcfg.itemlevel["ilvl_font_size"] = 14
			LolzenUIcfg.itemlevel["ilvl_font_flag"] = "THINOUTLINE"
			LolzenUIcfg.itemlevel["ilvl_use_itemquality_color"] = false
			ReloadUI()
		end
	end
end)