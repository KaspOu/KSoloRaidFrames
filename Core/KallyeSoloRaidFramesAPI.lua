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