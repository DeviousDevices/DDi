Scriptname zadEquipScript extends ObjectReference  

; Libraries
zadlibs Property libs Auto
slaUtilScr Property Aroused Auto

; Old escape dialog - DO NOT USE
Message Property zad_DeviceMsgMagic auto   	; Device removal via magic message Deprecated!!
Message Property zad_DeviceRemoveMsg auto  	; Device removal message Deprecated!!
Message Property zad_DeviceEscapeMsg Auto	; Device escape message Deprecated!!

; Item Descriptors
Message Property zad_DeviceMsg auto			; Device interaction message
Armor Property deviceRendered Auto			; Rendered Device - is what's displayed in game.
Armor Property deviceInventory Auto			; Inventory Device - has the script
Keyword Property zad_DeviousDevice Auto

; Persistant Variables
Quest Property deviceQuest Auto
String Property deviceName Auto
Bool Property JammedLock = False Auto      ; Is the lock currently jammed? (Deprecated, do NOT use!)
MiscObject Property Lockpick Auto

; Wrist Bondage and struggle system
String[] Property struggleIdles Auto
String[] Property struggleIdlesHob Auto

; Unlock system
Key Property deviceKey  Auto               				; Key type to unlock this device
Bool Property DestroyKey = False Auto 					; If set to true, the key(s) will be destroyed when the device is unlocked or escaped from.
Bool Property DestroyOnRemove = False Auto 				; If set to true, they device will be destroyed when it is unlocked or escaped from.
Int Property NumberOfKeysNeeded = 1 Auto 				; Number of keys needed (=multiple locks)
Float Property LockAccessDifficulty = 0.0 Auto			; If set to greater than zero, the character cannot easily reach the locks when locked in this restraint. The higher the number, the harder she will find it to unlock herself, even when in possession of the key. A value of 100 will make it impossible for her to reach the locks. She will need help. Make sure that your mod actually provides a means to escape such retraints!
Float Property UnlockCooldown = 0.0	Auto				; How many hours have to pass between unlock attempts for hard to unlock restraints.
Float Property KeyBreakChance = 0.0 Auto				; Chance that the key breaks when trying to unlock an item. WARNING: Do NOT use this feature when there is only one key in the game etc.
Float Property LockJamChance = 0.0 Auto					; Chance that the key gets stuck in the lock when it breaks. The lock has to be repaired before further unlock attempts.
Float Property LockShieldTimerMin = 0.0 Auto			; If this number is greater than zero, the player has to wait for a minimum of this many hours before she can unlock the device with a key.
Float Property LockShieldTimerMax = 0.0 Auto			; If this number is greater than zero, the player has to wait for a maximum of this many hours before she can unlock the device with a key.

; Escape system
Float Property BaseEscapeChance = 0.0 Auto				; Base chance to escape a restraint via struggling. Magic bonus applies. 0 disables this feature.
Float Property LockPickEscapeChance = 0.0 Auto			; Base chance to escape a restraint via lockpicking Need proper lockpick, Lockpick bonus applies. 0 disables this feature.
Form[] Property AllowedLockPicks Auto 					; List of items other than lockpicks considered a valid pick tool for this device. The lockpick is allowed by default unless disabled.
Bool Property AllowLockPick = True Auto					; Indicates whether or not the bobby pin is considered a valid lockpick for this device.
Float Property CutDeviceEscapeChance = 0.0 Auto			; Base chance to escape a restraint via cutting it open. Need proper tool, Agiliy bonus applies. 0 disables this feature.
Bool Property AllowStandardTools = True Auto			; Indicates whether or not the items in the standard tools list (all small blades) are considered a valid cutting tool for this device.
Keyword[] Property AllowedTool Auto						; List of item keywords considered a cutting tool for this device. 
Float Property CatastrophicFailureChance = 0.0 Auto		; Chance that an escape attempt fails in a catastrophic manner, preventing any further attempts to escape this device using that method.
Float Property EscapeCooldown = 2.0	Auto				; How many hours have to pass between escape attempts.
Float Property RepairJammedLockChance = 20.0 Auto		; Chance that the player manages to successfully repair a jammed lock.
Float Property RepairCooldown = 4.0	Auto				; How many hours have to pass between repair attempts.
Bool Property AllowDifficultyModifier = False Auto		; Override to allow the difficulty modifier for quest/custom items (tagged with zad_BlockGeneric or zad_QuestItem). For generic items this is always allowed, regardless of this setting.
Bool Property DisableLockManipulation = False Auto		; Override to disallow the player manipulating the locks. Not needed for quest/custom items, as this feature is disabled for them anyway.

