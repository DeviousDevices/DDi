Scriptname zadEquipScript extends ObjectReference  

; Libraries
zadlibs Property libs Auto
slaUtilScr Property Aroused Auto

; Dialog
Message Property zad_DeviceMsg auto        	; Device interaction message
Message Property zad_DeviceMsgMagic auto   	; Device removal via magic message
Message Property zad_DeviceRemoveMsg auto  	; Device removal message
Message Property zad_DeviceEscapeMsg Auto	; Device escape message

; Item Types
Armor Property deviceRendered Auto         ; Internal Device
Armor Property deviceInventory Auto        ; Inventory Device
Key Property deviceKey  Auto               ; Key type to unlock this device
Bool Property JammedLock = False Auto      ; Is the lock currently jammed? (Deprecated, do NOT use!)
MiscObject Property Lockpick Auto

; Keywords
Keyword Property zad_DeviousDevice Auto

; Persistant Variables
Quest Property deviceQuest Auto
String Property deviceName Auto

Float Property BaseEscapeChance = 10.0 Auto	; Device escape difficulty: This is the base chance to make a succesful escape attempt in %. E.g. a value of 10 means that 1 in 10 escape attempts are succesful.

Keyword[] Property EquipConflictingDevices Auto ; These item keywords, if present on the character, will prevent the item from getting equipped, unless a script does it.
Keyword[] Property EquipRequiredDevices Auto ; These item keywords, if NOT present on the character, will prevent the item from getting equipped, unless a script does it.
Keyword[] Property UnEquipConflictingDevices Auto ; These item keywords, if present on the character, will prevent the item from getting unequipped, unless a script does it.
Message Property zad_EquipConflictFailMsg auto ; This message will get displayed if an item fails to equip due to present keyword conflicts. Make sure to explain the conflicts, so the player knows what's going on!
Message Property zad_EquipRequiredFailMsg auto ; This message will get displayed if an item fails to equip due to missing keyword conflicts. Make sure to explain the conflicts, so the player knows what's going on!
Message Property zad_UnEquipFailMsg auto ; This message will get displayed if an item fails to unequip due to keyword conflicts. Make sure to explain the conflicts, so the player knows what's going on!

; Local Variables
bool menuDisable = false
int mutexTimeout = 10
bool unequipMutex
Bool RemovedWithSuccess = True
Bool RemovedViaEscape = False
Float LastEscapeAttemptAt
Int EscapeAttemptsMade = 0

Function MultipleItemFailMessage(string offendingItem)
	offendingItem = libs.MakeSingularIfPlural(offendingItem)
	libs.NotifyPlayer("It is impossible to wear multiple " + offendingItem + "s simultaneously.", true)
	libs.Log("Actor attempted to equip multiple "+offendingItem+"s simultaneously ("+zad_DeviousDevice+").")
EndFunction


bool Function ShouldEquipSilently(actor akActor)
	; Differentiate between item being forced on actor, and voluntary equips.
	if !UI.IsMenuOpen("ContainerMenu") && (akActor != libs.PlayerRef || !UI.IsMenuOpen("InventoryMenu"))
		libs.Log("No menus are open. Equipping silently.")
		return true
	EndIf
	return false
EndFunction


