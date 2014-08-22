Scriptname zadDevicesUnderneathPlayerScript extends ReferenceAlias

zadLibs Property libs Auto
import zadNativeFunctions

Bool Property Working Auto

Event OnPlayerLoadGame()
	libs.DevicesUnderneath.Maintenance()
EndEvent


Function Logic(armor akArmor, bool equipOrUnequip)
	; libs.Log("equipOrUnequip = " + equipOrUnequip)
	if akArmor == None
		return
	EndIf
	if FormHasKeywordString(akArmor as Form, "NoHide")
		return
	EndIf
	; libs.Log("Logic("+equipOrUnequip+")")
	int slotMask = akArmor.GetSlotMask()
	if slotmask == 0
		return
	EndIf
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
		return
	EndIf
	Logic(akArmor, true)
	Working = False
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
		return
	EndIf
	Logic(akArmor, false)
	Working = False
EndEvent
