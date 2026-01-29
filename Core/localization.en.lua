-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------
local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "Disabled: Conflict with %s";
l.MSG_LOADED         = format("%s loaded and active", l.VERS_TITLE);

l.INIT_FAILED = format("%s not initialized correctly (conflict?)!", l.VERS_TITLE);


-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
  l.MSG_LOADED = l.MSG_LOADED.."\nType "..l.YLL.."/sr group|r to toggle party frames while in raid"
  l.OPTION_RAIDSTYLE_ACTION = "Manually activate option "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_RAIDSTYLE_WARNING = "Auto-activating option "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU..": "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
  l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "Show both party and raid frames (while in raid): %s"
  l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("Type %s to toggle party frames while in raid", l.YLL.."/sr group|r")
end

