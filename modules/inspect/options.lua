--// options for inspect //--

local addon, ns = ...

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" and LolzenUIcfg.modules["inspect"] == true then

		local title = ns.createTitle("inspect")

		local about = ns.createDescription("inspect", "Fixes unit inspection on Mouseover targets (with keybind)")
		about:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

		local bignotice = ns["inspect"]:CreateFontString(nil, "ARTWORK")
		bignotice:SetPoint("CENTER", ns["inspect"], "CENTER", 0, -8)
		bignotice:SetFont("Interface\\AddOns\\LolzenUI\\fonts\\DroidSansBold.ttf", 28, "OUTLINE")
		bignotice:SetText("No options, because this is a utility module")
		bignotice:SetTextColor(1, 1, 1, 0.2)
	end
end)