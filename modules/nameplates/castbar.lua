local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L
local LSM = LibStub("LibSharedMedia-3.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["nameplates"] == true then

		-- // Create a subcategory panel for Castbar // --
		ns.np_castbar_options = CreateFrame("Frame", "nameplates_castbarpanel", ns["nameplates"])
		ns.np_castbar_options.name = "   "..L["sub_panel_nameplates_castbar"]
		ns.np_castbar_options.parent = LUI["nameplates"]
		InterfaceOptions_AddCategory(ns.np_castbar_options)

		local cb_title = ns.createTitle("np_castbar_options", L["sub_panel_nameplates_title"])

		local cb_header1 = ns.createHeader("np_castbar_options", L["Preview"]..":")
		cb_header1:SetPoint("TOPLEFT", cb_title, "BOTTOMLEFT", 0, -40)

		local cb_prev_np_frame = CreateFrame("Frame", nil, ns["np_castbar_options"])
		cb_prev_np_frame:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		cb_prev_np_frame:SetPoint("TOPLEFT", cb_header1, "BOTTOMLEFT", 20, -10)

		ns.setNPCBPrevSize = function()
			cb_prev_np_frame:SetSize(LolzenUIcfg.nameplates.general["np_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		end

		local cb_prev_np = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np:SetAllPoints(cb_prev_np_frame)
		cb_prev_np:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates.general["np_texture"]))
		cb_prev_np:SetVertexColor(0.6, 0.1, 0)

		ns.setNPCBTexture = function()
			cb_prev_np:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates.general["np_texture"]))
		end

		local cb_prev_np_lvlname = cb_prev_np_frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
		cb_prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
		cb_prev_np_lvlname:SetText("|cffffff00110|r + Random Name")
		cb_prev_np_lvlname:SetPoint("CENTER", cb_prev_np_frame, 0, 3)

		ns.setNPCBLvlNameFont = function()
			cb_prev_np_lvlname:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.general["np_lvlname_font"]), LolzenUIcfg.nameplates.general["np_lvlname_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.general["np_lvlname_font_flag"])
		end

		local cb_prev_np_cb = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np_cb:SetSize(LolzenUIcfg.nameplates.castbar["np_cb_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cb_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		cb_prev_np_cb:SetPoint(LolzenUIcfg.nameplates.castbar["np_cb_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cb_anchor2"], LolzenUIcfg.nameplates.castbar["np_cb_posx"], LolzenUIcfg.nameplates.castbar["np_cb_posy"])
		cb_prev_np_cb:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates.castbar["np_cb_texture"]))

		ns.setNPCB = function()
			cb_prev_np_cb:SetSize(LolzenUIcfg.nameplates.castbar["np_cb_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cb_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		end

		local cb_prev_np_spark = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np_spark:SetSize(LolzenUIcfg.nameplates.castbar["np_spark_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_spark_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		cb_prev_np_spark:SetPoint("RIGHT", cb_prev_np_cb, "RIGHT", LolzenUIcfg.nameplates.castbar["np_spark_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"]/2, 0)
		cb_prev_np_spark:SetBlendMode("ADD")
		cb_prev_np_spark:SetTexture('Interface\\CastingBar\\UI-CastingBar-Spark')

		ns.setNPCBSpark = function()
			cb_prev_np_spark:SetSize(LolzenUIcfg.nameplates.castbar["np_spark_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_spark_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			cb_prev_np_spark:SetPoint("RIGHT", cb_prev_np_cb, "RIGHT", LolzenUIcfg.nameplates.castbar["np_spark_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"]/2, 0)
		end

		local cb_prev_np_icon = ns.createButtonTexture("np_castbar_options", LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], GetSpellTexture(214815), nil)
		cb_prev_np_icon:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbicon_posx"], LolzenUIcfg.nameplates.castbar["np_cbicon_posy"])

		ns.setNPCBIcon = function()
			cb_prev_np_icon:SetSize(LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		end

		local cb_prev_np_shield = cb_prev_np_frame:CreateTexture(nil, "BACKGROUND")
		cb_prev_np_shield:SetSize(LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*3*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*3*LolzenUIcfg.nameplates.general["np_selected_scale"])
		cb_prev_np_shield:SetTexture("Interface\\AddOns\\LolzenUI\\media\\shield")
		cb_prev_np_shield:SetPoint("CENTER", cb_prev_np_icon, 0, 0)

		ns.setNPCBShield = function()
			cb_prev_np_shield:SetSize(LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*3*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*3*LolzenUIcfg.nameplates.general["np_selected_scale"])
		end

		local cb_prev_np_time = ns.createFontstring("np_castbar_options", "3.0")
		cb_prev_np_time:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtime_font"]), LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"])
		cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtime_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtime_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])

		ns.setNPCBTime = function()
			cb_prev_np_time:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtime_font"]), LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"])
			cb_prev_np_time:ClearAllPoints()
			cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtime_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtime_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		end

		local cb_prev_np_text = ns.createFontstring("np_castbar_options", "Random Castname")
		cb_prev_np_text:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtext_font"]), LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"])
		cb_prev_np_text:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtext_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtext_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])

		ns.setNPCBText = function()
			cb_prev_np_text:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtext_font"]), LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"])
			cb_prev_np_text:ClearAllPoints()
			cb_prev_np_text:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtext_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtext_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
		end

		local cb_pos_x_text = ns.createFontstring("np_castbar_options", L["PosX"]..":")
		cb_pos_x_text:SetPoint("TOPLEFT", cb_prev_np_frame, "BOTTOMLEFT", -20, -30)

		local cb_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cb_posx"])
		cb_pos_x:SetPoint("LEFT", cb_pos_x_text, "RIGHT", 10, 0)

		cb_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cb_posx"] = tonumber(cb_pos_x:GetText())
			self.oldText = self:GetText()
			cb_prev_np_cb:SetPoint(LolzenUIcfg.nameplates.castbar["np_cb_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cb_anchor2"], LolzenUIcfg.nameplates.castbar["np_cb_posx"], LolzenUIcfg.nameplates.castbar["np_cb_posy"])
			LolzenUI.setNP_CBPos()
		end)

		cb_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_pos_y_text = ns.createFontstring("np_castbar_options", L["PosY"]..":")
		cb_pos_y_text:SetPoint("LEFT", cb_pos_x, "RIGHT", 10, 0)

		local cb_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cb_posy"])
		cb_pos_y:SetPoint("LEFT", cb_pos_y_text, "RIGHT", 10, 0)

		cb_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cb_posy"] = tonumber(cb_pos_y:GetText())
			self.oldText = self:GetText()
			cb_prev_np_cb:SetPoint(LolzenUIcfg.nameplates.castbar["np_cb_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cb_anchor2"], LolzenUIcfg.nameplates.castbar["np_cb_posx"], LolzenUIcfg.nameplates.castbar["np_cb_posy"])
			LolzenUI.setNP_CBPos()
		end)

		cb_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_anchor_text = ns.createFontstring("np_castbar_options", L["anchor"].."1:")
		cb_anchor_text:SetPoint("LEFT", cb_pos_y, "RIGHT", 10, 0)

		local cb_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_anchor_bar1", 110, LolzenUIcfg.nameplates.castbar["np_cb_anchor"])
		cb_anchor:SetPoint("LEFT", cb_anchor_text, "RIGHT", -10, -3)
		cb_anchor.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cb_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_anchor)]
			cb_prev_np_cb:ClearAllPoints()
			cb_prev_np_cb:SetPoint(LolzenUIcfg.nameplates.castbar["np_cb_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cb_anchor2"], LolzenUIcfg.nameplates.castbar["np_cb_posx"], LolzenUIcfg.nameplates.castbar["np_cb_posy"])
			LolzenUI.setNP_CBPos()
		end

		local cb_anchor_text2 = ns.createFontstring("np_castbar_options", L["anchor"].."2:")
		cb_anchor_text2:SetPoint("LEFT", cb_anchor, "RIGHT", -5, 3)

		local cb_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_anchor_bar2", 110, LolzenUIcfg.nameplates.castbar["np_cb_anchor2"])
		cb_anchor2:SetPoint("LEFT", cb_anchor_text2, "RIGHT", -10, -3)
		cb_anchor2.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cb_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_anchor2)]
			cb_prev_np_cb:ClearAllPoints()
			cb_prev_np_cb:SetPoint(LolzenUIcfg.nameplates.castbar["np_cb_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cb_anchor2"], LolzenUIcfg.nameplates.castbar["np_cb_posx"], LolzenUIcfg.nameplates.castbar["np_cb_posy"])
			LolzenUI.setNP_CBPos()
		end

		local cb_texture_text = ns.createFontstring("np_castbar_options", L["texture"]..":")
		cb_texture_text:SetPoint("TOPLEFT", cb_pos_x_text, "BOTTOMLEFT", 0, -15)

		local cb_texture = ns.createPicker("np_castbar_options", "statusbar", "np_cb_statusbar", 120, LolzenUIcfg.nameplates.castbar["np_cb_texture"])
		cb_texture:SetPoint("LEFT", cb_texture_text, "RIGHT", -10, -3)
		cb_texture.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cb_texture"] = UIDropDownMenu_GetSelectedName(cb_texture)
			cb_prev_np_cb:SetTexture(LSM:Fetch("statusbar", LolzenUIcfg.nameplates.castbar["np_cb_texture"]))
			LolzenUI.setNP_CBTexture()
		end

		local cb_height_text = ns.createFontstring("np_castbar_options", L["height"]..":")
		cb_height_text:SetPoint("LEFT", cb_texture, "RIGHT", -5, 3)

		local cb_height = ns.createInputbox("np_castbar_options", 40, 20, LolzenUIcfg.nameplates.castbar["np_cb_height"])
		cb_height:SetPoint("LEFT", cb_height_text, "RIGHT", 10, 0)

		cb_height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cb_height"] = tonumber(cb_height:GetText())
			self.oldText = self:GetText()
			cb_prev_np_cb:SetSize(LolzenUIcfg.nameplates.castbar["np_cb_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cb_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBSize()
		end)

		cb_height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_width_text = ns.createFontstring("np_castbar_options", L["width"]..":")
		cb_width_text:SetPoint("LEFT", cb_height, "RIGHT", 10, 0)

		local cb_width = ns.createInputbox("np_castbar_options", 40, 20, LolzenUIcfg.nameplates.castbar["np_cb_width"])
		cb_width:SetPoint("LEFT", cb_width_text, "RIGHT", 10, 0)

		cb_width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cb_width"] = tonumber(cb_width:GetText())
			self.oldText = self:GetText()
			cb_prev_np_cb:SetSize(LolzenUIcfg.nameplates.castbar["np_cb_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cb_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBSize()
		end)

		cb_width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_header2 = ns.createHeader("np_castbar_options", L["sub_panel_nameplates_spark_header"])
		cb_header2:SetPoint("TOPLEFT", cb_texture_text, "BOTTOMLEFT", 0, -30)

		local cb_spark_height_text = ns.createFontstring("np_castbar_options", L["height"]..":")
		cb_spark_height_text:SetPoint("TOPLEFT", cb_header2, "BOTTOMLEFT", 0, -10)

		local cb_spark_height = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_spark_height"])
		cb_spark_height:SetPoint("LEFT", cb_spark_height_text, "RIGHT", 10, 0)

		cb_spark_height:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_spark_height:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_spark_height"] = tonumber(cb_spark_height:GetText())
			self.oldText = self:GetText()
			cb_prev_np_spark:SetSize(LolzenUIcfg.nameplates.castbar["np_spark_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_spark_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBSparkSize()
		end)

		cb_spark_height:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_spark_height:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_spark_width_text = ns.createFontstring("np_castbar_options", L["width"]..":")
		cb_spark_width_text:SetPoint("LEFT", cb_spark_height, "RIGHT", 10, 0)

		local cb_spark_width = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_spark_width"])
		cb_spark_width:SetPoint("LEFT", cb_spark_width_text, "RIGHT", 10, 0)

		cb_spark_width:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_spark_width:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_spark_width"] = tonumber(cb_spark_width:GetText())
			self.oldText = self:GetText()
			cb_prev_np_spark:SetSize(LolzenUIcfg.nameplates.castbar["np_spark_width"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_spark_height"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBSparkSize()
		end)

		cb_spark_width:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_spark_width:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_header3 = ns.createHeader("np_castbar_options", L["icon"])
		cb_header3:SetPoint("TOPLEFT", cb_spark_height_text, "BOTTOMLEFT", 0, -30)

		local cb_icon_size_text = ns.createFontstring("np_castbar_options", L["size"]..":")
		cb_icon_size_text:SetPoint("TOPLEFT", cb_header3, "BOTTOMLEFT", 0, -10)

		local cb_icon_size = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbicon_size"])
		cb_icon_size:SetPoint("LEFT", cb_icon_size_text, "RIGHT", 10, 0)

		cb_icon_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbicon_size"] = tonumber(cb_icon_size:GetText())
			self.oldText = self:GetText()
			cb_prev_np_icon:SetSize(LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			cb_prev_np_shield:SetSize(LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*3*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbicon_size"]*3*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBIconSize()
		end)

		cb_icon_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_x_text = ns.createFontstring("np_castbar_options", L["PosX"]..":")
		cb_icon_pos_x_text:SetPoint("LEFT", cb_icon_size, "RIGHT", 5, 0)

		local cb_icon_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbicon_posx"])
		cb_icon_pos_x:SetPoint("LEFT", cb_icon_pos_x_text, "RIGHT", 10, 0)

		cb_icon_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbicon_posx"] = tonumber(cb_icon_pos_x:GetText())
			self.oldText = self:GetText()
			cb_prev_np_icon:ClearAllPoints()
			cb_prev_np_icon:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbicon_posx"], LolzenUIcfg.nameplates.castbar["np_cbicon_posy"])
			LolzenUI.setNP_CBIconPos()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_pos_y_text = ns.createFontstring("np_castbar_options", L["PosY"]..":")
		cb_icon_pos_y_text:SetPoint("LEFT", cb_icon_pos_x, "RIGHT", 5, 0)

		local cb_icon_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbicon_posy"])
		cb_icon_pos_y:SetPoint("LEFT", cb_icon_pos_y_text, "RIGHT", 10, 0)

		cb_icon_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_icon_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbicon_posy"] = tonumber(cb_icon_pos_y:GetText())
			self.oldText = self:GetText()
			cb_prev_np_icon:ClearAllPoints()
			cb_prev_np_icon:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbicon_posx"], LolzenUIcfg.nameplates.castbar["np_cbicon_posy"])
			LolzenUI.setNP_CBIconPos()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_icon_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_icon_anchor_text = ns.createFontstring("np_castbar_options", L["anchor"].."1:")
		cb_icon_anchor_text:SetPoint("TOPLEFT", cb_icon_size_text, "BOTTOMLEFT", 0, -15)

		local cb_icon_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_icon_anchor1", 110, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"])
		cb_icon_anchor:SetPoint("LEFT", cb_icon_anchor_text, "RIGHT", -10, -3)
		cb_icon_anchor.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor)]
			cb_prev_np_icon:ClearAllPoints()
			cb_prev_np_icon:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbicon_posx"], LolzenUIcfg.nameplates.castbar["np_cbicon_posy"])
			LolzenUI.setNP_CBIconPos()
		end

		local cb_icon_anchor_text2 = ns.createFontstring("np_castbar_options", L["anchor"].."2:")
		cb_icon_anchor_text2:SetPoint("LEFT", cb_icon_anchor, "RIGHT", -5, 3)

		local cb_icon_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_icon_anchor2", 110, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"])
		cb_icon_anchor2:SetPoint("LEFT", cb_icon_anchor_text2, "RIGHT", -10, -3)
		cb_icon_anchor2.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_icon_anchor2)]
			cb_prev_np_icon:ClearAllPoints()
			cb_prev_np_icon:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbicon_anchor"], cb_prev_np_frame, LolzenUIcfg.nameplates.castbar["np_cbicon_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbicon_posx"], LolzenUIcfg.nameplates.castbar["np_cbicon_posy"])
			LolzenUI.setNP_CBIconPos()
		end

		local cb_header4 = ns.createHeader("np_castbar_options", L["time"])
		cb_header4:SetPoint("TOPLEFT", cb_icon_anchor_text, "BOTTOMLEFT", 0, -30)

		local cb_time_font_text = ns.createFontstring("np_castbar_options", L["font"]..":")
		cb_time_font_text:SetPoint("TOPLEFT", cb_header4, "BOTTOMLEFT", 0, -10)

		local cb_time_font = ns.createPicker("np_castbar_options", "font", "cb_time_font", 120, LolzenUIcfg.nameplates.castbar["np_cbtime_font"])
		cb_time_font:SetPoint("LEFT", cb_time_font_text, "RIGHT", -10, -3)
		cb_time_font.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtime_font"] = UIDropDownMenu_GetSelectedName(cb_time_font)
			cb_prev_np_time:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtime_font"]), LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"])
			LolzenUI.setNP_CBTimeFont()
		end

		local cb_time_font_size_text = ns.createFontstring("np_castbar_options", L["size"]..":")
		cb_time_font_size_text:SetPoint("LEFT", cb_time_font, "RIGHT", -10, 3)

		local cb_time_font_size = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"])
		cb_time_font_size:SetPoint("LEFT", cb_time_font_size_text, "RIGHT", 10, 0)

		cb_time_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"] = tonumber(cb_time_font_size:GetText())
			self.oldText = self:GetText()
			cb_prev_np_time:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtime_font"]), LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"])
			LolzenUI.setNP_CBTimeFont()
		end)

		cb_time_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_font_flag_text = ns.createFontstring("np_castbar_options", L["flag"]..":")
		cb_time_font_flag_text:SetPoint("LEFT", cb_time_font_size, "RIGHT", 10, 0)

		local cb_time_font_flag = ns.createPicker("np_castbar_options", "flag", "cb_time_font_flag", 120, LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"])
		cb_time_font_flag:SetPoint("LEFT", cb_time_font_flag_text, "RIGHT", -10, -3)
		cb_time_font_flag.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_time_font_flag)]
			cb_prev_np_time:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtime_font"]), LolzenUIcfg.nameplates.castbar["np_cbtime_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtime_font_flag"])
			LolzenUI.setNP_CBTimeFont()
		end

		local cb_time_pos_x_text = ns.createFontstring("np_castbar_options", L["PosX"]..":")
		cb_time_pos_x_text:SetPoint("TOPLEFT", cb_time_font_text, "BOTTOMLEFT", 0, -15)

		local cb_time_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbtime_posx"])
		cb_time_pos_x:SetPoint("LEFT", cb_time_pos_x_text, "RIGHT", 10, 0)

		cb_time_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbtime_posx"] = tonumber(cb_time_pos_x:GetText())
			self.oldText = self:GetText()
			cb_prev_np_time:ClearAllPoints()
			cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtime_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtime_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTimePos()
		end)

		cb_time_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_pos_y_text = ns.createFontstring("np_castbar_options", L["PosY"]..":")
		cb_time_pos_y_text:SetPoint("LEFT", cb_time_pos_x, "RIGHT", 5, 0)

		local cb_time_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbtime_posy"])
		cb_time_pos_y:SetPoint("LEFT", cb_time_pos_y_text, "RIGHT", 10, 0)

		cb_time_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_time_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbtime_posy"] = tonumber(cb_time_pos_y:GetText())
			self.oldText = self:GetText()
			cb_prev_np_time:ClearAllPoints()
			cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtime_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtime_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTimePos()
		end)

		cb_time_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_time_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_time_anchor_text = ns.createFontstring("np_castbar_options", L["anchor"].."1:")
		cb_time_anchor_text:SetPoint("LEFT", cb_time_pos_y, "RIGHT", 10, 0)

		local cb_time_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_time_anchor1", 110, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"])
		cb_time_anchor:SetPoint("LEFT", cb_time_anchor_text, "RIGHT", -10, -3)
		cb_time_anchor.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor)]
			cb_prev_np_time:ClearAllPoints()
			cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtime_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtime_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTimePos()
		end

		local cb_time_anchor_text2 = ns.createFontstring("np_castbar_options", L["anchor"].."2:")
		cb_time_anchor_text2:SetPoint("LEFT", cb_time_anchor, "RIGHT", -5, 3)

		local cb_time_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_time_anchor2", 110, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"])
		cb_time_anchor2:SetPoint("LEFT", cb_time_anchor_text2, "RIGHT", -10, -3)
		cb_time_anchor2.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_time_anchor2)]
			cb_prev_np_time:ClearAllPoints()
			cb_prev_np_time:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtime_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtime_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtime_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtime_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTimePos()
		end

		local cb_header5 = ns.createHeader("np_castbar_options", L["text"])
		cb_header5:SetPoint("TOPLEFT", cb_time_pos_x_text, "BOTTOMLEFT", 0, -30)

		local cb_text_font_text = ns.createFontstring("np_castbar_options", L["font"]..":")
		cb_text_font_text:SetPoint("TOPLEFT", cb_header5, "BOTTOMLEFT", 0, -10)

		local cb_text_font = ns.createPicker("np_castbar_options", "font", "cb_text_font", 120, LolzenUIcfg.nameplates.castbar["np_cbtext_font"])
		cb_text_font:SetPoint("LEFT", cb_text_font_text, "RIGHT", -10, -3)
		cb_text_font.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtext_font"] = UIDropDownMenu_GetSelectedName(cb_text_font)
			cb_prev_np_text:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtext_font"]), LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"])
			LolzenUI.setNP_CBTextFont()
		end

		local cb_text_font_size_text = ns.createFontstring("np_castbar_options", L["size"]..":")
		cb_text_font_size_text:SetPoint("LEFT", cb_text_font, "RIGHT", -10, 3)

		local cb_text_font_size = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"])
		cb_text_font_size:SetPoint("LEFT", cb_text_font_size_text, "RIGHT", 10, 0)

		cb_text_font_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_font_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"] = tonumber(cb_text_font_size:GetText())
			self.oldText = self:GetText()
			cb_prev_np_text:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtext_font"]), LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"])
			LolzenUI.setNP_CBTextFont()
		end)

		cb_text_font_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_font_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_font_flag_text = ns.createFontstring("np_castbar_options", L["flag"]..":")
		cb_text_font_flag_text:SetPoint("LEFT", cb_text_font_size, "RIGHT", 10, 0)

		local cb_text_font_flag = ns.createPicker("np_castbar_options", "flag", "cb_text_font_flag", 120, LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"])
		cb_text_font_flag:SetPoint("LEFT", cb_text_font_flag_text, "RIGHT", -10, -3)
		cb_text_font_flag.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(cb_text_font_flag)]
			cb_prev_np_text:SetFont(LSM:Fetch("font", LolzenUIcfg.nameplates.castbar["np_cbtext_font"]), LolzenUIcfg.nameplates.castbar["np_cbtext_font_size"]*LolzenUIcfg.nameplates.general["np_selected_scale"] , LolzenUIcfg.nameplates.castbar["np_cbtext_font_flag"])
			LolzenUI.setNP_CBTextFont()
		end

		local cb_text_pos_x_text = ns.createFontstring("np_castbar_options", L["PosX"]..":")
		cb_text_pos_x_text:SetPoint("TOPLEFT", cb_text_font_text, "BOTTOMLEFT", 0, -15)

		local cb_text_pos_x = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbtext_posx"])
		cb_text_pos_x:SetPoint("LEFT", cb_text_pos_x_text, "RIGHT", 10, 0)

		cb_text_pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbtext_posx"] = tonumber(cb_text_pos_x:GetText())
			self.oldText = self:GetText()
			cb_prev_np_text:ClearAllPoints()
			cb_prev_np_text:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtext_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtext_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTextPos()
		end)

		cb_text_pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_pos_y_text = ns.createFontstring("np_castbar_options", L["PosY"]..":")
		cb_text_pos_y_text:SetPoint("LEFT", cb_text_pos_x, "RIGHT", 5, 0)

		local cb_text_pos_y = ns.createInputbox("np_castbar_options", 30, 20, LolzenUIcfg.nameplates.castbar["np_cbtext_posy"])
		cb_text_pos_y:SetPoint("LEFT", cb_text_pos_y_text, "RIGHT", 10, 0)

		cb_text_pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		cb_text_pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.nameplates.castbar["np_cbtext_posy"] = tonumber(cb_text_pos_y:GetText())
			self.oldText = self:GetText()
			cb_prev_np_text:ClearAllPoints()
			cb_prev_np_text:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtext_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtext_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTextPos()
		end)

		cb_text_pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		cb_text_pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local cb_text_anchor_text = ns.createFontstring("np_castbar_options", L["anchor"].."1:")
		cb_text_anchor_text:SetPoint("LEFT", cb_text_pos_y, "RIGHT", 10, 0)

		local cb_text_anchor = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_text_anchor1", 110, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"])
		cb_text_anchor:SetPoint("LEFT", cb_text_anchor_text, "RIGHT", -10, -3)
		cb_text_anchor.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor)]
			cb_prev_np_text:ClearAllPoints()
			cb_prev_np_text:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtext_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtext_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTextPos()
		end

		local cb_text_anchor_text2 = ns.createFontstring("np_castbar_options", L["anchor"].."2:")
		cb_text_anchor_text2:SetPoint("LEFT", cb_text_anchor, "RIGHT", -5, 3)

		local cb_text_anchor2 = ns.createPicker("np_castbar_options", "anchor", "nameplates_castbar_text_anchor2", 110, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"])
		cb_text_anchor2:SetPoint("LEFT", cb_text_anchor_text2, "RIGHT", -10, -3)
		cb_text_anchor2.OnClick = function()
			LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(cb_text_anchor2)]
			cb_prev_np_text:ClearAllPoints()
			cb_prev_np_text:SetPoint(LolzenUIcfg.nameplates.castbar["np_cbtext_anchor"], cb_prev_np_cb, LolzenUIcfg.nameplates.castbar["np_cbtext_anchor2"], LolzenUIcfg.nameplates.castbar["np_cbtext_posx"]*LolzenUIcfg.nameplates.general["np_selected_scale"], LolzenUIcfg.nameplates.castbar["np_cbtext_posy"]*LolzenUIcfg.nameplates.general["np_selected_scale"])
			LolzenUI.setNP_CBTextPos()
		end

		ns["np_castbar_options"].default = function(self)
			LolzenUIcfg.nameplates.castbar = _G["LolzenUIdefaultcfg"].nameplates.castbar
			ReloadUI()
		end
	end
end)