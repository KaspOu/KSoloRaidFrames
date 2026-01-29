-------------------------------------------------------------------------------
-- French localization
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "D\195\169sactiv\195\169 : Conflit avec %s";
l.MSG_LOADED         = format("%s lanc\195\169 et actif", l.VERS_TITLE);

l.INIT_FAILED = format("%s pas charg\195\169 correctement (conflit ?) !", l.VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
    l.OPTION_RAIDSTYLE_ACTION = "Activez manuellement l'option "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_RAIDSTYLE_WARNING = "Activation auto de l'option "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Afficher \195\160 la fois les cadres de groupe et de raid (en raid) : %s"
    l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Tapez %s pour afficher/masquer les cadres de groupe en raid", l.YLL.."/sr group|r")
end

--@do-not-package@
-- https://www.townlong-yak.com/framexml/live/Helix/GlobalStrings.lua
-- https://code.google.com/archive/p/mangadmin/wikis/SpecialCharacters.wiki
-- https://wowwiki.fandom.com/wiki/Localizing_an_addon
--@end-do-not-package@
