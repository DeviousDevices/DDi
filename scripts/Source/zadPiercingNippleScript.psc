Scriptname zadPiercingNippleScript extends zadRestraintScript  

string strFailEquip =  "The bra you are wearing prevents you from inserting these piercings."

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if !akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Nipple Piercings).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousBra)
			if akActor == libs.PlayerRef && !silent
				libs.NotifyActor(strFailEquip, akActor, true)
			ElseIf  !silent
				libs.NotifyActor("The bra " + akActor.GetLeveledActorBase().GetName() + " is wearing prevents you from inserting these piercings.", akActor, true)
			EndIf
			if !silent
				return 2
			Else
				return 0
			EndIf
		Endif
	Endif
	return 0
EndFunction


Function OnEquippedPre(actor akActor, bool silent=false)
	if !akActor.HasPerk(libs.PiercedNipples)
		akActor.AddSpell(libs.PiercedNipplesSpell, true)
	Endif
	if !silent
		libs.NotifyActor("You carefully slip the piercings into "+GetMessageName(akActor)+" nipples. A quiet 'Click' is heard as the band clicks together, now seemingly seamless. ", akActor, true)
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction


Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost PiercingNipples")
	
EndFunction

int Function OnUnequippedFilter(actor akActor)
	if akActor.WornHasKeyword(libs.zad_DeviousBra)
		return 1
	EndIf
	return 0
EndFunction

Function DeviceMenu(Int msgChoice = 0)
        msgChoice = zad_DeviceMsg.Show() ; display menu
	if msgChoice==0 ; Not wearing a bra, no piercings
		Debug.Notification("You choose to put the piercings in.")
		libs.EquipDevice(libs.PlayerRef, deviceInventory, deviceRendered, zad_DeviousDevice)
	elseif msgChoice==1 ; Wearing a bra, no piercings
		Debug.MessageBox(strFailEquip)
	elseif msgChoice==2 ; Not wearing a bra, Remove piercings with tool
		DeviceMenuRemoveWithKey()
	elseif msgChoice==3 ; Wearing a bra, piercings
		NoKeyFailMessage(libs.PlayerRef)
	elseif msgChoice==4 ; Force them out
		if libs.playerRef.WornhasKeyword(libs.zad_DeviousBra)
			NoKeyFailMessage(libs.playerRef)
		Else
			DeviceMenuRemoveWithoutKey()
		EndIf
	Endif
	DeviceMenuExt(msgChoice)
	SyncInventory()
EndFunction
		

Function NoKeyFailMessage(Actor akActor)
	if akActor == libs.PlayerRef
		libs.NotifyPlayer("Try as you might, the bra you are wearing prevents you from removing the piercings.", true)
	Else
		libs.NotifyNPC("The bra that "+akActor.GetLeveledActorBase().GetName() + " is wearing is securely locking the piercings in place. You must remove it prior to removing them.", true)
	EndIf
EndFunction
