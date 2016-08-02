scriptName zadEventArmbinderWiggle extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousArmbinder) )
EndFunction

Function Execute(actor akActor)
	if akActor.GetCombatState() == 0
		libs.abq.StruggleScene(akActor)
		if !libs.abq.DisableStruggle
			libs.abq.StruggleCount = libs.abq.StruggleCount + 1
		EndIf
	EndIf
EndFunction
