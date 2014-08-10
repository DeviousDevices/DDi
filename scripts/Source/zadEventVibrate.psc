scriptName zadEventVibrate extends zadBaseLinkedEvent

Int Function GetChanceModified(actor akActor, int chanceMod)
	; include both tags for truely active effects
	float ret = Probability
	if libs.ActorHasKeyword(akActor, libs.zad_EffectLively)
		ret *= 1.5
	EndIf
	if libs.ActorHasKeyword(akActor, libs.zad_EffectVeryLively)
		ret *= 2
	EndIf
	return ((ret - Probability) as Int)
EndFunction

Bool Function Filter(actor akActor, int chanceMod=0)
	if !libs.Config.HardcoreEffects && akActor == libs.PlayerRef && akActor.GetCombatState() >= 1
		libs.Log("Player is in combat, and HardCoreEffects == false. Not starting new vibration effect.")
		return false	
	EndIf
	if akActor.IsInFaction(libs.Sexlab.ActorLib.AnimatingFaction)
		libs.Log("Player is in a sexlab scene. Not starting new vibration effect.")
		return false
	EndIf
	return (HasKeywords(akActor) && (akActor.WornHasKeyword(libs.zad_DeviousPlug) || akActor.WornHasKeyword(libs.zad_DeviousPiercingsNipple) || akActor.WornHasKeyword(libs.zad_DeviousPiercingsVaginal)) && Parent.Filter(akActor, GetChanceModified(akActor, chanceMod)))
EndFunction

bool Function HasKeywords(actor akActor)
	return (libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingRandom) || libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingVeryStrong) || libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingStrong) || libs.ActorHasKeyword(akActor, libs.zad_EffectVibrating) || libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingWeak) || libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingVeryWeak))
EndFunction

Function Execute(actor akActor)
	;libs.Log("VibrateEffect("+chance+")")
	int vibStrength = 0
	int duration = 0
		if libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingRandom)
			vibStrength = utility.RandomInt(1,5)
		elseif libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingVeryStrong)
			vibStrength = 5
		elseIf libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingStrong)
			vibStrength = 4
		elseIf libs.ActorHasKeyword(akActor, libs.zad_EffectVibrating)
			vibStrength = 3
		elseIf libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingWeak)
			vibStrength = 2
		elseIf libs.ActorHasKeyword(akActor, libs.zad_EffectVibratingVeryWeak)
			vibStrength = 1
		else
			return
		EndIf
		libs.VibrateEffect(akActor, vibStrength, duration, teaseOnly=libs.shouldEdgeActor(akActor))
EndFunction
