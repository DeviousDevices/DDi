Scriptname zadBraEffect extends ActiveMagicEffect  

zadLibs Property Libs Auto

Actor Property target Auto
bool Property Terminate Auto

Function DoRegister()
	if !Terminate && target
		RegisterForSingleUpdate(5.0)
	EndIf
EndFunction

Function DoStart()
	if !Terminate && target
		RegisterForSingleUpdate(1.0)
	EndIf
EndFunction

Function DoUnregister()
	if !Terminate && target
		libs.ShowBreasts(Target)
		UnregisterForUpdate()
	EndIf
EndFunction


Event OnUpdate()
	if !Terminate
		if (!Target.GetWornForm(0x00000004) || Target.WornHasKeyword(libs.zad_DeviousHarness)) && !Target.WornHasKeyword(libs.zad_NoCompressBreasts)
			libs.HideBreasts(Target)
		Endif
	Else ; Avoid race condition
		libs.ShowBreasts(Target)
	EndIf
	DoRegister()
EndEvent


Event OnEffectStart(Actor akTarget, Actor akCaster)
	; if akTarget != libs.PlayerRef
	; 	return
	; EndIf
	libs.Log("OnEffectStart(): Bra")
	Target = akTarget
	Terminate = False

	if Target.WornHasKeyword(libs.zad_DeviousBra) && (!Target.GetWornForm(0x00000004) || Target.WornHasKeyword(libs.zad_DeviousHarness)) && !Target.WornHasKeyword(libs.zad_NoCompressBreasts)
		libs.HideBreasts(Target)
	EndIf
	DoStart()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Bra")
	Terminate = True
	libs.ShowBreasts(Target)
EndEvent

Event OnCellAttach()
	DoStart()
EndEvent

Event OnCellDetach()
	DoUnregister()
EndEvent