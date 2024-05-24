--[[
	Hello to K Solo Raid Frames
	Last version: @project-version@ (@project-date-iso@)
]]

local _, ns = ...
local l = ns.I18N;
local isInit = false;
local isLoaded = false;


local function SLASH_KS_command(msgIn)
	if (not isLoaded) then
		ns.AddMsgWarn(l.INIT_FAILED);
		return;
	end
	
	if msgIn == "edit" then
		ns.ShowEditMode("PartyFrame");
	else
		ns.CheckForSoloFrames();
	end
end

local function SLASH_CLEAR_command()
	SELECTED_CHAT_FRAME:Clear()
end

local function OnEvent(self, event, ...)
	local arg1 = select(1, ...);
	if (event == "ADDON_LOADED" and arg1 == ns.ADDON_NAME) then
		self:UnregisterEvent("ADDON_LOADED");
		isLoaded = true;
		-- ! SoloRaid Frames
			if (EditModeManagerFrame.UseRaidStylePartyFrames) then
				-- Edit Mode - Since DragonFlight (10)
				hooksecurefunc(CompactPartyFrame, "UpdateVisibility", ns.Hook_CompactPartyFrame_UpdateVisibility);
			else
				-- Classic
				CompactRaidFrameManager:Show()
				CompactRaidFrameManager.Hide = function() end
				CompactRaidFrameContainer:Show()
				CompactRaidFrameContainer.Hide = function() end

				GetDisplayedAllyFrames = ns.SoloRaid_GetDisplayedAllyFrames;
				CompactRaidFrameContainer_OnEvent = ns.SoloRaid_CompactRaidFrameContainer_OnEvent;
			end

		-- ! Addon Loaded ^^
		if (EditModeManagerFrame.UseRaidStylePartyFrames and not EditModeManagerFrame:UseRaidStylePartyFrames()) then
			ns.AddMsgWarn(ns.TITLE.." - "..l.OPTION_SOLORAID_TOOLTIP);
		end
	end
end -- END ns.OnEvent

local function OnLoad(frame)

	SlashCmdList["KS"] = SLASH_KS_command;
	SLASH_KS1 = "/ks";
	SLASH_KS2 = "/sr";
	SLASH_KS3 = "/ksr";
	SLASH_KS4 = "/kallyesolo";

	if (ns.CONFLICT) then
		ns.AddMsgErr(format(l.CONFLICT_MESSAGE, ns.CONFLICT_WITH));
		return;
	end

	SlashCmdList["CLEAR"] = SLASH_CLEAR_command;
	SLASH_CLEAR1 = "/clear";

	if (isInit or InCombatLockdown()) then return; end

	isInit = true;
	frame:SetScript("OnEvent",
		function(frame, event, ...)
			OnEvent(frame, event, ...);
		end
	);
	frame:RegisterEvent("ADDON_LOADED");
end -- END ns.OnLoad



do
	local eventsFrame = CreateFrame("Frame", nil, UIParent)
	OnLoad(eventsFrame);
end