; These messages exist both here and in zadlibs. Modders can override the messages per item with these!
Message Property zad_DD_EscapeDeviceMSG Auto 				; Device escape dialogue. You can customize it if you want, but make sure not to change the order and functionality of the buttons.
Message Property zad_DD_OnEquipDeviceMSG Auto 				; Message is displayed upon device equip (dialogue only)
Message Property zad_DD_OnNoKeyMSG Auto 	 				; Message is displayed when the player has no key
Message Property zad_DD_OnNotEnoughKeysMSG	Auto 			; Message is displayed when the player has not enough keys
Message Property zad_DD_OnLeaveItNotWornMSG Auto 	 		; Message is displayed when the player clicks the "Leave it Alone" button while not wearing the device.
Message Property zad_DD_OnLeaveItWornMSG Auto 		 		; Message is displayed when the player clicks the "Leave it Alone" button while wearing the device.
Message Property zad_DD_KeyBreakMSG Auto 	 				; Message is displayed when a key breaks while trying to unlock this device.
Message Property zad_DD_KeyBreakJamMSG Auto 				; Message is displayed when a key breaks and gets stuck in the lock when trying to unlock this device.
Message Property zad_DD_UnlockFailJammedMSG	Auto 			; Message displayed when a player tries to unlock a jammed device.
Message Property zad_DD_RepairLockNotJammedMSG Auto 		; Message displayed when a player tries to repair a device that's not jammed.
Message Property zad_DD_RepairLockMSG Auto 					; Message displayed when a player tries to repair a lock.
Message Property zad_DD_RepairLockSuccessMSG Auto 			; Message displayed when a player successfully tries to repair a lock.
Message Property zad_DD_RepairLockFailureMSG Auto 			; Message displayed when a player fails to repair a lock.
Message Property zad_DD_EscapeStruggleMSG Auto 				; Message to be displayed when the player tries to struggle out of a restraint
Message Property zad_DD_EscapeStruggleFailureMSG Auto 		; Message to be displayed when the player fails to struggle out of a restraint
Message Property zad_DD_EscapeStruggleSuccessMSG Auto 		; Message to be displayed when the player succeeds to struggle out of a restraint
Message Property zad_DD_EscapeLockPickMSG Auto 				; Message to be displayed when the player tries to pick a restraint
Message Property zad_DD_EscapeLockPickFailureMSG Auto 		; Message to be displayed when the player fails to pick a restraint
Message Property zad_DD_EscapeLockPickSuccessMSG Auto 		; Message to be displayed when the player succeeds to pick a restraint
Message Property zad_DD_EscapeCutMSG Auto 					; Message to be displayed when the player tries to cut a restraint
Message Property zad_DD_EscapeCutFailureMSG Auto 			; Message to be displayed when the player fails to cut a restraint
Message Property zad_DD_EscapeCutSuccessMSG Auto 			; Message to be displayed when the player succeeds to cut open a restraint
Message Property zad_DD_OnPutOnDevice Auto					; Message to be displayed when the player locks on an item, so she can manipulate the locks if she choses. You can customize it if you want, but make sure not to change the order and functionality of the buttons.

; Device dependencies
Keyword[] Property EquipConflictingDevices Auto 		; These item keywords, if present on the character, will prevent the item from getting equipped, unless a script does it.
Keyword[] Property EquipRequiredDevices Auto 			; These item keywords, if NOT present on the character, will prevent the item from getting equipped, unless a script does it.
Keyword[] Property UnEquipConflictingDevices Auto 		; These item keywords, if present on the character, will prevent the item from getting unequipped, unless a script does it.
Message Property zad_EquipConflictFailMsg auto 			; This message will get displayed if an item fails to equip due to present keyword conflicts. Make sure to explain the conflicts, so the player knows what's going on!
Message Property zad_EquipRequiredFailMsg auto 			; This message will get displayed if an item fails to equip due to missing keyword conflicts. Make sure to explain the conflicts, so the player knows what's going on!
Message Property zad_UnEquipFailMsg auto 				; This message will get displayed if an item fails to unequip due to keyword conflicts. Make sure to explain the conflicts, so the player knows what's going on!

; Local Variables
bool isLockManipulated = false
bool menuDisable = false
int mutexTimeout = 10
bool unequipMutex

; Internal script variables
Float LastUnlockAttemptAt = 0.0							; When did the player last attempt to unlock this device.
Float DeviceEquippedAt = 0.0							; When was this device equipped?
Int EscapeCutAttemptsMade = 0							; Tracker of how often the player tried to escape this device via cutting.
Int EscapeStruggleAttemptsMade = 0						; Tracker of how often the player tried to escape this device via struggling.
Int EscapeLockPickAttemptsMade = 0						; Tracker of how often the player tried to escape this device via lockpicking.
Float LastStruggleEscapeAttemptAt = 0.0					; When did the player last attempt to escape via struggling.
Float LastCutEscapeAttemptAt = 0.0						; When did the player last attempt to escape via cutting.
Float LastLockPickEscapeAttemptAt = 0.0					; When did the player last attempt to escape via lockpicking.
Int RepairAttemptsMade = 0								; Tracker of how often the player tried to escape this device.
Float LastRepairAttemptAt = 0.0							; When did the player last attempt to escape.
Float RepairDifficultyModifier = 0.0					; Global modifier for escape attempts. Can be used to make escape harder or easier.
Float LockShieldTimer = 0.0								; The actual uptime of the lockshield. Randomly determined when the item is equipped using the min and max values.
Bool QuestItemRemovalTokenInternal = False

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
	; check for device conflicts
	If !silently && (IsEquipDeviceConflict(akActor) || IsEquipRequiredDeviceConflict(akActor))
		menuDisable = true
		akActor.UnequipItem(deviceInventory, false, true)
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
	If !silently && akActor == libs.playerref && !akActor.WornHasKeyword(zad_DeviousDevice) && akActor.GetItemCount(deviceRendered) == 0
		Int msgChoice = zad_DeviceMsg.Show() ; display menu
		if msgChoice != 0 ; Equip Device voluntarily			
			akActor.UnequipItem(deviceInventory, false, true)
			return
		Else
			isLockManipulated = False		
			If !DisableLockManipulation && ( deviceRendered.HasKeyword(libs.zad_Lockable) || deviceInventory.HasKeyword(libs.zad_Lockable) ) && !deviceInventory.HasKeyword(libs.zad_QuestItem) && !deviceRendered.HasKeyword(libs.zad_QuestItem) && !deviceInventory.HasKeyword(libs.zad_BlockGeneric) && !deviceRendered.HasKeyword(libs.zad_BlockGeneric) 
				Int Choice = 0
				If zad_DD_OnPutOnDevice
					Choice = zad_DD_OnPutOnDevice.Show()
				Else
					Choice = libs.zad_DD_OnPutOnDevice.Show()
				EndIf
				If Choice == 1
					isLockManipulated = True				
				EndIf
			EndIf
		EndIf
	EndIf
	int filter = OnEquippedFilter(akActor, silent=silently)
	if filter >= 1
		if filter == 2
			menuDisable = true
			akActor.UnequipItem(deviceInventory, false, true)
		EndIf
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
	OnEquippedPost(akActor)
	SetLockShield()
	If deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)		
		libs.StartBoundEffects(akActor)
	EndIf	
	LastCutEscapeAttemptAt = 0.0
	LastStruggleEscapeAttemptAt = 0.0
	LastLockPickEscapeAttemptAt = 0.0
	LastUnlockAttemptAt = 0.0
	LastRepairAttemptAt = 0.0
	EscapeCutAttemptsMade = 0
	EscapeStruggleAttemptsMade = 0
	EscapeLockpickAttemptsMade = 0
