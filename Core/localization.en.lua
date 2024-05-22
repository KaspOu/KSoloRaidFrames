-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------



KS_VERS_TITLE    = format("%s %s", KS_TITLE, KS_VERSION);

KS_OPTION_SOLORAID_TOOLTIP = "#"

KS_CONFLICT_MESSAGE = "Disabled: Conflict with %s";
KS_MSG_LOADED         = format("%s loaded and active", KS_VERS_TITLE);

KS_INIT_FAILED = format("%s not initialized correctly (conflict?)!", KS_VERS_TITLE);


-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
  KS_OPTION_SOLORAID_TOOLTIP = "I suggest you to activate option "..YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU..": "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")";
end
