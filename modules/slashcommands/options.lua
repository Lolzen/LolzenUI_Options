--// options for slashcommands //--

local _, ns = ...
local L = ns.L
local LUI = LolzenUI.L

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["slashcommands"] == true then

		local title = ns.createTitle("slashcommands")

		local about = ns.createDescription("slashcommands", LUI["desc_slashcommands"])

		local header1 = ns.createHeader("slashcommands", "/rl")
		header1:SetPoint("TOPLEFT", about, "BOTTOMLEFT", 0, -20)

		local desc1 = ns.createFontstring("slashcommands", L["slash_rl"])
		desc1:SetPoint("TOPLEFT", header1, "BOTTOMLEFT", 0, 0)

		local header2 = ns.createHeader("slashcommands", "/frame")
		header2:SetPoint("TOPLEFT", desc1, "BOTTOMLEFT", 0, -20)

		local desc2 = ns.createFontstring("slashcommands", L["slash_frame"])
		desc2:SetPoint("TOPLEFT", header2, "BOTTOMLEFT", 0, 0)

		local header3 = ns.createHeader("slashcommands", "/child")
		header3:SetPoint("TOPLEFT", desc2, "BOTTOMLEFT", 0, -20)

		local desc3 = ns.createFontstring("slashcommands", L["slash_child"])
		desc3:SetPoint("TOPLEFT", header3, "BOTTOMLEFT", 0, 0)

		local header4 = ns.createHeader("slashcommands", "/gm")
		header4:SetPoint("TOPLEFT", desc3, "BOTTOMLEFT", 0, -20)

		local desc4 = ns.createFontstring("slashcommands", L["slash_gm"])
		desc4:SetPoint("TOPLEFT", header4, "BOTTOMLEFT", 0, 0)

		local header5 = ns.createHeader("slashcommands", "|cff5599ff/lolzen|r |cffffffff&|r |cff5599ff/lolzenui|r")
		header5:SetPoint("TOPLEFT", desc4, "BOTTOMLEFT", 0, -20)

		local desc5 = ns.createFontstring("slashcommands", L["slash_lolzen"])
		desc5:SetPoint("TOPLEFT", header5, "BOTTOMLEFT", 0, 0)
	end
end)