-------------------------------------------------------------------------------
-- Russian localization ZamestoTV
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "Отключено: Конфликт с %s";
l.MSG_LOADED         = format("%s загружен и активен", l.VERS_TITLE);

l.INIT_FAILED = format("%s не инициализирован корректно (конфликт?)!", l.VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
  l.OPTION_RAIDSTYLE_ACTION = "Вручную активируйте опцию "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_RAIDSTYLE_WARNING = "Автоматическая активация опции "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU..": "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Отображать и групповые, и рейдовые рамки (во время рейда): %s"
  l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Введите %s для переключения групповых рамок в рейде", l.YLL.."/sr group|r")
end
