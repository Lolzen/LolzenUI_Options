--// options for nameplates //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L
local LSM = LibStub("LibSharedMedia-3.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["nameplates"] == true then

		local title = ns.createTitle("nameplates")

		local about = ns.createDescription("nameplates", LUI["desc_nameplates"])

		local header1 = ns.createHeader("nameplates", L["Preview"]..":")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local header1BG = ns.createBackground("nameplates", 600, 40)
		header1BG:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", -4, -4)
		header1BG:SetFrameLevel(1)

		local prev_np_frame = CreateFrame("Frame", nil, ns["nameplates"])
		prev_np_frame:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		prev_np_frame:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 8, -25)

		local prev_np = prev_np_frame:CreateTexture(nil, "BACKGROUND")
		prev_np:SetAllPoints(prev_np_frame)
		prev_np:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates.general["np_texture"]))
		prev_np:SetVertexColor(0.6, 0.1, 0)

		local prev_np_lvlname = prev_np_frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
		prev_np_lvlname:SetText("|cffffff00110|r + Random Name")
		prev_np_lvlname:SetPoint(LolzenUIcfg.nameplates.general["np_lvlname_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_lvlname_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])

		local prev_np_threatglow = CreateFrame("Frame", nil, ns["nameplates"])
		prev_np_threatglow:SetFrameStrata("BACKGROUND")
		prev_np_threatglow:SetBackdrop({
			edgeFile ="Interface\\AddOns\\LolzenUI\\media\\glow", edgeSize = 5,
			insets = {left = 4, right = 4, top = 4, bottom = 4}
		})
		prev_np_threatglow:SetPoint("TOPLEFT", prev_np, -5, 5)
		prev_np_threatglow:SetPoint("BOTTOMRIGHT", prev_np, 5, -5)
		prev_np_threatglow:SetBackdropBorderColor(6, 0, 0)

		local prev_np_targetindicator = prev_np_frame:CreateTexture(nil, "OVERLAY")
		prev_np_targetindicator:SetTexture("Interface\\AddOns\\LolzenUI\\media\\target-glow")
		prev_np_targetindicator:SetPoint("CENTER", prev_np, 0, -3*LolzenUIcfg.nameplates.general["np_selected_scale"])
		prev_np_targetindicator:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		prev_np_targetindicator:SetVertexColor(48/255, 113/255, 191/255)

		local prev_np_raidmark = prev_np_frame:CreateTexture(nil, "OVERLAY")
		prev_np_raidmark:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8")
		prev_np_raidmark:SetPoint(LolzenUIcfg.nameplates.general["np_raidmark_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_raidmark_posx"], LolzenUIcfg.nameplates.general["np_raidmark_posy"])
		prev_np_raidmark:SetSize(LolzenUIcfg.nameplates.general["np_raidmark_size"], LolzenUIcfg.nameplates.general["np_raidmark_size"])

		local prev_np_frameBG = ns.createBackground("nameplates", 600, 58)
		prev_np_frameBG:SetPoint("TOPLEFT", prev_np_frame, "BOTTOMLEFT", -12, -14)
		prev_np_frameBG:SetFrameLevel(1)

		local cb1 = ns.createCheckBox("nameplates", "targetindicator", "|cff5599ff"..L["np_show_targetindicator"].."|r", LolzenUIcfg.nameplates.general["np_targetindicator"])
		cb1:SetPoint("TOPLEFT", prev_np, "BOTTOMLEFT", -8, -20)

		cb1:SetScript("OnClick", function(self)
			LolzenUIcfg.nameplates.general["np_targetindicator"] = cb1:GetChecked()
			if cb1:GetChecked() == false then
				prev_np_targetindicator:Hide()
			else
				prev_np_targetindicator:Show()
			end
			LolzenUI.setNPTargetIndicator()
		end)

		if cb1:GetChecked() == false then
			prev_np_targetindicator:Hide()
		else
			prev_np_targetindicator:Show()
		end

		local cb2 = ns.createCheckBox("nameplates", "threatindicator", "|cff5599ff"..L["np_show_threat_border"].."|r", LolzenUIcfg.nameplates.general["np_threatindicator"])
		cb2:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, 0)

		cb2:SetScript("OnClick", function(self)
			LolzenUIcfg.nameplates.general["np_threatindicator"] = cb2:GetChecked()
			if cb2:GetChecked() == false then
				prev_np_threatglow:Hide()
			else
				prev_np_threatglow:Show()
			end
		end)

		if cb2:GetChecked() == false then
			prev_np_threatglow:Hide()
		else
			prev_np_threatglow:Show()
		end

		local header2 = ns.createHeader("nameplates", L["np_nameplates_general_header"])
		header2:SetPoint("TOPLEFT", cb2, "BOTTOMLEFT", 0, -8)

		local header2BG = ns.createBackground("nameplates", 600, 33)
		header2BG:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", -4, -4)
		header2BG:SetFrameLevel(1)

		local height_text = ns.createFontstring("nameplates", L["height"]..":")
		height_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 4, -15)

		local height = ns.createInputbox("nameplates", 40, 20, LolzenUIcfg.nameplates.general["np_height"])
		height:SetPoint("LEFT", height_text, "RIGHT", 10, 0)

		height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_height"] = tonumber(height:GetText())
			self.oldText = self:GetText()
			prev_np_frame:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI_Options.setNPCBPrevSize()
			LolzenUI.setNPSize()
		end)

		height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local width_text = ns.createFontstring("nameplates", L["width"]..":")
		width_text:SetPoint("LEFT", height, "RIGHT", 10, 0)

		local width = ns.createInputbox("nameplates", 40, 20, LolzenUIcfg.nameplates.general["np_width"])
		width:SetPoint("LEFT", width_text, "RIGHT", 10, 0)

		width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_width"] = tonumber(width:GetText())
			self.oldText = self:GetText()
			prev_np_frame:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI_Options.setNPCBPrevSize()
			LolzenUI.setNPSize()
		end)

		width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local texture_text = ns.createFontstring("nameplates", L["texture"]..":")
		texture_text:SetPoint("LEFT", width, "RIGHT", 10, 0)

		local texture = ns.createPicker("nameplates", "statusbar", "np_statusbar", 120, LolzenUIcfg.nameplates.general["np_texture"])
		texture:SetPoint("LEFT", texture_text, "RIGHT", -10, -3)
		texture.OnClick = function()
			LolzenUIcfg.nameplates.general["np_texture"] = UIDropDownMenu_GetSelectedName(texture)
			prev_np:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates.general["np_texture"]))
			LolzenUI_Options.setNPCBTexture()
			LolzenUI.setNPTexture()
		end

		local selected_text = ns.createFontstring("nameplates", L["np_target_nameplate_scale"]..":")
		selected_text:SetPoint("LEFT", texture, "RIGHT", -5, 3)

		local selected = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_selected_scale"])
		selected:SetPoint("LEFT", selected_text, "RIGHT", 10, 0)

		selected:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		selected:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_selected_scale"] = tonumber(selected:GetText())
			self.oldText = self:GetText()
			prev_np_frame:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			prev_np_lvlname:SetPoint(LolzenUIcfg.nameplates.general["np_lvlname_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_lvlname_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
			prev_np_targetindicator:SetPoint("CENTER", prev_np, 0, -3*LolzenUIcfg.nameplates.general["np_selected_scale"])
			prev_np_targetindicator:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI_Options.setNPCBPrevSize()
			LolzenUI_Options.setNPCBLvlNameFont()
			LolzenUI_Options.setNPCB()
			LolzenUI_Options.setNPCBSpark()
			LolzenUI_Options.setNPCBIcon()
			LolzenUI_Options.setNPCBShield()
			LolzenUI_Options.setNPCBTime()
			LolzenUI_Options.setNPCBText()
			LolzenUI.setNPSize()
		end)

		selected:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		selected:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local header3 = ns.createHeader("nameplates", L["np_level_and_name_header"])
		header3:SetPoint("TOPLEFT", height_text, "BOTTOMLEFT", -4, -17)

		local header3BG = ns.createBackground("nameplates", 600, 64)
		header3BG:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", -4, -4)
		header3BG:SetFrameLevel(1)

		local lvlname_font_text = ns.createFontstring("nameplates", L["font"]..":")
		lvlname_font_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 4, -17)

		local lvlname_font = ns.createPicker("nameplates", "font", "lvlname_font", 120, LolzenUIcfg.nameplates.general["np_lvlname_font"])
		lvlname_font:SetPoint("LEFT", lvlname_font_text, "RIGHT", -10, -3)
		lvlname_font.OnClick = function()
			LolzenUIcfg.nameplates.general["np_lvlname_font"] = UIDropDownMenu_GetSelectedName(lvlname_font)
			prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
			LolzenUI_Options.setNPCBLvlNameFont()
			LolzenUI.setNPLevelFont()
		end

		local lvlname_font_size_text = ns.createFontstring("nameplates", L["size"]..":")
		lvlname_font_size_text:SetPoint("LEFT", lvlname_font, "RIGHT", -10, 3)

		local lvlname_font_size = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_lvlname_font_size"])
		lvlname_font_size:SetPoint("LEFT", lvlname_font_size_text, "RIGHT", 10, 0)

		lvlname_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		lvlname_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_lvlname_font_size"] = tonumber(lvlname_font_size:GetText())
			self.oldText = self:GetText()
			prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
			LolzenUI_Options.setNPCBLvlNameFont()
			LolzenUI.setNPLevelFont()
		end)

		lvlname_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		lvlname_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local lvlname_font_flag_text = ns.createFontstring("nameplates", L["flag"]..":")
		lvlname_font_flag_text:SetPoint("LEFT", lvlname_font_size, "RIGHT", 10, 0)

		local lvlname_font_flag = ns.createPicker("nameplates", "flag", "lvlname_font_flag", 120, LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
		lvlname_font_flag:SetPoint("LEFT", lvlname_font_flag_text, "RIGHT", -10, -3)
		lvlname_font_flag.OnClick = function()
			LolzenUIcfg.nameplates.general["np_lvlname_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(lvlname_font_flag)]
			prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
			LolzenUI_Options.setNPCBLvlNameFont()
			LolzenUI.setNPLevelFont()
		end

		local lvlname_pos_x_text = ns.createFontstring("nameplates", L["PosX"]..":")
		lvlname_pos_x_text:SetPoint("TOPLEFT", lvlname_font_text, "BOTTOMLEFT", 0, -15)

		local lvlname_pos_x = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_lvlname_posx"])
		lvlname_pos_x:SetPoint("LEFT", lvlname_pos_x_text, "RIGHT", 10, 0)

		lvlname_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		lvlname_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_lvlname_posx"] = tonumber(lvlname_pos_x:GetText())
			self.oldText = self:GetText()
			prev_np_lvlname:ClearAllPoints()
			prev_np_lvlname:SetPoint(LolzenUIcfg.nameplates.general["np_lvlname_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_lvlname_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNPLevelFontPos()
		end)

		lvlname_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		lvlname_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local lvlname_pos_y_text = ns.createFontstring("nameplates", L["PosY"]..":")
		lvlname_pos_y_text:SetPoint("LEFT", lvlname_pos_x, "RIGHT", 5, 0)

		local lvlname_pos_y = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_lvlname_posy"])
		lvlname_pos_y:SetPoint("LEFT", lvlname_pos_y_text, "RIGHT", 10, 0)

		lvlname_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		lvlname_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_lvlname_posy"] = tonumber(lvlname_pos_y:GetText())
			self.oldText = self:GetText()
			prev_np_lvlname:ClearAllPoints()
			prev_np_lvlname:SetPoint(LolzenUIcfg.nameplates.general["np_lvlname_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_lvlname_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNPLevelFontPos()
		end)

		lvlname_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		lvlname_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local lvlname_anchor_text = ns.createFontstring("nameplates", L["anchor"]..":")
		lvlname_anchor_text:SetPoint("LEFT", lvlname_pos_y, "RIGHT", 10, 0)

		local lvlname_anchor = ns.createPicker("nameplates", "anchor", "nameplates_lvlname_anchor1", 110, LolzenUIcfg.nameplates.general["np_lvlname_anchor"])
		lvlname_anchor:SetPoint("LEFT", lvlname_anchor_text, "RIGHT", -10, -3)
		lvlname_anchor.OnClick = function()
			LolzenUIcfg.nameplates.general["np_lvlname_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(lvlname_anchor)]
			prev_np_lvlname:ClearAllPoints()
			prev_np_lvlname:SetPoint(LolzenUIcfg.nameplates.general["np_lvlname_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_lvlname_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNPLevelFontPos()
		end

		local header4 = ns.createHeader("nameplates", L["raidmarks"])
		header4:SetPoint("TOPLEFT", lvlname_pos_x_text, "BOTTOMLEFT", -4, -20)

		local header4BG = ns.createBackground("nameplates", 600, 48)
		header4BG:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", -4, -4)
		header4BG:SetFrameLevel(1)

		local cb3 = ns.createCheckBox("nameplates", "raidtargetindicator", "|cff5599ff"..L["show_raidmarks"].."|r", LolzenUIcfg.nameplates.general["np_raidtargetindicator"])
		cb3:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -7)

		cb3:SetScript("OnClick", function(self)
			LolzenUIcfg.nameplates.general["np_raidtargetindicator"] = cb3:GetChecked()
			if cb3:GetChecked() == false then
				prev_np_raidmark:Hide()
			else
				prev_np_raidmark:Show()
			end
			LolzenUI.setNPRaidMarks()
		end)

		if cb3:GetChecked() == false then
			prev_np_raidmark:Hide()
		else
			prev_np_raidmark:Show()
		end

		local rt_size_text = ns.createFontstring("nameplates", L["size"]..":")
		rt_size_text:SetPoint("TOPLEFT", cb3, "BOTTOMLEFT", 4, 0)

		local rt_size = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_raidmark_size"])
		rt_size:SetPoint("LEFT", rt_size_text, "RIGHT", 10, 0)

		rt_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rt_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_raidmark_size"] = tonumber(rt_size:GetText())
			self.oldText = self:GetText()
			prev_np_raidmark:SetSize(LolzenUIcfg.nameplates.general["np_raidmark_size"], LolzenUIcfg.nameplates.general["np_raidmark_size"])
			LolzenUI.setNPRaidMarkSize()
		end)

		rt_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rt_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rt_pos_x_text = ns.createFontstring("nameplates", L["PosX"]..":")
		rt_pos_x_text:SetPoint("LEFT", rt_size, "RIGHT", 10, 0)

		local rt_pos_x = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_raidmark_posx"])
		rt_pos_x:SetPoint("LEFT", rt_pos_x_text, "RIGHT", 10, 0)

		rt_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rt_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_raidmark_posx"] = tonumber(rt_pos_x:GetText())
			self.oldText = self:GetText()
			prev_np_raidmark:ClearAllPoints()
			prev_np_raidmark:SetPoint(LolzenUIcfg.nameplates.general["np_raidmark_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_raidmark_posx"], LolzenUIcfg.nameplates.general["np_raidmark_posy"])
			LolzenUI.setNPRaidMarkPos()
		end)

		rt_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rt_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rt_pos_y_text = ns.createFontstring("nameplates", L["PosY"]..":")
		rt_pos_y_text:SetPoint("LEFT", rt_pos_x, "RIGHT", 5, 0)

		local rt_pos_y = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_raidmark_posy"])
		rt_pos_y:SetPoint("LEFT", rt_pos_y_text, "RIGHT", 10, 0)

		rt_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		rt_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_raidmark_posy"] = tonumber(rt_pos_y:GetText())
			self.oldText = self:GetText()
			prev_np_raidmark:ClearAllPoints()
			prev_np_raidmark:SetPoint(LolzenUIcfg.nameplates.general["np_raidmark_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_raidmark_posx"], LolzenUIcfg.nameplates.general["np_raidmark_posy"])
			LolzenUI.setNPRaidMarkPos()
		end)

		rt_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		rt_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local rt_anchor_text = ns.createFontstring("nameplates", L["anchor"]..":")
		rt_anchor_text:SetPoint("LEFT", rt_pos_y, "RIGHT", 10, 0)

		local rt_anchor = ns.createPicker("nameplates", "anchor", "nameplates_raidmark_anchor", 110, LolzenUIcfg.nameplates.general["np_raidmark_anchor"])
		rt_anchor:SetPoint("LEFT", rt_anchor_text, "RIGHT", -10, -3)
		rt_anchor.OnClick = function()
			LolzenUIcfg.nameplates.general["np_raidmark_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(rt_anchor)]
			prev_np_raidmark:ClearAllPoints()
			prev_np_raidmark:SetPoint(LolzenUIcfg.nameplates.general["np_raidmark_anchor"], prev_np, LolzenUIcfg.nameplates.general["np_raidmark_posx"], LolzenUIcfg.nameplates.general["np_raidmark_posy"])
			LolzenUI.setNPRaidMarkPos()
		end

		local header5 = ns.createHeader("nameplates", L["auras"])
		header5:SetPoint("TOPLEFT", rt_size_text, -4, -23)

		local header5BG = ns.createBackground("nameplates", 600, 130)
		header5BG:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", -4, -4)
		header5BG:SetFrameLevel(1)

		local aura_type_text = ns.createFontstring("nameplates", L["show"]..":")
		aura_type_text:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 4, -16)

		local aura_type = ns.createPicker("nameplates", "uf_auratype", "np_aura_type", 70, LolzenUIcfg.nameplates.general["np_aura_show_type"])
		aura_type:SetPoint("LEFT", aura_type_text, "RIGHT", -10, -3)
		aura_type.OnClick = function()
			LolzenUIcfg.nameplates.general["np_aura_show_type"] = ns.picker_uf_auratype[UIDropDownMenu_GetSelectedID(aura_type)]
			LolzenUI.setNPAuraType()
		end

		local aura_maxnum_text = ns.createFontstring("nameplates", L["show_max_0_to_40"]..":")
		aura_maxnum_text:SetPoint("LEFT", aura_type, "RIGHT", -5, 3)

		local aura_maxnum = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_aura_maxnum"])
		aura_maxnum:SetPoint("LEFT", aura_maxnum_text, "RIGHT", 10, 0)

		aura_maxnum:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_maxnum:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_aura_maxnum"] = tonumber(aura_maxnum:GetText())
			self.oldText = self:GetText()
			LolzenUI.setNPAuraMaxNum()
		end)

		aura_maxnum:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_maxnum:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_spacing_text = ns.createFontstring("nameplates", L["spacing"]..":")
		aura_spacing_text:SetPoint("LEFT", aura_maxnum, "RIGHT", 10, 0)

		local aura_spacing = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_aura_spacing"])
		aura_spacing:SetPoint("LEFT", aura_spacing_text, "RIGHT", 10, 0)

		aura_spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_spacing:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_aura_spacing"] = tonumber(aura_spacing:GetText())
			self.oldText = self:GetText()
			LolzenUI.setNPAuraSpacing()
		end)

		aura_spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_size_text = ns.createFontstring("nameplates", L["size"]..":")
		aura_size_text:SetPoint("LEFT", aura_spacing, "RIGHT", 10, 0)

		local aura_size = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_aura_size"])
		aura_size:SetPoint("LEFT", aura_size_text, "RIGHT", 10, 0)

		aura_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_aura_size"] = tonumber(aura_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.setNPAuraSize()
		end)

		aura_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_pos_x_text = ns.createFontstring("nameplates", L["PosX"]..":")
		aura_pos_x_text:SetPoint("TOPLEFT", aura_type_text, "BOTTOMLEFT", 0, -15)

		local aura_pos_x = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_aura_posx"])
		aura_pos_x:SetPoint("LEFT", aura_pos_x_text, "RIGHT", 10, 0)

		aura_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_aura_posx"] = tonumber(aura_pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.setNPAuraPos()
		end)

		aura_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_pos_y_text = ns.createFontstring("nameplates", L["PosY"]..":")
		aura_pos_y_text:SetPoint("LEFT", aura_pos_x, "RIGHT", 5, 0)

		local aura_pos_y = ns.createInputbox("nameplates", 30, 20, LolzenUIcfg.nameplates.general["np_aura_posy"])
		aura_pos_y:SetPoint("LEFT", aura_pos_y_text, "RIGHT", 10, 0)

		aura_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		aura_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.general["np_aura_posy"] = tonumber(aura_pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.setNPAuraPos()
		end)

		aura_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		aura_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local aura_anchor_text = ns.createFontstring("nameplates", L["anchor"].."1:")
		aura_anchor_text:SetPoint("LEFT", aura_pos_y, "RIGHT", 5, 0)

		local aura_anchor = ns.createPicker("nameplates", "anchor", "np_aura_anchor", 90, LolzenUIcfg.nameplates.general["np_aura_anchor1"])
		aura_anchor:SetPoint("LEFT", aura_anchor_text, "RIGHT", -10, -3)
		aura_anchor.OnClick = function()
			LolzenUIcfg.nameplates.general["np_aura_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor)]
			LolzenUI.setNPAuraPos()
		end

		local aura_anchor2_text = ns.createFontstring("nameplates", L["anchor"].."2:")
		aura_anchor2_text:SetPoint("LEFT", aura_anchor, "RIGHT", -10, 3)

		local aura_anchor2 = ns.createPicker("nameplates", "anchor", "np_aura_anchor2", 90, LolzenUIcfg.nameplates.general["np_aura_anchor2"])
		aura_anchor2:SetPoint("LEFT", aura_anchor2_text, "RIGHT", -10, -3)
		aura_anchor2.OnClick = function()
			LolzenUIcfg.nameplates.general["np_aura_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(aura_anchor2)]
			LolzenUI.setNPAuraPos()
		end

		local aura_growthx_text = ns.createFontstring("nameplates", L["growth_x"]..":")
		aura_growthx_text:SetPoint("TOPLEFT", aura_pos_x_text, "BOTTOMLEFT", 0, -15)

		local aura_growthx = ns.createPicker("nameplates", "uf_auragrowth_x", "np_aura_growthx", 70, LolzenUIcfg.nameplates.general["np_aura_growth_x"])
		aura_growthx:SetPoint("LEFT", aura_growthx_text, "RIGHT", -10, -3)
		aura_growthx.OnClick = function()
			LolzenUIcfg.nameplates.general["np_aura_growth_x"] = ns.picker_uf_auragrowth_x[UIDropDownMenu_GetSelectedID(aura_growthx)]
			LolzenUI.setNPAuraAxis()
		end

		local aura_growthy_text = ns.createFontstring("nameplates", L["growth_y"]..":")
		aura_growthy_text:SetPoint("LEFT", aura_growthx, "RIGHT", -5, 3)

		local aura_growthy = ns.createPicker("nameplates", "uf_auragrowth_y", "np_aura_growthy", 70, LolzenUIcfg.nameplates.general["np_aura_growth_y"])
		aura_growthy:SetPoint("LEFT", aura_growthy_text, "RIGHT", -10, -3)
		aura_growthy.OnClick = function()
			LolzenUIcfg.nameplates.general["np_aura_growth_y"] = ns.picker_uf_auragrowth_y[UIDropDownMenu_GetSelectedID(aura_growthy)]
			LolzenUI.setNPAuraAxis()
		end

		local cb5 = ns.createCheckBox("nameplates", "np_show_only_player_auras", "|cff5599ff"..L["show_only_player_auras"].."|r", LolzenUIcfg.nameplates.general["np_aura_show_only_player"])
		cb5:SetPoint("TOPLEFT", aura_growthx_text, "BOTTOMLEFT", -4, -8)

		local cb6 = ns.createCheckBox("nameplates", "np_desature_nonplayer_auras", "|cff5599ff"..L["desature_auras_not_by_player"].."|r", LolzenUIcfg.nameplates.general["np_aura_desature_nonplayer_auras"])
		cb6:SetPoint("TOPLEFT", cb5, "BOTTOMLEFT", 0, 0)

		cb5:SetScript("OnClick", function(self)
			LolzenUIcfg.nameplates.general["np_aura_show_only_player"] = cb5:GetChecked()
			if cb5:GetChecked() == true then
				cb6:Hide()
			else
				cb6:Show()
			end
			LolzenUI.setNPAuraShowOnlyPlayer()
		end)

		if cb5:GetChecked() == true then
			cb6:Hide()
		else
			cb6:Show()
		end

		cb6:SetScript("OnClick", function(self)
			LolzenUIcfg.nameplates.general["np_aura_desature_nonplayer_auras"] = cb6:GetChecked()
			LolzenUI.setNPAuraDesatured()
		end)

		ns["nameplates"].default = function(self)
			LolzenUIcfg.nameplates.general = _G["LolzenUIdefaultcfg"].nameplates.general
			ReloadUI()
		end
	end
end)