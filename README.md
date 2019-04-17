# BruceLee
Kick shit - supports Pummel, Kick and Counterspell


```
/run if(BruceLee_Kick()) then SendChatMessage(UnitName("player") .. " interrupted - <Friend> is next.", "PARTY"); end
```

```
/run if(BruceLee_Kick()) then SendChatMessage(UnitName("player") .. " interrupted.", "SAY"); end
```

Mage:

```
/run if(BruceLee_Kick()) then SpellStopCasting() CastSpellByName("Counterspell") SendChatMessage(UnitName("player") .. " interrupted.", "SAY"); end
```

https://www.youtube.com/watch?v=EZATcStzaBM
