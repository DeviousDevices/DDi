scriptName zadEventYokeWiggle extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousYoke) )
EndFunction

Function Execute(actor akActor)
	if akActor.GetCombatState() != 0
		; Don't start this particular event in combat.
		return
	EndIf
	libs.ybq.StruggleScene(akActor)
	if !libs.ybq.DisableStruggle
		libs.ybq.StruggleCount = libs.ybq.StruggleCount + 1
	EndIf
EndFunction