Event OnEquipped(Actor akActor)
	libs.Log("OnEquipped("+akActor.GetLeveledActorBase().GetName()+": "+deviceInventory.GetName()+")")
	bool silently = ShouldEquipSilently(akActor)
	if akActor.WornHasKeyword(zad_DeviousDevice) && akActor.GetItemCount(deviceRendered) == 0
 		menuDisable = true
		if akActor != libs.PlayerRef
			if silently
				; If no menus are open, this duplication was likely caused by FTM. Avoid duplication.
				; libs.Log("Avoiding FTM duplication bug.")
			Else
				akActor.UnequipItem(deviceInventory, false, true)
				MultipleItemFailMessage(deviceName)
				akActor.RemoveItem(deviceInventory, 1, true)
				libs.PlayerRef.AddItem(deviceInventory, 1, true)
			EndIf
		Else
			MultipleItemFailMessage(deviceName)
			akActor.UnequipItem(deviceInventory, false, true)
		EndIf
		libs.DeviceMutex = false
        return
	EndIf
	; Check to see if item state is broken
	libs.ReEquipExistingDevice(akActor, zad_DeviousDevice)
	if akActor.WornHasKeyword(zad_DeviousDevice)
		libs.Log("OnEquipped(): Detected/fixed broken item state. " + akActor.GetLeveledActorBase().GetName() + " has rendered "+deviceName+" in inventory still.")
		menuDisable = true
		akActor.UnequipItem(deviceInventory, false, true)
		libs.DeviceMutex = false
		return
	Endif
	int filter = OnEquippedFilter(akActor, silent=silently)
	if filter >= 1
		if filter == 2
			menuDisable = true
			akActor.UnequipItem(deviceInventory, false, true)
		EndIf
		libs.DeviceMutex = false
		return
	EndIf
	; check for device conflicts
	If !silently && (IsEquipDeviceConflict(akActor) || IsEquipRequiredDeviceConflict(akActor))
		menuDisable = true
		akActor.UnequipItem(deviceInventory, false, true)
		libs.DeviceMutex = false
		return
    EndIf
	libs.CleanupDevices(akActor, zad_DeviousDevice, deviceRendered)
	; I would extend this to NPC's, but I am concerned about potential bloating.
	; ( NPC's going out of cell, resetting inventories, etc. without OnRemoveDevice() being called )
	if akActor == libs.PlayerRef ; Store equipped devices for faster generic calls.
		StoreEquippedDevice(akActor)
		StorageUtil.SetIntValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus", 0)
	EndIf
	OnEquippedPre(akActor, silent=silently)
	libs.SendDeviceEquippedEvent(deviceName, akActor)
	libs.SendDeviceEquippedEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
	; akActor.SetOutfit(libs.zadEmptyOutfit, True)
	akActor.EquipItem(DeviceInventory, false, true)
	akActor.EquipItem(DeviceRendered, true, true)
	SyncInventory(akActor)
	libs.DeviceMutex = false
	if akActor != libs.PlayerRef
		libs.RepopulateNpcs()
	EndIf

    ; Store the time the device can be removed, but only for the PC, and 
    ; only if it's a generic item.  Honestly, we're still probably going to be
    ; storing times for devices that will never be checked (piercings?), but
    ; I'm unsure of the cost-benefit of having a large list of keywords to
    ; accept/reject.  Plus the maintenance overhead may not make it worth the
    ; coder's time.
    ; Also, though it would be nice to toggle different devices off and on in
    ; MCM, it would be hell to maintain, especially as some devices have their
    ; own manual add/removal code, which bypasses the lock shield removal
    ; check, which breaks the Rule Of Least Surprise...
    if (akActor == libs.PlayerRef) \
            && (libs.config.lockShieldActive) \
            && !( deviceRendered.HasKeyword(libs.zad_BlockGeneric) || deviceInventory.HasKeyword(libs.zad_BlockGeneric) ) \
			&& !( deviceRendered.HasKeyword(libs.zad_QuestItem) || deviceInventory.HasKeyword(libs.zad_QuestItem) ) \
            && ( !(deviceRendered.HasKeyword(libs.zad_DeviousBlindfold) || deviceRendered.HasKeyword(libs.zad_DeviousGag)) \
                    || libs.config.lockShieldDebilitating \
               )
        StorageUtil.SetFloatValue( \
                akActor, \
                "zad_LockShieldTime" + deviceRendered, \
                utility.GetCurrentGameTime() + (utility.RandomInt(libs.config.lockShieldMinTime, libs.Config.lockShieldMaxTime) as Float / 24.0) \
        )
    endif

	OnEquippedPost(akActor)
EndEvent


Event OnUnequipped(Actor akActor)
	unequipMutex = true
	libs.Log("OnUnequipped("+akActor.GetLeveledActorBase().GetName()+": "+deviceInventory.GetName()+")")
	
	if StorageUtil.GetIntValue(akActor, "zad_RemovalToken" + deviceInventory, 0) >= 1
		if OnUnequippedFilter(akActor) >= 1
			libs.Log("OnUnequipped(): Detected removal token, but OnUnequippedFilter return >= 1. Not removing device.")
			; Clear removal token
			StorageUtil.UnsetIntValue(akActor, "zad_RemovalToken"+deviceInventory)
			; Cleanup
			unequipMutex = false
			libs.DeviceMutex = false
			EquipDevice(akActor, skipMutex=true)
			SyncInventory(akActor)
		else
			libs.Log("Detected removal token. Done.")
			akActor.RemoveItem(deviceRendered, 1, true) ; This should not be necessary, but ensure that SD+ bug does not reoccur.
			UnsetStoredDevice(akActor)
			OnRemoveDevice(akActor)
			StorageUtil.UnsetIntValue(akActor, "zad_RemovalToken"+deviceInventory)
			unequipMutex = false
			libs.DeviceMutex = false
			If akActor == libs.playerref
				StorageUtil.UnSetIntValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus")
                ; Always unset zad_LockShieldTime even if not enabled, as it may
                ; have been disabled after the device was equipped.
                StorageUtil.UnsetFloatValue(akActor, "zad_LockShieldTime" + deviceRendered)
			Endif
		EndIf
	else
		if akActor==libs.PlayerRef
			if (menuDisable == false)
				; Catch removeallitems and similar effects for compatibility with impolite mods.
				; Not doing this for npc's, since equip state can't be relied upon for them.
				if akActor.GetItemCount(deviceInventory) <=0
					libs.Log("Caught remove-all. Re-equipping device.")
					EquipDevice(akActor, skipMutex=true)
					return
				EndIf
				if !libs.PlayerRef.IsEquipped(deviceRendered) 
					libs.Log("Rendered device is missing. Sync'ing...")
					SyncInventory()
					if !libs.PlayerRef.IsEquipped(deviceRendered)
					libs.Log("Rendered device is still missing. done.")
						unequipMutex = false 
						libs.deviceMutex = false
						return
					EndIf
				EndIf
				; Player had to unequip item to access this. Reequip it immediately, to help avoid spam-unlocks.
				libs.PlayerRef.EquipItem(deviceInventory, false, true)
				DeviceMenu()
			Else
				menuDisable = false
			Endif
		Endif
		unequipMutex = false
	EndIf	
EndEvent


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	libs.Log("OnContainerChanged()")
	bool avoidRaceCondition = unequipMutex
	; if avoidRaceCondition ; basic spinlock to avoid race condition
	; 	int timeoutCount = 0
	; 	int i = 0
	; 	while unequipMutex
	; 		if (timeoutCount >= mutexTimeout)
	; 			libs.Error("Spinlock timed out.")
	; 			return
	; 		EndIf
	; 		Utility.Wait(0.5)
	; 		timeoutCount += 1
	; 	EndWhile
	; EndIf
	if OnContainerChangedFilter(akNewContainer, akOldContainer) < 1
		if akNewContainer && !akOldContainer
			; PC or NPC picked up belt. No action required.
			; Actually, this could be a neat way of initiating a belt quest. Loot it from a chest, and bam.
			; xxx
			return
		elseif akOldContainer && !akNewContainer
			; Item is being dropped.
			if libs.IsWearingDevice((akOldContainer as actor), DeviceRendered, zad_DeviousDevice) == 1
				libs.Log(deviceName+" dropped.")
				self.Delete()
			Endif
			return
		else
			; Item is changing inventories, or being stored in a container 
			if akNewContainer != libs.PlayerRef
				; Avoid giving away last copy of worn item.
				if (akOldContainer.GetItemCount(deviceInventory) >= 1 && !avoidRaceCondition) || (akOldContainer.GetItemCount(deviceRendered)== 0 && !avoidRaceCondition)
					libs.Log("Giving item away. Not last copy.")
					Actor npc = (akNewContainer as Actor)
					if npc != none && !npc.IsDead(); TODO: Add gender check (User commented about sos futa? Look in to that maybe?)
						; Differentiate between intentionally giving it away, and having it stolen by (submit/SD/etc). Hmmm.
						; Inventory, Barter, Container
						if UI.IsMenuOpen("ContainerMenu")
							libs.Log("ContainerMenu is open, and container is "+npc.GetLeveledActorBase().GetName()+". Forcing npc to equip device.")
							; Giving item to an npc, equip it.
							if libs.WearingConflictingDevice(npc, deviceRendered, zad_DeviousDevice)
								libs.NotifyPlayer(npc.GetLeveledActorBase().GetName()+" is already wearing a "+deviceName+"!")
								npc.RemoveItem(deviceInventory, 1, false, libs.PlayerRef)
							Else
								If !IsEquipDeviceConflict(npc) && !IsEquipRequiredDeviceConflict(npc)
									libs.EquipDevice(npc, deviceInventory, deviceRendered, zad_DeviousDevice)
								Endif
							EndIf
							; OnEquipped(npc) ; Not sure why this isn't being called for npc's. Temporary work-around.
						EndIf
					EndIf
					return
				EndIf
				libs.Log(deviceName+" is switching containers. Count: " + akOldContainer.GetItemCount(deviceInventory))
				akNewContainer.RemoveItem(deviceInventory, 1, true)
				akNewContainer.RemoveItem(deviceRendered, 1, true)
			else
				Actor npc = (akOldContainer as Actor)
				; Is this an npc, or a container?
				if npc != none && npc.GetItemCount(deviceRendered)!=0
					if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousArmbinder)
						libs.Notify("The armbinder you are wearing prevents you from removing the "+deviceName+" from " + npc.GetLeveledActorBase().GetName() + ".")
						npc.AddItem(deviceInventory, 1, true)
						npc.EquipItem(deviceInventory, false, true)
						libs.PlayerRef.RemoveItem(deviceInventory, 1, true)
						return
					EndIf
					; handle belts locking in plugs
					if npc.WornHasKeyword(libs.zad_DeviousBelt) && DeviceRendered.HasKeyword(libs.zad_DeviousPlugVaginal) || (DeviceRendered.HasKeyword(libs.zad_DeviousPlugAnal) && !npc.WornHasKeyword(libs.zad_PermitAnal))
						libs.Notify(npc.GetLeveledActorBase().GetName() + " is wearing a chastity belt. You can't remove the " + deviceName)
						npc.AddItem(deviceInventory, 1, true)
						npc.EquipItem(deviceInventory, false, true)
						libs.PlayerRef.RemoveItem(deviceInventory, 1, true)
						return
					EndIf
					if npc.WornHasKeyword(libs.zad_DeviousBra) && (DeviceRendered.HasKeyword(libs.zad_DeviousPiercingsNipple) && !DeviceRendered.HasKeyword(libs.zad_BraNoBlockPiercings))
						libs.Notify(npc.GetLeveledActorBase().GetName() + " is wearing a chastity bra. You can't remove the " + deviceName)
						npc.AddItem(deviceInventory, 1, true)
						npc.EquipItem(deviceInventory, false, true)
						libs.PlayerRef.RemoveItem(deviceInventory, 1, true)
						return
					EndIf
					if npc.IsDead() 
						RemoveDevice(npc, skipMutex=true)
						return
					EndIf
					; Does the player have the right key?
					if deviceKey && libs.PlayerRef.GetItemCount(deviceKey) >= 1
						; Free npc.
						If !IsUnEquipDeviceConflict(npc)
							libs.Notify("You use the key to unlock the "+deviceName+" from " + npc.GetLeveledActorBase().GetName() + ".")
							RemoveDevice(npc, skipMutex=true)
						EndIf
					; Does not have correct key
					else
						; Does npc have multiple instances of this device?
						if npc.GetItemCount(deviceInventory) <= 0 
							; Does this device not have a key?
							if deviceKey == none
								if OnUnequippedFilter(npc) >= 1
									npc.AddItem(deviceInventory, 1, true)
									libs.PlayerRef.RemoveItem(deviceInventory, 1, true)
									NoKeyFailMessage(npc)
								else
									libs.Notify("You remove the "+deviceName+" from "+ npc.GetLeveledActorBase().GetName() + ".")
									RemoveDevice(npc, skipMutex=true)
								EndIf
							; Device has a key, player does not have it
							else
								libs.Notify("You lack the key required to free " + npc.GetLeveledActorBase().GetName() + " from the "+deviceName+".")
								npc.AddItem(deviceInventory, 1, true)
								npc.EquipItem(deviceInventory, false, true)
								libs.PlayerRef.RemoveItem(deviceInventory, 1, true)
							EndIf
						EndIf
					EndIf
				EndIf
				libs.Log((akNewContainer as Actor).GetLeveledActorBase().GetName() + " received "+deviceName+".")
				return
			EndIf
		EndIf
		OnContainerChangedPre(akNewContainer, akOldContainer)
		Actor npc = (akOldContainer as Actor)
		if npc != none
			SyncInventory(npc)
		else
			SyncInventory()
		EndIf
		OnContainerChangedPost(akNewContainer, akOldContainer)
	EndIf
