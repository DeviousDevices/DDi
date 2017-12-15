Scriptname zadDevicesUnderneathPlayerScript extends ReferenceAlias

zadLibs Property libs Auto
import zadNativeFunctions

Bool Property Working Auto

Event OnPlayerLoadGame()
	libs.DevicesUnderneath.Maintenance()
	libs.PlayerRef.RemoveItem(libs.DevicesUnderneath.zad_DeviceHider, 5, true)
EndEvent


Function Logic(armor akArmor, bool equipOrUnequip)
	; libs.Log("equipOrUnequip = " + equipOrUnequip)
	if akArmor != None
		if !FormHasKeywordString(akArmor as Form, "NoHide")
			; libs.Log("Logic("+equipOrUnequip+")")
			int slotMask = akArmor.GetSlotMask()
			if slotmask != 0
				int i = 0
				While i <= 30
					int slot = libs.DevicesUnderneath.ShiftCache[i]
					; libs.Log("Checking slot "+(i+30) +": "+slot)
					if Math.LogicalAnd(SlotMask, slot)
						libs.DevicesUnderneath.UpdateSlotmask(i, slot, equipOrUnequip)
					EndIf
					i += 1
				EndWhile
				libs.DevicesUnderneath.ApplySlotmask()
				; libs.Log("EndLogic()")
			EndIf	
		EndIf
	EndIf
EndFunction

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	int timeout = 0
	While Working && timeout <= 500
		timeout += 1
		Utility.Wait(0.01)
	EndWhile
	Working = True
	armor akArmor = (akBaseObject as Armor)
	if akArmor == libs.DevicesUnderneath.zad_DeviceHider
		Working = False
	else
		Logic(akArmor, true)
		Working = False
	EndIf
EndEvent


Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	int timeout = 0
	While Working && timeout <= 500
		timeout += 1
		Utility.Wait(0.01)
	EndWhile
	Working = True
	armor akArmor = (akBaseObject as Armor)
	if akArmor == libs.DevicesUnderneath.zad_DeviceHider
		libs.PlayerRef.EquipItem(libs.DevicesUnderneath.zad_DeviceHider, true, true)
		Working = False
	else
		Logic(akArmor, false)
		Working = False	
	EndIf
EndEvent
