scriptName zadEventChaosPlug extends zadEventVibrate

bool Function HasKeywords(actor akActor)
	return (libs.ActorHasKeyword(akActor, libs.zad_EffectChaosPlug))
EndFunction

Function Execute(actor akActor)
	;libs.Log("VibrateEffect("+chance+")")
	int selection = utility.RandomInt(1,4)
	if selection == 1 || akActor.GetCombatState() >= 1
		libs.ShockActor(akActor)
	Else
		libs.VibrateEffect(akActor, (selection+1), 0, teaseOnly=libs.shouldEdgeActor(akActor))
	EndIf
EndFunction