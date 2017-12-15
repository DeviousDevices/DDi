Scriptname zadYokeScript extends zadRestraintScript

zadYokeQuestScript Property ybq Auto

; Messages
Message Property zad_YokePreEquipMsg Auto
Message Property zad_YokeEquipPostMsg Auto
Message Property zad_YokeDisableLocksMsg Auto
Message Property zad_YokeEnableLocksMsg Auto
Message Property CustomStruggleImpossibleMsg = None Auto
Message Property CustomStruggleMsg = None Auto

Bool Property Locked = true Auto

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		if akActor == libs.PlayerRef
			zad_YokeEquipPostMsg.Show()
		Else
			libs.NotifyActor("You slip "+GetMessageName(akActor)+" arms in to the Yoke, which locks with a soft click.", akActor, true)
		EndIf
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction


Function OnEquippedPost(actor akActor)
	akActor.UnequipItemSlot(36) ; Unequip ring to avoid clipping
	if akActor == libs.PlayerRef
		libs.UpdateControls()
		ybq.IsLoose = False
		ybq.StruggleCount = 0
		If BaseEscapeChance > 0
			ybq.EnableStruggling()
		Else
			ybq.DisableStruggling()			
		EndIf
		if CustomStruggleImpossibleMsg
			ybq.CustomStruggleImpossibleMsg = CustomStruggleImpossibleMsg
		EndIf
		if CustomStruggleMsg
			ybq.CustomStruggleMsg = CustomStruggleMsg
		EndIf
		ybq.EnableDialogue()
		SetCustomMessage()
	EndIf
	libs.ApplyBoundAnim(akActor)
EndFunction


Function SetCustomMessage()
	SetDefaultMessages()
EndFunction


Function SetDefaultMessages()
	ybq.CustomStruggleMsg = None
	ybq.CustomStruggleImpossibleMsg = None
EndFunction

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if ! akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Yoke).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousArmbinder)
			MultipleItemFailMessage("Armbinder")
			return 2
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousStraitjacket)
			MultipleItemFailMessage("Straitjacket")
			return 2
		EndIf
	EndIf
	if akActor != libs.PlayerRef || silent
		return 0 ; Proceed.
	EndIf
        int interaction = zad_YokePreEquipMsg.show()
        if interaction == 0 ; Equip Device
		ybq.IsLocked = Locked
		return 0 ; Proceed
	ElseIf interaction == 1 ; Manipulate Locks
		if Locked
			zad_YokeDisableLocksMsg.Show()
			Locked = False
		Else
			zad_YokeEnableLocksMsg.Show()
			Locked = True
		EndIf
		return OnEquippedFilter(akActor)
	ElseIf interaction == 2 ; Put it away
		return 2
	EndIf
	libs.Error("Invalid menu option selected for Yoke Script")
	return 0
EndFunction


Function DeviceMenu(Int msgChoice = 0)
	msgChoice = ybq.ShowDeviceMenu(msgChoice)
	DeviceMenuExt(msgChoice)
	SyncInventory()
EndFunction


Function OnRemoveDevice(actor akActor)
	if akActor == libs.PlayerRef
		SetDefaultMessages()
	EndIf
	if !libs.IsAnimating(akActor)
		Debug.SendAnimationEvent(akActor, "IdleForceDefaultState")
	EndIf
EndFunction
