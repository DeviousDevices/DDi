ScriptName zadGagEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto
SexLabFramework Property Sexlab Auto
import MfgConsoleFunc

actor Property Target Auto
Bool Property Terminate Auto

Function ClearMFG(actor ActorRef)
	ActorRef.ClearExpressionOverride()
	ResetPhonemeModifier(ActorRef)
EndFunction

Function DoRegister()
	if !Terminate && target
		RegisterForSingleUpdate(1.0)
	EndIf
EndFunction

Function DoUnregister()
	if !Terminate && target
		UnregisterForUpdate()
	EndIf
EndFunction

Function DoApply()
	if !Terminate && target
		ApplyGagEffect()
		DoRegister()
	EndIf
EndFunction

Event OnUpdate()
	DoApply()
EndEvent

Function ApplyGagEffect()
	if Target.Is3DLoaded() && !Target.IsDead() && !Target.IsDisabled()
		Shout theShout = Target.GetEquippedShout()
		If theShout != None
			Target.UnequipShout(TheShout)
		EndIf
		libs.ApplyGagEffect(Target)
	EndIf
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectStart(gag)")
	target = akTarget
	Terminate = False
	DoApply()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(gag)")
	Terminate = true
	Utility.Wait(0.2) ; Wait for menus to close
	ClearMFG(target)
EndEvent

Event OnCellLoad()
	DoApply()
EndEvent

Event OnCellAttach()
	DoApply()
EndEvent

Event OnLoad()
	DoApply()
EndEvent

Event OnCellDetach()
	DoUnregister()
EndEvent

Event OnUnload()
	DoUnregister()
EndEvent

