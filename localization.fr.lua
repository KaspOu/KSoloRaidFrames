-------------------------------------------------------------------------------
-- French localization
-------------------------------------------------------------------------------

if (GetLocale() == "frFR") then

KS_VERS_TITLE    = format("%s %s", KS_TITLE, KS_VERSION);

KS_OPTION_SOLORAID_TOOLTIP = "#"

KS_CONFLICT_MESSAGE = "D\195\169sactiv\195\169 : Conflit avec %s";
KS_MSG_LOADED         = format("%s lanc\195\169 et actif", KS_VERS_TITLE);

KS_INIT_FAILED = format("%s pas charg\195\169 correctement (conflit ?) !", KS_VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
    KS_OPTION_SOLORAID_TOOLTIP = "Pensez \195\160 activer l'option "..YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
end

--@do-not-package@
-- https://code.google.com/archive/p/mangadmin/wikis/SpecialCharacters.wiki
-- https://wowwiki.fandom.com/wiki/Localizing_an_addon
--@end-do-not-package@
end
