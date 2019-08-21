﻿--// German localization //--

local addon, ns = ...
local L = ns.L

if GetLocale() == "deDE" then
	-- optionpanel general (or used across multiple panels)
	L["module Options"] = "modul Optionen"
	L["Preview"] = "Vorschau"
	L["texture"] = "Textur"
	L["height"] = "Höhe"
	L["width"] = "Breite"
	L["PosX"] = "PosX"
	L["PosY"] = "PosY"
	L["alpha"] = "Transparenz"
	L["bgalpha"] = "Hintergund Transparenz"
	L["anchor"] = "Ankerpunkt"
	L["parent"] = "Stammpunkt"
	L["color"] = "Farbe"
	L["font"] = "Schriftart"
	L["size"] = "Größe"
	L["flag"] = "Flagge"
	L["frame"] = "Fenster"
	L["spacing"] = "Abstand"
	L["background"] = "Hintergrund"
	L["border"] = "Rahmen"
	L["Position"] = "Position"
	L["afk_flag"] = "AFK Flagge"
	L["dnd_flag"] = "DND Flagge"
	L["scale"] = "Skalierung"
	L["icon"] = "Symbol"
	L["time"] = "Zeit"
	L["text"] = "Text"
	L["auras"] = "Auren"
	L["show"] = "Zeige"
	L["show_max_0_to_40"] = "Zeige Maximal (0-40)"
	L["growth_x"] = "Wachstum X Achse"
	L["growth_y"] = "Wachstum Y Achse"
	L["show_only_player_auras"] = "Zeige nur Spieler Auren"
	L["desature_auras_not_by_player"] = "Graue Auren aus die nicht von dir sind"
	L["raidmarks"] = "Raid Symbole"
	L["show_raidmarks"] = "Zeige Raid Symbole"
	-- actionbars
	L["ab_keybinds"] = "Zeige Tastenzuweisungen"
	L["ab_texture_and_size"] = "Texturen & Größe"
	L["ab_normaltexture"] = "Normale Textur"
	L["ab_flashtexture"] = "Flash Textur"
	L["ab_checkedtexture"] = "Checked Textur"
	L["ab_hovertexture"] = "Hover Textur"
	L["ab_pushedtexture"] = "Pushed Textur"
	L["ab_buttonsize"] = "Buttongröße"
	L["ab_buttonspacing"] = "Buttonabstand"
	L["ab_positions"] = "Leisten Positionen"
	L["ab_mainmenubar"] = "Hauptleiste"
	L["ab_multibarbottomleft"] = "Untere Linke Leiste"
	L["ab_multibarbottomright"] = "Untere Rechte Leiste"
	L["ab_multibarleft"] = "Linke Leiste"
	L["ab_multibarright"] = "Rechte Leiste"
	L["ab_petbar"] = "Begleiterleiste"
	L["ab_posessbar"] = "Spezial Leiste"
	L["ab_bar_type"] = "Aktionsleisten Typ"
	-- artifactbar
	L["af_draw_1px"] = "Zeichne einen 1px Rahmen um die Artefaktleiste"
	L["af_1px_round"] = "Abgerundeter 1px Rahmen"
	L["af_1px_notice"] = "Aktiviere 1px Rahmen für diese Option"
	L["af_mouseover_text"] = "Zeige den Text bei Mouseover"
	-- buffs
	L["buff_size"] = "Buff Größe"
	L["debuff_size"] = "Debuff Größe"
	L["tempenchant_size"] = "Waffenverzauberungen Größe"
	L["buff_duration_header"] = "Zeitanzeige"
	L["buff_detailed_duration_text"] = "Detailierter Text für die Buffdauer (Verbraucht mehr CPU Zyklen)"
	L["buff_counter_header"] = "Zähler Text"
	L["buff_and_tempench_texture"] = "Buff & Waffenverzauberungen Textur"
	L["debuff_texture"] = "Debuff Textur"
	-- buffwatcher
	L["bw_watched_auras_header"] = "Auren die beobachtet werden"
	L["bw_add_or_delete_text"] = "Hinzufügen oder löschen von Auren (per spellID)"
	L["bw_add_button"] = "Hinzufügen"
	L["bw_delete_button"] = "Löschen"
	L["bw_protip_text"] = "Suche die spellID auf WoWHead wie im Bild \nund gib dann die Zahl ein" -- \n is a line break
	L["bw_startingpoint_notice"] = "Der Startpunkt ist in der Mitte vom Bildschirm (0/0)"
	L["bw_icon_size"] = "Symbol Größe"
	L["bw_icon_spacing"] = "Symbol abstand"
	-- chat
	L["chat_short_chatstamps"] = "Benutze kurze Chat Stempel (G| P| R| ...)"
	L["chat_strip_brackets"] = "Entferne Eckige Klammern vom Chat (items, achievements, etc)"
	L["chat_show_timestamps"] = "Zeige Zeitstempel"
	L["chat_timestamp_notice"] = "Diese Option setzt Blizzard's eingebaute Zeitstempel zu 'keine'"
	L["chat_disable_fading"] = "Deaktiviere Verblassen"
	L["chat_auto_who"] = "Sende /who automatisch bei neuen eingehenden Flüsternachrichten"
	L["chat_afk_dnd_once"] = "Zeige afk/dnd nachrichten nur einmal pro person"
	L["chat_strip_say_and_yell"] = "Entferne 'sagt' und 'schreit' vom Chat"
	L["chat_short_channel_names"] = "Kurze Chatkanalnamen"
	L["chat_font_shadow"] = "Schrift Schatten"
	L["chat_background"] = "Chat Hintergrund"
	L["chat_header_link_color"] = "URL Farbe"
	L["chat_header_flags_and_sticky_channels"] = "Flaggen und Kanäle merken"
	L["chat_sticky_say"] = "Sagen"
	L["chat_sticky_yell"] = "Schreien"
	L["chat_sticky_party"] = "Gruppe"
	L["chat_sticky_guild"] = "Gilde"
	L["chat_sticky_officer"] = "Offizier"
	L["chat_sticky_raid"] = "Schlachtzug"
	L["chat_sticky_raidwarning"] = "Schlachtzugswarnung"
	L["chat_sticky_whisper"] = "Flüstern"
	L["chat_sticky_channel"] = "Kanal"
	-- clock
	L["clock_hours_and_minutes_header"] = "Stunden & Minuten"
	L["clock_seconds_header"] = "Sekunden"
	L["clock_seconds_enabled"] = "Zeige Sekunden an"
	L["clock_date"] = "Datumsformat"
	-- fonts
	L["DAMAGE_TEXT_FONT"] = "Schriftart Schaden"
	L["UNIT_NAME_FONT"] = "Schriftart Einheiten"
	L["NAMEPLATE_FONT"] = "Schriftart Namensplaketten"
	L["STANDARD_TEXT_FONT"] = "Schriftart Standard"
	-- interruptannouncer
	L["ia_announce_intance"] = "Sage Unterbrechungen im /i an"
	L["ia_announce_party"] = "Sage Unterbrechungen im /p an"
	L["ia_announce_say"] = "Sage Unterbrechungen im /s an"
	L["ia_message"] = "Unterbrechungsansage"
	L["ia_message_description"] = "Benutze |cff5599ff!spell|r für den unterbrochenen Zauber und |cff5599ff!name|r für den Namen der unterbochenen Einheit"
	-- itemlevel
	L["ilvl_show_on_characterframe"] = "Zeige Itemlevel auf dem Charakterfenster"
	L["ilvl_show_on_inspectframe"] = "Zeige Itemlevel auf dem Inspizierfenster"
	L["ilvl_show_on_bags"] = "Zeige Itemlevel auf den Taschen"
	L["ilvl_header_text"] = "Itemlevel Text"
	L["ilvl_use_quality_color"] = "Benutze Qualitätsfarben für Itemlevel Text"
	-- minimap
	L["mm_square"] = "Quadratische Minimap"
	-- miscellaneous
	L["misc_rep_colors_header"] = "Ruf Farben"
	L["misc_use_alternative_rep_colors"] = "Benutze alternative Ruf Farben"
	L["misc_hated"] = "Hasserfüllt"
	L["misc_hostile"] = "Feindselig"
	L["misc_unfriendly"] = "Unfreundlich"
	L["misc_neutral"] = "Neutral"
	L["misc_friendly"] = "Freundlich"
	L["misc_honored"] = "Wohlwollend"
	L["misc_revered"] = "Respektvoll"
	L["misc_exalted"] = "Ehrfürchtig"
	L["misc_microbuttons"] = "Mikrobuttons"
	L["misc_hide_microbuttons"] = "Verstecke Mikrobuttonmenü"
	-- nameplates
	L["np_show_targetindicator"] = "Zeige Zielindikator auf der ausgewählten Namensplakette"
	L["np_show_threat_border"] = "Zeige einen Glührahmen bei Gegnern im Kampf"
	L["np_nameplates_general_header"] = "Namensplaketten Allgemein"
	L["np_target_nameplate_scale"] = "Ziel Plakette Skalierung"
	L["np_level_and_name_header"] = "Level und Name"
	L["sub_panel_nameplates_castbar"] = "Zauberleiste"
	L["sub_panel_nameplates_title"] = "Namensplaketten Modul: Zauberleiste Optionen"
	L["sub_panel_nameplates_spark_header"] = "Funken"
	-- objectivetrackerframe
	L["objective_autocollapse"] = "Automatisches minimieren im Kampf"
	L["objective_autocollapse_desc"] = "Verkleinert automatisch im Kampf und vergößert außerhalb des Kampfes"
	L["objective_auto_collapse_login"] = "Automatisches minimieren beim Einloggen"
	L["objective_auto_collapse_login_desc"] = "Minimiert automatisch beim einloggen"
	-- orderhallbar
	L["ohb_always_show"] = "Zeige die Ordenshallenleiste immer an"
	L["ohb_zonetext_header"] = "Zonentext"
	L["ohb_currency_header"] = "Abzeichen"
	L["ohb_icon_size"] = "Symbol Größe"
	-- pullcount
	L["count_play_sound_from"] = "Spiele Chatnachrichten klänge von"
	L["count_guild"] = "Gilde"
	L["count_party"] = "Gruppe"
	L["count_instance"] = "Instanzgruppe"
	L["count_say"] = "Sagen"
	L["count_custom_channels"] = "Benutzerdefinierte Kanäle"
	L["count_custom_message_to_react_header"] = "Benutzerdefinierte Chatnachrichten um Klänge abzuspielen"
	L["count_countdown_message"] = "Countdown Nachricht"
	L["count_!n_represents"] = "|cff5599ff!n|r repränsentiert eine nummer (1-10)"
	L["count_range_header"] = "Zähler Grenze & Klang Dateien"
	L["count_range_notice"] = "|cffffffff(Klangdateien befinden sich in LolzenUI/sounds)|r"
	L["count_range"] = "Pull Zähl Grenze (1-10)"
	L["count_file"] = "Klangdatei für Zahl"
	L["count_file_pull"] = "Klangdatei für Pull"
	-- slashcommands
	L["slash_rl"] = "Eine kurze version von /reload"
	L["slash_frame"] = "Schreibt im Chat den Namen des Fensters unter dem Cursor"
	L["slash_child"] = "Schreibt im Chat die Namen der untergeordneten Fenster, des Fensters unter dem Cursor"
	L["slash_gm"] = "Öffnet das Hilfemenü (um z.b. GM Tickets zu schreiben)"
	L["slash_lolzen"] = "Öffnet das Hauptmenü von LolzenUI"
	-- tooltip
	L["tt_show_factionicons"] = "Zeige Fraktionssymbole"
	L["tt_show_talents"] = "Zeige Talente"
	L["tt_healthbar_header"] = "Gesundheitsleiste"
	L["tt_flags_header"] = "Flaggen"
	L["tt_offline_flag"] = "Offline Flagge"
	L["tt_player_guild_header"] = "Spieler Gilde"
	L["tt_use_guild_color_globally"] = "Benutze Gildenfarbe Global (Nicht nur Eigene Gilde)"
	-- unitframes
	L["uf_healthpoints"] = "Lebenspunkte"
	L["uf_healthpoints_overwrite_global_settings"] = "Überschreibe die globalen Einstellungen"
	L["uf_powerpoints"] = "Ressourcenpunkte (Mana, etc)"
	L["uf_castbar"] = "Zauberleiste"
	L["uf_use_standalone_castbar"] = "Benutze Eigene Zauberleiste (Position & Große)"
	L["uf_trim_castbar_icon"] = "Beschneide das Zauberleistensymbol (Wenn Symbol >= Zauberleiste)"
	L["uf_time_and_spellname_header"] = "Zeit & Castname Schriftart"
	L["uf_roleindicator_header"] = "Rollensymbol"
	L["uf_show_roleindicator"] = "Zeige Rollensymbol"
	L["uf_readycheckindicator_header"] = "Bereitschaftsprüfungs Symbol"
	L["uf_show_restingindicator"] = "Zeige Ruhegebietsymbol"
	L["uf_restingindicator_header"] = "Ruhegebiet Symbol"
	L["uf_general_use_hp_percent"] = "Zeige HP Prozent"
	L["uf_general_use_both_value_and_percent"] = "Zeige HP Punkte & HP Prozent"
	L["uf_general_switch_value_and_percent_order"] = "Benutze [Prozent]"..LolzenUIcfg.unitframes.general["uf_val_perc_divider"].."[Punkte] statt [Punkte]"..LolzenUIcfg.unitframes.general["uf_val_perc_divider"].."[Prozent]"
	L["uf_general_use_short_values"] = "Benutze kurze Zahlen (34m5, 3k2, etc)"
	L["uf_general_use dot_divider"] = "Benutze punkttrennung bei kurzen Zahlen (34.5m, 3.2k, etc)"
	L["uf_general_notice_reenables_options_below"] = "(Reaktiviert die Optionen unterhalb)"
	L["uf_general_notice_activate_hpperc_for_this"] = "Aktiviere HP Prozent hierfür"
	L["uf_general_notice_deactivate_hpperc_for_this"] = "Deaktiviere HP Prozent hierfür"
	L["uf_general_notice_activate_hpval_and_hpperc_for_this"] = "Aktiviere HPPunkte & HP Prozent hierfür"
	L["uf_general_hpdivider_text"] = "Trennsymbol"
	L["uf_general_leadindicator"] = "Gruppenanführer Symbol"
	L["uf_general_fadout_out_of_reach"] = "Transparente Einheitenfenster wenn außer Reichweite"
	L["uf_general_fadout_out_of_reach_alpha"] = "Außer Reichweiten Transparenz(Gruppe/Schlachzug)"
	L["uf_general_combatfade"] = "Aktiviere Kampftransparenz (Spieler, Ziel & Ziel des Ziels)"
	L["uf_general_combatfade_in_combat_alpha"] = "Transparenz im Kampf"
	L["uf_general_combatfade_out_of_combat_alpha"] = "Transparenz außerhalb vom Kampf"
	L["uf_general_hp_font_options"] = "Globale HP Punkt Optionen (kann individuell überschrieben werden)"
	L["sub_panel_unitframes_player"] = "Spieler"
	L["sub_panel_unitframes_player_title"] = "Einheitenfenster Modul: Spieler Optionen"
	L["sub_panel_unitframes_player_classpower_and_runes_header"] = "Klassenpunkte (Combo Punkte, ...) & Runen"
	L["sub_panel_unitframes_target"] = "Ziel"
	L["sub_panel_unitframes_target_title"] = "Einheitenfenster Modul: Ziel Optionen"
	L["sub_panel_unitframes_targettarget"] = "Ziel des Ziels"
	L["sub_panel_unitframes_targettarget_title"] = "Einheitenfenster Modul: Ziel des Ziels Optionen"
	L["sub_panel_unitframes_party"] = "Gruppe"
	L["sub_panel_unitframes_party_title"] = "Einheitenfenster Modul: Gruppe Optionen"
	L["sub_panel_unitframes_party_use_LolzenUI"] = "Benutze LolzenUI integrierte Gruppenfenster"
	L["sub_panel_unitframes_party_use_vertical_layout"] = "Benutze Vertikales Layout"
	L["sub_panel_unitframes_raid"] = "Schlachtzug"
	L["sub_panel_unitframes_raid_title"] = "Einheitenfenster Modul: Schlachtzug Optionen"
	L["sub_panel_unitframes_raid_use_LolzenUI"] = "Benutze LolzenUI integrierte Raidruppenfenster"
	L["sub_panel_unitframes_pet"] = "Begleiter"
	L["sub_panel_unitframes_pet_title"] = "Einheitenfenster Modul: Begleiter Optionen"
	L["sub_panel_unitframes_boss"] = "Boss"
	L["sub_panel_unitframes_boss_title"] = "Einheitenfenster Modul: Boss Optionen"
	L["sub_panel_unitframes_boss_placement"] = "Platzierung zusätzlicher Bossfenster"
	L["sub_panel_unitframes_boss_show_power"] = "Zeige Ressourcenleiste & punkte"
	L["sub_panel_unitframes_focus"] = "Fokus"
	L["sub_panel_unitframes_focus_title"] = "Einheitenfenster Modul: Fokus Optionen"
	L["sub_panel_unitframes_powercolors"] = "Ressourcen Farben"
	L["sub_panel_unitframes_powercolors_title"] = "Einheitenfenster Modul: Ressourcen Farben Optionen"
	L["sub_panel_unitframes_powercolors_mana"] = "Mana"
	L["sub_panel_unitframes_powercolors_rage"] = "Wut"
	L["sub_panel_unitframes_powercolors_focus"] = "Fokus"
	L["sub_panel_unitframes_powercolors_energy"] = "Energie"
	L["sub_panel_unitframes_powercolors_combopoints"] = "Combo Punkte"
	L["sub_panel_unitframes_powercolors_runes"] = "Runen"
	L["sub_panel_unitframes_powercolors_runicpower"] = "Runenmacht"
	L["sub_panel_unitframes_powercolors_soulshards"] = "Seelensplitter"
	L["sub_panel_unitframes_powercolors_lunarpower"] = "Astrale Macht"
	L["sub_panel_unitframes_powercolors_holypower"] = "Heilige Macht"
	L["sub_panel_unitframes_powercolors_maelstrom"] = "Mahlstrom"
	L["sub_panel_unitframes_powercolors_chi"] = "Chi"
	L["sub_panel_unitframes_powercolors_insanity"] = "Wahnsinn"
	L["sub_panel_unitframes_powercolors_arcanecharges"] = "Arkane Ladungen"
	L["sub_panel_unitframes_powercolors_fury"] = "Jähzorn"
	L["sub_panel_unitframes_powercolors_pain"] = "Pein"
	L["sub_panel_unitframes_omf"] = "Positionen"
	L["sub_panel_unitframes_omf_title"] = "Einheitenfenster Modul: Positionen [oUF_Movableframes]"
	L["sub_panel_unitframes_omf_about"] = "Tippe %s um Ankerpunkte An und Auszuschalten"
	-- worldmap
	L["wm_scale"] = "Weltkartenskalierung [reichweite: 0.1 - 1]"
	L["wm_coordinates"] = "Aktiviere Maus Koordinaten"
	L["wm_title_or_coordinates_color"] = "Titeltext/Koordinaten Farbe"
	L["save_worldmap_position"] = "Speichere die Weltkartenposition"
	-- xpbar
	L["xp_regular_xp_color"] = "Normale XP Farbe"
	L["xp_rested_xp_color"] = "Ausgeruhte XP Farbe"
	L["xp_pvp_color"] = "PvP Farbe (Ehre)"
	L["xp_paragon_color"] = "Paragon XP Farbe"
	L["xp_draw_1px"] = "Zeichne einen 1px Rahmen um die XPleiste"
	L["xp_1px_round"] = "Abgerundeter 1px Rahmen"
	L["xp_1px_notice"] = "Aktiviere 1px Rahmen für diese Option"
	L["xp_mouseover_text"] = "Zeige den Text bei Mouseover"
end