EndEvent


Event OnUnequipped(Actor akActor)
	unequipMutex = true
	libs.Log("OnUnequipped("+akActor.GetLeveledActorBase().GetName()+": "+deviceInventory.GetName()+")")
	If DeviceRendered.HasKeyword(Libs.Zad_QuestItem) || DeviceInventory.HasKeyword(Libs.Zad_QuestItem)
		libs.Log("Attempt to remove quest item: "+akActor.GetLeveledActorBase().GetName()+": "+deviceInventory.GetName()+")")
		if !QuestItemRemovalTokenInternal && (libs.questItemRemovalAuthorizationToken == None || libs.zadStandardKeywords.HasForm(libs.questItemRemovalAuthorizationToken) || (!DeviceRendered.HasKeyword(libs.questItemRemovalAuthorizationToken) && !DeviceInventory.HasKeyword(libs.questItemRemovalAuthorizationToken)))
			libs.Log("Caught and prevented unauthorized removal attempt!")
			unequipMutex = false
			libs.DeviceMutex = false
			EquipDevice(akActor, skipMutex=true)
			SyncInventory(akActor)
			; If this is a genuine attempt to unlock the item, display the menu
			if UI.IsMenuOpen("InventoryMenu")
				DeviceMenu()
			EndIf
			Return
		Else
			libs.questItemRemovalAuthorizationToken = None			
			QuestItemRemovalTokenInternal = False
		EndIf
	EndIf	
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
			If deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)
				libs.StopBoundEffects(akActor)
			EndIf
			StorageUtil.UnsetIntValue(akActor, "zad_RemovalToken"+deviceInventory)
			unequipMutex = false
			libs.DeviceMutex = false			
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

Function RemoveDevice(actor akActor, bool destroyDevice=false, bool skipMutex=false)	
	libs.SendDeviceRemovalEvent(deviceName, akActor)
	libs.SendDeviceRemovedEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
	if deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
		if !skipMutex
			libs.AcquireAndSpinlock()
		EndIf
		libs.Log("Acquired mutex, removing " + deviceInventory.GetName())		
		StorageUtil.SetIntValue(akActor, "zad_RemovalToken" + deviceInventory, 1)
		QuestItemRemovalTokenInternal = True
		akActor.UnequipItemEx(deviceInventory, 0, false)
		akActor.RemoveItem(deviceRendered, 1, true) 
		libs.CleanupDevices(akActor, zad_DeviousDevice)
		if DestroyOnRemove
			akActor.RemoveItem(deviceInventory, 1, true)
		EndIf		
	Else
		libs.RemoveDevice(akActor, deviceInventory, deviceRendered, zad_DeviousDevice, DestroyOnRemove, skipMutex=skipMutex)
	Endif
	If akActor != Libs.PlayerRef
		return
	EndIf
	If DestroyKey
		libs.PlayerRef.RemoveItem(DeviceKey, NumberOfKeysNeeded, False)
	EndIf	
EndFunction

