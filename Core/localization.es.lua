-------------------------------------------------------------------------------
-- Spanish localization (ChatGPT)
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil
l.CONFLICT_MESSAGE = "Desactivado: Conflicto con %s";
l.MSG_LOADED         = format("%s cargado y activo", l.VERS_TITLE);

l.INIT_FAILED = format("%s no se inicializ\195\179 correctamente (\194\191conflicto?)!", l.VERS_TITLE);


--? Edit Mode - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
  l.OPTION_RAIDSTYLE_ACTION = "Activar manualmente la opci\195\179n "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_RAIDSTYLE_WARNING = "Activando autom\195\161ticamente la opci\195\179n "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU..": "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Mostrar tanto los marcos de grupo como de banda (mientras est\195\169s en banda): %s"
  l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Escribe %s para alternar los marcos de grupo en banda", l.YLL.."/sr group|r")
end
