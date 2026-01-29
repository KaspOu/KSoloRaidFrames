-------------------------------------------------------------------------------
-- Portuguese localization (ChatGPT)
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil
l.CONFLICT_MESSAGE = "Desativado: Conflito com %s";
l.MSG_LOADED         = format("%s carregado e ativo", l.VERS_TITLE);

l.INIT_FAILED = format("%s n\195\163o carregado corretamente (conflito ?) !", l.VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
    l.OPTION_RAIDSTYLE_ACTION = "Ative manualmente a op\195\167\195\163o "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_RAIDSTYLE_WARNING = "Ativa\195\167\195\163o autom\195\161tica da op\195\167\195\163o "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
    l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Mostrar os quadros de grupo e raide ao mesmo tempo (quando em raide): %s"
    l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Digite %s para alternar os quadros de grupo durante a raide", l.YLL.."/sr group|r")
end
