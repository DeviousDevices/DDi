Scriptname zadBraEffect extends ActiveMagicEffect  

zadLibs Property Libs Auto

Actor Property target Auto
bool Property Terminate Auto

float Property OriginalNodeScale Auto

Function DoRegister()
	if !Terminate && target
		RegisterForSingleUpdate(5.0)
	EndIf
EndFunction


Event OnUpdate()
	if !Terminate
		if !Target.GetWornForm(0x00000004)
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

	libs.StoreNodes(Target)
	OriginalNodeScale = libs.BreastNodeScale
	if Target.WornHasKeyword(libs.zad_DeviousBra) && !Target.GetWornForm(0x00000004)
		libs.HideBreasts(Target)
	EndIf
	DoRegister()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Bra")
	Terminate = True
	libs.ShowBreasts(Target)
EndEvent
