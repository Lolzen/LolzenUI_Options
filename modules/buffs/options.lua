--// options for buffs //--

local _, ns = ...
local LSM = LibStub("LibSharedMedia-3.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["buffs"] == true then

		local title = ns.createTitle("buffs")

		local about = ns.createDescription("buffs", "Skins the buffs/debuffs along with a more detailed timer")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

		local header1 = ns.createHeader("buffs", "Preview:")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local button = ns.createButtonTexture("buffs", LolzenUIcfg.buffs["buff_size"], select(3, GetSpellInfo(546)))
		button:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local bufftex = ns.createButtonOverlay("buffs", button, LolzenUIcfg.buffs["buff_aura_texture"])
		bufftex:SetVertexColor(0, 0, 0)

		local buttondur = ns.createFontstring("buffs", "TEXT")
		buttondur:SetPoint(LolzenUIcfg.buffs["buff_duration_anchor1"], button, LolzenUIcfg.buffs["buff_duration_anchor2"], LolzenUIcfg.buffs["buff_duration_posx"], LolzenUIcfg.buffs["buff_duration_posy"])
		buttondur:SetFont(LSM:Fetch("font", LolzenUIcfg.buffs["buff_duration_font"]), LolzenUIcfg.buffs["buff_duration_font_size"], LolzenUIcfg.buffs["buff_duration_font_flag"])
		if LolzenUIcfg.buffs["buff_duration_detailed"] == true then
			buttondur:SetText("7:46")
		else
			buttondur:SetText("|c2200ff2m|r")
		end
		buttondur:SetDrawLayer("OVERLAY")

		local buttoncount = ns.createFontstring("buffs", "2")
		buttoncount:SetPoint(LolzenUIcfg.buffs["buff_counter_anchor"], button, LolzenUIcfg.buffs["buff_counter_posx"], LolzenUIcfg.buffs["buff_counter_posy"])
		buttoncount:SetFont(LSM:Fetch("font", LolzenUIcfg.buffs["buff_counter_font"]), LolzenUIcfg.buffs["buff_counter_size"], LolzenUIcfg.buffs["buff_counter_font_flag"])
		buttoncount:SetDrawLayer("OVERLAY")

		local button2 = ns.createButtonTexture("buffs", LolzenUIcfg.buffs["buff_debuff_size"], select(3, GetSpellInfo(192423)))
		button2:SetPoint("LEFT", button, "RIGHT", 5, 0)
		
		local debufftex = ns.createButtonOverlay("buffs", button2, LolzenUIcfg.buffs["buff_debuff_texture"])
		debufftex:SetVertexColor(1, 0, 0)

--		local button3 = ns.createButtonTexture("buffs", LolzenUIcfg.buffs["buff_tempenchant_size"], select(3, GetSpellInfo(53343)))
--		button3:SetPoint("LEFT", button2, "RIGHT", 5, 0)

--		local tempenchtex = ns.createButtonOverlay("buffs", button3, LolzenUIcfg.buffs["buff_aura_texture"])
--		tempenchtex:SetVertexColor(0, 0, 0)

		local header2 = ns.createHeader("buffs", "Buffs:")
		header2:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, -30)

		local buff_size_text = ns.createFontstring("buffs", "Buff size:")
		buff_size_text:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		local buff_size = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_size"])
		buff_size:SetPoint("LEFT", buff_size_text, "RIGHT", 10, 0)

		local debuff_size_text = ns.createFontstring("buffs", "Debuff size:")
		debuff_size_text:SetPoint("LEFT", buff_size, "RIGHT", 5, 0)

		local debuff_size = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_debuff_size"])
		debuff_size:SetPoint("LEFT", debuff_size_text, "RIGHT", 10, 0)

		local tempenchant_size_text = ns.createFontstring("buffs", "Tempenchant size:")
		tempenchant_size_text:SetPoint("LEFT", debuff_size, "RIGHT", 5, 0)

		local tempenchant_size = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_tempenchant_size"])
		tempenchant_size:SetPoint("LEFT", tempenchant_size_text, "RIGHT", 10, 0)

		local pos_x_text = ns.createFontstring("buffs", "PosX:")
		pos_x_text:SetPoint("TOPLEFT", buff_size_text, "BOTTOMLEFT", 0, -15)

		local pos_x = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_posx"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		local pos_y_text = ns.createFontstring("buffs", "PosY:")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_posy"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		local anchor_text = ns.createFontstring("buffs", "Anchor1:")
		anchor_text:SetPoint("LEFT", pos_y, "RIGHT", 5, 0)

		local anchor = ns.createPicker("buffs", "anchor", "buffs_anchor1_picker", 80, LolzenUIcfg.buffs["buff_anchor1"])
		anchor:SetPoint("LEFT", anchor_text, "RIGHT", -10, -3)

		local parent_text = ns.createFontstring("buffs", "Parent:")
		parent_text:SetPoint("LEFT", anchor, "RIGHT", -5, 3)

		local parent = ns.createInputbox("buffs", 80, 20, LolzenUIcfg.buffs["buff_parent"])
		parent:SetPoint("LEFT", parent_text, "RIGHT", 10, 0)

		local anchor2_text = ns.createFontstring("buffs", "Anchor2:")
		anchor2_text:SetPoint("LEFT", parent, "RIGHT", 5, 0)

		local anchor2 = ns.createPicker("buffs", "anchor", "buffs_anchor2_picker", 80, LolzenUIcfg.buffs["buff_anchor2"])
		anchor2:SetPoint("LEFT", anchor2_text, "RIGHT", -10, -3)

		local bufftex_path_text = ns.createFontstring("buffs", "|cff5599ffbuff/tempenchant texture:|r Interface/AddOns/LolzenUI/media/")
		bufftex_path_text:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -15)

		local bufftex_path = ns.createInputbox("buffs", 80, 20, LolzenUIcfg.buffs["buff_aura_texture"])
		bufftex_path:SetPoint("LEFT", bufftex_path_text, "RIGHT", 10, 0)

		local debufftex_path_text = ns.createFontstring("buffs", "|cff5599ffdebuff texture:|r Interface/AddOns/LolzenUI/media/")
		debufftex_path_text:SetPoint("TOPLEFT", bufftex_path_text, "BOTTOMLEFT", 0, -15)

		local debufftex_path = ns.createInputbox("buffs", 80, 20, LolzenUIcfg.buffs["buff_debuff_texture"])
		debufftex_path:SetPoint("LEFT", debufftex_path_text, "RIGHT", 10, 0)

		local header3 = ns.createHeader("buffs", "Duration text:")
		header3:SetPoint("TOPLEFT", debufftex_path_text, "BOTTOMLEFT", 0, -30)

		local dur_pos_x_text = ns.createFontstring("buffs", "PosX:")
		dur_pos_x_text:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, -8)

		local dur_pos_x = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_duration_posx"])
		dur_pos_x:SetPoint("LEFT", dur_pos_x_text, "RIGHT", 10, 0)

		local dur_pos_y_text = ns.createFontstring("buffs", "PosY:")
		dur_pos_y_text:SetPoint("LEFT", dur_pos_x, "RIGHT", 5, 0)

		local dur_pos_y = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_duration_posy"])
		dur_pos_y:SetPoint("LEFT", dur_pos_y_text, "RIGHT", 10, 0)

		local dur_anchor_text = ns.createFontstring("buffs", "Anchor1:")
		dur_anchor_text:SetPoint("LEFT", dur_pos_y, "RIGHT", 5, 0)

		local dur_anchor = ns.createPicker("buffs", "anchor", "buffs_dur_anchor1_picker", 100, LolzenUIcfg.buffs["buff_duration_anchor1"])
		dur_anchor:SetPoint("LEFT", dur_anchor_text, "RIGHT", -10, -3)

		local dur_anchor2_text = ns.createFontstring("buffs", "Anchor2:")
		dur_anchor2_text:SetPoint("LEFT", dur_anchor, "RIGHT", -5, 3)

		local dur_anchor2 = ns.createPicker("buffs", "anchor", "buffs_dur_anchor2_picker", 100, LolzenUIcfg.buffs["buff_duration_anchor2"])
		dur_anchor2:SetPoint("LEFT", dur_anchor2_text, "RIGHT", -10, -3)

		local dur_font_text = ns.createFontstring("buffs", "Font:")
		dur_font_text:SetPoint("TOPLEFT", dur_pos_x_text, "BOTTOMLEFT", 0, -15)

		local dur_font = ns.createPicker("buffs", "font", "buffs_dur_font_picker", 100, LolzenUIcfg.buffs["buff_duration_font"])
		dur_font:SetPoint("LEFT", dur_font_text, "RIGHT", -10, -3)

		local dur_font_size_text = ns.createFontstring("buffs", "Size:")
		dur_font_size_text:SetPoint("LEFT", dur_font, "RIGHT", -5, 3)

		local dur_font_size = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_duration_font_size"])
		dur_font_size:SetPoint("LEFT", dur_font_size_text, "RIGHT", 10, 0)

		local dur_font_flag_text = ns.createFontstring("buffs", "Flag:")
		dur_font_flag_text:SetPoint("LEFT", dur_font_size, "RIGHT", 5, 0)

		local dur_font_flag = ns.createPicker("buffs", "flag", "buffs_dur_font_flag_picker", 100, LolzenUIcfg.buffs["buff_duration_font_flag"])
		dur_font_flag:SetPoint("LEFT", dur_font_flag_text, "RIGHT", -10, -3)

		local cb1 = ns.createCheckBox("buffs", "detailedduration", "|cff5599ffmore detailed duration text (uses more cpu cycles)|r", LolzenUIcfg.buffs["buff_duration_detailed"])
		cb1:SetPoint("TOPLEFT", dur_font_text, "BOTTOMLEFT", 0, -8)

		local header4 = ns.createHeader("buffs", "Counter text:")
		header4:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -30)

		local count_pos_x_text = ns.createFontstring("buffs", "PosX:")
		count_pos_x_text:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, -8)

		local count_pos_x = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_counter_posx"])
		count_pos_x:SetPoint("LEFT", count_pos_x_text, "RIGHT", 10, 0)

		local count_pos_y_text = ns.createFontstring("buffs", "PosY:")
		count_pos_y_text:SetPoint("LEFT", count_pos_x, "RIGHT", 5, 0)

		local count_pos_y = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_counter_posy"])
		count_pos_y:SetPoint("LEFT", count_pos_y_text, "RIGHT", 10, 0)

		local count_anchor_text = ns.createFontstring("buffs", "Anchor:")
		count_anchor_text:SetPoint("LEFT", count_pos_y, "RIGHT", 5, 0)

		local count_anchor = ns.createPicker("buffs", "anchor", "buffs_count_anchor_picker", 100, LolzenUIcfg.buffs["buff_counter_anchor"])
		count_anchor:SetPoint("LEFT", count_anchor_text, "RIGHT", -10, -3)

		local count_font_text = ns.createFontstring("buffs", "Font:")
		count_font_text:SetPoint("TOPLEFT", count_pos_x_text, "BOTTOMLEFT", 0, -15)

		local count_font = ns.createPicker("buffs", "font", "count_font_picker", 120, LolzenUIcfg.buffs["buff_counter_font"])
		count_font:SetPoint("LEFT", count_font_text, "RIGHT", -10, -3)

		local count_font_size_text = ns.createFontstring("buffs", "Size:")
		count_font_size_text:SetPoint("LEFT", count_font, "RIGHT", -5, 3)

		local count_font_size = ns.createInputbox("buffs", 30, 20, LolzenUIcfg.buffs["buff_counter_size"])
		count_font_size:SetPoint("LEFT", count_font_size_text, "RIGHT", 10, 0)

		local count_font_flag_text = ns.createFontstring("buffs", "Flag:")
		count_font_flag_text:SetPoint("LEFT", count_font_size, "RIGHT", 5, 0)

		local count_font_flag = ns.createPicker("buffs", "flag", "buffs_count_font_flag_picker", 100, LolzenUIcfg.buffs["buff_counter_font_flag"])
		count_font_flag:SetPoint("LEFT", count_font_flag_text, "RIGHT", -10, -3)

		ns["buffs"].okay = function(self)
			LolzenUIcfg.buffs["buff_size"] = tonumber(buff_size:GetText())
			LolzenUIcfg.buffs["buff_debuff_size"] = tonumber(debuff_size:GetText())
			LolzenUIcfg.buffs["buff_tempenchant_size"] = tonumber(tempenchant_size:GetText())
			LolzenUIcfg.buffs["buff_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor)]
			LolzenUIcfg.buffs["buff_parent"] = parent:GetText()
			LolzenUIcfg.buffs["buff_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(anchor2)]
			LolzenUIcfg.buffs["buff_posx"] = tonumber(pos_x:GetText())
			LolzenUIcfg.buffs["buff_posy"] = tonumber(pos_y:GetText())
			LolzenUIcfg.buffs["buff_duration_anchor1"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(dur_anchor)]
			LolzenUIcfg.buffs["buff_duration_anchor2"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(dur_anchor2)]
			LolzenUIcfg.buffs["buff_duration_posx"] = tonumber(dur_pos_x:GetText())
			LolzenUIcfg.buffs["buff_duration_posy"] = tonumber(dur_pos_y:GetText())
			LolzenUIcfg.buffs["buff_duration_detailed"] = cb1:GetChecked()
			LolzenUIcfg.buffs["buff_duration_font"] = UIDropDownMenu_GetSelectedName(dur_font)
			LolzenUIcfg.buffs["buff_duration_font_size"] = tonumber(dur_font_size:GetText())
			LolzenUIcfg.buffs["buff_duration_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(dur_font_flag)]
			LolzenUIcfg.buffs["buff_counter_anchor"] = ns.picker_anchor[UIDropDownMenu_GetSelectedID(count_anchor)]
			LolzenUIcfg.buffs["buff_counter_posx"] = tonumber(count_pos_x:GetText())
			LolzenUIcfg.buffs["buff_counter_posy"] = tonumber(count_pos_y:GetText())
			LolzenUIcfg.buffs["buff_counter_font"] = UIDropDownMenu_GetSelectedName(count_font)
			LolzenUIcfg.buffs["buff_counter_size"] = tonumber(count_font_size:GetText())
			LolzenUIcfg.buffs["buff_counter_font_flag"] = ns.picker_flags[UIDropDownMenu_GetSelectedID(count_font_flag)]
			LolzenUIcfg.buffs["buff_aura_texture"] = bufftex_path:GetText()
			LolzenUIcfg.buffs["buff_debuff_texture"] = debufftex_path:GetText()
		end

		ns["buffs"].default = function(self)
			LolzenUIcfg.buffs["buff_size"] = 30
			LolzenUIcfg.buffs["buff_debuff_size"] = 30
			LolzenUIcfg.buffs["buff_tempenchant_size"] = 30
			LolzenUIcfg.buffs["buff_anchor1"] = "TOPRIGHT"
			LolzenUIcfg.buffs["buff_parent"] = "Minimap"
			LolzenUIcfg.buffs["buff_anchor2"] = "TOPLEFT"
			LolzenUIcfg.buffs["buff_posx"] = -15
			LolzenUIcfg.buffs["buff_posy"] = 2
			LolzenUIcfg.buffs["buff_duration_anchor1"] = "CENTER"
			LolzenUIcfg.buffs["buff_duration_anchor2"] = "BOTTOM"
			LolzenUIcfg.buffs["buff_duration_posx"] = 0
			LolzenUIcfg.buffs["buff_duration_posy"] = 3
			LolzenUIcfg.buffs["buff_duration_detailed"] = true
			LolzenUIcfg.buffs["buff_duration_font"] = "DroidSans"
			LolzenUIcfg.buffs["buff_duration_font_size"] = 11
			LolzenUIcfg.buffs["buff_duration_font_flag"] = "OUTLINE"
			LolzenUIcfg.buffs["buff_counter_anchor"] = "TOPRIGHT"
			LolzenUIcfg.buffs["buff_counter_posx"] = 0
			LolzenUIcfg.buffs["buff_counter_posy"] = 0
			LolzenUIcfg.buffs["buff_counter_font"] = "DroidSans"
			LolzenUIcfg.buffs["buff_counter_size"] = 16
			LolzenUIcfg.buffs["buff_counter_font_flag"] = "OUTLINE"
			LolzenUIcfg.buffs["buff_aura_texture"] = "auraborder"
			LolzenUIcfg.buffs["buff_debuff_texture"] = "debuffborder"
			ReloadUI()
		end
	end
end)