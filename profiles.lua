local addon, ns = ...
local AceSerializer = LibStub:GetLibrary("AceSerializer-3.0")
local LibDeflate = LibStub:GetLibrary("LibDeflate")

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "LolzenUI_Options" then
		-- intitialize LolzenUIprofiles (Saved Variables for profiles) if they aren't already
		if LolzenUIprofiles == nil then
			LolzenUIprofiles = {
				["profiles"] = {
					["Lolzen"] = _G["LolzenUIdefaultcfg"],
					["User"] = LolzenUIcfg,
				},
				["OMFProfiles"] = {
					["Lolzen"] = _G["LolzenUIOMFdefaultcfg"],
					["User"] = LolzenUIcfgOMF,
				},
				["selectedProfile"] = "User",
			}
		end

		-- serialize, compress and encode a config (table)
		local function getSCETable(t)
			-- serialize
			local serializedTable = AceSerializer:Serialize(t)
			-- compress, using zlib @ level9
			local compressed = LibDeflate:CompressDeflate(serializedTable, {level = 9})
			-- encode to printable format
			local encoded_string = LibDeflate:EncodeForPrint(compressed)
			return encoded_string
		end

		-- deserialize, decompress and decode a string back to table format
		local function getDSCETable(str)
			-- decode the printable format string
			local decoded_string = LibDeflate:DecodeForPrint(str)
			-- decompress
			local decompressed = LibDeflate:DecompressDeflate(decoded_string)
			-- get initial config table back
			local bool, deserialized_data = AceSerializer:Deserialize(decompressed)
			return deserialized_data
		end

		-- parent panel
		local panel = LolzenUI.panel

		local profiles_text = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		profiles_text:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -228, -70)
		profiles_text:SetText("|cff5599ffProfiles:|r")

		local profiles = CreateFrame("Button", "prof", panel, "UIDropDownMenuTemplate")
		profiles:Show()
		local function OnClick(prof)
			UIDropDownMenu_SetSelectedName(profiles, prof.value)
		end
		local function initialize(profiles, level)
			local info = UIDropDownMenu_CreateInfo()
			for k, v in pairs(LolzenUIprofiles.profiles) do
				info = UIDropDownMenu_CreateInfo()
				info.text = k
				info.value = k
				info.func = OnClick
				UIDropDownMenu_AddButton(info, level)
			end
		end
		UIDropDownMenu_Initialize(profiles, initialize)
		UIDropDownMenu_SetWidth(profiles, 235)
		UIDropDownMenu_SetButtonWidth(profiles, 250)
		UIDropDownMenu_SetSelectedName(profiles, LolzenUIprofiles.selectedProfile)
		UIDropDownMenu_JustifyText(profiles, "LEFT")
		profiles:SetPoint("TOPLEFT", profiles_text, "BOTTOMLEFT", -20, -3)

		local function saveProfile(name)
			if name == "Lolzen" then
				StaticPopup_Show("LolzenUI_protectedprofile")
			else
				LolzenUIprofiles.profiles[name] = LolzenUIcfg
				LolzenUIprofiles.OMFProfiles[name] = LolzenUIcfgOMF
				UIDropDownMenu_SetSelectedName(profiles, name)
				UIDropDownMenu_SetText(profiles, name)
				LolzenUIprofiles.selectedProfile = name
				print("Profile "..name.." saved/updated")
			end
		end

		local function loadProfile(name)
			if LolzenUIprofiles.profiles[name] then
				LolzenUIcfg = LolzenUIprofiles.profiles[name]
				LolzenUIcfgOMF = LolzenUIprofiles.OMFProfiles[name]
				LolzenUIprofiles.selectedProfile = name
				UIDropDownMenu_SetSelectedName(profiles, name)
				UIDropDownMenu_SetText(profiles, name)
				StaticPopup_Show("LolzenUI_reload_for_profile")
				print("Profile "..name.." loaded! Reaload to take effect.")
			else
				print("debug: "..name)
			end
		end

		StaticPopupDialogs["LolzenUI_protectedprofile"] = {
			text = "Lolzen is the default profile and can not be overwritten",
			button1 = "OK",
			timeout = 0,
			whileDead = true,
			hideOnEscape = 1,
			preferredIndex = 3,  -- avoid some UI taint
		}

		local tmpData = {}
		StaticPopupDialogs["LolzenUI_havethisprofile"] = {
			text = "This profile is already imported, do you want to update this profile?",
			button1 = "Yes",
			button2 = "No",
			timeout = 0,
			whileDead = true,
			hideOnEscape = 1,
			preferredIndex = 3,  -- avoid some UI taint
			OnAccept = function(self)
				LolzenUIprofiles.profiles[tmpData[1]] = getDSCETable(tmpData[3])
				LolzenUIprofiles.OMFProfiles[tmpData[1]] = getDSCETable(tmpData[4])
				print("Profile "..tmpData[1].." has been updated")
			end,
		}

		StaticPopupDialogs["LolzenUI_oldprofile"] = {
			text = "This profile is from an older UI version. Import Anyways?",
			button1 = "Yes",
			button2 = "No",
			timeout = 0,
			whileDead = true,
			hideOnEscape = 1,
			preferredIndex = 3,  -- avoid some UI taint
			OnAccept = function(self)
				LolzenUIprofiles.profiles[tmpData[1]] = getDSCETable(tmpData[3])
				LolzenUIprofiles.OMFProfiles[tmpData[1]] = getDSCETable(tmpData[4])
				print("Profile "..tmpData[1].." has been updated")
			end,
		}

		StaticPopupDialogs["LolzenUI_olderprofile_version"] = {
			text = "You already have a more up to date version of this profile imported.",
			button1 = "OK",
			timeout = 0,
			whileDead = true,
			hideOnEscape = 1,
			preferredIndex = 3,  -- avoid some UI taint
		}

		StaticPopupDialogs["LolzenUI_saveprofile"] = {
			text = "Enter Profile Name",
			button1 = "Save",
			button2 = "Cancel",
			hasEditBox = true,
			timeout = 0,
			whileDead = true,
			preferredIndex = 3,  -- avoid some UI taint
			OnAccept = function(self)
				saveProfile(self.editBox:GetText())
				self:Hide()
			end,
			EditBoxOnEnterPressed = function(self)
				local parent = self:GetParent()
				saveProfile(parent.editBox:GetText())
				parent:Hide()
			end,
			EditBoxOnEscapePressed = function(self)
				self:GetParent():Hide()
			end,
		}

		StaticPopupDialogs["LolzenUI_loadprofile"] = {
			text = "Loading This Profile will overwrite your currwnt settings! Load anyways?",
			button1 = "Ok",
			button2 = "Cancel",
			timeout = 0,
			whileDead = true,
			preferredIndex = 3,  -- avoid some UI taint
			OnAccept = function(self)
				loadProfile(UIDropDownMenu_GetSelectedName(profiles))
			end,
		}

		StaticPopupDialogs["LolzenUI_reload_for_profile"] = {
			text = "Reload now to take loaded Profile in effect?",
			button1 = "Yes",
			button2 = "No",
			timeout = 0,
			whileDead = true,
			preferredIndex = 3,  -- avoid some UI taint
			OnAccept = function(self)
				ReloadUI()
			end,
		}

		local loadButton = CreateFrame("Button", "loadButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		loadButton:SetSize(60, 23)
		loadButton:SetText("Load")
		loadButton:SetPoint("TOPLEFT", profiles, "BOTTOMLEFT", 16, 0)
		loadButton:SetScript("OnClick", function()
			StaticPopup_Show("LolzenUI_loadprofile")
		end)

		local saveButton = CreateFrame("Button", "saveButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		saveButton:SetSize(60, 23)
		saveButton:SetText("Save")
		saveButton:SetPoint("LEFT", loadButton, "RIGHT", 5, 0)
		saveButton:SetScript("OnClick", function()
			StaticPopup_Show("LolzenUI_saveprofile")
		end)

		local importTextfield = CreateFrame("ScrollFrame", "profileImportTextfield_LolzenUIOptions", panel, "InputScrollFrameTemplate")
		importTextfield:SetPoint("TOP", profiles, "BOTTOM", 0, -50)
		importTextfield:SetSize(250, 70)
		importTextfield.CharCount:Hide()
		importTextfield.EditBox:SetMaxLetters(10000) -- even compressed the strings will be HUGE
		importTextfield.EditBox:SetWidth(importTextfield:GetWidth() - 20)
		importTextfield:Hide()

		local okButton = CreateFrame("Button", "loadButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		okButton:SetSize(importTextfield:GetWidth() + 10, 23)
		okButton:SetPoint("TOPLEFT", importTextfield, "BOTTOMLEFT", -5, -10)
		okButton.which = ""
		okButton:SetScript("OnClick", function(self)
			if okButton.which == "import" then
				if not string.find(importTextfield.EditBox:GetText(), "^?") then
					importTextfield.EditBox:SetText("Import a valid Profile String, This is empty or invalid")
					importTextfield.EditBox:HighlightText()
				else
					importTextfield:Hide()
					self:Hide()
					-- here we import and store the import string
					-- import_profile[1] = Profile Name
					-- import_profile[2] = LolzenUI Version in which the profile was exported
					-- import_profile[3] = the encoded & compressed profile string
					-- import_profile[4] = then encoded & compressed OMFProfile string
					local import_string = importTextfield.EditBox:GetText()					
					local import_profile = {}
					for w in import_string:gmatch("([^?,]+)") do
						import_profile[#import_profile+1] = w
					end
					-- now save the profile		
					if not LolzenUIprofiles.profiles[import_profile[1]] then
						-- check for version
						if import_profile[2] < GetAddOnMetadata("LolzenUI", "version") then
							StaticPopup_Show("LolzenUI_oldprofile")
							tmpData = import_profile
						else
							LolzenUIprofiles.profiles[import_profile[1]] = getDSCETable(import_profile[3])
							LolzenUIprofiles.OMFProfiles[tmpData[1]] = getDSCETable(tmpData[4])
							print("Profile "..import_profile[1].." has been imported")
						end
					else
						if import_profile[2] < GetAddOnMetadata("LolzenUI", "version") then
							StaticPopup_Show("LolzenUI_olderprofile_version")
						else
							StaticPopup_Show("LolzenUI_havethisprofile")
							tmpData = import_profile
						end
					end
				end
			elseif okButton.which == "export" then
				importTextfield:Hide()
				self:Hide()
			end
		end)
		okButton:Hide()

		local importButton = CreateFrame("Button", "importButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		importButton:SetSize(60, 23)
		importButton:SetText("Import")
		importButton:SetPoint("LEFT", saveButton, "RIGHT", 5, 0)
		importButton:SetScript("OnClick", function()
			okButton.which = "import"
			importTextfield:Show()
			importTextfield.EditBox:SetText("")
			okButton:Show()
			okButton:SetText("Import Profile")
		end)

		local exportButton = CreateFrame("Button", "exportButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		exportButton:SetSize(60, 23)
		exportButton:SetText("Export")
		exportButton:SetPoint("LEFT", importButton, "RIGHT", 5, 0)
		exportButton:SetScript("OnClick", function()
			okButton.which = "export"
			importTextfield:Show()
			importTextfield.EditBox:SetText("?"..LolzenUIprofiles.selectedProfile..","..GetAddOnMetadata("LolzenUI", "version")..","..getSCETable(LolzenUIprofiles.profiles[LolzenUIprofiles.selectedProfile])..","..getSCETable(LolzenUIprofiles.OMFProfiles[LolzenUIprofiles.selectedProfile]))
			importTextfield.EditBox:HighlightText()
			importTextfield.EditBox:SetFocus()
			okButton:Show()
			okButton:SetText("I'm done (ctrl + c)")
		end)
	end
end)
f:RegisterEvent("ADDON_LOADED")