endEvent


Function EquipDevice(actor akActor, bool skipMutex=false)
	libs.EquipDevice(akActor, deviceInventory, deviceRendered, zad_DeviousDevice, skipEvents=true, skipMutex=skipMutex)
EndFunction


bool Function CheckLockShield(actor akActor)
    ; Check device timer
    if akActor != none && akActor == libs.PlayerRef && libs.config.lockShieldActive
        ; zad_LockShieldTime is set when the device is worn and unset when it is removed.
        float lockShieldTime = StorageUtil.GetFloatValue(akActor, "zad_LockShieldTime" + deviceRendered, 0.0)
        float hoursRemaining = (lockShieldTime - utility.GetCurrentGameTime() ) * 24

        ; Have a device time > 0.0 and have worn it for the appropriate period
        ; (0.01 equals zero, for sufficiently large values of zero)
        if (lockShieldTime > 0.01) && (hoursRemaining > 0)
            string msg = "The lock is covered with a magical shield that "

            if hoursRemaining < 6
                msg += "has almost faded completely."
            elseif hoursRemaining < 24
                msg += "is showing signs of weakening.  You're not sure how much longer you will have to wait, but at least the end is in sight."
            else
                msg += "makes it completely inaccessible.  You will have to wait and hope that it disappears in time."
            endif

            libs.Notify(msg, true)
            return false
        endif
    endif
    return true
