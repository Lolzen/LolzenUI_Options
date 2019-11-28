--// core //--

local addon, ns = ...
_G[addon] = ns

local L = LolzenUI.L
local LSM = LibStub("LibSharedMedia-3.0")
local LBT = LibStub("LibButtonTexture-1.0")

local f = CreateFrame("Frame")

local sortTable = {}
local sort_func = function(a, b)
	return L[a.name] < L[b.name] 
end

-- create the module specific options
function ns.createOptionPanels()
	-- sort localized module names alphabethically
	table.sort(LolzenUI.modules, sort_func)
	for i=1, #LolzenUI.modules do
		if LolzenUIcfg.modules[LolzenUI.modules[i].name] == true and LolzenUI.modules[i].hasOptions == true then
			if not ns[LolzenUI.modules[i].name] then
				ns[LolzenUI.modules[i].name] = CreateFrame("Frame", LolzenUI.modules[i].name.."panel", LolzenUI.panel)
				ns[LolzenUI.modules[i].name].name = L[LolzenUI.modules[i].name]
				ns[LolzenUI.modules[i].name].parent = LolzenUI.panel.name
				InterfaceOptions_AddCategory(ns[LolzenUI.modules[i].name])
			end
		end
	end
end

f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" then
		ns.createOptionPanels()
	end
end)

--/ Provide functions to easily create options for modules /--

-- title
ns.createTitle = function(module, optionalText)
	local title
	title = ns[module]:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", ns[module], 16, -16)
	if optionalText ~= nil then
		title:SetText("|cff5599ff"..optionalText.."|r")
	else
		title:SetText("|cff5599ff"..string.upper(string.sub(ns[module].name, 1, 1))..string.sub(ns[module].name, 2).." "..ns.L["module Options"].."|r")
	end
	return title
end

-- description
ns.createDescription = function(module, text, sub)
	local desc
	if sub ~= nil then
		desc = ns[module][sub]:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		desc:SetPoint("TOPLEFT", ns[module][sub], 16, -40)
	else
		desc = ns[module]:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
		desc:SetPoint("TOPLEFT", ns[module], 16, -40)
	end
	desc:SetText(text)
	return desc
end

-- header
ns.createHeader = function(module, text, sub)
	local header
	if sub ~= nil then
		header = ns[module][sub]:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	else
		header = ns[module]:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	end
	header:SetText("|cff5599ff"..text.."|r")
	return header
end

-- generic fontstring
ns.createFontstring = function(module, text, sub)
	local genstr
	if sub ~= nil then
		genstr = ns[module][sub]:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	else
		genstr = ns[module]:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	end
	genstr:SetText(text)
	return genstr
end

-- inputbox
ns.createInputbox = function(module, width, height, num, sub)
	local box
	if sub ~= nil then
		box = CreateFrame("EditBox", nil, ns[module][sub], "InputBoxTemplate")	
	else
		box = CreateFrame("EditBox", nil, ns[module], "InputBoxTemplate")
	end
	box:SetSize(width, height)
	box:SetAutoFocus(false)
	box:ClearFocus()
	if num ~= nil then
		box:SetNumber(num)
	end
	box:SetCursorPosition(0)
	return box
end

-- checkbox
ns.createCheckBox = function(module, name, text, checkedVar, sub)
	local checkbox
	if sub ~= nil then
		checkbox = CreateFrame("CheckButton", name, ns[module][sub], "ChatConfigCheckButtonTemplate")
	else
		checkbox = CreateFrame("CheckButton", name, ns[module], "ChatConfigCheckButtonTemplate")
	end
	_G[checkbox:GetName().."Text"]:SetText(text)
	if checkedVar == true then
		checkbox:SetChecked(true)
	else
		checkbox:SetChecked(false)
	end
	return checkbox
end

-- button texture
ns.createButtonTexture = function(module, size, texture, sub)
	local buttonTex
	if sub ~= nil then
		buttonTex = ns[module][sub]:CreateTexture(nil, "TEXTURE")
	else
		buttonTex = ns[module]:CreateTexture(nil, "TEXTURE")
	end
	buttonTex:SetSize(size, size)
	buttonTex:SetTexture(texture)
	buttonTex:SetTexCoord(.04, .94, .04, .94)
	return buttonTex
end

