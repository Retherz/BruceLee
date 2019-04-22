BruceLee_SpellID = 0;
BruceLee_Name = "";
BruceLee_StartCast = 0;
BruceLee_LastCast = 0;

BruceLee_Com_LastInterrupt = 0;

BruceLee_SpellNames = {
  ["ROGUE"] = "Kick",
  ["WARRIOR"] = "Pummel",
  ["MAGE"] = "Counterspell",
}

function BruceLee_OnEvent()
if(event == "CHAT_MSG_ADDON") then
  if(arg1 == "BruceLee" and arg2 == BruceLee_Target()) then
    BruceLee_Com_LastInterrupt = math.floor(GetTime() * 100) / 100;
  end
  return;
end
  if(UnitExists("target")) then
    if(strfind(arg1, UnitName("target"))) then
      if(strfind(arg1, "begins to cast")) then
        BruceLee_StartCast = GetTime();
      end
    end
  end
end


function BruceLee_OnLoad()
  if(GetSpellName(1, "spell") ~= nil) then
    BruceLee_SetSpellIDs();
    BruceLee_AddOnFrame:SetScript("OnUpdate", nil);
    BruceLee_AddOnFrame:SetScript("OnEvent", BruceLee_OnEvent);
    BruceLee_AddOnFrame:RegisterEvent("CHAT_MSG_ADDON");
    BruceLee_AddOnFrame:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE");
    BruceLee_AddOnFrame:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF");
  end
end

local frame = CreateFrame("Frame", "BruceLee_AddOnFrame");
BruceLee_AddOnFrame:SetScript("OnUpdate", BruceLee_OnLoad);

function BruceLee_SetSpellIDs()
  local _, englishClass = UnitClass("player");
  local i = 1;
  while BruceLee_SpellNames[englishClass] ~= nil do
   local spellName = GetSpellName(i, "spell")
    if(spellName == BruceLee_SpellNames[englishClass]) then
      BruceLee_SpellID = i;
      BruceLee_Name = BruceLee_SpellNames[englishClass];
      return;
    end
    if not spellName then
      break
    end
   i = i + 1
  end
  BruceLee_AddOnFrame:SetScript("OnUpdate", nil);
  BruceLee_AddOnFrame:SetScript("OnEvent", nil);
end

function BruceLee_GetCooldown()
  local duration, cd = GetSpellCooldown(BruceLee_SpellID, "spell");
  if(cd == 0) then
    return 0;
  else
    return cd - (GetTime() - duration);
  end
end

function BruceLee_Kick()
  local t = math.floor(GetTime() * 100) / 100;
  if(UnitExists("target") and BruceLee_SpellID ~= 0 and BruceLee_GetCooldown() == 0 and GetTime() - BruceLee_StartCast < 1.4 and t ~= BruceLee_LastCast and t ~= BruceLee_Com_LastInterrupt) then
    BruceLee_LastCast = t;
    BruceLee_CommunicateKick();
    CastSpellByName(BruceLee_Name);
    return true;
  end
  return false;
end

function BruceLee_CommunicateKick()
  if(GetNumRaidMembers() == 0) then
    SendAddonMessage("BruceLee", BruceLee_Target(), "PARTY");
  else
    SendAddonMessage("BruceLee", BruceLee_Target(), "RAID");
  end
end

function BruceLee_Target()
  local c = GetRaidTargetIndex(target);
  c = c ~= nil and c or 0;
  return UnitName("target") .. c;
end
