local addon, ns = ...
local AceSerializer = LibStub:GetLibrary("AceSerializer-3.0")
local LibDeflate = LibStub:GetLibrary("LibDeflate")

--[[	ToDo:
	implement loading/saving more gracefully
	testing load/save
	handle LolzenUIcfgOMF
	cleanup
]]

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(self, event, addon)
	local updateButtonText
	if addon == "LolzenUI_Options" then
		-- intitialize LolzenUIprofiles (Saved Variables for profiles) if they aren't already
		if LolzenUIprofiles == nil then
			if LolzenUIcfg["hasSeenTutorial"] == false then
				LolzenUIprofiles = {
					["profiles"] = {
						["Lolzen"] = LolzenUI.defaultconfig,
					},
					["selectedProfile"] = "Lolzen",
				}
			else
				LolzenUIprofiles = {
					["profiles"] = {
						["Lolzen"] = LolzenUI.defaultconfig,
						["User"] = LolzenUIcfg,
					},
					["selectedProfile"] = "User",
				}
			end
		end

		--// Popuop Dialogs // --

		StaticPopupDialogs["LolzenUI_protectedprofile"] = {
			text = "Lolzen is the default profile and can not be overwritten",
			button1 = "OK",
			--button2 = "Cancel",
			timeout = 0,
			whileDead = true,
			hideOnEscape = 1,
			preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
		--	OnAccept = function(self)
		--		saveProfile(self.editBox:GetText())
		--	end,
		--	EditBoxOnEnterPressed = function(self)
		--		local parent = self:GetParent()
		--		saveProfile(parent.editBox:GetText())
		--		parent:Hide()
		--	end,
		--	EditBoxOnEscapePressed = function(self)
		--		self:GetParent():Hide()
		--	end,
		}
		
		StaticPopupDialogs["LolzenUI_saveprofile"] = {
			text = "Enter Profile Name",
			button1 = "Save",
			button2 = "Cancel",
			hasEditBox = true,
			timeout = 0,
			whileDead = true,
			preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
			OnAccept = function(self)
				saveProfile(self.editBox:GetText())
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

		-- // functions //--

		-- serialize, compress and encode a config (table)
		local function getSCETable(t)
			-- serialize
			local serializedTable = AceSerializer:Serialize(t)
			--compress, using zlib @ level9
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

		local function saveProfile(name)
			if name == "Lolzen" then
				StaticPopup_Show("LolzenUI_protectedprofile")
			else
				if not LolzenUIprofiles.profiles[name] then
					LolzenUIprofiles.profiles[name] = LolzenUIcfg
					UIDropDownMenu_SetSelectedName(profiles, name)
					UIDropDownMenu_SetText(profiles, name)
					LolzenUIprofiles.selectedProfile = name
					updateButtonText(name)
					print("New Profile "..name.." saved!")
				else
					LolzenUIprofiles.profiles[name] = LolzenUIcfg
					UIDropDownMenu_SetSelectedName(profiles, name)
					UIDropDownMenu_SetText(profiles, name)
					LolzenUIprofiles.selectedProfile = name
					updateButtonText(name)
					print("Profile "..name.." updated!")
				end
				print("! "..LolzenUIprofiles.selectedProfile.." !"	)
			end
		end

		local function loadProfile(name)
			if LolzenUIprofiles.profiles[name] then
			--	LolzenUIcfg = LolzenUIprofiles.profiles[name]
			--	LolzenUIprofiles.selectedProfile = name
			--	UIDropDownMenu_SetSelectedName(profiles, name)
			--	UIDropDownMenu_SetText(profiles, name)
				print("Profile "..name.." loaded!")
			else
				print("debug: "..name)
			end
		end

		--// Profile Settings //--

		-- parent panel
		local panel = LolzenUI.panel

		local profiles_text = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		profiles_text:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -228, -70)
		profiles_text:SetText("|cff5599ffProfiles:|r")

		local profiles = CreateFrame("Button", "prof", panel, "UIDropDownMenuTemplate")
		profiles:Show()
		local function OnClick(prof)
			UIDropDownMenu_SetSelectedName(profiles, prof.value)
			updateButtonText(prof.value)
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
		if LolzenUIprofiles == nil then
			UIDropDownMenu_SetSelectedName(profiles, LolzenUIprofiles.selectedProfile)
		else
			UIDropDownMenu_SetSelectedName(profiles, LolzenUIprofiles.selectedProfile)
		end
		UIDropDownMenu_JustifyText(profiles, "LEFT")
		profiles:SetPoint("TOPLEFT", profiles_text, "BOTTOMLEFT", -20, -3)

		--// Load & Save Stuff //--

		local loadButton = CreateFrame("Button", "loadButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		loadButton:SetSize(60, 23) -- width, height
		loadButton:SetText("Load")
		loadButton:SetPoint("TOPLEFT", profiles, "BOTTOMLEFT", 16, 0)
		loadButton:SetScript("OnClick", function()
			loadProfile(UIDropDownMenu_GetSelectedName(profiles))
		end)

		local saveButton = CreateFrame("Button", "saveButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		saveButton:SetSize(60, 23) -- width, height
		if UIDropDownMenu_GetSelectedName(profiles) == LolzenUIprofiles.selectedProfile then
			saveButton:SetText("Update")
		else
			saveButton:SetText("Save")
		end
		saveButton:SetPoint("LEFT", loadButton, "RIGHT", 5, 0)
		saveButton:SetScript("OnClick", function()
			if UIDropDownMenu_GetSelectedName(profiles) == LolzenUIprofiles.selectedProfile then
				LolzenUIprofiles.profiles[LolzenUIprofiles.selectedProfile] = LolzenUIcfg
				UIDropDownMenu_SetSelectedName(profiles, LolzenUIprofiles.selectedProfile)
				UIDropDownMenu_SetText(profiles, LolzenUIprofiles.selectedProfile)
				--LolzenUIprofiles.selectedProfile = UIDropDownMenu_GetSelectedName(profiles)
				print("Profile "..UIDropDownMenu_GetSelectedName(profiles).." updated!")
			else
				StaticPopup_Show("LolzenUI_saveprofile")
			end
		end)

		updateButtonText = function(selected)
			if selected == LolzenUIprofiles.selectedProfile then
				saveButton:SetText("Update")
			else
				saveButton:SetText("Save")
			end
		end

		-- // Import & Export Stuff //--

		local importTextfield = CreateFrame("ScrollFrame", "profileImportTextfield_LolzenUIOptions", panel, "InputScrollFrameTemplate")
		importTextfield:SetPoint("TOP", profiles, "BOTTOM", 0, -50)
		importTextfield:SetSize(250, 70)
		importTextfield.CharCount:Hide()
		importTextfield.EditBox:SetMaxLetters(10000) -- even compressed the strings will be HUGE
		importTextfield.EditBox:SetWidth(importTextfield:GetWidth() - 20)
		importTextfield:Hide()
		
		local okButton = CreateFrame("Button", "loadButton_LolzenUIOptions", panel, "UIPanelButtonTemplate")
		okButton:SetSize(importTextfield:GetWidth() + 10, 23) -- width, height
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
					--import_profile[1] = Profile Name
					--import_profile[2] = LolzenUI Version in which the profile was exported
					--import_profile[3] = the encoded & compressed profile string
					local import_string = importTextfield.EditBox:GetText()					
					local import_profile = {}
					for w in import_string:gmatch("([^?,]+)") do
						import_profile[#import_profile+1] = w
					end
					--now save the profile		
					if not LolzenUIprofiles.profiles[import_profile[1]] then
						-- check for version
					--	if import_profile[2] < GetAddOnMetadata("LolzenUI", "version") then
							--ask if the user still wants to import anyways
							-- this will only be relevant IF any breaking changes were made between versions
					--	else
							LolzenUIprofiles.profiles[import_profile[1]] = getDSCETable(import_profile[3])
							print("Profile "..import_profile[1].." has been imported")
					--	end
					else
						print("Profile is already imported; Do you want to update the profile?")
						-- TODO: actually implement the updating mechanism
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
			importTextfield.EditBox:SetText("?"..LolzenUIprofiles.selectedProfile..","..GetAddOnMetadata("LolzenUI", "version")..","..getSCETable(LolzenUIprofiles.profiles[LolzenUIprofiles.selectedProfile]))
			importTextfield.EditBox:HighlightText()
			importTextfield.EditBox:SetFocus()
			okButton:Show()
			okButton:SetText("I'm done (ctrl + c)")
		end)
	end
end)
f:RegisterEvent("ADDON_LOADED")