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

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.itemlevel["ilvl_characterframe"] = cb1:GetChecked()
			LolzenUI.SetItemlevelBlizzCharVisibility()
		end)

		local cb2 = ns.createCheckBox("itemlevel", "Inspect", "|cff5599ff"..L["ilvl_show_on_inspectframe"].."|r", LolzenUIcfg.itemlevel["ilvl_inspectframe"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.itemlevel["ilvl_inspectframe"] = cb2:GetChecked()
			LolzenUI.SetItemlevelBlizzInspectVisibility()
		end)

		local cb3 = ns.createCheckBox("itemlevel", "Bags", "|cff5599ff"..L["ilvl_show_on_bags"].."|r", LolzenUIcfg.itemlevel["ilvl_bags"])
		cb3:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, 0)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.itemlevel["ilvl_bags"] = cb3:GetChecked()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end)

		local header = ns.createHeader("itemlevel", L["ilvl_header_text"])
		header:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 0, -13)

		local pos_x_text = ns.createFontstring("itemlevel", L["PosX"]..":")
		pos_x_text:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -10)

		local pos_x = ns.createInputbox("itemlevel", 30, 20, LolzenUIcfg.itemlevel["ilvl_font_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.itemlevel["ilvl_font_posx"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("itemlevel", L["PosY"]..":")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("itemlevel", 30, 20, LolzenUIcfg.itemlevel["ilvl_font_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.itemlevel["ilvl_font_posy"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local anchor_text = ns.createFontstring("itemlevel", L["anchor"]..":")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("itemlevel", "anchor", "ilvl_anchor_1", 110, LolzenUIcfg.itemlevel["ilvl_anchor"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)
		anchor.OnClick = function()
			LolzenUIcfg.itemlevel["ilvl_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end

		local color_text = ns.createFontstring("itemlevel", L["color"]..":")
		color_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local color = ns.createColorTexture("itemlevel", 16, 16, LolzenUIcfg.itemlevel["ilvl_font_color"], "LolzenUI Standard")
		color:SetPoint("LEFT", color_text, "RIGHT", 10, 0)
		color.setActualColors = function()
			LolzenUIcfg.itemlevel["ilvl_font_color"] = {color:GetVertexColor()}
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end

		local color_f = ns.createColorPicker("itemlevel", color, LolzenUIcfg.itemlevel["ilvl_font_color"])
		color_f:SetAllPoints(color)

		local font_text = ns.createFontstring("itemlevel", L["font"]..":")
		font_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -15)

		local font = ns.createPicker("itemlevel", "font", "itemlevel_font", 120, LolzenUIcfg.itemlevel["ilvl_font"])
		font:SetPoint("LEFT", font_text, "RIGHT", -10, -3)
		font.OnClick = function()
			LolzenUIcfg.itemlevel["ilvl_font"] = UIDropDownMenu_GetSelectedName(font)
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end

		local font_size_text = ns.createFontstring("itemlevel", L["size"]..":")
		font_size_text:SetPoint("LEFT", font, "RIGHT", -5, 3)

		local font_size = ns.createInputbox("itemlevel", 30, 20, LolzenUIcfg.itemlevel["ilvl_font_size"])
		font_size:SetPoint("LEFT", font_size_text, "RIGHT", 10, 0)

		font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.itemlevel["ilvl_font_size"] = tonumber(font_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end)

		font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local font_flag_text = ns.createFontstring("itemlevel", L["flag"]..":")
		font_flag_text:SetPoint("LEFT", font_size, "RIGHT", 5, 0)

		local font_flag = ns.createPicker("itemlevel", "flag", "itemlevel_font_flag", 120, LolzenUIcfg.itemlevel["ilvl_font_flag"])
		font_flag:SetPoint("LEFT", font_flag_text, "RIGHT", -10, -3)
		font_flag.OnClick = function()
			LolzenUIcfg.itemlevel["ilvl_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(font_flag)]
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end

		local cb4 = ns.createCheckBox("itemlevel", "itemquality_colors", "|cff5599ff"..L["ilvl_use_quality_color"].."|r", LolzenUIcfg.itemlevel["ilvl_use_itemquality_color"])
		cb4:SetPoint("TOPLEFT", font_text, "BOTTOMLEFT", 0, -8)

		cb4:SetScript("OnClick", function(self)
			LolzenUIcfg.itemlevel["ilvl_use_itemquality_color"] = cb4:GetChecked()
			LolzenUI.SetItemlevelBlizzChar()
			LolzenUI.SetItemlevelBlizzInspect()
			if IsAddOnLoaded("Baggins") then
				LolzenUI.UpdateItemlevelBaggins()
			elseif IsAddOnLoaded("Bagnon") then
				LolzenUI.UpdateItemlevelBagnon()
			elseif IsAddOnLoaded("BaudBag") then
				LolzenUI.UpdateItemlevelBaudBag()
			elseif IsAddOnLoaded("Combuctor") then
				LolzenUI.UpdateItemlevelCombuctor()
			elseif IsAddOnLoaded("Inventorian") then
				LolzenUI.UpdateItemlevelInventorian()
			elseif IsAddOnLoaded("LiteBag") then
				LolzenUI.UpdateItemlevelLitebag()
			else
				LolzenUI.UpdateItemlevelBlizzBags()
			end
		end)

		ns["itemlevel"].default = function(self)
			LolzenUIcfg.itemlevel = _G["LolzenUIdefaultcfg"].itemlevel
			ReloadUI()
		end
	end
end)