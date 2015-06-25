scriptName zadEventYokeWiggle extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousYoke) )
EndFunction

Function Execute(actor akActor)
	if akActor.GetCombatState() == 0
		libs.ybq.StruggleScene(akActor)
		if !libs.ybq.DisableStruggle
			libs.ybq.StruggleCount = libs.ybq.StruggleCount + 1
		EndIf
	EndIf
EndFunction
