--// options for buffwatcher //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["buffwatcher"] == true then

		local title = ns.createTitle("buffwatcher")

		local about = ns.createDescription("buffwatcher", LUI["desc_buffwatcher"])

		local header1 = ns.createHeader("buffwatcher", L["bw_watched_auras_header"]..":")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local header1BG = ns.createBackground("buffwatcher", 280, 475)
		header1BG:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", -4, -4)
		header1BG:SetFrameLevel(1)

		local function getInfo(id)
			local name, _, spellicon = GetSpellInfo(id)
			if spellicon ~= nil then
				return name, spellicon
			else
				return GetSpellInfo(212812), GetSpellTexture(212812)
			end
		end

		local icon = {}
		local function generateList()
			for i=1, #LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")] do
				if not icon[i] then
					icon[i] = ns["buffwatcher"]:CreateTexture(nil, "OVERLAY")
					icon[i]:SetTexCoord(.04, .94, .04, .94)
					icon[i]:SetTexture(select(2, getInfo(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i])))
					icon[i]:SetSize(26, 26)
				else
					icon[i]:SetTexture(select(2, getInfo(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i])))
				end
				if i == 1 then
					icon[i]:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 6, -20)
				else
					icon[i]:SetPoint("TOPLEFT", icon[i-1], "BOTTOMLEFT", 0, -5)
				end
				if not icon[i].text then
					icon[i].text = ns["buffwatcher"]:CreateFontString(nil, "OVERLAY")
					icon[i].text:SetFont("Interface\\AddOns\\LolzenUI\\fonts\\DroidSans.ttf", 12 ,"OUTLINE")
					icon[i].text:SetTextColor(1, 1, 1)
					icon[i].text:SetPoint("LEFT", icon[i], "RIGHT", 10, 0)
					icon[i].text:SetText(getInfo(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i]).." (spellid: "..LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i]..")")
				else
					icon[i].text:SetText(getInfo(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i]).." (spellid: "..LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i]..")")
				end
			end
			for i=1, #icon do
				if not LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")][i] then
					icon[i]:SetTexture(nil)
					icon[i].text:SetText(nil)
				end
			end
		end
		generateList()

		local add = ns.createFontstring("buffwatcher", L["bw_add_or_delete_text"])
		add:SetPoint("LEFT", header1, "RIGHT", 80, 0)

		local addBG = ns.createBackground("buffwatcher", 318, 130)
		addBG:SetPoint("TOPLEFT", add, "BOTTOMLEFT", -4, -4)
		addBG:SetFrameLevel(1)

		local eb = ns.createInputbox("buffwatcher", 50, 20, nil)
		eb:SetPoint("TOPLEFT", add, "BOTTOMLEFT", 10, -10)

		local previewicon = ns["buffwatcher"]:CreateTexture(nil, "OVERLAY")
		previewicon:SetTexCoord(.04, .94, .04, .94)
		previewicon:SetTexture(GetSpellTexture(212812))
		previewicon:SetSize(16, 16)
		previewicon:SetPoint("LEFT", eb, "RIGHT", 5, 0)

		local prevname = ns.createFontstring("buffwatcher", "???")
		prevname:SetPoint("LEFT", previewicon, "RIGHT", 5, 0)

		eb:SetScript("OnTextChanged", function(self)
			previewicon:SetTexture(select(2, getInfo(eb:GetText())))
			prevname:SetText(getInfo(eb:GetText()))
		end)

		local b = CreateFrame("Button", "addButton", ns["buffwatcher"], "UIPanelButtonTemplate")
		b:SetSize(80 ,22) -- width, height
		b:SetText(L["bw_add_button"])
		b:SetPoint("TOPLEFT", eb, "BOTTOMLEFT", -5, -8)
		b:SetScript("OnClick", function()
			local isduplicate = false
			for k, v in pairs(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")]) do
				if v == eb:GetText() then
					isduplicate = true
				end
			end
			if isduplicate == true then
				print("duplicate id detected!")
			else
				table.insert(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")], eb:GetText())
				generateList()
				LolzenUI.BuffWatcherUpdate()
			end
		end)

		local b2 = CreateFrame("Button", "delButton", ns["buffwatcher"], "UIPanelButtonTemplate")
		b2:SetSize(80 ,22) -- width, height
		b2:SetText(L["bw_delete_button"])
		b2:SetPoint("LEFT", b, "RIGHT", 10, 0)
		b2:SetScript("OnClick", function()
			for k, v in pairs(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")]) do
				if v == eb:GetText() then
					table.remove(LolzenUIcfg.buffwatcher["buffwatchlist"][UnitName("player")], k)
				end
			end
			generateList()
			LolzenUI.BuffWatcherUpdate()
		end)

		local pos_x_text = ns.createFontstring("buffwatcher", "PosX:")
		pos_x_text:SetPoint("TOPLEFT", b, "BOTTOMLEFT", 4, -10)

		local pos_x = ns.createInputbox("buffwatcher", 30, 20, LolzenUIcfg.buffwatcher["buffwatch_pos_x"])
		pos_x:SetPoint("LEFT", pos_x_text, "RIGHT", 10, 0)

		pos_x:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_x:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.buffwatcher["buffwatch_pos_x"] = tonumber(pos_x:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetBuffWatcherPosition()
		end)

		pos_x:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_x:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_y_text = ns.createFontstring("buffwatcher", "PosY:")
		pos_y_text:SetPoint("LEFT", pos_x, "RIGHT", 5, 0)

		local pos_y = ns.createInputbox("buffwatcher", 30, 20, LolzenUIcfg.buffwatcher["buffwatch_pos_y"])
		pos_y:SetPoint("LEFT", pos_y_text, "RIGHT", 10, 0)

		pos_y:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		pos_y:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.buffwatcher["buffwatch_pos_y"] = tonumber(pos_y:GetText())
			self.oldText = self:GetText()
			LolzenUI.SetBuffWatcherPosition()
		end)

		pos_y:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		pos_y:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local pos_desc = ns.createFontstring("buffwatcher", L["bw_startingpoint_notice"])
		pos_desc:SetPoint("TOPLEFT", pos_x_text, "BOTTOMLEFT", 0, -8)

		local icon_size_text = ns.createFontstring("buffwatcher", L["bw_icon_size"])
		icon_size_text:SetPoint("TOPLEFT", pos_desc, "BOTTOMLEFT", 0, -15)

		local icon_size = ns.createInputbox("buffwatcher", 30, 20, LolzenUIcfg.buffwatcher["buffwatch_icon_size"])
		icon_size:SetPoint("LEFT", icon_size_text, "RIGHT", 10, 0)

		icon_size:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		icon_size:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.buffwatcher["buffwatch_icon_size"] = tonumber(icon_size:GetText())
			self.oldText = self:GetText()
			LolzenUI.BuffWatcherUpdate()
		end)

		icon_size:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		icon_size:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local icon_spacing_text = ns.createFontstring("buffwatcher", L["bw_icon_spacing"])
		icon_spacing_text:SetPoint("LEFT", icon_size, "RIGHT", 5, 0)

		local icon_spacing = ns.createInputbox("buffwatcher", 30, 20, LolzenUIcfg.buffwatcher["buffwatch_icon_spacing"])
		icon_spacing:SetPoint("LEFT", icon_spacing_text, "RIGHT", 10, 0)

		icon_spacing:SetScript("OnEscapePressed", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		icon_spacing:SetScript("OnEnterPressed", function(self)
			LolzenUIcfg.buffwatcher["buffwatch_icon_spacing"] = tonumber(icon_spacing:GetText())
			self.oldText = self:GetText()
			LolzenUI.BuffWatcherUpdate()
		end)

		icon_spacing:SetScript("OnEditFocusGained", function(self)
			self.oldText = self:GetText()
		end)

		icon_spacing:SetScript("OnEditFocusLost", function(self)
			self:SetText(self.oldText)
			self:ClearFocus()
		end)

		local tip = ns.createFontstring("buffwatcher", "|cff5599ffPROTIP: |r"..L["bw_protip_text"])
		tip:SetPoint("TOPLEFT", icon_size_text, "BOTTOMLEFT", -4, -20)

		local help = ns["buffwatcher"]:CreateTexture(nil, "OVERLAY")
		help:SetSize(293, 66)
		help:SetTexture("Interface\\AddOns\\LolzenUI_Options\\modules\\buffwatcher\\help.tga")
		help:SetPoint("TOPLEFT", tip, "BOTTOMLEFT", 0, -8)

		local helpBG = ns.createBackground("buffwatcher", 318, 110)
		helpBG:SetPoint("TOPLEFT", icon_size_text, "BOTTOMLEFT", -12, -12)
		helpBG:SetFrameLevel(1)

		ns["buffwatcher"].default = function(self)
			LolzenUIcfg.buffwatcher = _G["LolzenUIdefaultcfg"].buffwatcher
			ReloadUI()
		end
	end
end)