bool Function RemoveDeviceWithKey(actor akActor = none, bool destroyDevice=false)
	; the destroyDevice Parameter is ignored since it's now an item property, but it's left in not to cause conflicts with existing mods.
	if akActor == none
		akActor = libs.PlayerRef
	EndIf   
	If isLockManipulated
		libs.Notify("As you have manipulated the " + deviceName + ", you are able to slip out of the device with ease!", messageBox = True)
		RemoveDevice(akActor)	
		Return True
	EndIf	
	if (akActor == libs.PlayerRef) && StorageUtil.GetIntValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus") == 1
		libs.Log("RemoveDeviceWithKey called, but lock is jammed.")
		If zad_DD_UnlockFailJammedMSG
			zad_DD_UnlockFailJammedMSG.Show()
		Else
			libs.zad_DD_UnlockFailJammedMSG.Show()
		EndIf
		return false
	EndIf	
	If !CheckLockShield() ; is the timer expired?
		Return False
	EndIf
	; Check if she is able to unlock herself. We do this check here to allow it to apply even to keyless restraints that shouldn't be just removed.
	If !CheckLockAccess()
		Return False
	EndIf
	StruggleScene(libs.PlayerRef)
	If DeviceKey
		If libs.PlayerReF.GetItemCount(DeviceKey) <= 0
			If zad_DD_OnNoKeyMSG
				zad_DD_OnNoKeyMSG.Show()
			Else
				libs.Notify("You do not posess the correct key to manipulate this " + deviceName + ".")
			EndIf
			Return False
		ElseIf libs.PlayerRef.GetItemCount(DeviceKey) < NumberOfKeysNeeded
			If zad_DD_OnNotEnoughKeysMSG
				zad_DD_OnNotEnoughKeysMSG.Show()
			Else
				libs.Notify("You do not posess enough keys to manipulate this " + deviceName + ".")
			EndIf
			Return False
		EndIf		
		; The key break chance defaults to zero, so we don't need to check for quest items etc. If modders set this chance higher, it's their responsibility!
		Float ModValue = (KeyBreakChance * CalculateKeyModifier(False))
		If (KeyBreakChance < 100.0) && (ModValue >= 100.0)
			; If the modder didn't mean to make it completely impossible to unlock this item, it shouldn't be after applying the modifier either!
			ModValue = 95.0
		EndIf		
		If Utility.RandomFloat(0.0, 99.9) < ModValue
			Libs.PlayerRef.RemoveItem(DeviceKey, Utility.RandomInt(1, NumberOfKeysNeeded))
			libs.SendDeviceKeyBreakEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
			If Utility.RandomFloat(0.0, 99.9) < (LockJamChance * CalculateKeyModifier(False))
				; broken key becomes stuck in the lock
				libs.SendDeviceJamLockEventVerbose(deviceInventory, zad_DeviousDevice, akActor)
				StorageUtil.SetIntValue(akActor, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus", 1)
				if zad_DD_KeyBreakJamMSG
					zad_DD_KeyBreakJamMSG.Show()
				Else
					libs.zad_DD_KeyBreakJamMSG.Show()
				EndIf
			Else
				If zad_DD_KeyBreakMSG
					zad_DD_KeyBreakMSG.Show()
				Else
					libs.zad_DD_KeyBreakMSG.Show()
				EndIf
			EndIf
			Return False
		EndIf
	EndIf	
	RemoveDevice(akActor)	
	return True
EndFunction

Function ResetLockShield()
	DeviceEquippedAt = Utility.GetCurrentGameTime()
	SetLockShield()
EndFunction

Function SetLockShield()
	If (LockShieldTimerMin > 0.0) && (LockShieldTimerMin <= LockShieldTimerMax)
		LockShieldTimer = ((Utility.RandomFloat(LockShieldTimerMin, LockShieldTimerMax)) * CalculateCooldownModifier(False))
	Else
		LockShieldTimer = 0.0
	EndIf
EndFunction

Bool Function CheckLockShield()
	If LockShieldTimer == 0.0
		return True
	EndIf
	Float HoursNeeded = LockShieldTimer
	Float HoursPassed = (Utility.GetCurrentGameTime() - DeviceEquippedAt) * 24.0
	if HoursPassed > HoursNeeded
		return True
	Else
		Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
		libs.notify("This lock is protected with a timed lock shield preventing you from inserting a key as long as it is active! You can try to unlock this device in about " + HoursToWait + " hours.", messageBox = true)
		return False
	EndIf
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

Bool Function CanMakeUnlockAttempt()
	; check if the character can make an unlock attempt.
	Float HoursNeeded = (UnlockCooldown * CalculateCooldownModifier(False))
	Float HoursPassed = (Utility.GetCurrentGameTime() - LastUnlockAttemptAt) * 24.0
	if HoursPassed > HoursNeeded
		LastUnlockAttemptAt = Utility.GetCurrentGameTime()
		return True
	Else
		Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
		libs.notify("You are still tired from the last attempt, and cannot again try to unlock this device already! You can try again in about " + HoursToWait + " hours.", messageBox = true)
	EndIf
	return False
EndFunction

Bool Function CheckLockAccess()
	; You can unlock only wrist restraints when wearing wrist restraints.
	If libs.playerRef.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)
		libs.notify("You cannot unlock the " + DeviceName + " with your wrists tied.", messageBox = True)
		Return False
	EndIf
	; cannot remove other DD devices when wearing bondage mittens either
	if !deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage) && (libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBondageMittens) && !deviceRendered.HasKeyword(libs.zad_DeviousBondageMittens))
		libs.NotifyPlayer("You cannot remove the " + deviceName + " while wearing bondage mittens!", true)
		return False
	EndIf	
	If LockAccessDifficulty > 0.0
		If !CanMakeUnlockAttempt()
			Return False
		EndIf
		Float ModValue = (LockAccessDifficulty * CalculateDifficultyModifier(False))
		If (LockAccessDifficulty < 100.0) && (ModValue >= 100.0)
			; If the modder didn't mean to make it completely impossible to reach the locks, it shouldn't be after applying the modifier either!
			ModValue = 95.0
		EndIf
		If Utility.RandomFloat(0.0, 99.9) < ModValue
			If DeviceKey != None || isLockManipulated		
				If LockAccessDifficulty < 50.0
					libs.notify("You try to insert the key into the " + DeviceName + "'s lock, but find the locks a bit outsides of your reach. After a few failed attempts to slide the key into the lock, you have no choice but to give up for now. You should still eventually be able to unlock yourself. Just try again a bit later!", messageBox = True)
				ElseIf LockAccessDifficulty < 100.0
					libs.notify("This restraint was designed to make it hard for the person wearing it in to unlock herself. You struggle hard trying to insert the key into the " + DeviceName + "'s lock anyway, but find the locks well outsides of your reach. Tired from your struggles, you have no choice but to give up for now. Maybe try again later!", messageBox = True)
				Else
					libs.notify("This restraint was designed to put the locks safely out of reach of the person wearing it. There is no way you will ever be able to unlock yourself, even when in possession of the proper key. You will need to seek help!", messageBox = True)
				EndIf
			Else
				libs.notify("You try to undo your restraint, but you are unable to reach the locking mechanism!", messageBox = True)
			EndIf
			Return False
		EndIf
	EndIf
	Return True
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
	if libs.PlayerRef.IsEquipped(DeviceRendered) || libs.PlayerRef.WornHasKeyword(zad_DeviousDevice)
		return
	EndIf
	EquipDevice(libs.PlayerRef)	
	If zad_DD_OnEquipDeviceMSG
		zad_DD_OnEquipDeviceMSG.Show()
	Else
		libs.zad_DD_OnEquipDeviceMSG.Show()
	EndIf    
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
	int unlockChance = libs.CheckDeviceEscape(libs.GetUnlockThreshold(), "Lockpicking")
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