endFunction

Function RemoveDevice(actor akActor, bool destroyDevice=false, bool skipMutex=false)
	; cannot remove DD devices when wearing bondage mittens...except the bondage mittens!
	; armbinders and yokes do NOT use this function to get removed, hence this works.
	if (akActor.WornHasKeyword(libs.zad_DeviousBondageMittens) && !deviceRendered.HasKeyword(libs.zad_DeviousBondageMittens))
		libs.NotifyPlayer("You cannot remove the " + deviceName + " while wearing bondage mittens!", true)
		return
	EndIf	
	; RemovedWithSuccess is set to false when the key breaks, so we don't display the "You succesfully removed device" message later, when you actually didn't.
	; Most OOP instructors are likely to faint seeing this cringeworthy implementation, but the alternative is changing the function header and making everyone recompile everything. Nah!
	RemovedWithSuccess = True
	if (akActor == libs.PlayerRef) && libs.Config.DestroyKeyProbability > 0.0 && deviceKey != none && !RemovedViaEscape ; don't break keys when the character escaped the item!
		; At the time of writing this, only the player may unlock themselves / NPCs via this function.
		; I do not really see that changing in the future, so using an explicit reference to the
		; player here is probably the way to go. Quests will manipulate this via the API anyways,
		; and this function is only for internal use.
		if deviceInventory.HasKeyword(libs.zad_BlockGeneric) || deviceRendered.HasKeyword(libs.zad_BlockGeneric) || deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
			Libs.Log("Not breaking key for non-generic device.")
		Elseif Utility.RandomInt(1, 100) <= libs.Config.DestroyKeyProbability
			if (Utility.RandomInt(1, 100) <= libs.Config.DestroyKeyJamChance)
				libs.NotifyPlayer("The key breaks while attempting to remove the "+deviceName+", and the broken key becomes stuck in the lock!", true)				
				libs.SendDeviceJamLockEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
				StorageUtil.SetIntValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus", 1)
			Else
				libs.NotifyPlayer("The key breaks while attempting to remove the "+deviceName+"!", true)
			EndIf			
			libs.SendDeviceKeyBreakEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
			libs.PlayerRef.RemoveItem(deviceKey, 1, true)
			RemovedWithSuccess = False
			return
		EndIf
	Endif
	libs.SendDeviceRemovalEvent(deviceName, akActor)
	libs.SendDeviceRemovedEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
	if deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
		if !skipMutex
			libs.AcquireAndSpinlock()
		EndIf
		libs.Log("Acquired mutex, removing " + deviceInventory.GetName())		
		StorageUtil.SetIntValue(akActor, "zad_RemovalToken" + deviceInventory, 1)
		akActor.UnequipItemEx(deviceInventory, 0, false)
		akActor.RemoveItem(deviceRendered, 1, true) 
		libs.CleanupDevices(akActor, zad_DeviousDevice)
		if destroyDevice
			akActor.RemoveItem(deviceInventory, 1, true)
		EndIf
	Else
		libs.RemoveDevice(akActor, deviceInventory, deviceRendered, zad_DeviousDevice, destroyDevice, skipMutex=skipMutex)
	Endif
	if deviceKey != none && akActor.GetItemCount(deviceKey) < 1 && libs.config.thresholdModifier > 0
		libs.Log("Player escaped device without having the key. Modifying unlock threshold.")
		libs.Config.UnlockThreshold = (libs.Config.UnlockThreshold + libs.Config.thresholdModifier) ; += giving syntax errors? 
	EndIf
	If libs.Config.destroyKey
		if deviceInventory.HasKeyword(libs.zad_BlockGeneric) || deviceRendered.HasKeyword(libs.zad_BlockGeneric) || deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
			Libs.Log("Not breaking key for non-generic device.")
		Else
			libs.PlayerRef.RemoveItem(deviceKey, 1, true)
		EndIf
	EndIf
