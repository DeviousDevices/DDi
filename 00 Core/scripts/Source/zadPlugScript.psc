Scriptname zadPlugScript extends zadEquipScript

Keyword Property zad_DeviousBelt Auto

string strFailEquipBelt =  "Try as you might, the belt you are wearing prevents you from inserting this plug."
string strFailEquipHarness =  "Try as you might, the harness you are wearing prevents you from inserting this plug."

int Function OnEquippedFilter(actor akActor, bool silent=false)
	; FTM optimization
	if silent && akActor != libs.PlayerRef
		return 0
	EndIf	
	if akActor == libs.PlayerRef && !silent
		int i = libs.zad_PlugsConfirmMSG.Show()
		If i != 0
			return 2
		EndIf
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
	If !deviceKey
		if akActor == libs.PlayerRef
			if Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Desire")
				msg = "Your hole is now filled, as is your desire for pleasure."
			elseif Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Horny")
				msg = "You slowly insert the plug inside your opening, your lust growing with every inch it slides in."
			elseif Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Desperate")
				msg = "You insert the plug inside your opening and take great delight in the resulting feelings of pleasure."
			else
				msg = "Barely in control of control your own body you thrust the plug almost forcefully into the appropriate opening."
			endif
		else
			msg = akActor.GetLeveledActorBase().GetName() + " shudders as you push the plugs in to her."
		EndIf
	Else
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
			msg = akActor.GetLeveledActorBase().GetName() + " shudders as you push the plug into her and lock it."
		EndIf
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

Function RemovePlugNoLock()
	If libs.Playerref.WornHasKeyword(libs.zad_DeviousBelt)
		; display a different message if it's likely a belt harness:
		If libs.Playerref.WornHasKeyword(libs.zad_DeviousHarness)
			NoKeyFailMessageHarness(libs.playerRef)
		else
			NoKeyFailMessageBelt(libs.playerRef)
		EndIf
		return
	EndIf
	if deviceRendered.HasKeyword(libs.zad_kw_InflatablePlugVaginal) && (libs.zadInflatablePlugStateVaginal.GetValueInt() > 0)
		libs.notify("You cannot remove this plug as long as it is inflated.", messagebox = true)
		return
	elseif deviceRendered.HasKeyword(libs.zad_kw_InflatablePlugAnal) && (libs.zadInflatablePlugStateAnal.GetValueInt() > 0)
		libs.notify("You cannot remove this plug as long as it is inflated.", messagebox = true)
		return
	EndIf
	string msg = ""
	if Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Desire")
		msg = "You easily slide the plug out of your hole and feel no regret."
	elseif Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Horny")
		msg = "Despite the pleasure it provides, you remove the plug from your hole."
	elseif Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Desperate")
		msg = "Despite your body telling you otherwise, you reluctantly pull the plug from your now well lubricated opening."
	else
		msg = "It takes all the willpower that you can muster to relax your muscles enough to let the plug slide out."
	endif
	libs.NotifyPlayer(msg, true)
	RemoveDevice(libs.PlayerRef)	
EndFunction

Function RemovePlugLock()
	If libs.Playerref.WornHasKeyword(libs.zad_DeviousBelt)
		; display a different message if it's likely a belt harness:
		If libs.Playerref.WornHasKeyword(libs.zad_DeviousHarness)
			NoKeyFailMessageHarness(libs.playerRef)
		else
			NoKeyFailMessageBelt(libs.playerRef)
		EndIf
		return
	EndIf
	if deviceRendered.HasKeyword(libs.zad_kw_InflatablePlugVaginal) && (libs.zadInflatablePlugStateVaginal.GetValueInt() > 0)
		libs.notify("You cannot remove this plug as long as it is inflated.", messagebox = true)
		return
	elseif deviceRendered.HasKeyword(libs.zad_kw_InflatablePlugAnal) && (libs.zadInflatablePlugStateAnal.GetValueInt() > 0)
		libs.notify("You cannot remove this plug as long as it is inflated.", messagebox = true)
		return
	EndIf
	string msg = ""	
	if RemoveDeviceWithKey() 
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
EndFunction

Function DeviceMenu(Int msgChoice = 0)
	msgChoice = zad_DeviceMsg.Show() ; display menu
	if msgChoice==0 ; put in
		; check if she is plugged already:
		If deviceRendered.HasKeyword(libs.zad_DeviousPlugAnal) && libs.Playerref.WornHasKeyword(libs.zad_DeviousPlugAnal)
			libs.notify("Your backside is filled with an anal plug already!", messagebox = true)
			return
		EndIf
		If deviceRendered.HasKeyword(libs.zad_DeviousPlugVaginal) && libs.Playerref.WornHasKeyword(libs.zad_DeviousPlugVaginal)
			libs.notify("You are filled with a vaginal plug already!", messagebox = true)
			return
		EndIf
		If libs.Playerref.WornHasKeyword(libs.zad_DeviousBelt)
			Debug.MessageBox(strFailEquipBelt)
			return
		EndIf
		If deviceRendered.HasKeyword(libs.zad_DeviousPlugAnal)
			libs.notify("You slide the plug into your backside, sending waves of pleasure through your body.", messagebox = true)
		Else
			libs.notify("You open your legs and slide the plug inside you, sending waves of pleasure through your body.", messagebox = true)
		EndIf
		libs.EquipDevice(libs.PlayerRef, deviceInventory, deviceRendered, zad_DeviousDevice)
	elseif msgChoice==1 ; take out
		If deviceKey == None
			RemovePlugNoLock()
		Else
			RemovePlugLock()
		EndIf		
	elseif msgChoice==5 && deviceKey ; Force it out
		if libs.playerRef.WornhasKeyword(libs.zad_DeviousBelt)
			NoKeyFailMessageBelt(libs.playerRef)		
		Else
			DeviceMenuRemoveWithoutKey()
		EndIf
	Endif
	DeviceMenuExt(msgChoice)
	SyncInventory()
EndFunction
		
Function NoKeyFailMessageBelt(Actor akActor)
	if akActor == libs.PlayerRef
		libs.NotifyPlayer("Try as you might, the belt you are wearing prevents you from removing this plug.", true)
	Else
		libs.NotifyNPC("The belt that "+akActor.GetLeveledActorBase().GetName() + " is wearing is securely locking this plug in place. You must remove it prior to removing the plug.", true)
	EndIf
EndFunction

Function NoKeyFailMessageHarness(Actor akActor)
	if akActor == libs.PlayerRef
		libs.NotifyPlayer("Try as you might, the harness you are wearing prevents you from removing this plug.", true)
	Else
		libs.NotifyNPC("The harness that "+akActor.GetLeveledActorBase().GetName() + " is wearing is securely locking this plug in place. You must remove it prior to removing the plug.", true)
	EndIf
EndFunction
