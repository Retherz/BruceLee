# BruceLee 1.1
Kick shit - supports Pummel, Kick and Counterspell

Allows you to only use your interrupt if your target has started casting less than 1.5 seconds ago. The addon communicates with other users of the addon based on raid symbols and target name to reduce multiple uses of interrupts on the same target and the same cast.


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
