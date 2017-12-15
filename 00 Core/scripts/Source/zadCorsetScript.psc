Scriptname zadCorsetScript extends zadEquipScript  

Armor Property stateDefault Auto
Armor Property stateBeltedFull Auto 
Armor Property stateBeltedOpen Auto 


Function UpdateState(actor akActor) 
	armor tmp = DeviceRendered
	int currentState = StorageUtil.GetIntValue(akActor, "zad_StoredCorsetRendered", 0)
	if currentState == 0
		DeviceRendered = stateDefault
	ElseIf currentState == 1
		deviceRendered = stateBeltedOpen
	ElseIf currentState == 2
		deviceRendered = stateBeltedFull
	EndIf
	if akActor.WornHasKeyword(libs.zad_DeviousCorset) ; Don't process further if not wearing a corset.
		if !akActor.IsEquipped(deviceRendered)
			akActor.RemoveItem(stateDefault, 1, true)
			akActor.RemoveItem(stateBeltedFull, 1, true)
			akActor.RemoveItem(stateBeltedOpen, 1, true)
			akActor.EquipItem(deviceRendered, true, true)
		EndIf
	EndIf
EndFunction


Function StoreCorset(actor akActor)
	StorageUtil.SetFormValue(akActor, "zad_StoredCorsetInventory", deviceInventory)
	; StorageUtil.SetFormValue(akActor, "zad_StoredCorsetRendered", deviceRendered)
EndFunction


Function PurgeCorset(actor akActor)
	StorageUtil.UnSetIntValue(akActor, "zad_StoredCorsetRendered")
	StorageUtil.UnSetFormValue(akActor, "zad_StoredCorsetInventory")
EndFunction


Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You pull the corset around "+GetMessageName(akActor)+" waist, and lock it in the back.", akActor, true)
	EndIf
	libs.UpdateCorsetState(akActor)
	UpdateState(akActor)
	StoreCorset(akActor)
	Parent.OnEquippedPre(akActor, silent)
EndFunction


int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if ! akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Corset).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousHarness)
			MultipleItemFailMessage("Harness")
			return 2
		Endif
	Endif
	return 0
EndFunction


Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost Corset")
EndFunction

Function OnRemoveDevice(actor akActor)
	PurgeCorset(akActor)
EndFunction

Function OnUnequipped(actor akActor)
	if StorageUtil.GetIntValue(akActor, "zad_RemovalToken" + deviceInventory, 0) < 1
		UpdateState(akActor)
	EndIf
	Parent.OnUnequipped(akActor)
EndFunction

Function EquipDevice(actor akActor, bool skipMutex=false)
	UpdateState(akActor)
	Parent.EquipDevice(akActor, skipMutex)
EndFunction
