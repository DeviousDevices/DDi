scriptName zadEventHorny extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	int arousal = libs.Aroused.GetActorExposure(akActor)
	float CombatModifier = 1
	if akActor.GetCombatState() == 1
		CombatModifier = 0.5
	EndIf
	if arousal >= libs.ArousalThreshold("Desperate")
		chanceMod += 20
	ElseIf arousal >= libs.ArousalThreshold("Horny")
		chanceMod += 10
	EndIf
	 return ((akActor.WornHasKeyword(libs.zad_DeviousBelt) || akActor.WornHasKeyword(libs.zad_DeviousHarness)) && (arousal >= libs.ArousalThreshold("Desire") && Parent.Filter(akActor, (chanceMod * combatModifier) as Int)))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("You absent-mindedly allow your hands to wander...")
	; want to buy table
	int i = Utility.RandomInt(1,3)
	Idle anim
	if i == 1
		anim = libs.AnimSwitchKeyword(akActor, libs.zad_DeviousArmbinder, libs.ddZazaparmbzad03, libs.DDZazhornyA)
	ElseIf i == 2
		anim = libs.AnimSwitchKeyword(akActor, libs.zad_DeviousArmbinder, libs.ddZazaparmbzad09, libs.DDZazhornyB)
	Else
		anim = libs.AnimSwitchKeyword(akActor, libs.zad_DeviousArmbinder, libs.ddZazaparmbzad10, libs.DDZazhornyC)
	EndIf
	libs.PlayThirdPersonAnimation(akActor, anim, Utility.RandomInt(5,10), permitRestrictive=true)
EndFunction
