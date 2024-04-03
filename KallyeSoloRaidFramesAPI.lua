function KS_ShowEditMode(window)
	if (not EditModeManagerFrame.UseRaidStylePartyFrames) then
		return;
	end
	ShowUIPanel(EditModeManagerFrame);
	if window == "PartyFrame" then
		C_EditMode.SetAccountSetting(Enum.EditModeAccountSetting.ShowPartyFrames, 1);
		--EditModeManagerFrame:SelectSystem(PartyFrame);
		PartyFrame:SelectSystem();
		PartyFrame:HighlightSystem();
	end
end

--[[
! Solo Raid Frames main, since DragonFlight (10)
- Show Raid Frames if solo
]]
function KS_Hook_CompactPartyFrame_UpdateVisibility()
	if (not IsInRaid() and not IsInGroup()) then
		CompactPartyFrame:SetShown(true);
	end
end

--[[
! Solo Raid Frames Classic
- Show Party/Raid Frames even if solo
]]
local KS_Blizzard_GetDisplayedAllyFrames = GetDisplayedAllyFrames; -- protect original behavior
function KS_SoloRaid_GetDisplayedAllyFrames()
	-- Call original default behavior
	local daf = KS_Blizzard_GetDisplayedAllyFrames()

	if not daf then
		return 'party'
	else
		return daf
	end
end
local KS_Blizzard_CompactRaidFrameContainer_OnEvent = CompactRaidFrameContainer_OnEvent;  -- protect original behavior
function KS_SoloRaid_CompactRaidFrameContainer_OnEvent(self, event, ...)
	-- Call original default behavior
	KS_Blizzard_CompactRaidFrameContainer_OnEvent(self, event, ...)

	-- If all these are true, then the above call already did the TryUpdate
	local unit = ... or ""
	if ( unit == "player" or strsub(unit, 1, 4) == "raid" or strsub(unit, 1, 5) == "party" ) then
		return
	end
	-- Always update the RaidFrame
	if ( event == "UNIT_PET" ) and ( self.displayPets ) then
		CompactRaidFrameContainer_TryUpdate(self)
	end
end

function CheckForSoloFrames()
	if (EditModeManagerFrame.UseRaidStylePartyFrames and not EditModeManagerFrame:UseRaidStylePartyFrames()) then
		KS_AddMsgWarn(KS_TITLE.." - "..KS_OPTION_SOLORAID_TOOLTIP);
		KS_ShowEditMode("PartyFrame");
	else
		KS_AddMsg(KS_MSG_LOADED);
	end
end

--[[
!  Default chat
]]
function KS_AddMsg(msg)
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s%s|r", YLL, msg or ""));
	end
end
--[[
!  Warning chat
]]
function KS_AddMsgWarn(msg)
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s%s|r", CY, msg or ""));
	end
end

--[[
!  Error chat
]]
function KS_AddMsgErr(msg)
	if (DEFAULT_CHAT_FRAME) then
		DEFAULT_CHAT_FRAME:AddMessage(format("%s%s: %s|r", RDL, KS_TITLE, msg or ""));
	end
end