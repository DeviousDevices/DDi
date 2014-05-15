Scriptname zadDevicesUnderneathPlayerScript extends ReferenceAlias

zadLibs Property libs Auto


Event OnPlayerLoadGame()
	libs.DevicesUnderneath.Maintenance()
EndEvent


Function Logic(armor akArmor, bool equipOrUnequip)
	if akArmor == None
		return
	EndIf
	; libs.Log("Logic("+equipOrUnequip+")")
	int slotMask = akArmor.GetSlotMask()
	int i = 0
	While i <= 30
		int slot = Math.LeftShift(1, i)
		; libs.Log("Checking slot "+(i+30) +": "+slot)
		if Math.LogicalAnd(SlotMask, slot)
			libs.DevicesUnderneath.UpdateSlotmask(i, slot, equipOrUnequip)
		EndIf
		i += 1
	EndWhile
	libs.DevicesUnderneath.ApplySlotmask()
	libs.Log("EndLogic()")
EndFunction


Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	armor akArmor = (akBaseObject as Armor)
	if akArmor == libs.DevicesUnderneath.zad_DeviceHider
		return
	EndIf
	Logic(akArmor, true)
EndEvent


Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	armor akArmor = (akBaseObject as Armor)
	if akArmor == libs.DevicesUnderneath.zad_DeviceHider
		return
	EndIf
	Logic(akArmor, false)
EndEvent