EndFunction

bool Function RemoveDeviceWithKey(actor akActor = none, bool destroyDevice=false)
	if akActor == none
		akActor = libs.PlayerRef
	EndIf

    if !CheckLockShield(akActor)
        return false
    endif

	if (akActor == libs.PlayerRef) && StorageUtil.GetIntValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus") == 1
		libs.Log("RemoveDeviceWithKey called, but lock is jammed.")
		libs.Notify("You attempt to unlock the "+deviceName+", but the lock is jammed!", true)
		return false
	EndIf
	if akActor.GetItemCount(deviceKey)>=1
		libs.Log("RemoveDeviceWithKey called, actor has correct key. Removing "+ deviceName +".")
		RemovedViaEscape = False
		RemoveDevice(akActor)
		;return true
		return RemovedWithSuccess
	else
		libs.Log("RemoveDeviceWithKey called for a "+deviceName+" while actor does not possess key.")
		libs.Notify("You do not posess the correct key to manipulate this " + deviceName + ".")
		return false
	Endif
EndFunction


Function SyncInventory(Actor akActor=none)
	if akActor == none
		akActor = libs.PlayerRef
	EndIf
	libs.ReEquipExistingDevice(akActor, zad_DeviousDevice)
	if libs.WearingConflictingDevice(akActor, deviceRendered, zad_DeviousDevice)
		libs.Log("SyncInventory() called for one "+deviceName+", while already wearing another.")
		return
	EndIf
	; Inventory sanity failsafes
	if akActor.GetItemCount(deviceRendered)>1 ; This has never come up, but who knows what odd situations users will get themselves in to?
		libs.Log("Sanity Failsafe procced: Reducing internal "+deviceName+" count to 1.")
		akActor.RemoveItem(deviceRendered, (akActor.GetItemCount(deviceRendered) - 1), true)
	EndIf
	; Npc support
	if akActor != libs.PlayerRef
		; I am not sure why NPCs unequip the inventory item. Perhaps their ai package is fighting with me? Just blind equip it. 
		; This should not cause duplicate equips, because of previous checks.
		libs.Log("Syncing for actor " + akActor.GetLeveledActorBase().GetName()+".")
		akActor.EquipItem(deviceInventory, false, true)		
		if deviceKey && akActor.GetItemCount(deviceKey)>=1
    			libs.Log("SyncInventory(): Npc is removing "+deviceName+", since it has the key.")
			RemoveDevice(akActor)
    		else
    			libs.Log("SyncInventory(): Npc is equipping "+deviceName+".")
;    			libs.NotifyNPC("You catch " + akActor.GetLeveledActorBase().GetName() + " fiddling around with her "+deviceName+", in obvious discomfort...")
		Endif
	EndIf
	if akActor.IsEquipped(deviceInventory) || akActor.WornHasKeyword(zad_DeviousDevice)
		libs.CleanupDevices(akActor, zad_DeviousDevice, deviceRendered)
		libs.Log("SyncInventory(): Equipping "+deviceName+".")
		EquipDevice(akActor, skipMutex=true)
	else
		libs.Log("SyncInventory(): Nothing needs to be done.")
	Endif
	;EndIf
EndFunction

string function GetMessageName(actor akActor)
	if akActor != libs.PlayerRef
		return akActor.GetLeveledActorBase().GetName()+"'s"
	else
		return "your"	
	EndIf
EndFunction

Bool Function IsEquipDeviceConflict(Actor akActor)
	If EquipConflictingDevices.Length > 0
		int i = EquipConflictingDevices.Length
		Keyword kw
		bool break = false
		While i > 0 && !break
			i -= 1
			kw = EquipConflictingDevices[i]
			if kw && akActor.WornHasKeyword(kw)
				break = true
			EndIf
		EndWhile
		If break
			If zad_EquipConflictFailMsg
				zad_EquipConflictFailMsg.Show()
			EndIf
			Return True
		Endif
	Endif
	return false
EndFunction

Bool Function IsEquipRequiredDeviceConflict(Actor akActor)
	If EquipRequiredDevices.Length > 0
		int i = EquipRequiredDevices.Length
		Keyword kw
		bool ok = true
		While i > 0 && ok
			i -= 1
			kw = EquipRequiredDevices[i]
			if kw && !akActor.WornHasKeyword(kw)
				ok = false
			EndIf
		EndWhile
		If !ok
			If zad_EquipRequiredFailMsg
				zad_EquipRequiredFailMsg.Show()
			EndIf
			Return True
		Endif
	Endif
	return false
