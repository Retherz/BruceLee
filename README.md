# BruceLee
Kick shit - supports Pummel, Kick and Counterspell


```
/run if(BruceLee_Kick()) then SendChatMessage(UnitName("player") .. " interrupted - <Friend> are next.", "PARTY"); end
```

```
/run if(BruceLee_Kick()) then SendChatMessage(UnitName("player") .. " interrupted.", "SAY"); end
```

Mage:

```
/run if(BruceLee_Kick()) then SpellStopCasting() CastSpellByName("Counterspell") SendChatMessage(UnitName("player") .. " interrupted.", "SAY"); end
```

