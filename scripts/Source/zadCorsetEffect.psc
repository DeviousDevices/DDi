Scriptname zadCorsetEffect extends ActiveMagicEffect  

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
		if (!Target.GetWornForm(0x00000004) || Target.WornHasKeyword(libs.zad_DeviousHarness))
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
	libs.Log("OnEffectStart(): Corset")
	Target = akTarget
	Terminate = False

	libs.StoreNodes(Target)
	OriginalNodeScale = libs.BellyNodeScale
	if Target.WornHasKeyword(libs.zad_DeviousCorset) && (!Target.GetWornForm(0x00000004) || Target.WornHasKeyword(libs.zad_DeviousHarness))
		libs.HideBelly(Target)
	EndIf
	RegisterForSingleUpdate(2.0)
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Corset")
	Terminate = True
	libs.ShowBelly(Target)
EndEvent
