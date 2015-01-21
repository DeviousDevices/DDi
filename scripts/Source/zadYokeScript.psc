Scriptname zadYokeScript extends zadRestraintScript

zadYokeQuestScript Property ybq Auto

; Messages
Message Property zad_YokePreEquipMsg Auto
Message Property zad_YokeEquipPostMsg Auto
Message Property zad_YokeDisableLocksMsg Auto
Message Property zad_YokeEnableLocksMsg Auto

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
		ybq.EnableStruggling()
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
	msgChoice = ybq.ShowYokeMenu(msgChoice)
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
