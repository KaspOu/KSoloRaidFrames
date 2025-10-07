-------------------------------------------------------------------------------
-- Spanish localization (ChatGPT)
-------------------------------------------------------------------------------

if (GetLocale() ~= "esES" and GetLocale() ~= "esMX") then return end
local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil
l.CONFLICT_MESSAGE = "Desactivado: Conflicto con %s";
l.MSG_LOADED         = format("%s cargado y activo", l.VERS_TITLE);

l.INIT_FAILED = format("%s no se inicializó correctamente (¿conflicto?)!", l.VERS_TITLE);


--? Edit Mode - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
  l.OPTION_RAIDSTYLE_ACTION = "Activar manualmente la opción "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_RAIDSTYLE_WARNING = "Activando automáticamente la opción "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU..": "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
end
