Scriptname zadBellyEffect extends ActiveMagicEffect  

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
		libs.ShowBelly(Target)
		UnregisterForUpdate()
	EndIf
EndFunction


Event OnUpdate()
	if !Terminate
		if (!Target.GetWornForm(0x00000004) || Target.WornHasKeyword(libs.zad_DeviousHarness)) || Target.WornHasKeyword(libs.zad_DeviousBelt) || Target.WornHasKeyword(libs.zad_DeviousCorset) && !Target.WornHasKeyword(libs.zad_NoCompressBelly)
			libs.HideBelly(Target)
		Endif
	Else ; Avoid race condition
		libs.ShowBelly(Target)
	EndIf
	DoRegister()
EndEvent


Event OnEffectStart(Actor akTarget, Actor akCaster)
	; if akTarget != libs.PlayerRef
	; 	return
	; EndIf
	libs.Log("OnEffectStart(): Belly")
	Target = akTarget
	Terminate = False

	if (Target.WornHasKeyword(libs.zad_DeviousCorset) || Target.WornHasKeyword(libs.zad_DeviousBelt)) && (!Target.GetWornForm(0x00000004) || Target.WornHasKeyword(libs.zad_DeviousHarness)) && !Target.WornHasKeyword(libs.zad_NoCompressBelly)
		libs.HideBelly(Target)
	EndIf
	DoStart()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Belly")
	Terminate = True
	libs.ShowBelly(Target)
EndEvent

Event OnCellAttach()
	DoStart()
EndEvent

Event OnCellDetach()
	DoUnregister()
EndEvent