EndFunction

Bool Function IsUnEquipDeviceConflict(Actor akActor)
	If UnEquipConflictingDevices.Length > 0
		int i = UnEquipConflictingDevices.Length
		Keyword kw
		bool break = false
		While i > 0 && !break
			i -= 1
			kw = UnEquipConflictingDevices[i]
			if kw && akActor.WornHasKeyword(kw)
				break = true
			EndIf
		EndWhile
		If break
			If zad_UnEquipFailMsg
				zad_UnEquipFailMsg.Show()
			EndIf
			Return True
		Endif
	Endif
	return false
EndFunction


; ================================================================
; Functions for Inheritance 
; ================================================================

; ===============
; Interface
; ===============
Function NoKeyFailMessage(Actor akActor) ; Display fail removal for devices without a key
	
EndFunction

Function DeviceMenu(Int msgChoice = 0)
        msgChoice = zad_DeviceMsg.Show() ; display menu
	if msgChoice == 0 ; Equip Device voluntarily
		DeviceMenuEquip()
	elseif msgChoice == 1	; Remove device, with key
		DeviceMenuRemoveWithKey()
	elseif msgChoice == 2 ; Remove device, without key
		DeviceMenuRemoveWithoutKey()
	endif
	DeviceMenuExt(msgChoice)	
	SyncInventory()
EndFunction


Function DeviceMenuExt(Int msgChoice)

EndFunction

Function DeviceMenuEquip()
    EquipDevice(libs.PlayerRef)
	libs.NotifyPlayer("You choose to put the " + deviceName + " on.")	
EndFunction

function DeviceMenuRemoveWithKey()
    If !IsUnEquipDeviceConflict(libs.playerref)
		if RemoveDeviceWithKey()
			libs.NotifyPlayer("You succesfully unlock the " + deviceName+".")
		Endif
	Endif
EndFunction


;==========
;Lockpick Menu
;==========
; In a real language, this would be so much easier...
string Function DeviceMenuPickLockSuccess()
	RemovedViaEscape = True
	RemoveDevice(libs.PlayerRef)
	return ""
EndFunction
string Function DeviceMenuPickLockModerate()
	return ""
EndFunction
string Function DeviceMenuPickLockFail()
	libs.PlayerRef.RemoveItem(Lockpick)
	return ""
EndFunction
Function DeviceMenuPickLock()
	string skillName = ""
	if libs.Config.SkyRe
		skillName = "Pickpocket"
	else
		skillName = "Lockpicking"
	EndIf
	int unlockChance = libs.CheckDeviceEscape(libs.GetUnlockThreshold(), skillName)
	string out = ""
        if (unlockChance == -1)
		out += "You carefully insert a lockpick into the keyhole and manage to pick the lock. "
		out += DeviceMenuPickLockSuccess()
	elseif (unlockChance >= 100)
		out += "Despite your best lock breaking efforts the device refuse to open. "
		DeviceMenuPickLockModerate()
	else
		out += "Whether it's the lack of practice or just bad luck, the lock remains shut, breaking your lockpick in the process. "
		out += DeviceMenuPickLockFail()
	endif
	libs.Notify(out, messageBox=true)
EndFunction


;==========
;Magic Menu
;==========
string Function DeviceMenuDestructionSuccess()
	return ""
EndFunction
string Function DeviceMenuDestructionModerate()
	return ""
EndFunction
string Function DeviceMenuDestructionFail()
	return ""
EndFunction
string Function DeviceMenuAlterationSuccess()
	return ""
EndFunction
; string Function DeviceMenuAlterationModerate()
;	return ""
; EndFunction
string Function DeviceMenuAlterationFail()
	return ""
EndFunction
; string Function DeviceMenuConjurationSuccess()
;	return ""
; EndFunction
; string Function DeviceMenuConjurationModerate()
;	return ""
; EndFunction
string Function DeviceMenuConjurationFail()
	return ""
EndFunction
; string Function DeviceMenuRestorationSuccess()
;	return ""
; EndFunction
; string Function DeviceMenuRestorationModerate()
;	return ""
; EndFunction
string Function DeviceMenuRestorationFail()
	return ""
EndFunction
; string Function DeviceMenuIllusionSuccess()
;	return ""
; EndFunction
; string Function DeviceMenuIllusionModerate()
;	return ""
; EndFunction
string Function DeviceMenuIllusionFail()
	return ""
EndFunction

