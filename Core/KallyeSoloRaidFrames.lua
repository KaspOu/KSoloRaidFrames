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
	
	if msgIn == "edit" and ns.ShowEditMode then
		ns.ShowEditMode("PartyFrame");
	else
		ns.MODULES[1]:GetInfo();
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
		
		-- Load Module (standalone addon)
		local options = { SoloRaidFrame = true };
		ns.MODULES[1]:Init(options);
	end
end -- END ns.OnEvent

local function InitAddon(frame)

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
end



do
	local eventsFrame = CreateFrame("Frame", nil, UIParent)
	InitAddon(eventsFrame);
end