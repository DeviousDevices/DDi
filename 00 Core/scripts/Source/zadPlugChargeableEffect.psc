ScriptName zadPlugChargeableEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto
SexlabFramework Property Sexlab Auto


Bool Property Terminate Auto
actor Property Target Auto
Int Property GemSize Auto ; 1: Petty, 2: Leser, 3: Common, 4: Greater, 5: Grand

; If I use a property here, this data will be lost on RemoveAll, and similar effects. Globals would deny NPC support, etc, etc.
; Think I'll try using storageutil for this.
; Int Property CurrentCharge Auto

Function DoRegisterModEvent()
	UnregisterForModEvent("DeviceActorOrgasm")
	RegisterForModEvent("DeviceActorOrgasm", "OnActorOrgasm")
EndFunction

Function DoUnregisterModEvent()
	UnregisterForModEvent("DeviceActorOrgasm")
EndFunction

Event OnActorOrgasm(string eventName, string argString, float argNum, form sender)
	libs.Log("OnActorOrgasm("+argString+")")
	libs.StopVibrating(Target)
	libs.NotifyPlayer("Energy rapidly drains from the soulgem as you are brought to orgasm...")
	StorageUtil.SetIntValue(Target, "zad.SoulgemChargeValue", Utility.RandomInt(20, 40))
EndEvent

Function DoRegister()
	if !Terminate ; Avoid race condition resulting in papyrus error
		RegisterForSingleUpdateGameTime(1.0) ; Check every hour
	EndIf
EndFunction


Event OnUpdateGameTime()
	ApplyPlugEffects()
	DoRegister()
EndEvent


Function ApplyPlugEffects()
	if libs.Aroused.GetActorArousal(Target) >= 99
		int CurrentCharge = StorageUtil.GetIntValue(Target, "zad.SoulgemChargeValue") 
		int ChargeGain = (7-GemSize)
		CurrentCharge += ChargeGain
		StorageUtil.SetIntValue(Target, "zad.SoulgemChargeValue", CurrentCharge)
		libs.Log("Charged Soulgem. Current Charge ["+ CurrentCharge+ "]. Gained ["+chargeGain+"] this tick.")
		if CurrentCharge >= 100
			libs.VibrateEffect(Target, 4, 120)
		Else
			if Target == libs.PlayerRef
				If CurrentCharge >= 90
					libs.NotifyPlayer("The soulgem within you pulses in a way that arouses you greatly.")
				ElseIf CurrentCharge >= 75
					libs.NotifyPlayer("The soulgem within you grows uncomfortably warm, and moves slightly.")
				ElseIf CurrentCharge >= 50
					libs.NotifyPlayer("The soulgem within you grows uncomfortably warm, before cooling again.")
				ElseIf CurrentCharge >= 25
					libs.NotifyPlayer("The soulgem within you grows warm briefly, before cooling again.")
				Else
					libs.NotifyPlayer("It may be your imagination, though you think that the soulgem within you moved just now.")
				EndIf
			EndIf
		EndIf
	Else
		libs.Log("Did not charge "+Target.GetLeveledActorBase().GetName()+"' soulgem. Arousal: "+libs.Aroused.GetActorArousal(Target))
	EndIf
EndFunction


Event OnEffectStart(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectStart(Chargeable)")
	Target = akTarget
	Terminate = False
	; Set in zadPlugChargeableScript.psc
	; StorageUtil.SetIntValue(Target, "zad.SoulgemChargeValue", 0)
	DoRegisterModEvent()
	DoRegister()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Terminate = True
	DoUnregisterModEvent()
	libs.StopVibrating(Target)
	libs.Log("OnEffectFinish(Chargeable)")
EndEvent

Event OnCellLoad()
	DoRegisterModEvent()
	DoRegister()
EndEvent

Event OnCellAttach()
	DoRegisterModEvent()
	DoRegister()
EndEvent

Event OnLoad()
	DoRegisterModEvent()
	DoRegister()
EndEvent