-- button overlay texture
ns.createButtonOverlay = function(module, parent, texture, sub)
	local buttonOverlay
	if sub ~= nil then
		buttonOverlay = ns[module][sub]:CreateTexture(nil, "OVERLAY")
	else
		buttonOverlay = ns[module]:CreateTexture(nil, "OVERLAY")
	end
	buttonOverlay:SetTexture(texture)
	-- SetPoint() can still be individually done after this function has be called
	buttonOverlay:SetAllPoints(parent)
	return buttonOverlay
end

-- picker
ns.picker_alpha = {
	1,
	0.9,
	0.8,
	0.7,
	0.6,
	0.5,
	0.4,
	0.3,
	0.2,
	0.1,
}

ns.picker_anchor = {
	"BOTTOM",
	"BOTTOMLEFT",
	"BOTTOMRIGHT",
	"TOP",
	"TOPLEFT",
	"TOPRIGHT",
	"CENTER",
	"LEFT",
	"RIGHT",
}

ns.picker_flags = {
	"OUTLINE",
	"THINOUTLINE",
	"MONOCHROME",
	"",
}

ns.picker_dateformat = {
	"EU",
	"US",
}

ns.picker_growth = {
	"ABOVE",
	"BELOW",
	"LEFT",
	"RIGHT",
}

ns.picker_uf_parent = {
	"hp",
	"self",
}

ns.picker_uf_auratype = {
	"Buffs",
	"Debuffs",
	"Both",
	"None",
}

ns.picker_uf_auragrowth_x = {
	"LEFT",
	"RIGHT",
}

ns.picker_uf_auragrowth_y = {
	"UP",
	"DOWN",
}