Function DisplayDifficultyMsg()
	Int StruggleEscapeChance = Math.Floor(BaseEscapeChance)
	String result = "You carefully examine the " + DeviceName + ". "
	If StruggleEscapeChance > 75
		result += "This restraint is fairly weak and will not offer much resistance against struggling."
	ElseIf StruggleEscapeChance >= 50
		result += "This is not a very secure restraint. Struggling out should be easy."
	ElseIf StruggleEscapeChance >= 25
		result += "This restraint is somewhat secure, but not overly much so. Struggling out will be moderately difficult."
	ElseIf StruggleEscapeChance >= 15
		result += "This restraint is designed to be secure, but with enough patience could probably be struggled out from."
	ElseIf StruggleEscapeChance >= 10
		result += "This restraint is fairly secure and will be hard to struggle out from, but not impossible."
	ElseIf StruggleEscapeChance >= 5
		result += "This restraint is secure and will be extremely difficult to struggle out from."
	ElseIf StruggleEscapeChance > 0
		result += "This restraint is very secure and will withstand most escape attempts. Struggling out of this device will be almost impossible."
	Else
		result += "This is a high security restraint. Struggling out from this device will be completely impossible!"
	Endif
	result += " "
	If LockPickEscapeChance > 75
		result += "Its lock is weak and will not offer much resistance to pick attempts."
	ElseIf LockPickEscapeChance >= 50
		result += "Its lock is not very secure. Picking it should be easy."
	ElseIf LockPickEscapeChance >= 25
		result += "Its lock is somewhat secure, but not overly much so. Picking it will be moderately difficult."
	ElseIf LockPickEscapeChance >= 15
		result += "Its lock is designed to be secure, but might not withstand serious picking attempts."
	ElseIf LockPickEscapeChance >= 10
		result += "Its lock is fairly secure and will be hard to pick, but not impossible."
	ElseIf LockPickEscapeChance >= 5
		result += "Its lock is secure and will be extremely difficult to pick."
	ElseIf LockPickEscapeChance > 0
		result += "Its lock is very secure and will withstand most attempts to pick it."
	Else
		result += "It has a tamper proof lock. Unlocking it without the proper key will be absolutely impossible!"
	Endif
	result += " "
	If CutDeviceEscapeChance > 75
		result += "Its material is weak and will not offer much resistance to cutting."
	ElseIf CutDeviceEscapeChance >= 50
		result += "Its material is not very tough. Cutting it should be easy."
	ElseIf CutDeviceEscapeChance >= 25
		result += "Its material is somewhat tough, but not overly much so. Cutting it will be moderately difficult."
	ElseIf CutDeviceEscapeChance >= 15
		result += "Its material is tough, but could probably be cut with the right tool and enough effort."
	ElseIf CutDeviceEscapeChance >= 10
		result += "Its material is fairly tough and will be hard to cut, but not impossible."
	ElseIf CutDeviceEscapeChance >= 5
		result += "Its material is hard and will be extremely difficult to cut."
	ElseIf CutDeviceEscapeChance > 0
		result += "Its material is very hard and will withstand most attempts to cut it."
	Else
		result += "Its made of material impossible to cut with any tool!"
	Endif
	libs.notify(result, messageBox = true)
EndFunction

Float Function CalculateDifficultyModifier(Bool operator = true)
	; We don't modify for quest items
	If deviceInventory.HasKeyword(libs.zad_BlockGeneric) || deviceRendered.HasKeyword(libs.zad_BlockGeneric) || deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
		; except the modder specifically allowed the system to be used for that item!
		If !AllowDifficultyModifier
			libs.log("Difficulty modifier not applied - custom/quest item!")
			return 1.0
		EndIf
	EndIf
	Float val = 1.0
	Int mcmValue = libs.config.EscapeDifficulty	
	Int mcmLength = libs.config.EsccapeDifficultyList.Length
	Int median = ((mcmLength - 1) / 2) As Int ; This assumes the array to be uneven, otherwise there is no median value.
	Float maxModifier = 0.75 ; set this as desired - it's the maximum possible +/- modifier. It should not be larger than 1 (=100%)
	Float StepLength = maxModifier / median
	Int Steps = mcmValue - median	
	If operator
		val = 1 + (Steps * StepLength)
	Else
		val = 1 - (Steps * StepLength)
	EndIf
	libs.log("Difficulty modifier applied: " + val + " [setting: " + mcmValue + "]")
	return val
EndFunction

Float Function CalculateCooldownModifier(Bool operator = true)
	; We don't modify for quest items
	If deviceInventory.HasKeyword(libs.zad_BlockGeneric) || deviceRendered.HasKeyword(libs.zad_BlockGeneric) || deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
		; except the modder specifically allowed the system to be used for that item!
		If !AllowDifficultyModifier
			libs.log("Difficulty modifier not applied - custom/quest item!")
			return 1.0
		EndIf
	EndIf
	Float val = 1.0
	Int mcmValue = libs.config.CooldownDifficulty	
	Int mcmLength = libs.config.EsccapeDifficultyList.Length
	Int median = ((mcmLength - 1) / 2) As Int ; This assumes the array to be uneven, otherwise there is no median value.
	Float maxModifier = 0.9 ; set this as desired - it's the maximum possible +/- modifier. It should not be larger than 1 (=100%)
	Float StepLength = maxModifier / median
	Int Steps = mcmValue - median	
	If operator
		val = 1 + (Steps * StepLength)
	Else
		val = 1 - (Steps * StepLength)
	EndIf
	libs.log("Difficulty modifier applied: " + val + " [setting: " + mcmValue + "]")
	return val
EndFunction

Float Function CalculateKeyModifier(Bool operator = true)
	; We don't modify for quest items
	If deviceInventory.HasKeyword(libs.zad_BlockGeneric) || deviceRendered.HasKeyword(libs.zad_BlockGeneric) || deviceInventory.HasKeyword(libs.zad_QuestItem) || deviceRendered.HasKeyword(libs.zad_QuestItem)
		; except the modder specifically allowed the system to be used for that item!
		If !AllowDifficultyModifier
			libs.log("Difficulty modifier not applied - custom/quest item!")
			return 1.0
		EndIf
	EndIf
	Float val = 1.0
	Int mcmValue = libs.config.KeyDifficulty	
	Int mcmLength = libs.config.EsccapeDifficultyList.Length
	Int median = ((mcmLength - 1) / 2) As Int ; This assumes the array to be uneven, otherwise there is no median value.
	Float maxModifier = 1 ; set this as desired - it's the maximum possible +/- modifier. It should not be larger than 1 (=100%)
	Float StepLength = maxModifier / median
	Int Steps = mcmValue - median	
	If operator
		val = 1 + (Steps * StepLength)
	Else
		val = 1 - (Steps * StepLength)
	EndIf
	libs.log("Difficulty modifier applied: " + val + " [setting: " + mcmValue + "]")
	return val
EndFunction

Bool Function CanMakeStruggleEscapeAttempt()
	; check if the character can make an escape attempt
	If libs.PlayerRef.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)
		libs.notify("You cannot try to struggle out of the " + DeviceName + " with bound hands.", messageBox = true)
		return False
	EndIf	
	Float HoursNeeded = (EscapeCooldown * CalculateCooldownModifier(False))
	Float HoursPassed = (Utility.GetCurrentGameTime() - LastStruggleEscapeAttemptAt) * 24.0
	if HoursPassed > HoursNeeded
		LastStruggleEscapeAttemptAt = Utility.GetCurrentGameTime()
		return True
	Else
		Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
		libs.notify("You cannot try to struggle out of this device so soon after the last attempt! You can try again in about " + HoursToWait + " hours.", messageBox = true)
	EndIf
	return False
