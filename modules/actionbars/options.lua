--// options for actionbars //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L
local LBT = LibStub("LibButtonTexture-1.0")

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["actionbars"] == true then

		local title = ns.createTitle("actionbars")

		local about = ns.createDescription("actionbars", LUI["desc_actionbars"])

		local header1 = ns.createHeader("actionbars", L["Preview"]..":")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		-- // normaltexture buttonpreview // --

		local button = ns.createButtonTexture("actionbars", LolzenUIcfg.actionbar["actionbar_button_size"], GetSpellTexture(214815), nil)
		button:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, -8)

		local normaltex = ns.createButtonOverlay("actionbars", button, LBT:Fetch("border", LolzenUIcfg.actionbar["actionbar_normal_texture"]))

		-- // flashtexture buttonpreview // --

		local button2 = ns.createButtonTexture("actionbars", LolzenUIcfg.actionbar["actionbar_button_size"], GetSpellTexture(214815), nil)
		button2:SetPoint("LEFT", button, "RIGHT", LolzenUIcfg.actionbar["actionbar_button_spacing"], 0)

		local flashtex = ns.createButtonOverlay("actionbars", button2, LBT:Fetch("flashing", LolzenUIcfg.actionbar["actionbar_flash_texture"]))

		-- // checkedtexture buttonpreview // --

		local button3 = ns.createButtonTexture("actionbars", LolzenUIcfg.actionbar["actionbar_button_size"], GetSpellTexture(214815), nil)
		button3:SetPoint("LEFT", button2, "RIGHT", LolzenUIcfg.actionbar["actionbar_button_spacing"], 0)

		local checkedtex = ns.createButtonOverlay("actionbars", button3, LBT:Fetch("checked", LolzenUIcfg.actionbar["actionbar_checked_texture"]))

		-- // hovertexture buttonpreview // --

		local button4 = ns.createButtonTexture("actionbars", LolzenUIcfg.actionbar["actionbar_button_size"], GetSpellTexture(214815), nil)
		button4:SetPoint("LEFT", button3, "RIGHT", LolzenUIcfg.actionbar["actionbar_button_spacing"], 0)

		local hovertex = ns.createButtonOverlay("actionbars", button4, LBT:Fetch("hover", LolzenUIcfg.actionbar["actionbar_hover_texture"]))

		-- // pushedtexture buttonpreview // --

		local button5 = ns.createButtonTexture("actionbars", LolzenUIcfg.actionbar["actionbar_button_size"], GetSpellTexture(214815), nil)
		button5:SetPoint("LEFT", button4, "RIGHT", LolzenUIcfg.actionbar["actionbar_button_spacing"], 0)

		local pushedtex = ns.createButtonOverlay("actionbars", button5, LBT:Fetch("pushed", LolzenUIcfg.actionbar["actionbar_pushed_texture"]))

		local header2 = ns.createHeader("actionbars", L["ab_texture_and_size"])
		header2:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, -14)

		local cb1 = ns.createCheckBox("actionbars", "ab_show_keybinds", "|cff5599ff"..L["ab_keybinds"].."|r", LolzenUIcfg.actionbar["actionbar_show_keybinds"])
		cb1:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, -8)

		-- // texture paths // --
		
		local normaltex_path_text = ns.createFontstring("actionbars", L["ab_normaltexture"]..":")
		normaltex_path_text:SetPoint("TOPLEFT", cb1, "BOTTOMLEFT", 0, -8)

		local normaltex_path = ns.createPicker("actionbars", "buttonborder", "actionbar_buttonborder", 120, LolzenUIcfg.actionbar["actionbar_normal_texture"])
		normaltex_path:SetPoint("LEFT", normaltex_path_text, "RIGHT", -4, -5)

		local flashtex_path_text = ns.createFontstring("actionbars", L["ab_flashtexture"]..":")
		flashtex_path_text:SetPoint("TOPLEFT", normaltex_path_text, "BOTTOMLEFT", 0, -14)

		local flashtex_path = ns.createPicker("actionbars", "buttonflashing", "actionbar_buttonflash", 120, LolzenUIcfg.actionbar["actionbar_flash_texture"])
		flashtex_path:SetPoint("LEFT", flashtex_path_text, "RIGHT", 9, -5)

		local checkedtex_path_text = ns.createFontstring("actionbars", L["ab_checkedtexture"]..":")
		checkedtex_path_text:SetPoint("TOPLEFT", flashtex_path_text, "BOTTOMLEFT", 0, -14)

		local checkedtex_path = ns.createPicker("actionbars", "buttonchecked", "actionbar_buttonchecked", 120, LolzenUIcfg.actionbar["actionbar_checked_texture"])
		checkedtex_path:SetPoint("LEFT", checkedtex_path_text, "RIGHT", -10, -5)

		local hovertex_path_text = ns.createFontstring("actionbars", L["ab_hovertexture"]..":")
		hovertex_path_text:SetPoint("TOPLEFT", checkedtex_path_text, "BOTTOMLEFT", 0, -14)

		local hovertex_path = ns.createPicker("actionbars", "buttonhover", "actionbar_buttonhover", 120, LolzenUIcfg.actionbar["actionbar_hover_texture"])
		hovertex_path:SetPoint("LEFT", hovertex_path_text, "RIGHT", 3, -5)

		local pushedtex_path_text = ns.createFontstring("actionbars", L["ab_pushedtexture"]..":")
		pushedtex_path_text:SetPoint("TOPLEFT", hovertex_path_text, "BOTTOMLEFT", 0, -14)

		local pushedtex_path = ns.createPicker("actionbars", "buttonpushed", "actionbar_buttonpushed", 120, LolzenUIcfg.actionbar["actionbar_pushed_texture"])
		pushedtex_path:SetPoint("LEFT", pushedtex_path_text, "RIGHT", -2, -5)

		-- // size // --

		local size_text = ns.createFontstring("actionbars", L["ab_buttonsize"])
		size_text:SetPoint("TOPLEFT", pushedtex_path_text, "BOTTOMLEFT", 0, -20)

		local size = ns.createInputbox("actionbars", 30, 20, LolzenUIcfg.actionbar["actionbar_button_size"])
		size:SetPoint("LEFT", size_text, "RIGHT", 10, 0)

		local spacing_text = ns.createFontstring("actionbars", L["ab_buttonspacing"])
		spacing_text:SetPoint("LEFT", size, "RIGHT", 10, 0)

		local spacing = ns.createInputbox("actionbars", 30, 20, LolzenUIcfg.actionbar["actionbar_button_spacing"])
		spacing:SetPoint("LEFT", spacing_text, "RIGHT", 10, 0)

		local header3 = ns.createHeader("actionbars", L["ab_positions"])
		header3:SetPoint("TOPLEFT", size_text, "BOTTOMLEFT", 0, -14)

		-- // Positions // --

		local actionbars = {
			L["ab_mainmenubar"],
			L["ab_multibarbottomleft"],
			L["ab_multibarbottomright"],
			L["ab_multibarleft"],
			L["ab_multibarright"],
			L["ab_petbar"],
		}

		local backdrop = {
			bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = true, tileSize = 16,
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
			insets = {left = 4, right = 4, top = 4, bottom = 4},
		}

		local headername = ns.createFontstring("actionbars", L["ab_bar_type"])
		headername:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 8, -14)

		local headerx = ns.createFontstring("actionbars", "X")
		headerx:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 470, -14)

		local headery = ns.createFontstring("actionbars", "Y")
		headery:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 520, -14)

		local resetOrUpdateFrame = function(self)
			--self:
		end

		local OnEscapePressed = function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
			--TBD: reset frame
		end

		local box = {}
		for num, bar in pairs(actionbars) do
			if not box[num] then
				box[num] = CreateFrame("Frame", nil, ns.actionbars)
				box[num]:SetSize(570, 30)
				box[num]:SetBackdrop(backdrop)
				box[num]:SetBackdropColor(0.1, 0.1, 0.1, 0.5)
				box[num]:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
				if num == 1 then
					box[num]:SetPoint("TOPLEFT", headername, "BOTTOMLEFT", -4, -2)
				else
					box[num]:SetPoint("TOP", box[num-1], "BOTTOM", 0, -2)
				end
				
				box[num].name = ns.createFontstring("actionbars", bar)
				box[num].name:SetParent(box[num])
				box[num].name:SetPoint("LEFT", box[num], "LEFT", 6, 0)
				
				box[num].editbox_x = CreateFrame("EditBox", nil, ns.actionbars)
				box[num].editbox_x:SetSize(38, 14)
				box[num].editbox_x:SetMaxLetters(5)
				box[num].editbox_x:SetAutoFocus(false)
				box[num].editbox_x:SetFontObject(GameFontHighlight)
				box[num].editbox_x:SetPoint("RIGHT", box[num], "RIGHT", -80, 0)
				box[num].editbox_x:SetJustifyH("CENTER")
				box[num].editbox_x.numFormat = "%d"
				if num == 1 then
					box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mmb_posx"])		
				elseif num == 2 then
					box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbbl_posx"])
				elseif num == 3 then
					box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbbr_posx"])
				elseif num == 4 then
					box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbl_posx"])
				elseif num == 5 then
					box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbr_posx"])
				elseif num == 6 then
					box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_petb_posx"])
				end
				box[num].editbox_x.oldText = box[num].editbox_x:GetText()
				box[num].editbox_x:SetCursorPosition(0)
				
				box[num].editbox_x_background = box[num].editbox_x:CreateTexture(nil, "BACKGROUND")
				box[num].editbox_x_background:SetAllPoints(box[num].editbox_x)
				box[num].editbox_x_background:SetColorTexture(0.2, 0.2, 0.2, 0.8)
				
				box[num].editbox_x:SetScript("OnEscapePressed", OnEscapePressed)
			--	box[num].editbox_x_background:SetScript('OnEnterPressed', OnEnterPressed)
			--	box[num].editbox_x_background:SetScript('OnEditFocusGained', OnEditFocusGained)
			--	box[num].editbox_x_background:SetScript('OnEditFocusLost', OnEditFocusLost)
			--	box[num].editbox_x_background:SetScript('OnTextChanged', OnTextChanged)
			--	box[num].editbox_x_background:SetScript('OnChar', OnChar)
				
				box[num].editbox_y = CreateFrame("EditBox", nil, ns.actionbars)
				box[num].editbox_y:SetSize(38, 14)
				box[num].editbox_y:SetMaxLetters(5)
				box[num].editbox_y:SetAutoFocus(false)
				box[num].editbox_y:SetFontObject(GameFontHighlight)
				box[num].editbox_y:SetPoint("RIGHT", box[num], "RIGHT", -30, 0)
				box[num].editbox_y:SetJustifyH("CENTER")
				box[num].editbox_y.numFormat = "%d"
				if num == 1 then
					box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mmb_posy"])		
				elseif num == 2 then
					box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbbl_posy"])
				elseif num == 3 then
					box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbbr_posy"])
				elseif num == 4 then
					box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbl_posy"])
				elseif num == 5 then
					box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbr_posy"])
				elseif num == 6 then
					box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_petb_posy"])
				end
				box[num].editbox_y.oldText = box[num].editbox_y:GetText()
				box[num].editbox_y:SetCursorPosition(0)
				
				box[num].editbox_y_background = box[num].editbox_y:CreateTexture(nil, "BACKGROUND")
				box[num].editbox_y_background:SetAllPoints(box[num].editbox_y)
				box[num].editbox_y_background:SetColorTexture(0.2, 0.2, 0.2, 0.8)
				
				box[num].editbox_y:SetScript("OnEscapePressed", OnEscapePressed)
			--	box[num].editbox_y_background:SetScript('OnEnterPressed', OnEnterPressed)
			--	box[num].editbox_y_background:SetScript('OnEditFocusGained', OnEditFocusGained)
			--	box[num].editbox_y_background:SetScript('OnEditFocusLost', OnEditFocusLost)
			--	box[num].editbox_y_background:SetScript('OnTextChanged', OnTextChanged)
			--	box[num].editbox_y_background:SetScript('OnChar', OnChar)
				
				
	--			box[num].toggle = CreateFrame("Button", nil, box[num], "UIPanelButtonTemplate")
	--			box[num].toggle:SetSize(100, 18)
	--			box[num].toggle:SetPoint("CENTER", box[num], "CENTER", 0, 0)
	--			box[num].toggle:SetText(L["ab_toggle_dragframe"])
	--			box[num].toggle:SetScript("OnClick", function(self)
	--				for i = 1, NUM_ACTIONBAR_BUTTONS do
	--					local button = _G[dragFrameBarButtons[num]..i]

	--					if button then
	--						if button.dragFrameTexture:IsShown() then
	--							button.dragFrameTexture:Hide()
	--						else
	--							button.dragFrameTexture:Show()
	--						end
	--					end
	--				end
	--			end)
				
				box[num].reset = CreateFrame("Button", nil, box[num])
				box[num].reset:SetSize(16, 16)
				box[num].reset:SetPoint("RIGHT", box[num], "RIGHT", -5, 0)
				box[num].reset:SetNormalTexture[[Interface\Buttons\UI-Panel-MinimizeButton-Up]]
				box[num].reset:SetPushedTexture[[Interface\Buttons\UI-Panel-MinimizeButton-Down]]
				box[num].reset:SetHighlightTexture[[Interface\Buttons\UI-Panel-MinimizeButton-Highlight]]
				box[num].reset:SetScript("OnClick", function(self)
					if num == 1 then
						box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mmb_posx"])	
						box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mmb_posy"])		
					elseif num == 2 then
						box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbbl_posx"])
						box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbbl_posy"])
					elseif num == 3 then
						box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbbr_posx"])
						box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbbr_posy"])
					elseif num == 4 then
						box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbl_posx"])
						box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbl_posy"])
					elseif num == 5 then
						box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_mbr_posx"])
						box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_mbr_posy"])
					elseif num == 6 then
						box[num].editbox_x:SetText(LolzenUIcfg.actionbar["actionbar_petb_posx"])
						box[num].editbox_y:SetText(LolzenUIcfg.actionbar["actionbar_petb_posy"])
					end
				end)
				box[num].reset:SetScript("OnEnter", function(self)
					GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
					GameTooltip:SetText("Reset")
				end)
				box[num].reset:SetScript("OnLeave", GameTooltip_Hide)
			end
		end

		local applyButton = ns.createApplyButton("actionbars")
		applyButton:SetScript("OnClick", function()
			LolzenUIcfg.actionbar["actionbar_show_keybinds"] = cb1:GetChecked()
			LolzenUIcfg.actionbar["actionbar_normal_texture"] = UIDropDownMenu_GetSelectedName(normaltex_path)
			LolzenUIcfg.actionbar["actionbar_flash_texture"] = UIDropDownMenu_GetSelectedName(flashtex_path)
			LolzenUIcfg.actionbar["actionbar_checked_texture"] = UIDropDownMenu_GetSelectedName(checkedtex_path)
			LolzenUIcfg.actionbar["actionbar_hover_texture"] = UIDropDownMenu_GetSelectedName(hovertex_path)
			LolzenUIcfg.actionbar["actionbar_pushed_texture"] = UIDropDownMenu_GetSelectedName(pushedtex_path)
			LolzenUIcfg.actionbar["actionbar_button_spacing"] = spacing:GetText()
			LolzenUIcfg.actionbar["actionbar_button_size"] = size:GetText()
			LolzenUIcfg.actionbar["actionbar_mmb_posx"] = tonumber(box[1].editbox_x:GetText())
			LolzenUIcfg.actionbar["actionbar_mmb_posy"] = tonumber(box[1].editbox_y:GetText())
			LolzenUIcfg.actionbar["actionbar_mbbl_posx"] = tonumber(box[2].editbox_x:GetText())
			LolzenUIcfg.actionbar["actionbar_mbbl_posy"] = tonumber(box[2].editbox_y:GetText())
			LolzenUIcfg.actionbar["actionbar_mbbr_posx"] = tonumber(box[3].editbox_x:GetText())
			LolzenUIcfg.actionbar["actionbar_mbbr_posy"] = tonumber(box[3].editbox_y:GetText())
			LolzenUIcfg.actionbar["actionbar_mbl_posx"] = tonumber(box[4].editbox_x:GetText())
			LolzenUIcfg.actionbar["actionbar_mbl_posy"] = tonumber(box[4].editbox_y:GetText())
			LolzenUIcfg.actionbar["actionbar_mbr_posx"] = tonumber(box[5].editbox_x:GetText())
			LolzenUIcfg.actionbar["actionbar_mbr_posy"] = tonumber(box[5].editbox_y:GetText())
			LolzenUIcfg.actionbar["actionbar_petb_posx"] = tonumber(box[6].editbox_x:GetText())
			LolzenUIcfg.actionbar["actionbar_petb_posy"] = tonumber(box[6].editbox_y:GetText())
			ReloadUI()
		end)

		ns["actionbars"].default = function(self)
			LolzenUIcfg.actionbar = _G["LolzenUIdefaultcfg"].actionbar
			ReloadUI()
		end
	end
end)