Function DeviceMenuMagic()
	int magicChoice = zad_DeviceMsgMagic.show()
	if libs.PlayerRef.GetAv("Magicka")<50
		libs.Notify("Your mental reserves are far too drained to attempt this task.", true)
	else
                libs.PlayerRef.DamageAV("Magicka", 50)
                string out=""
                int unlockChance = 0
                if magicChoice == 0
			unlockChance = libs.CheckDeviceEscape(libs.GetUnlockThreshold()+15, "Destruction")
			out += "Wielding the power of Destruction, you set your mind to destroying the "+deviceInventory.GetName()+". "
			if unlockChance >= 100
				out += "After a few moments of focus, you abort the attempt, realizing that your control is not fine enough to perform such a delicate task. "
				out += DeviceMenuDestructionFail()
			elseif unlockChance >= 0
				out += "You channel the powers of Fire and Ice in to the edge of the "+deviceName+", attempting to sever it. The energy surges through the "+deviceName+", proving insufficient to destroy it. "
				out += DeviceMenuDestructionModerate()
			else
				out += "You channel the powers of Fire and Ice in to the "+deviceName+", and sufficiently destroy the band that is securing it in place. "
				out += DeviceMenuDestructionSuccess()
				RemovedViaEscape = True
				RemoveDevice(libs.PlayerRef, destroyDevice=true)
			Endif
                elseif magicChoice==1
			unlockChance = libs.CheckDeviceEscape(libs.GetUnlockThreshold()+5, "Alteration")
			out += "Wielding the power of Alteration, you set your mind to destroying the "+deviceInventory.GetName()+". You concentrate on the "+deviceName+"'s lock, seeking to manipulate it's physical state. "
			if unlockChance >= 0
				out += "Though you charge the lock with magical energy, it resists your attempts to manipulate it in this manner. "
				out += DeviceMenuAlterationFail()
			else
				out += "After a few moments, the magical energy is sufficient to turn the lock to goo, and you easily free yourself. "
				out += DeviceMenuAlterationSuccess()
				RemovedViaEscape = True
				RemoveDevice(libs.PlayerRef, destroyDevice=true)
			Endif
                elseif magicChoice==2
			out += "You study the lock, and realize that attempting to remove the "+deviceInventory.GetName()+" in this manner will be fruitless. The lock is far too intricate for a conjured key to open. "
			out += DeviceMenuConjurationFail()
                elseif magicChoice==3
			out+="You place your hands upon the "+deviceInventory.GetName()+", and flood it with positive energy. After a few moments of concentration, you realize that the "+deviceName+", being an inanimate object, is not effected by the school of Restoration. Abashed, you blush and cease maintaining the spell. "
			out += DeviceMenuRestorationFail()
                elseif magicChoice==4
			out += "You channel your magical energy in to creating a most convincing illusion. It is not until you have completed the spell, that you realize that the "+deviceInventory.GetName()+" is an inanimate object, and as such is not subject to illusion spells. Abashed, you blush and cease concentrating on the spell. "
			out += DeviceMenuIllusionFail()
                endif
		if out
			libs.Notify(out, messageBox=true)
                endif
	endif
EndFunction


string Function DeviceMenuBruteForceFail()
	return ""
EndFunction
Function DeviceMenuBruteForce()
        string out = "You desperately tug at the edges of the "+deviceName+" with all your strength to no avail. "
        out += DeviceMenuBruteForceFail()
	libs.Notify(out, messageBox=true)
EndFunction

Function DeviceMenuCarryOn()
	libs.Notify("Since there seems to be no obvious way to remove the "+deviceName+" you have no choice but to reluctantly leave it locked on for now.", messageBox=true)
EndFunction

Float Function CalclulateEscapeModifiers()
	Float result = BaseEscapeChance
	; Apply modifiers, but only if the device is not impossible to escape from.
	If BaseEscapeChance > 0.0
		result += EscapeAttemptsMade
		result += Libs.Config.DeviceDifficultyModifer
		If Libs.PlayerRef.GetAV("Destruction") > 25 || Libs.PlayerRef.GetAV("Alteration") > 25
			result += 1.0
		Endif
		If Libs.PlayerRef.GetAV("Destruction") > 50 || Libs.PlayerRef.GetAV("Alteration") > 50
			result += 2.0
		Endif
		If Libs.PlayerRef.GetAV("Destruction") > 75 || Libs.PlayerRef.GetAV("Alteration") > 75
			result += 3.0
		Endif
		If Libs.PlayerRef.GetAV("Lockpicking") > 25
			result += 1.0
		Endif
		If Libs.PlayerRef.GetAV("Lockpicking") > 50
			result += 2.0
		Endif
		If Libs.PlayerRef.GetAV("Lockpicking") > 75
			result += 3.0
		Endif
		Int EscapesMade = libs.zadDeviceEscapeSuccessCount.GetValueInt()
		If EscapesMade > 10
			result += 1.0
		Endif
		If EscapesMade > 25
			result += 1.0
		Endif
		If EscapesMade > 50
			result += 1.0
		Endif
		If EscapesMade > 100
			result += 1.0
		Endif
	Endif
	If result < 0.0
		return 0.0
	ElseIf result > 100.0
		return 100.0
	Endif
	return result
EndFunction

Function DisplayDifficultyMsg(Float EscapeChance)
	If EscapeChance > 80
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". This restraint will not offer much resistance. Escape from this device will be trivial.", messageBox = true)
	ElseIf EscapeChance > 50
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". It is not a very secure restraint. Escape from this device will be easy.", messageBox = true)
	ElseIf EscapeChance > 25
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". This restraint is somewhat secure, but not overly much so. Escape from this device will be moderately difficult.", messageBox = true)
	ElseIf EscapeChance > 10
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". This restraint is fairly secure. Escape from this device will be difficult.", messageBox = true)
	ElseIf EscapeChance > 5
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". This restraint was designed secure. Escape from this device will be very difficult.", messageBox = true)
	ElseIf EscapeChance > 0
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". This restraint is very secure and will withstand most escape attempts. Escape from this device will be extremely difficult.", messageBox = true)
	Else
		libs.notify("You carefully examine the " + deviceInventory.GetName() +". It is a high security restraint. Escape from this device will be impossible. You will need the proper key!", messageBox = true)
	Endif