EndFunction

Bool Function CanMakeCutEscapeAttempt()
	; check if the character can make an escape attempt
	If libs.PlayerRef.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)
		libs.notify("You cannot try to cut the " + DeviceName + " with bound hands.", messageBox = true)
		return False
	EndIf	
	Float HoursNeeded = (EscapeCooldown * CalculateCooldownModifier(False))
	Float HoursPassed = (Utility.GetCurrentGameTime() - LastCutEscapeAttemptAt) * 24.0
	if HoursPassed > HoursNeeded
		LastCutEscapeAttemptAt = Utility.GetCurrentGameTime()
		return True
	Else
		Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
		libs.notify("You cannot try to cut open this device so soon after the last attempt! You can try again in about " + HoursToWait + " hours.", messageBox = true)
	EndIf
	return False
EndFunction

Bool Function CanMakeLockPickEscapeAttempt()
	; check if the character can make an escape attempt
	; can't try this with bound hands. We do allow wrist restraints itself, though.
	If libs.PlayerRef.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)
		libs.notify("You cannot try to pick the " + DeviceName + " with bound hands.", messageBox = true)
		return False
	EndIf	
	Float HoursNeeded = (EscapeCooldown * CalculateCooldownModifier(False))
	Float HoursPassed = (Utility.GetCurrentGameTime() - LastLockPickEscapeAttemptAt) * 24.0
	if HoursPassed > HoursNeeded
		LastLockPickEscapeAttemptAt = Utility.GetCurrentGameTime()
		return True
	Else
		Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
		libs.notify("You cannot try to pick this device so soon after the last attempt! You can try again in about " + HoursToWait + " hours.", messageBox = true)
	EndIf
	return False
EndFunction

; returns 0 when the escape attempt fails, 1 at success and -1 when no attempt was made due to cooldown
Int Function Escape(Float Chance)
	Bool Success = False
	If Chance == 0.0
		; no need to process, but returning here will prevent catastrophic failures when there is zero chance of success. We're not THAT mean!
		return 0
	Endif
	libs.log("Player is trying to escape " + DeviceName + ". Escape chance after modifiers: " + Chance +"%")
	If Utility.RandomFloat(0.0, 99.9) < (Chance * CalculateDifficultyModifier(True))
		libs.log("Player has escaped " + DeviceName)
		; increase success counter
		libs.zadDeviceEscapeSuccessCount.SetValueInt(libs.zadDeviceEscapeSuccessCount.GetValueInt() + 1)		
		RemoveDevice(libs.PlayerRef)
		return 1
	Else
		libs.log("Player has failed to escape " + DeviceName)
	EndIf
	return 0
EndFunction

Bool Function HasValidCuttingTool()
	; on second thought...this is Skyrim! Does anybody ever NOT carry a blade?
	Return True	
	; Bool HasValidItem = false	
	; Int i = libs.zad_DD_StandardCuttingToolsList.GetSize()
	; While i > 0 && !HasValidItem
		; i -= 1
		; Form frm = libs.zad_DD_StandardCuttingToolsList.GetAt(i)
		; If libs.playerref.GetItemCount(frm) > 0
			; HasValidItem = True
		; EndIf
	; EndWhile	
	; i = AllowedTool.Length
	; While i > 0 && !HasValidItem
		; i -= 1
		; Form frm = AllowedTool[i]		
		; If libs.playerref.GetItemCount(frm) > 0
			; HasValidItem = True
		; EndIf
	; EndWhile
	; return HasValidItem
EndFunction

Float Function CalclulateCutSuccess()
	Float result = CutDeviceEscapeChance
	; Apply modifiers, but only if the device is not impossible to escape from to begin with.
	If CutDeviceEscapeChance > 0.0
		; add 1% for every previous attempt
		result += EscapeCutAttemptsMade		
		If Libs.PlayerRef.GetAV("OneHanded") > 25
			result += 1.0
		Endif
		If Libs.PlayerRef.GetAV("OneHanded") > 50
			result += 2.0
		Endif
		If Libs.PlayerRef.GetAV("OneHanded") > 75
			result += 3.0
		Endif
		; apply bonus for total successful escapes
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

Function EscapeAttemptCut()	
	If !HasValidCuttingTool()
		libs.notify("You do not possess a tool you could use for cutting your " + DeviceName + ".", messageBox = true)
		return
	EndIf
	; can't try this with bound hands. We do allow cutting wrist restraints itself, though.
	If libs.PlayerRef.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !deviceRendered.HasKeyword(libs.zad_DeviousHeavyBondage)
		libs.notify("You cannot try to cut open the " + DeviceName + " with bound hands.", messageBox = true)
		return
	EndIf
	If !CanMakeCutEscapeAttempt()
		return
	EndIf	
	If zad_DD_EscapeCutMSG
		zad_DD_EscapeCutMSG.Show()
	Else 
		libs.zad_DD_EscapeCutMSG.Show()
	EndIf
	Int i = Escape(CalclulateCutSuccess())
	If i == 1
		; device got removed in Escape(), so just need to show the success message.
		If zad_DD_EscapeCutSuccessMSG
			zad_DD_EscapeCutSuccessMSG.Show()
		Else
			libs.zad_DD_EscapeCutSuccessMSG.Show()
		EndIf
	Elseif i == 0
		; catastrophic failure will prevent further escape attempts
		if Utility.RandomFloat(0.0, 99.9) < CatastrophicFailureChance
			CutDeviceEscapeChance = 0.0
			libs.notify("You fail to escape from your " + DeviceName + " and your feeble attempts tighten the device so much that you won't ever be able to cut it open.", messageBox = true)
		Else
			; regular failure
			EscapeCutAttemptsMade += 1
			If zad_DD_EscapeCutFailureMSG
				zad_DD_EscapeCutFailureMSG.Show()
			Else
				libs.zad_DD_EscapeCutFailureMSG.Show()
			EndIf
		Endif
	EndIf
