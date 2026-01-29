-------------------------------------------------------------------------------
-- Korean localization (ChatGPT)
-------------------------------------------------------------------------------

local _, ns = ...
local l = ns.I18N;

l.VERS_TITLE    = format("%s %s", ns.TITLE, ns.VERSION);

l.OPTION_RAIDSTYLE_ACTION = nil
l.OPTION_RAIDSTYLE_WARNING = nil

l.CONFLICT_MESSAGE = "비활성화됨: %s와(과) 충돌";
l.MSG_LOADED         = format("%s 로드 및 활성화됨", l.VERS_TITLE);

l.INIT_FAILED = format("%s이(가) 올바르게 로드되지 않았습니다 (충돌?).", l.VERS_TITLE);

-- Edit Mode RaidStyle PF - Since DragonFlight (10)
if (EditModeManagerFrame.UseRaidStylePartyFrames) then
    l.OPTION_RAIDSTYLE_ACTION = "옵션 "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")".."을(를) 수동으로 활성화하십시오.";
    l.OPTION_RAIDSTYLE_WARNING = "옵션 "..l.YLL..HUD_EDIT_MODE_SETTING_UNIT_FRAME_RAID_STYLE_PARTY_FRAMES.."|r ("..HUD_EDIT_MODE_MENU.." : "..HUD_EDIT_MODE_PARTY_FRAMES_LABEL..")".."이(가) 자동으로 활성화됩니다.";
    l.OPTION_SOLORAID_GROUPINRAID_TOOLTIP = "레이드 중에 파티 및 레이드 프레임을 모두 표시: %s"
    l.MSG_LOADED = l.MSG_LOADED.."\n"..l.CY..format("%s를 입력하면 레이드 중 파티 프레임을 전환할 수 있습니다", l.YLL.."/sr group|r")
end
