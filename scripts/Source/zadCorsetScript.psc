Scriptname zadCorsetScript extends zadEquipScript  

Armor Property stateDefault Auto
Armor Property stateBeltedFull Auto 
Armor Property stateBeltedOpen Auto 

Function UpdateState(actor akActor)
	libs.Log("UpdateCorset()")
	;Armor tmp = DeviceRendered
	Armor tmp = StorageUtil.GetFormValue(akActor, "zad_StoredCorsetRendered", stateDefault) as Armor
	if akActor.WornHasKeyword(libs.zad_DeviousBelt)
		if akActor.WornHasKeyword(libs.zad_PermitAnal)
			DeviceRendered = stateBeltedOpen
			libs.Log("Using stateBeltedOpen")
		Else
			libs.Log("Using stateBeltedFull")
			DeviceRendered = stateBeltedFull
		EndIf
	Else
		libs.Log("Using stateDefault")
		DeviceRendered = stateDefault
	EndIf
	if (DeviceRendered != tmp)
		akActor.EquipItem(DeviceRendered, true, true)
		akActor.RemoveItem(tmp, 1, true)
		StorageUtil.SetFormValue(akActor, "zad_StoredCorsetRendered", DeviceRendered)
	EndIf
EndFunction


Function StoreCorset(actor akActor)
	libs.Log("StoreCorset("+deviceInventory+")")
	StorageUtil.SetFormValue(akActor, "zad_StoredCorsetInventory", deviceInventory)
	StorageUtil.SetFormValue(akActor, "zad_StoredCorsetRendered", deviceRendered)
EndFunction

Function PurgeCorset(actor akActor)
	StorageUtil.UnSetFormValue(akActor, "zad_StoredCorsetInventory")
	StorageUtil.UnSetFormValue(akActor, "zad_StoredCorsetRendered")
EndFunction

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You pull the corset around "+GetMessageName(akActor)+" waist, and lock it in the back.", akActor, true)
	EndIf
	UpdateState(akActor)
	StoreCorset(akActor)
	Parent.OnEquippedPre(akActor, silent)
EndFunction

Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost Corset")
EndFunction

Function OnRemoveDevice(actor akActor)
	PurgeCorset(akActor)
EndFunction

Function SyncInventory(actor akActor=none)
	if akActor == none
		akActor = libs.PlayerRef
	EndIf
	DeviceRendered = StorageUtil.GetFormValue(akActor, "zad_StoredCorsetRendered", stateDefault) as Armor
	Parent.SyncInventory(akActor)
EndFunction