EndFunction

Function EscapeAttemptLockPick()
	if StorageUtil.GetIntValue(libs.Playerref, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus") == 1		
		libs.Notify("You cannot try to pick a jammed lock!", true)
		return
	EndIf
	If !HasValidLockPick()
		libs.notify("You do not possess a pick you could use on your " + DeviceName + ".", messageBox = true)
		return
	EndIf	
	If !CanMakeLockPickEscapeAttempt()
		return
	EndIf
	If zad_DD_EscapeLockPickMSG	
		zad_DD_EscapeLockPickMSG.Show()
	Else
		libs.zad_DD_EscapeLockPickMSG.Show()
	EndIf
	; first make a check against lock difficulty as you can't pick what you can't reach! The cooldown timer has already reset at this point.
	If Utility.RandomFloat(0.0, 99.9) < LockAccessDifficulty
		libs.notify("You fail to reach your " + DeviceName + "'s locks and can't attempt to pick the lock.", messageBox = true)		
		return
	EndIf
	Int i = Escape(CalclulateLockPickSuccess())
	If i == 1
		; device got removed in Escape(), so just need to show the success message.
		If zad_DD_EscapeLockPickSuccessMSG
			zad_DD_EscapeLockPickSuccessMSG.Show()
		Else
			libs.zad_DD_EscapeLockPickSuccessMSG.Show()
		EndIf
	Elseif i == 0
		; catastrophic failure will prevent further escape attempts
		if Utility.RandomFloat(0.0, 99.9) < CatastrophicFailureChance
			LockPickEscapeChance = 0.0
			libs.notify("You fail to escape from your " + DeviceName + " and your feeble attempts trigger a safety shield inside the lock, preventing further pick attempts.", messageBox = true)
		Else
			; regular failure
			EscapeLockPickAttemptsMade += 1
			; destroy the lockpick
			DestroyLockPick()
			If zad_DD_EscapeLockPickFailureMSG
				zad_DD_EscapeLockPickFailureMSG.Show()
			Else
				libs.zad_DD_EscapeLockPickFailureMSG.Show()
			EndIf
		Endif
	EndIf
EndFunction

Bool Function HasValidLockPick()
	Bool HasValidItem = false
	If AllowLockPick && libs.PlayerRef.GetItemCount(libs.Lockpick) > 0
		return true
	EndIf
	Int i = AllowedLockPicks.Length
	While i > 0 && !HasValidItem
		i -= 1
		Form frm = AllowedLockPicks[i]
		If libs.playerRef.GetItemCount(frm) > 0
			HasValidItem = True
		EndIf
	EndWhile
	return HasValidItem
EndFunction

Bool Function DestroyLockPick()
	Bool LockPickDestroyed = false
	If AllowLockPick && libs.PlayerRef.GetItemCount(libs.Lockpick) > 0
		libs.playerRef.RemoveItem(libs.Lockpick)
		return True
	EndIf
	Int i = AllowedLockPicks.Length
	While i > 0 && !LockPickDestroyed
		i -= 1
		Form frm = AllowedLockPicks[i]
		If libs.playerRef.GetItemCount(frm) > 0 && !(frm As Keyword)
			libs.playerRef.RemoveItem(frm)
			LockPickDestroyed = True
		EndIf
	EndWhile
	return LockPickDestroyed
EndFunction

Float Function CalclulateLockPickSuccess()
	Float result = LockPickEscapeChance
	; Apply modifiers, but only if the device is not impossible to escape from to begin with.
	If LockPickEscapeChance > 0.0
		; add 1% for every previous attempt
		result += EscapeLockPickAttemptsMade		
		If Libs.PlayerRef.GetAV("Lockpicking") > 25
			result += 1.0
		Endif
		If Libs.PlayerRef.GetAV("Lockpicking") > 50
			result += 2.0
		Endif
		If Libs.PlayerRef.GetAV("Lockpicking") > 75
			result += 3.0
		Endif
		; apply bonus for total successful escapes
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

String[] Function SelectStruggleArray(actor akActor)
	If akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirt) && !akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirtRelaxed)
		if struggleIdlesHob.length > 0
			return struggleIdlesHob		; Use hobbled struggle idles
		else
			return struggleIdles		; Fall back to standard animations if no hobbled variants are available
		endif
	Else
		return struggleIdles		; Use regular struggle idles
	Endif
EndFunction

Function StruggleScene(actor akActor)
	if libs.IsAnimating(akActor)
		return
	EndIf
	String[] struggleArray = SelectStruggleArray(akActor)
	int len = struggleArray.length - 1
	If len < 1 
		return
	EndIf
	bool[] cameraState = libs.StartThirdPersonAnimation(akActor, struggleArray[Utility.RandomInt(0, len)], true)
	Utility.Wait(10)
	libs.Pant(libs.PlayerRef)
	Utility.Wait(10)
	libs.Pant(libs.PlayerRef)
	Utility.Wait(10)
	libs.EndThirdPersonAnimation(akActor, cameraState, true)
	libs.SexlabMoan(libs.PlayerRef)
EndFunction

Function EscapeAttemptStruggle()
	If !CanMakeStruggleEscapeAttempt()
		return
	EndIf
	If zad_DD_EscapeStruggleMSG
		zad_DD_EscapeStruggleMSG.Show()
	Else
		libs.zad_DD_EscapeStruggleMSG.Show()
	EndIf
	StruggleScene(libs.PlayerRef)
	Int i = Escape(CalclulateStruggleSuccess())
	If i == 1
		; device got removed in Escape(), so just need to show the success message.
		If zad_DD_EscapeStruggleSuccessMSG
			zad_DD_EscapeStruggleSuccessMSG.Show()
		Else
			libs.zad_DD_EscapeStruggleSuccessMSG.Show()
		EndIf
	Elseif i == 0
		; catastrophic failure will prevent further escape attempts
		if Utility.RandomFloat(0.0, 99.9) < CatastrophicFailureChance
			BaseEscapeChance = 0.0
			libs.notify("You fail to escape from your " + DeviceName + " and your feeble attempts tighten the device so much that you won't ever be able to struggle out from it.", messageBox = true)
		Else
			; regular failure
			EscapeStruggleAttemptsMade += 1
			If zad_DD_EscapeStruggleFailureMSG
				zad_DD_EscapeStruggleFailureMSG.Show()
			Else
				libs.zad_DD_EscapeStruggleFailureMSG.Show()
			EndIf
		Endif
	EndIf
