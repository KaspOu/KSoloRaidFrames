local _, ns = ...
local l = ns.I18N;

if ns.CONFLICT then
	return
end

function ns.ShowEditMode(window)
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
function ns.Hook_CompactPartyFrame_UpdateVisibility()
	if (not IsInRaid() and not IsInGroup()) then
		CompactPartyFrame:SetShown(true);
	end
end

--[[
! Solo Raid Frames Classic
- Show Party/Raid Frames even if solo
]]
local Blizzard_GetDisplayedAllyFrames = GetDisplayedAllyFrames; -- protect original behavior

function ns.SoloRaid_GetDisplayedAllyFrames()
	-- Call original default behavior
	local daf = Blizzard_GetDisplayedAllyFrames()

	if not daf then
		return 'party'
	else
		return daf
	end
end

local Blizzard_CompactRaidFrameContainer_OnEvent = CompactRaidFrameContainer_OnEvent;  -- protect original behavior

function ns.SoloRaid_CompactRaidFrameContainer_OnEvent(self, event, ...)
	-- Call original default behavior
	Blizzard_CompactRaidFrameContainer_OnEvent(self, event, ...)

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

function ns.CheckForSoloFrames()
	if (EditModeManagerFrame.UseRaidStylePartyFrames and not EditModeManagerFrame:UseRaidStylePartyFrames()) then
		ns.AddMsgWarn(ns.TITLE.." - "..l.OPTION_SOLORAID_TOOLTIP);
		ns.ShowEditMode("PartyFrame");
	else
		ns.AddMsg(l.MSG_LOADED);
	end
end