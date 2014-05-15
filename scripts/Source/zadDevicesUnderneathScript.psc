scriptname zadDevicesUnderneathScript extends Quest

zadLibs Property libs Auto
Armor Property zad_DeviceHider Auto
ArmorAddon Property zad_DeviceHiderAA Auto

int[] Property SlotMaskFilters Auto
int[] Property SlotMaskUsage Auto
int Property SlotMask Auto ; Avoid repeated lookups


;; [30]: 0x00000001
;; [31]: 0x00000002
;; [32]: 0x00000004
;; [33]: 0x00000008
;; [34]: 0x00000010
;; [35]: 0x00000020
;; [36]: 0x00000040
;; [37]: 0x00000080
;; [38]: 0x00000100
;; [39]: 0x00000200
;; [40]: 0x00000400
;; [41]: 0x00000800
;; [42]: 0x00001000
;; [43]: 0x00002000
;; [44]: 0x00004000
;; [45]: 0x00008000
;; [46]: 0x00010000
;; [47]: 0x00020000
;; [48]: 0x00040000
;; [49]: 0x00080000
;; [50]: 0x00100000
;; [51]: 0x00200000
;; [52]: 0x00400000
;; [53]: 0x00800000
;; [54]: 0x01000000
;; [55]: 0x02000000
;; [56]: 0x04000000
;; [57]: 0x08000000
;; [58]: 0x10000000
;; [59]: 0x20000000

Event OnInit()
	Maintenance()
EndEvent


Function SetDefaultSlotMasks()
	SlotMaskFilters = new int[128]
	SlotMaskUsage = new int[128]
	; SlotMaskFilters[2*4] = Math.LeftShift(1,26) ; For slot 32, hide slot 56.
	HideEquipment(32, 56) ; When slot 32 is equipped, hide slot 56.
EndFunction


Function HideEquipment(int slot1, int slot2)
	if slot1 < 30 || slot1 > 61 || slot2 < 30 || slot2 > 61
		libs.Error("HideEquipment received out of bound slot number.")
		Return
	EndIf
	int index = ((slot1 - 30) * 4)
	int i = 0
	while i < 4
		if SlotMaskFilters[index+i] == 0
			SlotMaskFilters[index+i] = Math.LeftShift(1, (slot2 - 30))
			libs.Log("DevicesUnderneath Registered(" + index+i + ":" + (slot2 - 30)+")")
			return
		EndIf
		i += 1
	EndWhile
	libs.Error("Maximum number of equipment slots reached for slot "+ slot1 + " while trying to hide slot "+ slot2)
EndFunction


Function Maintenance()
	libs.Log("DevicesUnderneath::Maintenance()")
	zad_DeviceHiderAA = zad_DeviceHider.GetNthArmorAddon(0)
	if SlotMaskFilters.length <= 0
		SetDefaultSlotMasks()
		SlotMask = zad_DeviceHiderAA.GetSlotMask()
	EndIf
	ApplySlotmask()
EndFunction


Function ApplySlotmask()
	if SlotMask < 0
		SlotMask = 0
	EndIf
	zad_DeviceHiderAA.SetSlotMask(SlotMask)
	libs.Log("Set slot mask to ["+SlotMask+"]: "+zad_DeviceHiderAA.GetSlotMask())
	; libs.PlayerRef.UnEquipItem(zad_DeviceHider, false, true)
	libs.PlayerRef.EquipItem(zad_DeviceHider, true, true)
	if !libs.PlayerRef.IsOnMount() ; Warning not to do this if mounted in Actor.psc
		libs.PlayerRef.QueueNiNodeUpdate()
	EndIf
EndFunction


Function UpdateSlotmask(int index, int slot, bool equipOrUnequip)
	libs.Log("UpdateSlotMask("+(index+30)+").")
	index *= 4
	if index >= 124
		libs.Error("UpdateSlotmask received out of bound index: "+index)
		return
	EndIf
	int i = 0
	while i < 4
		libs.Log("Checking "+SlotMask +" vs "+SlotMaskFilters[index+i])
		if SlotMaskFilters[index+i] != 0
			libs.Log("Match.")
			if equipOrUnequip
				SlotMask = Math.LogicalOr(SlotMask, SlotMaskFilters[index+i])
				SlotMaskUsage[index+i] = SlotMaskUsage[index+i] + 1
			Else
				SlotMaskUsage[index+i] = SlotMaskUsage[index+i] - 1
				if SlotMaskUsage[index+i] <= 0
					SlotMaskUsage[index+i] = 0
					SlotMask = SlotMask - SlotMaskFilters[index+i]
				EndIf
			EndIf
		EndIf
		i += 1
	EndWhile
	libs.Log("End UpdateSlotMask: "+SlotMask)
EndFunction


Function RebuildSlotmask(actor akActor)
	libs.Log("RebuildSlotmask()")
	SlotMaskUsage = new int[128]
	SlotMask = 0
 	int i = 0	
 	while i <= 30
 		Armor x = akActor.GetWornForm(Math.LeftShift(1, i)) as Armor
		if x != None
			int sm = x.GetSlotMask()
			int j = 0
			While j <= 30
				int slot = Math.LeftShift(1, j)
				if Math.LogicalAnd(sm, slot)
					UpdateSlotmask(j, slot, true)
				EndIf
				j += 1
			EndWhile
		EndIf
 		i += 1
 	EndWhile
	ApplySlotMask()
EndFunction
