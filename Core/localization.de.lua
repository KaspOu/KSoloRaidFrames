-------------------------------------------------------------------------------
-- German localization (ChatGPT)
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "Deaktiviert: Konflikt mit %s";
l.MSG_LOADED         = format("%s geladen und aktiv", l.VERS_TITLE);

l.INIT_FAILED = format("%s nicht korrekt geladen (Konflikt ?)!", l.VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
    l.OPTION_RAIDSTYLE_ACTION = "Aktivieren Sie manuell die Option "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_RAIDSTYLE_WARNING = "Automatische Aktivierung der Option "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Zeige sowohl Gruppen- als auch Schlachtzugsrahmen (im Schlachtzug): %s"
    l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Gib %s ein, um die Gruppenrahmen während eines Schlachtzugs umzuschalten", l.YLL.."/sr group|r")
end
