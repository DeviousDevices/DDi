Scriptname zadPlugChargeableScript extends zadPlugSoulgemScript



Function OnRemoveDevice(actor akActor)
	int CurrentCharge = StorageUtil.GetIntValue(libs.PlayerRef, "zad.SoulgemChargeValue") 
	libs.Log("OnRemoveDevice(Current Charge:"+CurrentCharge+")")
	If CurrentCharge >= 100 ; Fully charged.
		; Break down plug.
		libs.NotifyPlayer("After removing the plug from your trembling groin, the stand easily detaches.") 
		akActor.RemoveItem(DeviceInventory)
		akActor.AddItem(libs.SoulgemFilled)
		akActor.AddItem(libs.SoulgemStand)
	Else
		libs.NotifyPlayer("Though the plug glows upon removal, the light quickly fades from it.")
	EndIf
	StorageUtil.UnsetIntValue(akActor, "zad.SoulgemChargeValue")
EndFunction


Function OnEquippedPost(actor akActor)
	StorageUtil.SetIntValue(akActor, "zad.SoulgemChargeValue", 0)
	Parent.OnEquippedPost(akActor)
EndFunction
