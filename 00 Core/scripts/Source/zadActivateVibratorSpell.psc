ScriptName zadActivateVibratorSpell extends ActiveMagicEffect

zadLibs Property libs Auto
zadBQ00 Property zadQuest Auto
zadDeviousMagic Property zadMagic Auto

Int Property Strength Auto
Int Property Duration Auto ; If duration is 0, will be random duration
Bool Property FireAndForget Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if FireAndForget
		; Non-channeled
		libs.VibrateEffect(akTarget, Strength, Duration, teaseOnly=libs.ShouldEdgeActor(akTarget))
	else
		; Channeled
		if !zadMagic.IsRunning
			zadMagic.IsRunning = True ; Initialize immediately to mitigate probable race condition.
			if libs.ActorHasKeyword(akTarget, libs.zad_EffectVibratingVeryStrong) || libs.ActorHasKeyword(akTarget, libs.zad_EffectVibratingStrong) || libs.ActorHasKeyword(akTarget, libs.zad_EffectVibrating) || libs.ActorHasKeyword(akTarget, libs.zad_EffectVibratingWeak) || libs.ActorHasKeyword(akTarget, libs.zad_EffectVibratingVeryWeak) || libs.ActorHasKeyword(akTarget, libs.zad_EffectVibratingRandom)
				zadMagic.StartChannel(akCaster, akTarget)
				libs.VibrateEffect(akTarget, Strength, 120, teaseOnly=libs.ShouldEdgeActor(akTarget))
				zadMagic.TerminateChannel()
			EndIf
			zadMagic.IsRunning = False
		EndIf
	EndIf
EndEvent

; Event OnEffectFinish(Actor akTarget, Actor akCaster)
; 	libs.Log("ActivateVibrator: OnEffectFinish()")
; 	libs.StopVibrating(akTarget)
; EndEvent
