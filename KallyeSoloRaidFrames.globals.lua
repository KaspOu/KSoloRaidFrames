
KS_VERSION       = C_AddOns.GetAddOnMetadata("KallyeSoloRaidFrames", "Version");
KS_VERSIONNR     = tonumber(gsub(KS_VERSION, "%D", ""), 10);
if (C_AddOns.GetAddOnInfo) then
  KS_ADDON_NAME,KS_TITLE, KS_NOTES = C_AddOns.GetAddOnInfo("KallyeSoloRaidFrames");
else
  KS_ADDON_NAME,KS_TITLE, KS_NOTES = GetAddOnInfo("KallyeSoloRaidFrames");
end

if (C_AddOns.GetAddOnInfo and C_AddOns.IsAddOnLoaded) then
  KS_CONFLICT_WITH, KS_CONFLICT = select(2, C_AddOns.GetAddOnInfo("KallyeRaidFrames")), C_AddOns.IsAddOnLoaded("KallyeRaidFrames");
else
  _, KS_CONFLICT_WITH, _, KS_CONFLICT = GetAddOnInfo("KallyeRaidFrames");
end


-- Returns a chat color code string
function BCC(r, g, b)
  return string.format("|cff%02x%02x%02x", (r*255), (g*255), (b*255));
end

RDL = BCC(1.0, 0.3, 0.3);
YLL = BCC(1.0, 1.0, 0.5);
CY  = BCC(0.5, 1.0, 1.0);