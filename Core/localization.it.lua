-------------------------------------------------------------------------------
-- Italian localization (ChatGPT)
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "Disattivato: Conflitto con %s";
l.MSG_LOADED         = format("%s caricato e attivo", l.VERS_TITLE);

l.INIT_FAILED = format("%s non inizializzato correttamente (conflitto ?) !", l.VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
    l.OPTION_RAIDSTYLE_ACTION = "Attiva manualmente l'opzione "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_RAIDSTYLE_WARNING = "Attivazione automatica dell'opzione "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Mostra sia i riquadri del gruppo che del raid (quando sei in raid): %s"
    l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Digita %s per alternare i riquadri del gruppo durante un raid", l.YLL.."/sr group|r")
end
