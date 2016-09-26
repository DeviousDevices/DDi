Scriptname zadPlugLockingScript extends zadEquipScript

Keyword Property zad_DeviousBelt Auto

string strFailEquipBelt =  "Try as you might, the belt you are wearing prevents you from inserting this plug."
string strFailEquipHarness =  "Try as you might, the harness you are wearing prevents you from inserting this plug."

int Function OnEquippedFilter(actor akActor, bool silent=false)
	; FTM optimization
	if silent && akActor != libs.PlayerRef
		return 0
	EndIf
	if akActor.WornHasKeyword(libs.zad_DeviousBelt)
		if akActor == libs.PlayerRef && !silent
			libs.NotifyActor(strFailEquipBelt, akActor, true)
		ElseIf  !silent
			libs.NotifyActor("The belt " + akActor.GetLeveledActorBase().GetName() + " is wearing prevents you from inserting this plug.", akActor, true)
		EndIf
		if !silent
			return 2
		Else
			return 0
		EndIf
	Endif
	if akActor.WornHasKeyword(libs.zad_DeviousHarness)
		if akActor == libs.PlayerRef && !silent
			libs.NotifyActor(strFailEquipHarness, akActor, true)
		ElseIf  !silent
			libs.NotifyActor("The harness " + akActor.GetLeveledActorBase().GetName() + " is wearing prevents you from inserting this plug.", akActor, true)
		EndIf
		if !silent
			return 2
		Else
			return 0
		EndIf
	Endif
	return 0
EndFunction

Function OnEquippedPre(actor akActor, bool silent=false)
	; Check to see if old (slot 54) plug is being used.
	int slotMask = deviceRendered.GetSlotMask()
	if (Math.LogicalAnd(slotMask, 0x01000000)) ; Slot 54
		libs.Warn("Legacy (Slot 54) plug detected. Updating slotmask...")
		slotMask = ((slotMask - 0x01000000) + 0x08000000)
		deviceRendered.SetSlotMask(slotMask)
	EndIf
	string msg = ""
	if akActor == libs.PlayerRef
		if Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Desire")
			msg = "As you gently slide the plug in, you hear a sharp click and suddenly feel very full."
		elseif Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Horny")
			msg = "You slowly push the plug into your hole and let out a quiet gasp when it expands, locking itself securely in place."
		elseif Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Desperate")
			msg = "You insert the plug inside your sensitive opening and it clicks, suddenly growing in volume and filling you with delight."
		else
			msg = "You impatiently thrust the plug deep into yourself and its rapid expansion makes your legs clench together instinctively."
		endif
	else
		msg = akActor.GetLeveledActorBase().GetName() + " shudders as you push the plug into her."
	EndIf
	if !silent
		libs.NotifyActor(msg, akActor, true)
	EndIf
EndFunction


Function OnEquippedPost(actor akActor)
	Utility.Wait(5)
	bool legacyPlugs = false
	; Slots 48 and 57 Anal and Vaginal plugs      
	Form analSlot = akActor.GetWornForm(0x00040000)
	Form vagSlot = akActor.GetWornForm(0x08000000)
	if analSlot && vagSlot && analSlot == vagSlot
		legacyPlugs = true
	EndIf
EndFunction


Function DeviceMenu(Int msgChoice = 0)
        msgChoice = zad_DeviceMsg.Show() ; display menu
	if msgChoice==0 ; Not wearing a belt/harness, no plugs
		Debug.Notification("You choose to put the plugs in.")
		libs.EquipDevice(libs.PlayerRef, deviceInventory, deviceRendered, zad_DeviousDevice)
	elseif msgChoice==1 ; Wearing a harness, no plugs
		Debug.MessageBox(strFailEquipHarness)
	elseif msgChoice==2 ; Wearing a belt, no plugs
		Debug.MessageBox(strFailEquipBelt)
	elseif msgChoice==3 ; Not wearing a belt/harness, plugs
		string msg = ""
		;DeviceMenuRemoveWithKey()
		if RemoveDeviceWithKey() ;Using this instead of DeviceMenuRemoveWithKey() to show a custom success message
			if Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Desire")
				msg = "You unlock the plug and it contracts, allowing you to remove it without much hassle."
			elseif Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Horny")
				msg = "The mechanism rumbles as it reduces the plug to a more manageable size and you slowly pull it out."
			elseif Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Desperate")
				msg = "You turn the key very slowly to ease your body into letting the plug go and feel a tinge of regret as you slide it out."
			else
				msg = "It takes all the focus you can muster to properly disengage the plug's locking mechanism, but once you do it practically falls out of your lubricated opening."
			endif
			libs.NotifyPlayer(msg, true)
		endif
	elseif msgChoice==4 ; Wearing a harness, plugs
		NoKeyFailMessageHarness(libs.PlayerRef)
	elseif msgChoice==5 ; Wearing a belt, plugs
		NoKeyFailMessageBelt(libs.PlayerRef)
	elseif msgChoice==7 ; Force it out
		if libs.playerRef.WornhasKeyword(libs.zad_DeviousBelt)
			NoKeyFailMessageBelt(libs.playerRef)
		ElseIf libs.playerRef.WornhasKeyword(libs.zad_DeviousHarness)
			NoKeyFailMessageHarness(libs.playerRef)
		Else
			DeviceMenuRemoveWithoutKey()
		EndIf
	Endif
	DeviceMenuExt(msgChoice)
	SyncInventory()
EndFunction
		

Function NoKeyFailMessageBelt(Actor akActor)
	if akActor == libs.PlayerRef
		libs.NotifyPlayer("Try as you might, the belt you are wearing prevents you from removing these plugs.", true)
	Else
		libs.NotifyNPC("The belt that "+akActor.GetLeveledActorBase().GetName() + " is wearing is securely locking this plug in place. You must remove it prior to removing the plug.", true)
	EndIf
EndFunction

Function NoKeyFailMessageHarness(Actor akActor)
	if akActor == libs.PlayerRef
		libs.NotifyPlayer("Try as you might, the harness you are wearing prevents you from removing these plugs.", true)
	Else
		libs.NotifyNPC("The harness that "+akActor.GetLeveledActorBase().GetName() + " is wearing is securely locking this plug in place. You must remove it prior to removing the plug.", true)
	EndIf
EndFunction