--[[
List of button attributes
======================================================
info.text = [STRING]  --  The text of the button
info.value = [ANYTHING]  --  The value that UIDROPDOWNMENU_MENU_VALUE is set to when the button is clicked
info.func = [function()]  --  The function that is called when you click the button
info.checked = [nil, true, function]  --  Check the button if true or function returns true
info.isNotRadio = [nil, true]  --  Check the button uses radial image if false check box image if true
info.isTitle = [nil, true]  --  If it's a title the button is disabled and the font color is set to yellow
info.disabled = [nil, true]  --  Disable the button and show an invisible button that still traps the mouseover event so menu doesn't time out
info.tooltipWhileDisabled = [nil, 1] -- Show the tooltip, even when the button is disabled.
info.hasArrow = [nil, true]  --  Show the expand arrow for multilevel menus
info.hasColorSwatch = [nil, true]  --  Show color swatch or not, for color selection
info.r = [1 - 255]  --  Red color value of the color swatch
info.g = [1 - 255]  --  Green color value of the color swatch
info.b = [1 - 255]  --  Blue color value of the color swatch
info.colorCode = [STRING] -- "|cAARRGGBB" embedded hex value of the button text color. Only used when button is enabled
info.swatchFunc = [function()]  --  Function called by the color picker on color change
info.hasOpacity = [nil, 1]  --  Show the opacity slider on the colorpicker frame
info.opacity = [0.0 - 1.0]  --  Percentatge of the opacity, 1.0 is fully shown, 0 is transparent
info.opacityFunc = [function()]  --  Function called by the opacity slider when you change its value
info.cancelFunc = [function(previousValues)] -- Function called by the colorpicker when you click the cancel button (it takes the previous values as its argument)
info.notClickable = [nil, 1]  --  Disable the button and color the font white
info.notCheckable = [nil, 1]  --  Shrink the size of the buttons and don't display a check box
info.owner = [Frame]  --  Dropdown frame that "owns" the current dropdownlist
info.keepShownOnClick = [nil, 1]  --  Don't hide the dropdownlist after a button is clicked
info.tooltipTitle = [nil, STRING] -- Title of the tooltip shown on mouseover
info.tooltipText = [nil, STRING] -- Text of the tooltip shown on mouseover
info.tooltipOnButton = [nil, 1] -- Show the tooltip attached to the button instead of as a Newbie tooltip.
info.justifyH = [nil, "CENTER"] -- Justify button text
info.arg1 = [ANYTHING] -- This is the first argument used by info.func
info.arg2 = [ANYTHING] -- This is the second argument used by info.func
info.fontObject = [FONT] -- font object replacement for Normal and Highlight
info.menuTable = [TABLE] -- This contains an array of info tables to be displayed as a child menu
info.noClickSound = [nil, 1]  --  Set to 1 to suppress the sound when clicking the button. The sound only plays if .func is set.
info.padding = [nil, NUMBER] -- Number of pixels to pad the text on the right side
info.leftPadding = [nil, NUMBER] -- Number of pixels to pad the button on the left side
info.minWidth = [nil, NUMBER] -- Minimum width for this line
info.customFrame = frame -- Allows this button to be a completely custom frame, should inherit from UIDropDownCustomMenuEntryTemplate and override appropriate methods.
info.icon = [TEXTURE] -- An icon for the button.
info.mouseOverIcon = [TEXTURE] -- An override icon when a button is moused over.
https://github.com/tomrus88/BlizzardInterfaceCode/blob/master/Interface/FrameXML/UIDropDownMenu.lua
]]
local LolzenFontObjects = {}
ns.createPicker = function(module, pickertype, name, width, selected, sub)
	local t
	if pickertype == "alpha" then
		t = ns.picker_alpha
	elseif pickertype == "anchor" then
		t = ns.picker_anchor
	elseif pickertype == "dateformat" then
		t = ns.picker_dateformat
	elseif pickertype == "font" then
		t = LSM:List(LSM.MediaType.FONT)
	elseif pickertype == "flag" then
		t = ns.picker_flags
	elseif pickertype == "growth" then
		t = ns.picker_growth
	elseif pickertype == "uf_parent" then
		t = ns.picker_uf_parent
	elseif pickertype == "uf_auratype" then
		t = ns.picker_uf_auratype
	elseif pickertype == "uf_auragrowth_x" then
		t = ns.picker_uf_auragrowth_x
	elseif pickertype == "uf_auragrowth_y" then
		t = ns.picker_uf_auragrowth_y
	elseif pickertype == "statusbar" then
		t = LSM:List(LSM.MediaType.STATUSBAR)
	elseif pickertype == "background" then
		t = LSM:List(LSM.MediaType.BACKGROUND)
	elseif pickertype == "border" then
		t = LSM:List(LSM.MediaType.BORDER)
	elseif pickertype == "buttonborder" then
		t = LBT:List(LBT.MediaType.BORDER)
	elseif pickertype == "buttonflashing" then
		t = LBT:List(LBT.MediaType.FLASHING)
	elseif pickertype == "buttonchecked" then
		t = LBT:List(LBT.MediaType.CHECKED)
	elseif pickertype == "buttonhover" then
		t = LBT:List(LBT.MediaType.HOVER)
	elseif pickertype == "buttonpushed" then
		t = LBT:List(LBT.MediaType.PUSHED)
	end
	local selectedNum, selectedName
	local picker
	if sub ~= nil then
		picker = CreateFrame("Button", name, ns[module][sub], "UIDropDownMenuTemplate")
	else
		picker = CreateFrame("Button", name, ns[module], "UIDropDownMenuTemplate")
	end
	picker:Show()
	local function OnClick(name)
		if pickertype == "font" or pickertype == "statusbar" or pickertype == "background" or pickertype == "border" or pickertype == "dateformat" or pickertype == "buttonborder" or pickertype == "buttonflashing" or pickertype == "buttonchecked" or pickertype == "buttonhover" or pickertype == "buttonpushed" then
			UIDropDownMenu_SetSelectedName(picker, name.value)
		else
			UIDropDownMenu_SetSelectedID(picker, name:GetID())
		end
		-- option to add additional OnClick event conditions
		picker.OnClick()
	end
	local function initialize(picker, level)
		local info = UIDropDownMenu_CreateInfo()
		for k, v in pairs(t) do
			if v == selected then
				selectedNum = k
				selectedName = v
			end
			info = UIDropDownMenu_CreateInfo()
			info.text = v
			info.value = v
			info.func = OnClick
			if pickertype == "font" then
				--create new fontobjects
				if not LolzenFontObjects[v] then
					LolzenFontObjects[v] = CreateFont(v)
					LolzenFontObjects[v]:SetTextColor(1, 1, 1)
					LolzenFontObjects[v]:SetFont(LSM:Fetch("font", v), 12, "")
				end
				--now use created fontObjects to distinguish the fonts in the picker
				info.fontObject = v
			elseif pickertype == "statusbar" then
				info.icon = LSM:Fetch("statusbar", v)
				info.tCoord = 0, 1, 1, 1
			elseif pickertype == "background" then
				info.icon = LSM:Fetch("background", v)
				info.tCoord = 0, 1, 1, 1
			end
			UIDropDownMenu_AddButton(info, level)
		end
	end
	UIDropDownMenu_Initialize(picker, initialize)
	UIDropDownMenu_SetWidth(picker, width)
	UIDropDownMenu_SetButtonWidth(picker, width+15)
	if pickertype == "font" or pickertype == "statusbar" or pickertype == "background" or pickertype == "border" or pickertype == "dateformat" or pickertype == "buttonborder" or pickertype == "buttonflashing" or pickertype == "buttonchecked" or pickertype == "buttonhover" or pickertype == "buttonpushed" then
		UIDropDownMenu_SetSelectedName(picker, selectedName)
	else
		UIDropDownMenu_SetSelectedID(picker, selectedNum)
	end
	UIDropDownMenu_JustifyText(picker, "LEFT")
	return picker
