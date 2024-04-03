--[[
	Hello to Kallye Solo Raid Frames
	Last version: @project-version@ (@project-date-iso@)
]]

local isInit = false;
local isLoaded = false;


function KS_OnLoad(self)

	SlashCmdList["KS"] = SLASH_KS_command;
	SLASH_KS1 = "/ks";
	SLASH_KS2 = "/sr";
	SLASH_KS3 = "/kallyesolo";

	if (KS_CONFLICT) then
		KS_AddMsgErr(format(KS_CONFLICT_MESSAGE, KS_CONFLICT_WITH));
		return;
	end

	SlashCmdList["CLEAR"] = SLASH_CLEAR_command;
	SLASH_CLEAR1 = "/clear";

	if (isInit or InCombatLockdown()) then return; end

	isInit = true;
	self:SetScript("OnEvent",
		function(self, event, ...)
			KS_OnEvent(self, event, ...);
		end
	);
	self:RegisterEvent("ADDON_LOADED");
end -- END KS_OnLoad

-- KS_OnEvent
function KS_OnEvent(self, event, ...)
	local arg1 = select(1, ...);
	if (event == "ADDON_LOADED" and arg1 == KS_ADDON_NAME) then
		self:UnregisterEvent("ADDON_LOADED");
		isLoaded = true;
		-- ! SoloRaid Frames
			if (EditModeManagerFrame.UseRaidStylePartyFrames) then
				-- Edit Mode - Since DragonFlight (10)
				_G.hooksecurefunc(CompactPartyFrame, "UpdateVisibility", KS_Hook_CompactPartyFrame_UpdateVisibility);
			else
				-- Classic
				_G.CompactRaidFrameManager:Show()
				_G.CompactRaidFrameManager.Hide = function() end
				_G.CompactRaidFrameContainer:Show()
				_G.CompactRaidFrameContainer.Hide = function() end

				_G.GetDisplayedAllyFrames = KS_SoloRaid_GetDisplayedAllyFrames;
				_G.CompactRaidFrameContainer_OnEvent = KS_SoloRaid_CompactRaidFrameContainer_OnEvent;
			end

		-- ! Addon Loaded ^^
		if (EditModeManagerFrame.UseRaidStylePartyFrames and not EditModeManagerFrame:UseRaidStylePartyFrames()) then
			KS_AddMsgWarn(KS_TITLE.." - "..KS_OPTION_SOLORAID_TOOLTIP);
		end
	end
end -- END KS_OnEvent

function SLASH_KS_command(msgIn)
	if (not isLoaded) then
		KS_AddMsgWarn(KS_INIT_FAILED);
		return;
	end
	
	if msgIn == "edit" then
		KS_ShowEditMode("PartyFrame");
	else
		CheckForSoloFrames();
	end
end

function SLASH_CLEAR_command()
	SELECTED_CHAT_FRAME:Clear()
end