EndFunction

Float Function CalclulateStruggleSuccess()
	Float result = BaseEscapeChance
	; Apply modifiers, but only if the device is not impossible to escape from to begin with.
	If BaseEscapeChance > 0.0
		; add 1% for every previous attempt
		result += EscapeStruggleAttemptsMade		
		; apply strength bonus
		If Libs.PlayerRef.GetAV("Destruction") > 25 || Libs.PlayerRef.GetAV("Alteration") > 25
			result += 1.0
		Endif
		If Libs.PlayerRef.GetAV("Destruction") > 50 || Libs.PlayerRef.GetAV("Alteration") > 50
			result += 2.0
		Endif
		If Libs.PlayerRef.GetAV("Destruction") > 75 || Libs.PlayerRef.GetAV("Alteration") > 75
			result += 3.0
		Endif		
		; apply bonus for total successful escapes
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

; returns 0 when the escape attempt fails, 1 at success and -1 when no attempt was made due to cooldown
Int Function RepairJammedLock(Float Chance)
	Bool Success = False
	If Chance == 0.0
		; no need to process, but returning here will prevent catastrophic failures when there is zero chance of success. We're not THAT mean!
		return 0
	Endif
	libs.log("Player is trying to repair " + DeviceName + ". Repair chance after modifiers: " + Chance +"%")
	; check if the character can make a repair attempt
	Float HoursNeeded = (RepairCooldown * CalculateCooldownModifier(False))
	Float HoursPassed = (Utility.GetCurrentGameTime() - LastRepairAttemptAt) * 24.0	
	if HoursPassed > HoursNeeded
		LastRepairAttemptAt = Utility.GetCurrentGameTime()
		If Utility.RandomFloat(0.0, 99.9) < (Chance * CalculateDifficultyModifier(True))
			libs.log("Player has repaired " + DeviceName)			
			StorageUtil.SetIntValue(libs.playerref, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus", 0)			
			return 1
		Else
			libs.log("Player has failed to repair " + DeviceName)
		EndIf
	Else
		Int HoursToWait = Math.Ceiling(HoursNeeded - HoursPassed)
		libs.notify("You cannot try to repair this device's lock so soon after the last attempt! You can try again in about " + HoursToWait + " hours.", messageBox = true)
		return -1
	EndIf
	return 0
EndFunction

Function DeviceMenuRemoveWithoutKey()
	If IsUnEquipDeviceConflict(libs.playerref)
		return
	Endif
	; legacy escape system
	; If !BaseEscapeChance
		; int deviceRemoveOption = zad_DeviceRemoveMsg.show()
		; if deviceRemoveOption == 0 ; Lockpicking           
			; DeviceMenuPickLock()
		; elseif deviceRemoveOption == 1 ; Magicking
			; DeviceMenuMagic()
		; elseif deviceRemoveOption == 2 ; Brute force
			; DeviceMenuBruteForce()
		; elseif deviceRemoveOption == 3
			; DeviceMenuCarryOn()
		; endif
		; return
	; EndIf
	
	int msgOption 
	If !zad_DeviceEscapeMsg ; legacy device, use the default message in zadlibs
		msgOption = libs.zad_DeviceEscapeMsg.show()	
	Else
		msgOption = zad_DeviceEscapeMsg.show()	
	Endif
	If msgOption == 0 ; try to escape		
		If IsUnequipDeviceConflict(libs.PlayerRef)
			Return
		EndIf
		Int EscapeOption
		If !zad_DD_EscapeDeviceMSG ; legacy device, use the default message in zadlibs
			EscapeOption = libs.zad_DD_EscapeDeviceMSG.show()	
		Else
			EscapeOption = zad_DD_EscapeDeviceMSG.show()	
		Endif		
		If EscapeOption == 0 ; Struggle
			EscapeAttemptStruggle()
		Elseif EscapeOption == 1 ; Pick Lock
			EscapeAttemptLockPick()
		Elseif EscapeOption == 2 ; Cut Device
			EscapeAttemptCut()
		Elseif EscapeOption == 3 ; Examine
			DisplayDifficultyMsg()
		Elseif EscapeOption == 4 ; Repair
			If StorageUtil.GetIntValue(libs.playerref, "zad_Equipped" + libs.LookupDeviceType(zad_DeviousDevice) + "_LockJammedStatus") == 1				
				; this device has a jammed lock
				Int JamOption 
				If zad_DD_RepairLockMSG
					JamOption = zad_DD_RepairLockMSG.Show()
				Else
					JamOption = libs.zad_DD_RepairLockMSG.Show()
				EndIf
				If JamOption == 0 ; try
					Int RepairResult = RepairJammedLock(RepairJammedLockChance)
					If RepairResult == 0 ; fail
						If zad_DD_RepairLockFailureMSG
							zad_DD_RepairLockFailureMSG.Show()
						Else
							libs.zad_DD_RepairLockFailureMSG.Show()
						EndIf
					Elseif RepairResult == 1 ; success
						If zad_DD_RepairLockSuccessMSG
							zad_DD_RepairLockSuccessMSG.Show()
						Else
							libs.zad_DD_RepairLockSuccessMSG.Show()
						EndIf
						; no further action needed. Jammed lock status got reset in the function
					EndIf
				EndIf
			Else
				; not jammed. Silly player!
				If zad_DD_RepairLockNotJammedMSG
					zad_DD_RepairLockNotJammedMSG.Show()
				Else
					libs.zad_DD_RepairLockNotJammedMSG.Show()
				EndIf
			EndIf		
		Elseif EscapeOption == 5 ; Nothing
			If zad_DD_OnLeaveItWornMSG
				zad_DD_OnLeaveItWornMSG.Show()
			EndIf
		EndIf		
	ElseIf msgOption == 1 ; examine
		DisplayDifficultyMsg()
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
