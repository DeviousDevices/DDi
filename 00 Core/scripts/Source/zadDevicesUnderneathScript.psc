scriptname zadDevicesUnderneathScript extends Quest

zadLibs Property libs Auto
import zadNativeFunctions
Armor Property zad_DeviceHider Auto
ArmorAddon Property zad_DeviceHiderAA Auto

int[] Property SlotMaskFilters Auto
int[] Property SlotMaskUsage Auto
int[] Property ShiftCache Auto

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

; Event OnInit()
; 	Maintenance()
; EndEvent


Function SetDefaultSlotMasks()
	SlotMaskFilters = new int[128]
	SlotMaskUsage = new int[128]
	ShiftCache = new int [33]
	int i = 0
	while i <= 32
		ShiftCache[i] = Math.LeftShift(1, i)
		i += 1
	EndWhile
	; SlotMaskFilters[2*4] = Math.LeftShift(1,26) ; For slot 32, hide slot 56.
	HideEquipment(32, 51) ; When slot 32 is equipped, hide slot 51 (Nipple Piercings).
	HideEquipment(32, 56) ; When slot 32 is equipped, hide slot 56 (Chastity Bra's).
	HideEquipment(32, 58) ; When slot 32 is equipped, hide slot 58 (Corsets).
	HideEquipment(32, 49) ; When slot 32 is equipped, hide slot 49 (Belts).
EndFunction


Function HideEquipment(int slot1, int slot2)
	if slot1 < 30 || slot1 > 61 || slot2 < 30 || slot2 > 61
		libs.Error("HideEquipment received out of bound slot number.")
	else
		int index = ((slot1 - 30) * 4)
		int i = 0
		while i < 4
			if SlotMaskFilters[index+i] == 0
				SlotMaskFilters[index+i] = ShiftCache[slot2 - 30]
				libs.Log("DevicesUnderneath Registered(" + index+i + ":" + (slot2 - 30)+")")
				return
			EndIf
			i += 1
		EndWhile
		libs.Error("Maximum number of equipment slots reached for slot "+ slot1 + " while trying to hide slot "+ slot2)
	EndIf
EndFunction


Function Maintenance()
	libs.Log("DevicesUnderneath::Maintenance()")
	zad_DeviceHiderAA = zad_DeviceHider.GetNthArmorAddon(0)
	if SlotMaskFilters.length <= 0 || ShiftCache.Length <= 0
		SetDefaultSlotMasks()
	EndIf
	if libs.Config.DevicesUnderneathSlot == 0
		; libs.Config.DevicesUnderneathSlot = libs.Config.DevicesUnderneathSlotDefault
	EndIf
	UpdateDeviceHiderSlot()
EndFunction


Function ApplySlotmask()
	libs.PlayerRef.EquipItem(zad_DeviceHider, true, true)
	if SlotMask != zad_DeviceHiderAA.GetSlotMask()
		if SlotMask < 0
			SlotMask = 0
		EndIf
		zad_DeviceHiderAA.SetSlotMask(SlotMask)
		libs.Log("Set slot mask to ["+SlotMask+"]: "+zad_DeviceHiderAA.GetSlotMask())
		if libs.Config.UseQueueNiNode && !libs.PlayerRef.IsOnMount() ; Warning not to do this if mounted in Actor.psc
			; libs.Log("Using NiNode to update")
			libs.PlayerRef.QueueNiNodeUpdate()
			if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousGag)
				libs.ApplyGagEffect(libs.PlayerRef)
			EndIf
		Else
			libs.PlayerRef.UnEquipItem(zad_DeviceHider, false, true)
			libs.PlayerRef.EquipItem(zad_DeviceHider, true, true)
		EndIf
	EndIf
EndFunction


Function UpdateSlotmask(int index, int slot, bool equipOrUnequip)
	; libs.Log("UpdateSlotMask("+(index+30)+").")
	index *= 4
	if index >= 124
		libs.Error("UpdateSlotmask received out of bound index: "+index)
	else
		int i = 0
		while i < 4
		; libs.Log("Checking "+SlotMask +" vs "+SlotMaskFilters[index+i])
			if SlotMaskFilters[index+i] != 0
				; libs.Log("Match.")
				if equipOrUnequip
					SlotMask = Math.LogicalOr(SlotMask, SlotMaskFilters[index+i])
					SlotMaskUsage[index+i] = SlotMaskUsage[index+i] + 1
				Else
					SlotMaskUsage[index+i] = SlotMaskUsage[index+i] - 1
					; if SlotMaskUsage[index+i] <= 1
					; 	SlotMaskUsage[index+i] = 0
					SlotMask = SlotMask - SlotMaskFilters[index+i]
					; EndIf
				EndIf
			EndIf
			i += 1
		EndWhile
		; libs.Log("End UpdateSlotMask: "+SlotMask)
	EndIf
EndFunction


Function RebuildSlotmask(actor akActor)
	libs.Log("RebuildSlotmask()")
	int i = 0
	while i < 128
		SlotMaskUsage[i] = 0
		i += 1
	EndWhile
	SlotMask = 0
 	i = 0	
 	while i <= 30
 		Armor x = akActor.GetWornForm(ShiftCache[i]) as Armor
		if x != None && !FormHasKeywordString(x as Form, "NoHide")
			int sm = x.GetSlotMask()
			int j = 0
			While j <= 30
				int slot = ShiftCache[j]
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


Function UpdateDeviceHiderSlot()
	int slot = libs.Config.DevicesUnderneathSlot - 1
	libs.Log("Set Device Hider slot to "+(slot+30)+".")
	zad_DeviceHider.SetSlotMask(Math.LeftShift(1, slot))
	RebuildSlotMask(libs.PlayerRef)
	if !libs.PlayerRef.IsOnMount()
		libs.PlayerRef.QueueNiNodeUpdate()
	EndIf
EndFunction