EndFunction

Function DeviceMenuRemoveWithoutKey()
	If IsUnEquipDeviceConflict(libs.playerref)
		return
	Endif
	Bool useDeviceDifficultyEscape = Libs.Config.UseDeviceDifficultyEscape
	If !useDeviceDifficultyEscape || !BaseEscapeChance
		int deviceRemoveOption = zad_DeviceRemoveMsg.show()
		if deviceRemoveOption == 0 ; Lockpicking
            if !CheckLockShield(libs.PlayerRef)
                return
            endif
			DeviceMenuPickLock()
		elseif deviceRemoveOption == 1 ; Magicking
			DeviceMenuMagic()
		elseif deviceRemoveOption == 2 ; Brute force
			DeviceMenuBruteForce()
		elseif deviceRemoveOption == 3
			DeviceMenuCarryOn()
		endif
		return
	EndIf
	Float EscapeChance = CalclulateEscapeModifiers()
	int msgOption 
	If !zad_DeviceEscapeMsg ; legacy device, use the default message in zadlibs
		msgOption = libs.zad_DeviceEscapeMsg.show()	
	Else
		msgOption = zad_DeviceEscapeMsg.show()	
	Endif
	If msgOption == 0 ; try to escape		
		If BaseEscapeChance == 0.0
			libs.notify("You have no chance to escape the " + deviceInventory.GetName() + ". You need to look for the proper key!", messageBox = true)
			return
		Endif
		libs.log("Player is trying to escape " + deviceInventory.GetName() + ". Escape chance after modifiers: " + EscapeChance +"%")
		; check if the character can make an escape attempt
		Float HoursNeeded = Libs.Config.DeviceDifficultyCooldown
		Float HoursPassed = (Utility.GetCurrentGameTime() - LastEscapeAttemptAt) * 24.0
		if HoursPassed > HoursNeeded
			LastEscapeAttemptAt = Utility.GetCurrentGameTime()
			If Utility.RandomFloat(0.0, 99.9) < EscapeChance
				libs.log("Player has escaped " + deviceInventory.GetName())
				libs.notify("You succesfully escape from your " + deviceInventory.GetName(), messageBox = true)
				; increase success counter
				libs.zadDeviceEscapeSuccessCount.SetValueInt(libs.zadDeviceEscapeSuccessCount.GetValueInt() + 1)
				RemovedViaEscape = True
				RemoveDevice(libs.PlayerRef)
			Else
				libs.log("Player has failed to escape " + deviceInventory.GetName())
				; catastrophic failure will prevent further escape attempts
				if Utility.RandomFloat(0.0, 99.9) < Libs.Config.DeviceDifficultyCatastrophicFailChance
					BaseEscapeChance = 0.0
					libs.notify("You fail to escape from your " + deviceInventory.GetName() + " and your feeble attempts tighten the device so much that you won't ever be able to escape it. You need to look for the proper key!", messageBox = true)
				Else
					EscapeAttemptsMade += 1
					libs.notify("You fail to escape from your " + deviceInventory.GetName(), messageBox = true)
				Endif
			EndIf
		Else
			Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
			libs.notify("You cannot try to escape this device so soon after the last attempt! You can try again in about " + HoursToWait + " hours.", messageBox = true)
		EndIf		
	ElseIf msgOption == 1 ; examine
		DisplayDifficultyMsg(EscapeChance)
	ElseIf msgOption == 2 ; leave it on
		DeviceMenuCarryOn()
	Endif
EndFunction

; ===============
; Event Equip
; ===============
; Returns 0 if it's okay to proceed. Returns 1 if it is not. Returns 2 if it is not, and the offending item
; must be unequipped.
int Function OnEquippedFilter(actor akActor, bool silent=false)
	return 0
EndFunction

Function OnEquippedPre(actor akActor, bool silent=false)

EndFunction

Function OnEquippedPost(actor akActor)

EndFunction
; ===============
; Event Unequip
; ===============
int Function OnUnequippedFilter(actor akActor)
	return 0
EndFunction

Function OnUnequippedPre(Actor akActor)

EndFunction

Function OnUnequippedPost(Actor akActor)
	
EndFunction
; ===============
; Event OnContainerChanged
; ===============
int Function OnContainerChangedFilter(ObjectReference akNewContainer, ObjectReference akOldContainer)
	return 0
EndFunction

Function OnContainerChangedPre(ObjectReference akNewContainer, ObjectReference akOldContainer)

EndFunction

Function OnContainerChangedPost(ObjectReference akNewContainer, ObjectReference akOldContainer)

EndFunction
; ================================================================
; Functions for Quest use 
; ================================================================
Function OnRemoveDevice(actor akActor)
	; This is reliably called, so long as the API is used.
EndFunction


Function StoreEquippedDevice(actor akActor)
	StorageUtil.SetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_Inventory", DeviceInventory)
	StorageUtil.SetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_Rendered", DeviceRendered)
	StorageUtil.SetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_Key", DeviceKey)
EndFunction

Function UnsetStoredDevice(actor akActor)
	StorageUtil.UnsetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_Inventory")
	StorageUtil.UnsetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_Rendered")
	StorageUtil.UnsetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_Key")

EndFunction
