﻿--// French localization //--

local addon, ns = ...
local L = ns.L

if GetLocale() == "frFR" then
	-- optionpanel general (or used across multiple panels)
	L["module Options"] = "module Options"
	L["Preview"] = "Preview"
	L["texture"] = "Texture"
	L["height"] = "Height"
	L["width"] = "Width"
	L["PosX"] = "PosX"
	L["PosY"] = "PosY"
	L["alpha"] = "Alpha"
	L["bgalpha"] = "Background Alpha"
	L["anchor"] = "Anchor"
	L["parent"] = "Parent"
	L["color"] = "Color"
	L["font"] = "Font"
	L["size"] = "Size"
	L["flag"] = "Flag"
	L["frame"] = "Frame"
	L["spacing"] = "Spacing"
	L["background"] = "Background"
	L["border"] = "Border"
	L["Position"] = "Position"
	L["afk_flag"] = "AFK flag"
	L["dnd_flag"] = "DND flag"
	L["scale"] = "Scale"
	L["icon"] = "Icon"
	L["time"] = "Time"
	L["text"] = "Text"
	L["auras"] = "Auras"
	L["show"] = "Show"
	L["show_max_0_to_40"] = "Show maximum (0-40)"
	L["growth_x"] = "Growth X axis"
	L["growth_y"] = "Growth Y axis"
	L["show_only_player_auras"] = "Show only player Auras"
	L["desature_auras_not_by_player"] = "Desature Auras not by player"
	L["raidmarks"] = "Raid Marks"
	L["show_raidmarks"] = "Show Raid Marks"
	-- actionbars
	L["ab_keybinds"] = "Show keybinds"
	L["ab_texture_and_size"] = "Textures & Size"
	L["ab_normaltexture"] = "Normal texture"
	L["ab_flashtexture"] = "Flash texture"
	L["ab_checkedtexture"] = "Checked texture"
	L["ab_hovertexture"] = "Hover texture"
	L["ab_pushedtexture"] = "Pushed texture"
	L["ab_buttonsize"] = "Button size"
	L["ab_buttonspacing"] = "Button spacing"
	L["ab_positions"] = "Bar positions: |cffffffff(Scheme = Anchor1, Parent, Anchor2, posX, posY)|r"
	L["ab_mainmenubar"] = "Main Menu Bar"
	L["ab_multibarbottomleft"] = "Bottom Left Bar"
	L["ab_multibarbottomright"] = "Bottom Right Bar"
	L["ab_multibarleft"] = "Left Bar"
	L["ab_multibarright"] = "Right Bar"
	L["ab_petbar"] = "Pet Bar"
	L["ab_posessbar"] = "Special Bar"
	-- artifactbar
	L["af_draw_1px"] = "Draw a 1px border around the artifactbar"
	L["af_1px_round"] = "Rounded 1px border"
	L["af_1px_notice"] = "Activate 1px border for this option"
	L["af_mouseover_text"] = "Show text on mouseover"
	-- buffs
	L["buff_size"] = "Buff size"
	L["debuff_size"] = "Debuff size"
	L["tempenchant_size"] = "Tempenchat size"
	L["buff_duration_header"] = "Duration"
	L["buff_detailed_duration_text"] = "Detailed Buffduration (uses more CPU cycles)"
	L["buff_counter_header"] = "Counter text"
	L["buff_and_tempench_texture"] = "Buff & Tempenchant texture"
	L["debuff_texture"] = "Debuff texture"
	-- buffwatcher
	L["bw_watched_auras_header"] = "Auras which are being watched"
	L["bw_add_or_delete_text"] = "Add or delete Auras (per spellID)"
	L["bw_add_button"] = "Add"
	L["bw_delete_button"] = "Delete"
	L["bw_protip_text"] = "Search the spellID on WoWHead like in the picture \nand enter the number" -- \n is a line break
	L["bw_startingpoint_notice"] = "The startingpoint is the middle of the screen (0/0)"
	L["bw_icon_size"] = "Icon size"
	L["bw_icon_spacing"] = "Icon spacing"
	-- chat
	L["chat_short_chatstamps"] = "Use short chatstamps (G| P| R| ...)"
	L["chat_strip_brackets"] = "Remove brackets from chat (items, achievements, etc)"
	L["chat_show_timestamps"] = "Show timestamp"
	L["chat_disable_fading"] = "Disable fading"
	L["chat_auto_who"] = "Send /who automatcally on new incoming whispers"
	L["chat_afk_dnd_once"] = "Show afk/dnd only once per person"
	L["chat_strip_say_and_yell"] = "Remove 'say' and 'yell' from chat"
	L["chat_short_channel_names"] = "Short channelnames"
	L["chat_font_shadow"] = "Font shadow"
	L["chat_background"] = "Chat background"
	L["chat_header_flags_and_sticky_channels"] = "Flags and sticky channels"
	L["chat_sticky_say"] = "Say"
	L["chat_sticky_yell"] = "Yell"
	L["chat_sticky_party"] = "Party"
	L["chat_sticky_guild"] = "Guild"
	L["chat_sticky_officer"] = "Officer"
	L["chat_sticky_raid"] = "Raid"
	L["chat_sticky_raidwarning"] = "Raid Warning"
	L["chat_sticky_whisper"] = "Whisper"
	L["chat_sticky_channel"] = "Channel"
	-- clock
	L["clock_hours_and_minutes_header"] = "Hours & Minutes"
	L["clock_seconds_header"] = "Seconds"
	L["clock_seconds_enabled"] = "Show seconds"
	-- fonts
	L["DAMAGE_TEXT_FONT"] = "Damage font"
	L["UNIT_NAME_FONT"] = "Unit font"
	L["NAMEPLATE_FONT"] = "Nameplate font"
	L["STANDARD_TEXT_FONT"] = "Standard font"
	-- interruptannouncer
	L["ia_announce_intance"] = "Announce interrupts in /i"
	L["ia_announce_party"] = "Announce interrupts in /p"
	L["ia_announce_say"] = "Announce interrupts in /s"
	L["ia_message"] = "Interruptmessage"
	L["ia_message_description"] = "Use |cff5599ff!spell|r for the interrupted spell and |cff5599ff!name|r for the name of the interrupted unit"
	-- itemlevel
	L["ilvl_show_on_characterframe"] = "Show Itemlevel on the characterframe"
	L["ilvl_show_on_inspectframe"] = "Show Itemlevel on the inspectframe"
	L["ilvl_show_on_bags"] = "Show Itemlevel in bags"
	L["ilvl_header_text"] = "Itemlevel text"
	L["ilvl_use_quality_color"] = "Use qualitycolor for Itemlevel text"
	-- minimap
	L["mm_square"] = "Square Minimap"
	-- miscellaneous
	L["misc_rep_colors_header"] = "Reputation colors"
	L["misc_use_alternative_rep_colors"] = "Use alterative Reputation colors"
	L["misc_hated"] = "Hated"
	L["misc_hostile"] = "Hostile"
	L["misc_unfriendly"] = "Unfriendly"
	L["misc_neutral"] = "Neutral"
	L["misc_friendly"] = "Friendly"
	L["misc_honored"] = "Honored"
	L["misc_revered"] = "Revered"
	L["misc_exalted"] = "Exalted"
	L["misc_microbuttons"] = "Microbuttons"
	L["misc_hide_microbuttons"] = "Hide microbuttonmenu"
	-- nameplates
	L["np_show_targetindicator"] = "Show targetindicator on targetted nameplate"
	L["np_show_threat_border"] = "Show glowborder on enemys in combat"
	L["np_nameplates_general_header"] = "Namenplates General"
	L["np_target_nameplate_scale"] = "Target nameplate scale"
	L["np_level_and_name_header"] = "Level and name"
	L["sub_panel_nameplates_castbar"] = "Castbar"
	L["sub_panel_nameplates_title"] = "Namenplate Module: Castbar Options"
	L["sub_panel_nameplates_spark_header"] = "Spark"
	-- objectivetrackerframe
	L["objective_autocollapse"] = "Auto collapse in combat"
	L["objective_autocollapse_desc"] = "Automatically minimizes in combat and expands out of fight"
	L["objective_auto_collapse_login"] = "Auto collapse on login"
	L["objective_auto_collapse_login_desc"] = "Automatically minimizes on login"
	-- orderhallbar
	L["ohb_always_show"] = "Always show the Orderhallbar"
	L["ohb_zonetext_header"] = "Zonetext"
	L["ohb_currency_header"] = "Currency"
	L["ohb_icon_size"] = "Icon Size"
	-- pullcount
	L["count_play_sound_from"] = "Play chatsound from"
	L["count_guild"] = "Guild"
	L["count_party"] = "Party"
	L["count_instance"] = "Instance"
	L["count_say"] = "Say"
	L["count_custom_channels"] = "Custom channels"
	L["count_custom_message_to_react_header"] = "Custom chatmessages to play sounds from"
	L["count_countdown_message"] = "Countdown message"
	L["count_!n_represents"] = "|cff5599ff!n|r represents a number (1-10)"
	L["count_range_header"] = "Count Range & Soundfiles"
	L["count_range_notice"] = "|cffffffff(Soundfiles are located in LolzenUI/sounds)|r"
	L["count_range"] = "Pull count range (1-10)"
	L["count_file"] = "Soundfile for number"
	L["count_file_pull"] = "Soundfile for Pull"
	-- slashcommands
	L["slash_rl"] = "A short version of /reload"
	L["slash_frame"] = "Prints the name of the frame the mouse is hovering over"
	L["slash_child"] = "Prints the names of the childframes from the frame the mouse is hovering over"
	L["slash_gm"] = "Opens the help menu (e.g. for submitting GM tickets)"
	L["slash_lolzen"] = "Opens the Mainpanel of LolzenUI"
	-- tooltip
	L["tt_show_factionicons"] = "Show factionicons"
	L["tt_show_talents"] = "Show talents"
	L["tt_healthbar_header"] = "Healthbar"
	L["tt_flags_header"] = "Flags"
	L["tt_offline_flag"] = "Offline flag"
	L["tt_player_guild_header"] = "Player guild"
	L["tt_use_guild_color_globally"] = "Use guildcolor globally (not only guild the player is in)"
	-- unitframes
	L["uf_healthpoints"] = "Healthpoints"
	L["uf_healthpoints_overwrite_global_settings"] = "Overwrite the global settings"
	L["uf_powerpoints"] = "Powerpoints (Mana, etc)"
	L["uf_castbar"] = "Castbar"
	L["uf_use_standalone_castbar"] = "Use seperate castbar (position & size)"
	L["uf_trim_castbar_icon"] = "Trim the castbar icon (if icon >= castbar)"
	L["uf_time_and_spellname_header"] = "Time & castname font"
	L["uf_roleindicator_header"] = "Role indicator"
	L["uf_show_roleindicator"] = "Show role indicator"
	L["uf_readycheckindicator_header"] = "Readycheck indicator"
	L["uf_general_use_hp_percent"] = "Show HP percent"
	L["uf_general_use_both_value_and_percent"] = "Show HP points & HP percent"
	L["uf_general_switch_value_and_percent_order"] = "Use [Percent]"..LolzenUIcfg.unitframes.general["uf_val_perc_divider"].."[Points] instead of [Points]"..LolzenUIcfg.unitframes.general["uf_val_perc_divider"].."[Percent]"
	L["uf_general_use_short_values"] = "Use short values (34m5, 3k2, etc)"
	L["uf_general_use dot_divider"] = "Use dot divider on short values (34.5m, 3.2k, etc)"
	L["uf_general_notice_reenables_options_below"] = "(Reenables options below)"
	L["uf_general_notice_activate_hpperc_for_this"] = "Enable HP percent for this"
	L["uf_general_notice_deactivate_hpperc_for_this"] = "Disable HP percent for this"
	L["uf_general_notice_activate_hpval_and_hpperc_for_this"] = "Enable HP points & HP percent for this"
	L["uf_general_hpdivider_text"] = "Divider symbol"
	L["uf_general_leadindicator"] = "Lead indicator"
	L["uf_general_fadout_out_of_reach"] = "Fadout out of reach Unitframes"
	L["uf_general_fadout_out_of_reach_alpha"] = "Out of reach alpha (Party/Raid)"
	L["uf_general_combatfade"] = "Use combatfade (player, target & target of target)"
	L["uf_general_combatfade_in_combat_alpha"] = "Alpha in fight"
	L["uf_general_combatfade_out_of_combat_alpha"] = "Alpha out of combat"
	L["uf_general_hp_font_options"] = "Global HP point options (can be overritten individually)"
	L["sub_panel_unitframes_player"] = "Player"
	L["sub_panel_unitframes_player_title"] = "Unitframes Module: Player Options"
	L["sub_panel_unitframes_player_classpower_and_runes_header"] = "Classpower (Combo Points, ...) & Runes"
	L["sub_panel_unitframes_target"] = "Target"
	L["sub_panel_unitframes_target_title"] = "Unitframes Module: Target Optionens"
	L["sub_panel_unitframes_targettarget"] = "Target of Target"
	L["sub_panel_unitframes_targettarget_title"] = "Unitframes Module: Target of Target Options"
	L["sub_panel_unitframes_party"] = "Party"
	L["sub_panel_unitframes_party_title"] = "Unitframes Module: Party Options"
	L["sub_panel_unitframes_party_use_LolzenUI"] = "Use LolzenUI integrated Partyframes"
	L["sub_panel_unitframes_party_use_vertical_layout"] = "Use Vertikal Layout"
	L["sub_panel_unitframes_raid"] = "Raid"
	L["sub_panel_unitframes_raid_title"] = "Unitframes Module: Raid Options"
	L["sub_panel_unitframes_raid_use_LolzenUI"] = "Use LolzenUI integrated Raidframes"
	L["sub_panel_unitframes_pet"] = "Pet"
	L["sub_panel_unitframes_pet_title"] = "Unitframes Module: Pet Options"
	L["sub_panel_unitframes_boss"] = "Boss"
	L["sub_panel_unitframes_boss_title"] = "Unitframes Module: Boss Options"
	L["sub_panel_unitframes_boss_placement"] = "Additional boss placement"
	L["sub_panel_unitframes_boss_show_power"] = "Show powerbar & points"
	L["sub_panel_unitframes_focus"] = "Focus"
	L["sub_panel_unitframes_focus_title"] = "Unitframes Module: Focus Options"
	L["sub_panel_unitframes_powercolors"] = "Power Colors"
	L["sub_panel_unitframes_powercolors_title"] = "Unitframes Module: Power Colors Options"
	L["sub_panel_unitframes_powercolors_mana"] = "Mana"
	L["sub_panel_unitframes_powercolors_rage"] = "Rage"
	L["sub_panel_unitframes_powercolors_focus"] = "Focus"
	L["sub_panel_unitframes_powercolors_energy"] = "Energy"
	L["sub_panel_unitframes_powercolors_combopoints"] = "Combo Points"
	L["sub_panel_unitframes_powercolors_runes"] = "Runes"
	L["sub_panel_unitframes_powercolors_runicpower"] = "Runic Power"
	L["sub_panel_unitframes_powercolors_soulshards"] = "Soulshards"
	L["sub_panel_unitframes_powercolors_lunarpower"] = "Astral Power"
	L["sub_panel_unitframes_powercolors_holypower"] = "Holy Power"
	L["sub_panel_unitframes_powercolors_maelstrom"] = "Maelstrom"
	L["sub_panel_unitframes_powercolors_chi"] = "Chi"
	L["sub_panel_unitframes_powercolors_insanity"] = "Insanity"
	L["sub_panel_unitframes_powercolors_arcanecharges"] = "Arcane Charges"
	L["sub_panel_unitframes_powercolors_fury"] = "Fury"
	L["sub_panel_unitframes_powercolors_pain"] = "Pain"
	L["sub_panel_unitframes_omf"] = "Positions"
	L["sub_panel_unitframes_omf_title"] = "Unitframes Module: Positions [oUF_Movableframes]"
	L["sub_panel_unitframes_omf_about"] = "Type %s to toggle anchorframes"
	-- worldmap
	L["wm_scale"] = "Worldmapscale [limit: 0.1 - 1]"
	L["wm_coordinates"] = "Activate mouse coordinates"
	L["wm_title_or_coordinates_color"] = "Title/Coordinates Color"
	L["save_worldmap_position"] = "Save worldmap position"
	-- xpbar
	L["xp_regular_xp_color"] = "Normal XP Color"
	L["xp_rested_xp_color"] = "Rested XP Color"
	L["xp_pvp_color"] = "PvP Color (Honor)"
	L["xp_paragon_color"] = "Paragon XP Color"
	L["xp_draw_1px"] = "Draw a 1px border around the xpbar"
	L["xp_1px_round"] = "Rounded 1px border"
	L["xp_1px_notice"] = "Activate 1px border for this option"
	L["xp_mouseover_text"] = "Show text on mouseover"
end