end

-- color texture
ns.createColorTexture = function(module, width, height, colorVars, texture, sub)
	local colorTex
	if sub ~= nil then
		colorTex = ns[module][sub]:CreateTexture(nil, "ARTWORK")
	else
		colorTex = ns[module]:CreateTexture(nil, "ARTWORK")
	end
	colorTex:SetSize(width, height)
	colorTex:SetVertexColor(unpack(colorVars))
	colorTex:SetTexture(LSM:Fetch("statusbar", texture))
	return colorTex
end

-- colorPicker
ns.createColorPicker = function(module, colorRect, colorVars, sub)
	local function SetNewColor()
		colorRect:SetVertexColor(ColorPickerFrame:GetColorRGB())
	end

	local function restorePreviousColor()
		colorRect:SetVertexColor(unpack(ColorPickerFrame.previousValues))
	end

	local colorpickerframe
	if sub ~= nil then
		colorpickerframe = CreateFrame("Frame", nil, ns[module][sub])
	else
		colorpickerframe = CreateFrame("Frame", nil, ns[module])
	end
	colorpickerframe:SetFrameStrata("HIGH")
	colorpickerframe:EnableMouse(true)
	colorpickerframe:SetScript("OnMouseDown", function(self)
		-- clear previous values
		ColorPickerFrame.previousValues = nil
		ColorPickerFrame.cancelFunc = nil
		ColorPickerFrame.func = nil
		-- and fill with the relevant ones
		ColorPickerFrame.previousValues = colorVars
		ColorPickerFrame:SetColorRGB(unpack(colorVars))
		ColorPickerFrame.cancelFunc = restorePreviousColor
		ColorPickerFrame.func = SetNewColor
		ColorPickerFrame:Show()
	end)
	return colorpickerframe
end

-- scrollable content
ns.createScrollFrame = function(module, max)
	ns[module].scrollframe = CreateFrame("ScrollFrame", nil, ns[module])
	ns[module].scrollframe:SetPoint("TOPLEFT", ns[module], 0, -56) 
	ns[module].scrollframe:SetPoint("BOTTOMRIGHT", 0, 5)

	ns[module].scrollbar = CreateFrame("Slider", nil, ns[module].scrollframe, "UIPanelScrollBarTemplate")
	ns[module].scrollbar:SetPoint("TOPRIGHT", ns[module], -8, -84)
	ns[module].scrollbar:SetPoint("BOTTOMRIGHT", ns[module], -8, 24)
	ns[module].scrollbar:SetMinMaxValues(0, max) 
	ns[module].scrollbar:SetValueStep(1) 
	ns[module].scrollbar.scrollStep = 1
	ns[module].scrollbar:SetValue(0) 
	ns[module].scrollbar:SetWidth(16) 
	ns[module].scrollbar:SetScript("OnValueChanged", function (self, value) 
		self:GetParent():SetVerticalScroll(value) 
	end)

	ns[module].content = CreateFrame("Frame", nil, ns[module].scrollframe) 
	ns[module].content:SetSize(128, 80) 
	ns[module].scrollframe.content = ns[module].content
 
	ns[module].scrollframe:SetScrollChild(ns[module].content)

	-- enable mousewheel scrolling
	ns[module].scrollframe:EnableMouseWheel(true)
	ns[module].scrollframe:SetScript("OnMouseWheel", function(self, direction)
		local current = ns[module].scrollbar:GetValue()
		if direction == 1 then -- "up"
			ns[module].scrollbar:SetValue(current - 10)
		elseif direction == -1 then -- "down"
			ns[module].scrollbar:SetValue(current + 10)
		end
	end)
end

-- "Apply Settings" Button
ns.createApplyButton = function(module)
	local button = CreateFrame("Button", module.."_ApplyButton", ns[module], "UIPanelButtonTemplate")
	button:SetSize(120, 23) -- width, height
	button:SetText(L["apply_button"])
	button:SetPoint("BOTTOMRIGHT", ns[module], "BOTTOMRIGHT", -186, -37)
	return button
end