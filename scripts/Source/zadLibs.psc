Scriptname zadLibs extends Quest
; Libraries
SexLabFramework property SexLab auto
; import sslExpressionLibrary
import MfgConsoleFunc
import StringUtil
import zadNativeFunctions

slaUtilScr Property Aroused Auto
zadConfig Property Config Auto
zadNPCQuestScript Property zadNPCQuest Auto
zadArmbinderQuestScript Property abq Auto
zadYokeQuestScript Property ybq Auto
zadEventSlots Property EventSlots Auto ; See zadBaseEvent.psc for how to use the new events system.
zadDevicesUnderneathScript Property DevicesUnderneath Auto
Quest Property zadNPCSlots Auto

zbfBondageShell Property zbf Auto
zbfPlayerControl Property zbfPC Auto

; Keywords
Keyword Property zad_DeviousPlug Auto
Keyword Property zad_DeviousBelt Auto
Keyword Property zad_DeviousBra Auto
Keyword Property zad_DeviousCollar Auto
Keyword Property zad_DeviousArmCuffs Auto
Keyword Property zad_DeviousLegCuffs Auto
Keyword Property zad_DeviousArmbinder Auto
Keyword Property zad_DeviousHeavyBondage Auto

Keyword Property zad_DeviousYoke Auto
Keyword Property zad_DeviousCorset Auto
Keyword Property zad_DeviousClamps Auto
Keyword Property zad_DeviousGloves Auto
Keyword Property zad_DeviousHood Auto
Keyword Property zad_DeviousSuit Auto

Keyword Property zad_DeviousGag Auto
Keyword Property zad_DeviousGagPanel Auto
Keyword Property zad_DeviousPlugVaginal Auto
Keyword Property zad_DeviousPlugAnal Auto
Keyword Property zad_DeviousHarness Auto
Keyword Property zad_DeviousBlindfold Auto
Keyword Property zad_DeviousBoots Auto
Keyword Property zad_Lockable Auto
Keyword Property zad_DeviousPiercingsNipple Auto
Keyword Property zad_DeviousPiercingsVaginal Auto

Keyword Property zad_PermitOral Auto
Keyword Property zad_PermitAnal Auto
Keyword Property zad_PermitVaginal Auto

Keyword Property zad_InventoryDevice Auto
Keyword Property zad_BlockGeneric Auto ; Block generic removal of this device.

; Don't apply gag expression for devices with these keywords (Zaz gags).
Keyword Property zbfAnimMouth001 Auto 
Keyword Property zbfEffectOpenMouth Auto

;Idles
Idle Property DDZazHornyA Auto
Idle Property DDZazHornyB Auto
Idle Property DDZazHornyC Auto
Idle Property DDZazHornyD Auto
Idle Property DDZazHornyE Auto
;Idle Property DDZazHornyDClimax Auto
Idle Property DDZazaparmbzad01 Auto
Idle Property DDZazaparmbzad02 Auto
Idle Property DDZazaparmbzad03 Auto
Idle Property DDZazaparmbzad04 Auto
Idle Property DDZazaparmbzad05 Auto
Idle Property DDZazaparmbzad06 Auto
Idle Property DDZazaparmbzad07 Auto
Idle Property DDZazaparmbzad08 Auto
Idle Property DDZazaparmbzad09 Auto
Idle Property DDZazaparmbzad10 Auto

;Armbinder Struggle:
Idle Property DDZaZAPCArmBZaDS01 Auto
Idle Property DDZaZAPCArmBZaDS02 Auto
Idle Property DDZaZAPCArmBZaDS03 Auto
Idle Property DDZaZAPCArmBZaDS04 Auto
Idle Property DDZaZAPCArmBZaDS05 Auto
Idle Property DDZaZAPCArmBZaDS06 Auto

;Armbinder Vibrator Activated
Idle Property DDZaZAPCArmBZaDH01 Auto
Idle Property DDZaZAPCArmBZaDH02  Auto
Idle Property DDZaZAPCArmBZaDH03 Auto

; Default Armbinder Offset Idle
Idle Property ArmbinderIdle Auto

; Default Yoke Offset Idle
Idle Property YokeIdle01 Auto
Idle Property YokeIdle02 Auto
Idle Property YokeIdle03 Auto
Idle Property YokeIdle04 Auto

; Yoke Horny Idles
Idle Property YokeHorny01 Auto
Idle Property YokeHorny02 Auto
Idle Property YokeHorny03 Auto

Idle Property BleedoutIdle Auto
Idle Property ZapYokeBleedoutIdle Auto
Idle Property ZapArmbBleedoutIdle Auto

; All standard devices, at this time. Shorthand for mods, and to avoid the hassle of re-adding these as properties for other scripts.
; If you're using a custom device, you'll need to use EquipDevice, rather than the shorthand ManipulateDevice.
Armor Property beltPaddedRendered Auto         ; Internal Device
Armor Property beltPadded Auto        	       ; Inventory Device
Armor Property beltIronRendered Auto         ; Internal Device
Armor Property beltIron Auto        	     ; Inventory Device
Armor Property plugIronRendered Auto         ; Internal Device
Armor Property plugIron Auto        	     ; Inventory Device
Armor Property plugPrimitiveRendered Auto         ; Internal Device
Armor Property plugPrimitive Auto        	  ; Inventory Device
Armor Property plugInflatableRendered Auto         ; Internal Device
Armor Property plugInflatable Auto        	   ; Inventory Device
Armor Property plugSoulgemRendered Auto         ; Internal Device
Armor Property plugSoulgem Auto        		; Inventory Device
Armor Property braPaddedRendered Auto         ; Internal Device
Armor Property braPadded Auto        	      ; Inventory Device
Armor Property cuffsPaddedArmsRendered Auto         ; Internal Device
Armor Property cuffsPaddedArms Auto        	    ; Inventory Device
Armor Property cuffsPaddedLegsRendered Auto         ; Internal Device
Armor Property cuffsPaddedLegs Auto        	    ; Inventory Device
Armor Property cuffsPaddedCollarRendered Auto         ; Internal Device
Armor Property cuffsPaddedCollar Auto        	      ; Inventory Device
Armor Property cuffsPaddedCompleteRendered Auto         ; Internal Device
Armor Property cuffsPaddedComplete Auto        		; Inventory Device
Armor Property collarPostureRendered Auto         ; Internal Device
Armor Property collarPosture Auto        	  ; Inventory Device
Armor Property armbinderRendered Auto         ; Internal Device
Armor Property armbinder Auto        	  ; Inventory Device
Armor Property gagBall Auto
Armor Property gagBallRendered Auto
Armor Property gagPanel Auto
Armor Property gagPanelRendered Auto
Armor Property gagRing Auto
Armor Property gagRingRendered Auto

Armor Property gagStrapBall Auto                   ; Inventory Device
Armor Property gagStrapBallRendered Auto           ; Internal Device
Armor Property gagStrapRing Auto                   ; Inventory Device
Armor Property gagStrapRingRendered Auto           ; Internal Device
Armor Property blindfold Auto                        ; Inventory Device
Armor Property blindfoldRendered Auto                ; Internal Device
Armor Property cuffsLeatherArms Auto                 ; Inventory Device
Armor Property cuffsLeatherArmsRendered Auto         ; Internal Device
Armor Property cuffsLeatherLegs Auto                 ; Inventory Device
Armor Property cuffsLeatherLegsRendered Auto         ; Internal Device
Armor Property cuffsLeatherCollar Auto               ; Inventory Device
Armor Property cuffsLeatherCollarRendered Auto       ; Internal Device
Armor Property harnessBody Auto                          ; Inventory Device
Armor Property harnessBodyRendered Auto                  ; Internal Device
Armor Property harnessCollar Auto                  ; Inventory Device
Armor Property harnessCollarRendered Auto          ; Internal Device
Armor Property collarPostureLeather Auto
Armor Property collarPostureLeatherRendered Auto

Armor Property plugIronVag Auto                  ; Internal Device
Armor Property plugIronVagRendered Auto          ; Internal Device
Armor Property plugIronAn Auto                  ; Internal Device
Armor Property plugIronAnRendered Auto          ; Internal Device
Armor Property plugPrimitiveVag Auto                  ; Internal Device
Armor Property plugPrimitiveVagRendered Auto          ; Internal Device
Armor Property plugPrimitiveAn Auto                  ; Internal Device
Armor Property plugPrimitiveAnRendered Auto          ; Internal Device
Armor Property plugSoulgemVag Auto                  ; Internal Device
Armor Property plugSoulgemVagRendered Auto          ; Internal Device
Armor Property plugSoulgemAn Auto                  ; Internal Device
Armor Property plugSoulgemAnRendered Auto          ; Internal Device
Armor Property plugInflatableVag Auto                  ; Internal Device
Armor Property plugInflatableVagRendered Auto          ; Internal Device
Armor Property plugInflatableAn Auto                  ; Internal Device
Armor Property plugInflatableAnRendered Auto          ; Internal Device
Armor Property beltPaddedOpen Auto        	       ; Inventory Device
Armor Property beltPaddedOpenRendered Auto         ; Internal Device
Armor Property plugChargeableVag Auto
Armor Property plugChargeableRenderedVag Auto
Armor Property plugTrainingVag Auto
Armor Property plugTrainingRenderedVag Auto

Armor Property collarRestrictive Auto
Armor Property collarRestrictiveRendered Auto
Armor Property corset Auto
Armor Property corsetRendered Auto
Armor Property glovesRestrictive Auto
Armor Property glovesRestrictiveRendered Auto
Armor Property yoke Auto
Armor Property yokeRendered Auto

Armor Property piercingVSoul Auto
Armor Property piercingVSoulRendered Auto
Armor Property piercingNSoul Auto
Armor Property piercingNSoulRendered Auto

; Keys
Key Property chastityKey Auto
Key Property restraintsKey Auto
Key Property piercingKey Auto ; Piercing removal tool

; Sound fx
Sound Property VibrateVeryStrongSound Auto
Sound Property VibrateStrongSound Auto
Sound Property VibrateStandardSound Auto
Sound Property VibrateWeakSound Auto
Sound Property VibrateVeryWeakSound Auto
Sound Property EdgedSound Auto
Sound Property OrgasmSound  Auto
Sound Property MoanSound Auto
Sound Property GaggedSound Auto
Sound Property ShortMoanSound Auto
Sound Property ShortPantSound Auto

; Dialogue disable
GlobalVariable Property DialogueGagDisable Auto
GlobalVariable Property DialogueArmbinderDisable Auto

; Factions
Faction Property zadAnimatingFaction Auto
Faction Property zadVibratorFaction Auto
Faction Property zadGagPanelFaction Auto
Faction Property zadDisableDialogueFaction Auto

MiscObject Property zad_gagPanelPlug Auto
Outfit Property zadEmptyOutfit Auto


; Internal Variables
Armor Property deviceRemovalToken Auto         ; Internal token for removal events
Bool Property DeviceMutex Auto ; Prevent oddities when swapping sets of items quickly.
Bool Property GlobalEventFlag Auto ; Events enabled/disabled, globally. Useful for scenes that don't want to be interrupted.
bool Property RepopulateMutex Auto ; Avoid 2.6.3 bug
Float Property lastRepopulateTime Auto ; Avoid 2.6.3 bug
; Misc
Actor Property PlayerRef Auto
Faction Property SexLabAnimatingFaction Auto
Spell Property ShockEffect Auto
bool Property BoundAnimsAvailable = True Auto ; Obsolete. Bound anims are now always available, post zap 6

; Rechargeable Soulgem Stuff
Soulgem Property SoulgemEmpty Auto
Soulgem Property SoulgemFilled Auto
MiscObject Property SoulgemStand Auto
Perk Property LustgemCrafting Auto
float Property BreastNodeScale Auto
float Property BellyNodeScale Auto

; Nipple Piercings
Perk Property PiercedNipples Auto
Perk Property PiercedClit Auto

Spell Property PiercedNipplesSpell Auto
Spell Property PiercedClitSpell Auto

;;;;Effects
Keyword Property zad_HasPumps Auto

; Keywords for Device Effects
Keyword Property zad_EffectVibratingVeryStrong Auto
Keyword Property zad_EffectVibratingStrong Auto
Keyword Property zad_EffectVibrating Auto
Keyword Property zad_EffectVibratingWeak Auto
Keyword Property zad_EffectVibratingVeryWeak Auto
Keyword Property zad_EffectVibratingRandom Auto
Keyword Property zad_EffectVibrateOnSpellCast Auto
Keyword Property zad_EffectTrainOnSpellCast Auto
Keyword Property zad_EffectElectroStim Auto

Keyword Property zad_EffectHealthDraining Auto
Keyword Property zad_EffectStaminaDraining Auto
Keyword Property zad_EffectManaDraining Auto

Keyword Property zad_EffectShocking Auto ; Periodically shock actor.
Keyword Property zad_EffectChaosPlug Auto ; Coopervane's Random Plug.
Keyword Property zad_EffectShockOnFullArousal Auto ; Instead of vibrating, shock on full arousal.

 ; Effect modifiers
Keyword Property zad_EffectPossessed Auto ; Plugs will function stand-alone if this keyword is present.
Keyword Property zad_EffectRemote Auto

Keyword Property zad_EffectLively Auto       ; Increase chance of effect beyond mcm config.
Keyword Property zad_EffectVeryLively Auto   ; Further increase chance of effect. Stacks.

Keyword Property zad_EffectEdgeOnly Auto    ; Will never let the player cum for stimulating events (Vibration)
Keyword Property zad_EffectEdgeRandom Auto    ; Will sometimes let the player cum for stimulating events (Vibration)

Keyword Property zad_EffectsLinked Auto      ; If one effect fires, all effects fire.
Keyword Property zad_EffectCompressBreasts Auto ; Compress breasts to avoid hdt clipping through bras.
Keyword Property zad_EffectCompressBelly Auto ; Compress belly to avoid hdt clipping through corsets, belts and harnesses.

;===============================================================================
; Public Interface Functions
;===============================================================================
; There are two items for each type of item in this system: An inventory item, and a rendered item.
; The inventory item is the user-facing item that the user may interact with. The rendered item is
; the item that actually shows up on characters. The reason for this two item system is twofold:
; Firstly, this permits us to allow the user to interact with the item freely, without seeing the
; item unequip every time / without resorting to spells/powers. Secondly, the rendered item acts
;  as an surrogate-state of sorts that is useful for internal scripts.
; Each category of item managed by this system must have a unique keyword. This keyword must be 
; present on the rendered device. For instance, all belts provided by devious devices contain the
; keyword zad_DeviousBelt. If you add custom belts, you must use either my existing keywords, or
; add your own keyword for a different type of device.

; Shorthand for non-custom devices.
Function ManipulateDevice(actor akActor, armor device, bool equipOrUnequip, bool skipEvents = false)
	; w2b table
	Armor deviceRendered
	Keyword deviceKeyword
	if device == beltPadded
		deviceRendered = beltPaddedRendered
		deviceKeyword = zad_DeviousBelt
	ElseIf device == beltIron
		deviceRendered = beltIronRendered
		deviceKeyword = zad_DeviousBelt
	ElseIf device == plugIron
		deviceRendered = plugIronRendered
		deviceKeyword = zad_DeviousPlug
	ElseIf device == plugPrimitive
		deviceRendered = plugPrimitiveRendered
		deviceKeyword = zad_DeviousPlug
	ElseIf device == plugInflatable
		deviceRendered = plugInflatableRendered
		deviceKeyword = zad_DeviousPlug
	ElseIf device == plugSoulgem
		deviceRendered = plugSoulgemRendered
		deviceKeyword = zad_DeviousPlug
	ElseIf device == braPadded
		deviceRendered = braPaddedRendered
		deviceKeyword = zad_DeviousBra
	ElseIf device == cuffsPaddedArms
		deviceRendered = cuffsPaddedArmsRendered
		deviceKeyword = zad_DeviousArmCuffs
	ElseIf device == cuffsPaddedLegs
		deviceRendered = cuffsPaddedLegsRendered
		deviceKeyword = zad_deviousLegCuffs
	ElseIf device == cuffsPaddedCollar
		deviceRendered = cuffsPaddedCollarRendered
		deviceKeyword = zad_deviousCollar
	ElseIf device == cuffsPaddedComplete
		deviceRendered = cuffsPaddedCompleteRendered
		deviceKeyword = zad_DeviousArmCuffs
	ElseIf device == collarPosture
		deviceRendered = collarPostureRendered
		deviceKeyword = zad_DeviousCollar
	ElseIf device == collarPostureLeather
		deviceRendered = collarPostureLeatherRendered
		deviceKeyword = zad_DeviousCollar
	ElseIf device == armbinder
		deviceRendered = armbinderRendered
		deviceKeyword = zad_DeviousArmbinder
	ElseIf device == gagBall
		deviceRendered = gagBallRendered
		deviceKeyword = zad_DeviousGag
	ElseIf device == gagPanel
		deviceRendered = gagPanelRendered
		deviceKeyword = zad_DeviousGag
	ElseIf device == gagRing
		deviceRendered = gagRingRendered
		deviceKeyword = zad_DeviousGag
	ElseIf device == gagStrapBall
		deviceRendered=gagStrapBallRendered
		deviceKeyword = zad_DeviousGag
	ElseIf device == gagStrapRing
		deviceRendered=gagStrapRingRendered
		deviceKeyword = zad_DeviousGag
	ElseIf device == blindfold
		deviceRendered=blindfoldRendered
		deviceKeyword = zad_DeviousBlindfold
	ElseIf device == cuffsLeatherArms
		deviceRendered=cuffsLeatherArmsRendered
		deviceKeyword = zad_DeviousArmCuffs
	ElseIf device == cuffsLeatherLegs
		deviceRendered=cuffsLeatherLegsRendered
		deviceKeyword = zad_DeviousLegCuffs
	ElseIf device == cuffsLeatherCollar
		deviceRendered=cuffsLeatherCollarRendered
		deviceKeyword = zad_DeviousCollar
	ElseIf device == harnessBody
		deviceRendered=harnessBodyRendered
		deviceKeyword = zad_DeviousHarness
	ElseIf device == harnessCollar
		deviceRendered=harnessCollarRendered
		deviceKeyword = zad_DeviousCollar
	ElseIf device == plugIronVag
		deviceRendered = plugIronVagRendered
		deviceKeyword = zad_DeviousPlugVaginal
	ElseIf device == plugIronAn
		deviceRendered = plugIronAnRendered
		deviceKeyword = zad_DeviousPlugAnal
	ElseIf device == plugPrimitiveVag
		deviceRendered = plugPrimitiveVagRendered
		deviceKeyword = zad_DeviousPlugVaginal
	ElseIf device == plugPrimitiveAn
		deviceRendered = plugPrimitiveAnRendered
		deviceKeyword = zad_DeviousPlugAnal
	ElseIf device == plugSoulgemVag
		deviceRendered = plugSoulgemVagRendered
		deviceKeyword = zad_DeviousPlugVaginal
	ElseIf device == plugSoulgemAn
		deviceRendered = plugSoulgemAnRendered
		deviceKeyword = zad_DeviousPlugAnal
	ElseIf device == plugInflatableVag
		deviceRendered = plugInflatableVagRendered
		deviceKeyword = zad_DeviousPlugVaginal
	ElseIf device == plugInflatableAn
		deviceRendered = plugInflatableAnRendered
		deviceKeyword = zad_DeviousPlugAnal
	ElseIf device == beltPaddedOpen
		deviceRendered = beltPaddedOpenRendered
		deviceKeyword = zad_DeviousBelt
	ElseIf device ==  plugChargeableVag
		deviceRendered = plugChargeableRenderedVag
		deviceKeyword = zad_DeviousPlugVaginal
	ElseIf device ==  plugTrainingVag
		deviceRendered = plugTrainingRenderedVag
		deviceKeyword = zad_DeviousPlugVaginal
	ElseIf device == piercingNSoul
		deviceRendered = piercingNSoulRendered
		deviceKeyword = zad_DeviousPiercingsNipple
	ElseIf device == piercingVSoul
		deviceRendered = piercingVSoulRendered
		deviceKeyword = zad_DeviousPiercingsVaginal
	ElseIf device == collarRestrictive 
		deviceRendered = collarRestrictiveRendered
		deviceKeyword = zad_DeviousCollar
	ElseIf device == corset 
		deviceRendered = corsetRendered
		deviceKeyword = zad_DeviousCorset
	ElseIf device == glovesRestrictive 
		deviceRendered = glovesRestrictiveRendered
		deviceKeyword =zad_DeviousGloves
	ElseIf device == yoke 
		deviceRendered = yokeRendered
		deviceKeyword =zad_DeviousYoke
	Else
		Error("ManipulateDevice did not recognize device type that it received as an argument.")
		return
	EndIf
	if equipOrUnequip
		EquipDevice(akActor, device, deviceRendered, deviceKeyword, skipEvents = skipEvents)
	else
		RemoveDevice(akActor, device, deviceRendered, deviceKeyword, skipEvents = skipEvents)
	EndIf
EndFunction

; Equip device on actor.
;;; Function EquipDevice(actor akActor, ; The actor that this should operate on.
;;;                      armor deviceInventory ; The inventory device (See above explanation)
;;;                      armor deviceRendered ; The rendered device (See above explanation)
;;;                      keyword zad_DeviousDevice ; The keyword for this class of objects (See above explanation)
;;;                      bool skipEvents ; Skip onequipped event for this call. Useful for swapping items of the same type (Switching plugs, belts, collars, etc)
;;;                      bool skipMutex ; Internal use parameter only. Used for speedily recovering from remove-all, and similar effects. Don't use this.
;;;                      )
Function EquipDevice(actor akActor, armor deviceInventory, armor deviceRendered, keyword zad_DeviousDevice, bool skipEvents=false, bool skipMutex=false)
	if !skipMutex
		Log("EquipDevice called for " + deviceInventory.GetName())
		AcquireAndSpinlock()
		Log("Acquired mutex, equipping " + deviceInventory.GetName())
	else
		;Log("Not waiting for mutex. Proceed.")
	EndIf
	ReEquipExistingDevice(akActor, zad_DeviousDevice)
	if WearingConflictingDevice(akActor, deviceRendered, zad_DeviousDevice)
		Log("EquipDevice() called for one device, while already wearing another:" + zad_DeviousDevice)
		if !skipMutex
			DeviceMutex = false
		EndIf
		return
	EndIf
	if akActor.GetItemCount(deviceInventory) <=0
		akActor.AddItem(deviceInventory, 1, true)
	EndIf
	; skse version calls OnEquipped events. Fucking papyrus, lol.
	; Ugly design due to not realizing limitation of papyrus. Might refactor this later.
	if skipEvents
		akActor.EquipItem(deviceInventory, false, true)
		akActor.EquipItem(deviceRendered, true, true)
		if !skipMutex
			DeviceMutex = false
		EndIf
	else
		akActor.EquipItemEx(deviceInventory, 0, false, true)
	Endif
EndFunction




; Remove device from actor.
Function RemoveDevice(actor akActor, armor deviceInventory, armor deviceRendered, keyword zad_DeviousDevice, bool destroyDevice=false, bool skipEvents=false, bool skipMutex=false)
	Log("RemoveDevice called for " + deviceInventory.GetName())
	if !akActor.IsEquipped(deviceInventory) && !akActor.IsEquipped(deviceRendered)
		Warn("RemoveDevice called for " + deviceInventory +", but this device is not currently worn.")
		return
	EndIf
	if !skipMutex
		AcquireAndSpinlock()
	EndIf
	Log("Acquired mutex, removing " + deviceInventory.GetName())
	; Work around more native papyrus limitations by using skse functions.
	; This does present me with an easy way to swap devices without calling events though, if I want to use it. Neat.
	if skipEvents
		akActor.RemoveItem(deviceRendered, 1, true)
		akActor.UnequipItemEx(deviceInventory, 0, false)
		if !skipMutex
			DeviceMutex = false
		EndIf
	Else
		StorageUtil.SetIntValue(akActor, "zad_RemovalToken" + deviceInventory, 1)
		akActor.UnequipItemEx(deviceInventory, 0, false)
		akActor.RemoveItem(deviceRendered, 1, true) 
	Endif
        CleanupDevices(akActor, zad_DeviousDevice)
        if destroyDevice
		akActor.RemoveItem(deviceInventory, 1, true)
        EndIf
	; DeviceMutex is unlocked in zadEquipScript
EndFunction

; Returns 0 if the actor is not wearing a device of this type, 1 if she is wearing
; that specific device, or 2 if she's wearing another device of the same type.
int Function IsWearingDevice(actor akActor, armor deviceRendered, keyword zad_DeviousDevice)
	if akActor == none || deviceRendered == none || zad_DeviousDevice == none
		Error("IsWearingDevice received none argument.")
		return -1
	EndIf
	if akActor.WornHasKeyword(zad_DeviousDevice)
		if akActor.GetItemCount(deviceRendered)==0
			return 2
		Endif
		return 1
	EndIf
	return 0
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Begin Generic Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Thanks to lordescobar666 for the method used by these functions:
; As manipulate device, but will operate on any device lacking the zad_BlockGeneric keyword: Even those who's rendered device / keyword you don't know.
; Returns true if a device was successfully manipulated.
bool Function ManipulateGenericDevice(actor akActor, armor device, bool equipOrUnequip, bool skipEvents = false , bool skipMutex = false)
	ObjectReference tmpORef = akActor.placeAtMe(device, abInitiallyDisabled = true)
	zadEquipScript tmpZRef = tmpORef as zadEquipScript
	bool manipulated = false
	if tmpZRef != none
		if tmpZref.HasKeyword(zad_BlockGeneric)
			Warn("ManipulateGenericDevice called on armor with 'Block Generic Removal' keyword: zad_BlockGeneric")
		Else
			if equipOrUnequip
				EquipDevice(akActor, device, tmpZRef.deviceRendered, tmpZRef.zad_DeviousDevice, skipEvents = skipEvents, skipMutex = skipMutex)
			else
				RemoveDevice(akActor, device, tmpZRef.deviceRendered, tmpZRef.zad_DeviousDevice, skipEvents = skipEvents, skipMutex = skipMutex)
			EndIf
			manipulated = true
		EndIf
	Else
		Warn("ManipulateGenericDevice received non DD argument.")
	Endif
	tmpORef.delete()
	return manipulated
EndFunction

; Returns true if a device was successfully manipulated.
bool Function ManipulateGenericDeviceByKeyword(Actor akActor, Keyword kw, bool equipOrUnequip, bool skipEvents = false, bool skipMutex = false)
	Int iFormIndex = akActor.GetNumItems()
	bool breakFlag = false
	While iFormIndex > 0 && !breakFlag
		iFormIndex -= 1
		Form kForm = akActor.GetNthForm(iFormIndex)
		If kForm.HasKeyword(zad_InventoryDevice) && (((akActor.IsEquipped(kForm) || akActor != playerRef) && !equipOrUnequip) || (!akActor.IsEquipped(kForm) && equipOrUnequip))
			ObjectReference tmpORef = akActor.placeAtMe(kForm, abInitiallyDisabled = true)
			zadEquipScript tmpZRef = tmpORef as zadEquipScript
			if tmpZRef != none && tmpZRef.zad_DeviousDevice == kw && ((akActor.GetItemCount(tmpZRef.deviceRendered) > 0 && !equipOrUnequip) || equipOrUnequip)
				if !tmpZref.HasKeyword(zad_BlockGeneric)
					breakFlag = True
					if equipOrUnequip
						EquipDevice(akActor, kForm as Armor, tmpZRef.deviceRendered, tmpZRef.zad_DeviousDevice, skipEvents = skipEvents, skipMutex = skipMutex)
					else
						RemoveDevice(akActor, kForm as Armor, tmpZRef.deviceRendered, tmpZRef.zad_DeviousDevice, skipEvents = skipEvents, skipMutex = skipMutex)
					EndIf
				EndIf
			EndIf
			tmpORef.delete()
		EndIf				
	EndWhile
	return breakFlag
EndFunction

; Returns the currently equipped inventory device matching the supplied keyword.
Armor Function GetWornDevice(Actor akActor, Keyword kw)
	Armor retval = none
	Int iFormIndex = akActor.GetNumItems()
	bool breakFlag = false
	While iFormIndex > 0 && !breakFlag
		iFormIndex -= 1
		Form kForm = akActor.GetNthForm(iFormIndex)
		If kForm.HasKeyword(zad_InventoryDevice) && (akActor.IsEquipped(kForm) || akActor != playerRef)
			ObjectReference tmpORef = akActor.placeAtMe(kForm, abInitiallyDisabled = true)
			zadEquipScript tmpZRef = tmpORef as zadEquipScript
			if tmpZRef != none && tmpZRef.zad_DeviousDevice == kw && akActor.GetItemCount(tmpZRef.deviceRendered) > 0
				retval = kForm as Armor
				breakFlag = true
			Endif
			tmpORef.delete()
		EndIf
	EndWhile
	return retval
EndFunction

; Finds device based on rendered device keywords (e.g. keyword zad_DeviousBelt also returns a harness)
; Useful for situation where you just want to get the device occupying a specific slot without further differentiation
Armor Function GetWornDeviceFuzzyMatch(Actor akActor, Keyword kw)
    Armor retval = none
    Int iFormIndex = akActor.GetNumItems()
    bool breakFlag = false
    While iFormIndex > 0 && !breakFlag
        iFormIndex -= 1
        Form kForm = akActor.GetNthForm(iFormIndex)
        If kForm.HasKeyword(zad_InventoryDevice) && (akActor.IsEquipped(kForm) || akActor != playerRef)
            ObjectReference tmpORef = akActor.placeAtMe(kForm, abInitiallyDisabled = true)
            zadEquipScript tmpZRef = tmpORef as zadEquipScript
            if tmpZRef != none && tmpZRef.deviceRendered.hasKeyword(kw) && akActor.GetItemCount(tmpZRef.deviceRendered) > 0
                retval = kForm as Armor
                breakFlag = true
            Endif
            tmpORef.delete()
        EndIf
    EndWhile
    return retval
EndFunction

; Retrieves correct key for a given inventory device
Key Function GetDeviceKey(armor device)
    Key retval = none
    ObjectReference tmpORef = PlayerRef.placeAtMe(device, abInitiallyDisabled = true)
    zadEquipScript tmpZRef = tmpORef as zadEquipScript
    if tmpZRef != none
        retval = tmpZRef.deviceKey
    Else
        Warn("GetDeviceKey received non DD argument.")
    Endif
    tmpORef.delete()
    return retval
EndFunction

; Retrieves device keyword for a given inventory device
Keyword Function GetDeviceKeyword(armor device)
    Keyword retval = none
    ObjectReference tmpORef = PlayerRef.placeAtMe(device, abInitiallyDisabled = true)
    zadEquipScript tmpZRef = tmpORef as zadEquipScript
    if tmpZRef != none
        retval = tmpZRef.zad_DeviousDevice
    Else
        Warn("GetDeviceKeyword received non DD argument.")
    Endif
    tmpORef.delete()
    return retval
EndFunction


; Retrieves rendered device for a given inventory device
; Useful to check for keywords only present on the rendered device
Armor Function GetRenderedDevice(armor device)
    Armor retval = none
    ObjectReference tmpORef = PlayerRef.placeAtMe(device, abInitiallyDisabled = true)
    zadEquipScript tmpZRef = tmpORef as zadEquipScript
    if tmpZRef != none
        retval = tmpZRef.deviceRendered
    Else
        Warn("GetRenderedDevice received non DD argument.")
    Endif
    tmpORef.delete()
    return retval
EndFunction

; Register a device to be used by GetGenericDeviceByKeyword()
Function RegisterGenericDevice(Armor inventoryDevice, String tags)
	if inventoryDevice == none || inventoryDevice.HasKeyword(zad_BlockGeneric) || !inventoryDevice.hasKeyword(zad_InventoryDevice)
		return
	endIf
	
	Keyword kw = GetDeviceKeyword(inventoryDevice)
	if kw == none
		return
	endIf
	
	StorageUtil.FormListAdd(kw, "zad.GenericDevice", inventoryDevice, false)
	StorageUtil.StringListClear(inventoryDevice, "zad.deviceTags") ; Allow changing tags 
	String[] tagArray = sslUtility.ArgString(tags, ",")
	int i = tagArray.length
	while i > 0
		i -= 1
		log("adding tag " + tagArray[i] + " for " + inventoryDevice.GetName())
		StorageUtil.StringListAdd(inventoryDevice, "zad.deviceTags", tagArray[i])
	endWhile
EndFunction

; Retrieves a random inventory device with the given keyword, returns none if no devices are available
Armor Function GetGenericDeviceByKeyword(Keyword kw)
	int n = StorageUtil.FormListCount(kw, "zad.GenericDevice")
	Armor device = none
	while device == none && n > 0
		; Fetch a random device
		int i = Utility.RandomInt(0, n - 1)
		device = StorageUtil.FormListGet(kw, "zad.GenericDevice", i) as Armor
		if device == none
			; Remove the index from the list if it's none, and avoid clearing the list completely
			log("Found a none stored generic item, clearing...")
			StorageUtil.FormListRemoveAt(kw, "zad.GenericDevice", i)
			n = StorageUtil.FormListCount(kw, "zad.GenericDevice")
		endIf
	endWhile

	return device 
EndFunction

; Retrieves a random inventory device with the given keyword and tag combination
; If requireAll is true, ALL tags need to be found on the item to be returned
; If fallback is true, a completely random device with the same keyword is returned if tag search fails
Armor Function GetDeviceByTags(Keyword kw, String tags, bool requireAll = true, String tagsToSuppress = "", bool fallBack = true)
	log("GetDeviceByTags("+kw+", "+tags+")")
	String[] tagArray = sslUtility.ArgString(tags, ",")
	String[] supArray = sslUtility.ArgString(tagsToSuppress, ",")
	Form[] resultList = new Form[64]
	int n = 0
	
	int i = StorageUtil.FormListCount(kw, "zad.GenericDevice")
	While i > 0
		i -= 1
		Armor current = StorageUtil.FormListGet(kw, "zad.GenericDevice", i) as Armor
		If current && HasTags(current, tagArray, requireAll) && !HasTags(current, supArray, false)
			resultList[n]	= current
			n += 1
		ElseIf current == none
			StorageUtil.FormListRemoveAt(kw, "zad.GenericDevice", i)
		EndIf
	EndWhile
	
	if n < 1 && fallBack
		log("No devices found with tags, falling back to random device")
		return GetGenericDeviceByKeyword(kw)
	ElseIf n < 1
		log("No devices found with tags")
		return none
	endIf
	return resultList[Utility.RandomInt(0, n - 1)] as Armor
EndFunction

; Returns true if the given item has the given tag
bool Function HasTag(Armor item, String tag)
	int i = StorageUtil.StringListCount(item, "zad.deviceTags")
	while i > 0
		i -= 1
		If StorageUtil.StringListGet(item, "zad.deviceTags", i) == tag
			return true 
		EndIf
	endWhile
	return false
EndFunction

; Returns true if the given item has the given tags, if requireAll true, all the tags need to be found on the item
bool Function HasTags(Armor item, String[] tags, bool requireAll = true)
	if tags.length < 1
		return false
	endIf

	int i = StorageUtil.StringListCount(item, "zad.deviceTags")
	int n = 0
	int j
	while i > 0
		i -= 1
		j = tags.length
		String currentTag = StorageUtil.StringListGet(item, "zad.deviceTags", i)
		While j > 0
			j -= 1
			If currentTag == tags[j]
				If !requireAll
					return true
				EndIf
				n += 1
				j = 0 ; break
			EndIf
		endWhile
	endWhile
	return n == tags.length
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End Generic Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; This function is for mod consistency mostly
int Function ArousalThreshold(string index)
    ; Want to buy dict
    if index=="Content"
        return 0
    Elseif index=="Desire"
        return 25
    Elseif index=="Horny"
        return 50
    Elseif index=="Desperate"
        return 75
    Else
        Error("Error: ArousalThreshold passed invalid lookup string ("+index+")!")
        return -1
    Endif
EndFunction

; Globally enable periodic event processing.
Function EnableEventProcessing()
	Log("EnableEventProcessing()")
	GlobalEventFlag = True
EndFunction

; Globally disable periodic event processing.
Function DisableEventProcessing()
	Log("DisableEventProcessing()")
	GlobalEventFlag = False
EndFunction


;====================
; Camera Manipulation
;====================
bool[] Function StartThirdPersonAnimation(actor akActor, idle animation, bool permitRestrictive=false)
	Log("StartThirdPersonAnimation("+akActor.GetLeveledActorBase().GetName()+","+animation+")")
	bool[] ret = new bool[2]
	if IsAnimating(akActor)
		Log("Actor already in animating faction.")
		return ret
	EndIf
	Log("Debug-1")
	if !IsValidActor(akActor) || (akActor.WornHasKeyword(zad_DeviousArmBinder) && !permitRestrictive)
		Log("Actor is not loaded (Or is otherwise invalid). Aborting.")
		return ret
	EndIf
	Log("Debug-2")
	if akActor.IsWeaponDrawn()
		akActor.SheatheWeapon()
		; Wait for users with flourish sheathe animations.
		int timeout=0
		while akActor.IsWeaponDrawn() && timeout <= 35 ;  Wait 3.5 seconds at most before giving up and proceeding.
			Utility.Wait(0.1)
			timeout += 1
		EndWhile
		ret[1] = true
	EndIf
	Log("Debug-3")
	if akActor == PlayerRef
		; Manipulate camera
		Log("Debug-4")
		int cameraOld = Game.GetCameraState()
		if cameraOld == 10 || akActor.IsOnMount(); 10 On a horse
			akActor.Dismount()
			game.ForceThirdPerson()
			int timeout = 0
			while akActor.IsOnMount() && timeout <= 30; Wait for dismount to complete
				Utility.Wait(0.1)
				timeout += 1
			EndWhile
		ElseIf cameraOld == 11; Bleeding out.
			Warn("Actor is bleeding out. Hmm.")
			return ret
		ElseIf cameraOld == 12 ; Dragon? Wtf?
			Warn("Actor is dragon? Not sure what happened here.")
			return ret
		ElseIf cameraOld == 8 || cameraOld == 9 || cameraOld ==  7 ;;; 8 / 9 are third person. 7 is tween menu.
		;
		Else
			ret[0] = true
			game.ForceThirdPerson()
		EndIf
		Log("Debug-5")
		if config.ifp
			SendModEvent("FP_SetView", "0") ; turn off immersive view
		EndIf
		Log("Debug-6")
		; Not sure how to detect auto-walk: Tap 'forward' to disable it if it's active.
		Input.TapKey(Input.GetMappedKey("Forward"))
		; Freeze player controls
		DisableControls()
	Else
		akActor.SetDontMove(true)
	EndIf
	Log("Debug-7")
	SetAnimating(akActor, true)
	Log("Debug-8")
	akActor.PlayIdle(animation)
	Log("Debug-9")
	return ret
EndFunction

; Wrapper for both Start/End third person animation. Use this unless you need more control during the wait period.
Function PlayThirdPersonAnimation(actor akActor, idle animation, int duration, bool permitRestrictive=false)
	Log("PlayThirdPersonAnimation("+akActor.GetLeveledActorBase().GetName()+","+animation+","+duration+")")
	if IsAnimating(akActor)
		Log("Actor already in animating faction.")
		return
	EndIf
	if SexLab.ValidateActor(akActor) < 0 || akActor.IsSwimming() || akActor.IsOnMount() || akActor.GetCurrentScene() != none
		Warn("Not playing third person animation: Actor is already in a blocking animation.")
		return
	EndIf
	bool[] cameraState=StartThirdPersonAnimation(akActor, animation, permitRestrictive=permitRestrictive)
	Log("Playing animation for "+duration+" seconds.")
	Utility.Wait(duration)
	EndThirdPersonAnimation(akActor, cameraState, permitRestrictive=permitRestrictive)
EndFunction


Function EndThirdPersonAnimation(actor akActor, bool[] cameraState, bool permitRestrictive=false)
	Log("EndThirdPersonAnimation("+akActor.GetLeveledActorBase().GetName()+","+cameraState+")")
	SetAnimating(akActor, false)
	bool isBound = akActor.WornHasKeyword(zad_DeviousArmBinder) || akActor.WornHasKeyword(zad_DeviousYoke)
	if (!akActor.Is3DLoaded() ||  akActor.IsDead() || akActor.IsDisabled())
		Log("Actor is not loaded (Or is otherwise invalid). Aborting.")
		return
	EndIf
	if !IsBound
		Debug.SendAnimationEvent(akActor, "IdleForceDefaultState")
	EndIf
	if akActor == PlayerRef
		UpdateControls()
		if cameraState[0]
			game.ForceFirstPerson()
		ElseIf config.ifp
			SendModEvent("FP_SetView", "1") ; turn on immersive view
		EndIf
		if cameraState[1]
			;akActor.SheatheWeapon()
			;akActor.DrawWeapon()
		EndIf
	Else
		akActor.SetDontMove(false)
	EndIf
EndFunction


float Function GetVersion()
	return 2.91
EndFunction


;===============================================================================
; Internal Functions
;===============================================================================
Function StoreExposureRate(actor akActor)
	float original = StorageUtil.GetFloatValue(akActor, "zad.StoredExposureRate", 0.0)
	if original <= 0
		float exposureRate = Aroused.GetActorExposureRate(akActor)
		if exposureRate <= 0
			Warn("Exposure rate was originally 0. Changing to default.")
			exposureRate = Aroused.slaConfig.DefaultExposureRate
		Endif
		StorageUtil.SetFloatValue(akActor, "zad.StoredExposureRate", exposureRate)
	else
		Warn("StoreExposureRate called for actor " + akActor.GetLeveledActorBase().GetName() +", but actor already has this information stored.")
	Endif
EndFunction


float Function GetOriginalRate(actor akActor)
	return StorageUtil.GetFloatValue(akActor, "zad.StoredExposureRate", Aroused.slaConfig.DefaultExposureRate)
EndFunction


float Function GetModifiedRate(actor akActor)
	if akActor.WornHasKeyword(zad_DeviousPlug)
		return (GetOriginalRate(akActor) * GetPlugRateMult())
	Elseif akActor.WornHasKeyword(zad_DeviousBelt)
		return (GetOriginalRate(akActor) * GetBeltRateMult())
	Else
		Warn("GetModifiedRate() returning original rate: Actor is not belted.")
		return GetOriginalRate(akActor)
	Endif
EndFunction

bool function CheckConfigInit()
	if Config == none 
		Error("Config is not initialized. User didn't update properly?")
		return false
	EndIf
	return true
EndFunction

float function GetPlugRateMult()
	if CheckConfigInit()
		return Config.PlugRateMult
	else
		Error("GetPlugRateMult returning -1")
		return -1
	EndIf
EndFunction

float function GetBeltRateMult()
	if CheckConfigInit()
		return Config.BeltRateMult
	else
		Error("GetBeltRateMult returning -1")
		return -1
	EndIf
EndFunction

int Function GetUnlockThreshold()
	if CheckConfigInit()
		return Config.UnlockThreshold
	else
		Error("GetUnlockThreshold returning -1")
		return -1
	EndIf

EndFunction


int Function CheckDeviceEscape(int skillThreshold, string skillName)
    ; Returns -1 on success. Otherwise, returns chance.
    int playerSkill = PlayerRef.GetAV(skillName) As Int
    int chance = Utility.RandomInt() + playerSkill
    if chance > (skillThreshold + Aroused.GetActorExposure(PlayerRef)/5)
        return -1
    Endif
    return chance
EndFunction


Function Notify(string out, bool messageBox=false)
	if messageBox
		Debug.MessageBox(out)
	else
		Debug.Notification(out)
	EndIf
EndFunction


Function NotifyNPC(string out, bool messageBox=false)
	if Config.NpcMessages
		Notify(out, messageBox)
	else
		Log("NpcMessages==false: "+out)
	EndIf
EndFunction


Function NotifyPlayer(string out, bool messageBox=false)
	if Config.PlayerMessages
		Notify(out, messageBox)
	else
		Log("PlayerMessages==false: " + out)
	EndIf
EndFunction


Function NotifyActor(string out, Actor akActor, bool messageBox=false)
	if akActor == PlayerRef
		NotifyPlayer(out, messageBox)
	else
		NotifyNPC(out, messageBox)
	EndIf
EndFunction


Function Log(string in, int level=0)
	if !Config.LogMessages
		return
	EndIf
	string out = "[Zad]"
	if level>=2
		Debug.Trace("============================================================")
		Debug.Trace(out + " (((ERROR))): " + in)
		Debug.Trace("============================================================")
		return
	elseif level==1
		out = out + " ((WARNING)): " + in
	elseif level==0
		out = out + ": " + in
	Endif
	Debug.Trace(out)
EndFunction


Function Warn(string in)
	Log(in,1)
EndFunction


Function Error(string in)
	Log(in,2)
	Debug.MessageBox("An error has ocurred with your installation of Devious Devices. Please check the log for more information. Error Text: "+in)
EndFunction


Function CleanupDevices(actor akActor, keyword zad_DeviousDevice, Form skip1=None, Form skip2=None)
	if (skip1 != none && akActor.GetItemCount(skip1)==1) || (skip2 != none && akActor.GetItemCount(skip2)==1)
		return
	EndIf
	if akActor.GetItemCount(zad_DeviousDevice) >= 1
		Log("CleanupDevices() is working:" + akActor.GetItemCount(zad_DeviousDevice))
		int i = akActor.GetNumItems()
		while i > 0
			i -= 1
			Form f = akActor.GetNthForm(i)
			if f && f != skip1 && f != skip2 && f.HasKeyword(zad_DeviousDevice)
				akActor.RemoveItem(f, akActor.GetItemCount(f), true)
			EndIf
		EndWhile
	EndIf
EndFunction


Function ReEquipExistingDevice(actor akActor, keyword zad_DeviousDevice)
	int i = akActor.GetNumItems()
	if akActor.GetItemCount(zad_DeviousDevice)>0 && !akActor.WornHasKeyword(zad_DeviousDevice)
		Log("ReEquipExistingDevices() is working:" + akActor.GetItemCount(zad_DeviousDevice))
		Form f = FindMatchingDevice(akActor, zad_DeviousDevice)
		if f
			akActor.EquipItem(f, false, true)
		EndIf
	Endif
EndFunction


bool Function WearingConflictingDevice(actor akActor, armor deviceRendered, keyword zad_DeviousDevice)
	if akActor == none
		Error("WearingConflictingDevice received none argument.")
	EndIf
	if akActor.GetItemCount(deviceRendered)==0 && akActor.WornHasKeyword(zad_DeviousDevice)
		return true
	Endif
	return false
EndFunction


; Wrapper function for smaller arousal increments
Function UpdateExposure(actor akRef, float val, bool skipMultiplier=false)
	If (akRef == None)
		Error("UpdateExposure passed none reference.")
		return
	EndIf
	float lastRank = Aroused.GetActorExposure(akRef)
	Log("UpdateExposure("+akRef+","+val+","+skipMultiplier+")")
	if skipMultiplier
		; This function is very slow, and sometimes hangs for multiple seconds (Seen 10+). Directly access internals as a work-around.
		; Aroused.SetActorExposure(akRef, (lastRank + val + 1) as Int)
		float newVal = lastRank + val
		if newVal > 100
			newVal = 100
		EndIf
		StorageUtil.SetFloatValue(akRef, "SLAroused.ActorExposure", newVal)
		StorageUtil.SetFloatValue(akRef, "SLAroused.ActorExposureDate", Utility.GetCurrentGameTime())
	Else
		float rate = Aroused.GetActorExposureRate(akRef)
		int newRank = (lastRank + (val as float) * rate) as int	
		Aroused.SetActorExposure(akRef, newRank)
	EndIf
EndFunction


;;;
Function AcquireAndSpinlock()
	if DeviceMutex
		log("SpinLock() Started.")
		int timeout = 0
		while DeviceMutex
			Utility.Wait(0.1)
			if timeout >= 150
				Warn("SpinLock() timed out.")
				deviceMutex = false
			EndIf
			timeout += 1
		EndWhile
		log("SpinLock() Completed. Cycles:" + timeout)
	EndIf
	DeviceMutex = true ; Immediately reacquire lock
EndFunction


Function SendDeviceRemovalEvent(string deviceName, actor akActor)
	int isPlayer = 0
	if akActor == PlayerRef
		isPlayer = 1
	EndIf
	SendDeviceEvent("DeviceRemoved"+deviceName, akActor.GetLeveledActorBase().GetName(), isPlayer)
EndFunction

Function SendDeviceEquippedEvent(string deviceName, actor akActor)
	int isPlayer = 0
	if akActor == PlayerRef
		isPlayer = 1
	EndIf
	SendDeviceEvent("DeviceEquipped"+deviceName, akActor.GetLeveledActorBase().GetName(), isPlayer)
EndFunction

Function SendDeviceEvent(string eventName, string actorName, int isPlayer)
	Log("Sending device event "+eventName+"("+actorName+":"+isPlayer+")")
	SendModEvent(eventName, actorName, isPlayer)
EndFunction


;==================================================
; Effects
;==================================================
; Cause actor to have an orgasm.
;;; Function ActorOrgasm(actor akActor, int setArousalTo=-1, int vsID=-1)
;;;             actor akActor, ; The actor to operate on.
;;;             int setArousalTo=-1, ; The arousal value the actor should be set to post-orgasm
;;;             int vsID=-1, ; Vibrating sound ID. If provided, will stop vibration sound.
Function ActorOrgasm(actor akActor, int setArousalTo=-1, int vsID=-1)
	SendModEvent("DeviceActorOrgasm", akActor.GetLeveledActorBase().GetName())
	if setArousalTo < 0
		setArousalTo = Utility.RandomInt(0, 75)
	EndIf
	if akActor == PlayerRef
		Game.ShakeCamera(akActor, 1, 5)
	EndIf
	int sID = OrgasmSound.Play(akActor)
	Sound.SetInstanceVolume(sid, Config.VolumeOrgasm)
	Aroused.SetActorExposure(akActor, setArousalTo)
	Aroused.UpdateActorOrgasmDate(akActor)
	if !IsAnimating(akActor)
		bool[] cameraState = StartThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, "Orgasm"), true)
		int i = 0
		while i < 20
			i+= 1
			if !IsVibrating(akActor) && vsID != -1
				Sound.StopInstance(vsID)
				vsID=-1
			EndIf
			Utility.Wait(1)
		EndWhile
	        EndThirdPersonAnimation(akActor, cameraState, true)
	Else
		if !IsVibrating(akActor) && vsID != -1
			Sound.StopInstance(vsID)
			vsID=-1
		EndIf
	EndIf
EndFunction

; Play panting sound from actor
Function Pant(actor akActor)
	int psID = ShortPantSound.Play(akActor)
	Sound.SetInstanceVolume(psID, 1)
EndFunction

;;; wrapper for Sexlab Aroused integrated / gag integrated moan.
Function SexlabMoan(actor akActor, int arousal=-1, sslBaseVoice voice = none)
	; Is the player gagged?
	if akActor.WornHasKeyword(zad_DeviousGag)
		int gsID = gaggedSound.Play(akActor)
		Sound.SetInstanceVolume(gsID, 1)
		return
	EndIf
	; Select voice if needed
	if !voice
		voice = SexLab.PickVoice(akActor)
	EndIf
	; If arousal isn't provided, look it up.
	if arousal == -1
		arousal = Aroused.GetActorExposure(akActor)
	EndIf
	; Play the voice.
	voice.Moan(akActor, arousal)
EndFunction

; Play non-sexlab-moans
Function Moan(actor akActor, int arousal=-1, sslBaseVoice voice = none)
	if akActor.WornHasKeyword(zad_DeviousGag)
		int gsID = gaggedSound.Play(akActor)
		Sound.SetInstanceVolume(gsID, 1)
	Else
		int msID = ShortMoanSound.Play(akActor)
		Sound.SetInstanceVolume(msid, 1)
	EndIf
EndFunction


bool Function PlaySceneAndWait(Scene toPlay, bool forceStart=false, int timeout=120, int increment=5)
	if forceStart
		toPlay.ForceStart()
	else
		toPlay.Start()
	EndIf
	int i = 0
	while toPlay.IsPlaying() && i < timeout
		i += increment
		Utility.Wait(increment)
	EndWhile
	if i >= timeout
		if toPlay.IsPlaying()
			toPlay.Stop()
		EndIf
		Log("Scene timed out.")
		return false
	EndIf
	return true
EndFunction

; Cause an actor to experience being edged.
Function EdgeActor(actor akActor)
	SendModEvent("DeviceEdgedActor", akActor.GetLeveledActorBase().GetName())
	int sID = EdgedSound.Play(akActor)
	Sound.SetInstanceVolume(sid, Config.VolumeEdged)
	if akActor == PlayerRef
		Game.ShakeCamera(akActor, 0.5, 3)
	EndIf
	PlayThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, "Edged"), 15, permitRestrictive=true)
EndFunction


float Function GetMoanVolume(actor akActor, int exposure = -1)
	if akActor == PlayerRef
		if exposure == -1
			exposure = Aroused.GetActorExposure(akActor)
		EndIf
		return (0.25 + (exposure * 0.005) as Int)
	Else
		return 0.20 ; Quiet breathing for moaning actors.
	EndIf
EndFunction

function DoApplyExpression(int[] presets, actor ActorRef, bool hasGag = false) global
	if ActorRef == none
		return ; Nobody to express with!
	endIf
	; Clear existing mfg from actor
	; ActorRef.ClearExpressionOverride()
	ResetPhonemeModifier(ActorRef)
	; Apply preset, [n + 0] = mode, [n + 1] = id, [n + 2] = value
	int i = presets.Length
	while i > 2
		i -= 3
		if presets[i] == 2 && !hasGag
			ActorRef.SetExpressionOverride(presets[(i + 1)], presets[(i + 2)])
		else
			if hasGag && presets[i+1] == 1
				SetPhonemeModifier(ActorRef, 0, 1, 100)
			ElseIf hasGag &&  presets[i+1] == 11
				SetPhonemeModifier(ActorRef, 0, 11, 70)
			Else
				SetPhonemeModifier(ActorRef, presets[i], presets[(i + 1)], presets[(i + 2)])
			Endif
		endIf
	endWhile
endFunction


; Vib Expressions
Function ApplyExpression(Actor akActor, sslBaseExpression expression, int strength, bool openMouth=false)
	if !IsValidActor(akActor)
		Log("ApplyExpression(): Actor is not loaded (Or is otherwise invalid). Aborting.")
		return
	EndIf
	if !expression
		Log("ApplyExpression(): Expression is none.")
		return
	EndIf
	int gender = (akActor.GetBaseObject() as ActorBase).GetSex()
	bool hasGag = akActor.WornHasKeyword(zad_DeviousGag)
	DoApplyExpression(expression.GetPhase(expression.PickPhase(strength, gender), gender), akActor, hasGag)
	if openMouth && !hasGag
		MfgConsoleFunc.SetPhonemeModifier(akActor, 0, 0, 75)
	EndIf
	if hasGag
		ApplyGagEffect(akActor)
	EndIf
EndFunction


Function ResetExpression(actor akActor, sslBaseExpression expression)
	ResetPhonemeModifier(akActor)
	if akActor.WornHasKeyword(zad_DeviousGag)
		ApplyGagEffect(akActor)
	EndIf
EndFunction


string function GetVibrationStrength(int vibStrength)
	if vibStrength == 5
		return "extremely powerfully"
	elseIf vibStrength == 4
		return "strongly"
	elseIf vibStrength == 3
		return ""
	elseIf vibStrength == 2
		return "softly"
	elseIf vibStrength == 1
		return "agonizingly softly"
	EndIf
	return "Invalid"
EndFunction


string Function BuildVibrationString(actor akActor, int vibStrength, bool vPlug, bool aPlug, bool vPiercings, bool nPiercings)
	if ((vPiercings || nPiercings) && (vPlug || aPlug))
		return "Your piercing(s) (In addition to the plug(s) within you) begin to vibrate " + GetVibrationStrength(vibStrength) + "!"
	ElseIf ((vPiercings) && !(vPlug || aPlug))
		return "Your clitoral piercing begins to vibrate " + GetVibrationStrength(vibStrength) + "!"
	ElseIf ((nPiercings) && !(vPlug || aPlug))
		return "Your nipple piercings begins to vibrate " + GetVibrationStrength(vibStrength) + "!"
	Else
		return "The plug(s) within you begin to vibrate " + GetVibrationStrength(vibStrength) + "!"
	EndIf
EndFunction

string Function BuildPostVibrationString(actor akActor, int vibStrength, bool vPlug, bool aPlug, bool vPiercings, bool nPiercings)
	bool desperate = (Aroused.GetActorExposure(akActor) >= ArousalThreshold("Desperate"))
	if ((vPiercings || nPiercings) && (vPlug || aPlug))
		if Desperate
			return "You let out a frustrated moan as your piercing and plugs abruptly cease to vibrate."
		Else
			return "Your piercings and plugs all cease to vibrate."
		EndIf
	ElseIf ((vPiercings) && !(vPlug || aPlug))
		if Desperate
			return "You let out a frustrated moan as your clitoral piercing ceases to vibrate."
		Else
			return "Your clitoral piercing ceases to vibrate."
		EndIf
	ElseIf ((nPiercings) && !(vPlug || aPlug))
		if Desperate
			return "You breathe a sigh of relief when the rings piercing your nipples cease to vibrate."
		Else
			return "Your nipple piercings cease to vibrate."
		Endif
	Else
		if Desperate
			return "Your pussy clenches around the plugs as they abruptly cease vibrating."
		Else
			return "The plugs cease vibrating."
		EndIf
	EndIf
EndFunction

;;; Returns number of times actor came from this effect, -1 if it edged them, or -2 if an event was already ongoing.
; This function has suffered from feature creep pretty hard since it's inception, and is in need of refactoring. Still works, but very messy.
; Will split this up to a small library in the future. Will document this properly at that point.
int Function VibrateEffect(actor akActor, int vibStrength, int duration, bool teaseOnly=false, bool silent = false)
	AcquireAndSpinlock()
	If duration == 0
		duration = Utility.RandomInt(5,20)
	EndIf
	bool wasVibrating = IsVibrating(akActor)
	int newDuration = GetVibrating(akActor) + duration
	SetVibrating(akActor, newDuration)
	if wasVibrating
		Log("Actor already in VibratorFaction. Extending duration of existing event: "+newDuration)
		deviceMutex = False
		return -2
	EndIf

	bool vPlug = akActor.WornHasKeyword(zad_DeviousPlugVaginal)
	bool aPlug = akActor.WornHasKeyword(zad_DeviousPlugAnal)
	bool nPiercings = akActor.WornHasKeyword(zad_DeviousPiercingsNipple )
	bool vPiercings = akActor.WornHasKeyword(zad_DeviousPiercingsVaginal )

	deviceMutex = False
	float numVibratorsMult = 0.0
	;;; Plugs
	if vPlug
		numVibratorsMult += 0.7
	EndIf
	if aPlug
		numVibratorsMult += 0.3
	EndIf
	;;; Piercings
	if nPiercings
		numVibratorsMult += 0.25
	EndIf
	if vPiercings
		numVibratorsMult += 0.5
	EndIf

	if numVibratorsMult == 0.0
		numVibratorsMult = 1
	EndIf
	if akActor.WornHasKeyword(zad_DeviousBlindfold) ; Increased sensitivity!
		numVibratorsMult *= 1.15
	EndIf
	if !wasVibrating
		SendModEvent("DeviceVibrateEffectStart", akActor.GetLeveledActorBase().GetName(), vibStrength * numVibratorsMult)
	EndIf
	int actorCame = 0
	Log("VibrateEffect("+vibStrength +" for "+duration+"). VibrateMult: "+numVibratorsMult)
	sound vibSoundSelect
	
	string msg = BuildVibrationString(akActor, vibStrength, vPlug, aPlug, vPiercings, nPiercings)
	if vibStrength == 5
		vibSoundSelect = VibrateVeryStrongSound
	elseIf vibStrength == 4
		vibSoundSelect = VibrateStrongSound
	elseIf vibStrength == 3
		vibSoundSelect = VibrateStandardSound
	elseIf vibStrength == 2
		vibSoundSelect = VibrateWeakSound
	elseIf vibStrength == 1
		vibSoundSelect = VibrateVeryWeakSound
	else
		Error("Vibrator received invalid strength setting.")
		return -2
	EndIf
	if !silent && akActor == PlayerRef
		NotifyPlayer(msg)
	Endif

	; Initialize Sounds
	float vibSoundMult = 1
	if akActor != PlayerRef
		vibSoundMult=0.5
	EndIf
	int vsID = vibSoundSelect.Play(akActor)
	Sound.SetInstanceVolume(vsID, Config.VolumeVibrator * vibSoundMult)
	int msID = MoanSound.Play(akActor)
	Sound.SetInstanceVolume(msID, GetMoanVolume(akActor))
	int timeVibrated = 0
	int vibAnimStarted = 0
	bool[] cameraState

	; Start base expression
	sslBaseExpression expression = SexLab.RandomExpressionByTag("Pleasure")
	if Utility.RandomInt() <= (10*vibStrength) && (Config.HardcoreEffects || akActor != PlayerRef)
		ApplyExpression(akActor, expression, (Aroused.GetActorExposure(akActor) * 0.75) as Int, openMouth=true)
		PlayThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, "Horny01"), 3, permitRestrictive=true)
	Else
		ApplyExpression(akActor, expression, (Aroused.GetActorExposure(akActor) * 0.75) as Int)
	EndIf
	
	; Actor in combat?
	float combatModifier = 1
	if (akActor.GetCombatState() != 0)
		combatModifier = 0.5
	EndIf

	; Main Loop
	While IsValidActor(akActor) && timeVibrated < GetVibrating(akActor) && (akActor.WornHasKeyword(zad_DeviousPlug) || akActor.WornHasKeyword(zad_DeviousPiercingsNipple) || akActor.WornHasKeyword(zad_DeviousPiercingsVaginal))
		; Log("XXX VibrateEffect: Begin Tick "+timeVibrated)
		if (timeVibrated % 2) == 0 ; Make noise
			; Log("XXX VibrateEffect: Making Noise")
		 	akActor.CreateDetectionEvent(akActor, vibStrength * 10)
			; Log("XXX VibrateEffect: Done Making Noise")
		EndIf
		;;;;;;;;;;
		; Let the actor cum?
		;;;;;;;;;;
		; Log("XXX VibrateEffect: Let the actor cum?")
		if timeVibrated >= 3 && vibStrength >= 3 && aroused.GetActorExposure(akActor)>= 99
			int cumChance = (vibStrength * 2 * combatModifier) as Int
			Log("CumChance:"+cumChance+", vibStrength:"+vibStrength)
			if Utility.RandomInt() <= cumChance
				;;;;;;;;;;
				; Kill previous animation, if any.
				;;;;;;;;;;
				if vibAnimStarted != 0
					EndThirdPersonAnimation(akActor, cameraState, permitRestrictive=true)
					vibAnimStarted = 0
				EndIf
				actorCame += 1
				if teaseOnly
					expression = SexLab.RandomExpressionByTag("Pleasure")
					ApplyExpression(akActor, expression, 100, openMouth=true)
					Sound.StopInstance(vsID)
					Sound.StopInstance(msID)
					StopVibrating(akActor)
					if !silent && akActor == PlayerRef
						NotifyPlayer("The vibrations abruptly stop just short of bringing you to orgasm.")
					Endif
					EdgeActor(akActor)
					ResetExpression(akActor, expression)
					SendModEvent("DeviceVibrateEffectStop", akActor.GetLeveledActorBase().GetName(), vibStrength * numVibratorsMult)
					return -1
				EndIf
				ApplyExpression(akActor, expression, 100, openMouth=true)
				if !silent && akActor == PlayerRef
					NotifyPlayer("The plugs bring you to a thunderous climax.")
				EndIf
				Sound.StopInstance(msID)
				ActorOrgasm(akActor, vsID=vsID)
				if IsVibrating(akActor)
					msID = MoanSound.Play(akActor)
					Sound.SetInstanceVolume(msID, GetMoanVolume(akActor))
				EndIf
			EndIf
		EndIf
		; Log("XXX VibrateEffect: Done Let the actor cum?")
		;;;;;;;;;;
		; Increase arousal, moan sound.
		;;;;;;;;;;
		if (timeVibrated % (6-vibStrength)) == 0
			; Log("XXX VibrateEffect: Increasing Arousal")
			UpdateExposure(akActor, 5 * combatModifier * numVibratorsMult, skipMultiplier=true)
			; Log("XXX VibrateEffect: Arousal 2")
			Sound.SetInstanceVolume(msID, GetMoanVolume(akActor))
			; Log("XXX VibrateEffect: Done Increasing Arousal")
		EndIf
		;;;;;;;;;;
		; Play horny idle?
		;;;;;;;;;;
		if (Config.HardcoreEffects || akActor != PlayerRef) && (vibAnimStarted == 0) && Utility.RandomInt() <= (3+(VibStrength * 2)) && !IsAnimating(PlayerRef)
			; Log("XXX Starting Horny Idle")
			ApplyExpression(akActor, expression, (Aroused.GetActorExposure(akActor) * 0.75) as Int, openMouth=true)
			; Select animation
			string randomAnim
			if (nPiercings && !(vPlug || aPlug))
				randomAnim = "Horny03"
			Else
				randomAnim = "Horny01"
			EndIf
			cameraState=StartThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, randomAnim), permitRestrictive=true)
			vibAnimStarted = timeVibrated + 1
			; Log("XXX VibrateEffect: Done starting horny idle")
		EndIf
		;;;;;;;;;;
		; Stop horny idle?
		;;;;;;;;;;
		if (vibAnimStarted != 0) && (timeVibrated - vibAnimStarted >= 6) ; Stop animation after 5 seconds.
			; Log("XXX Stopping Horny Idle")
			ApplyExpression(akActor, expression, (timeVibrated / duration) * 75, openMouth=False)
			EndThirdPersonAnimation(akActor, cameraState, permitRestrictive=true)
			vibAnimStarted = 0
			; Log("XXX VibrateEffect: Done stopping horny idle")
		EndIf
		;;;;;;;;;;
		; Shake camera effect.
		;;;;;;;;;
		if akActor == PlayerRef
			; Log("XXX VibrateEffect: Shaking Camera")
			Game.ShakeCamera(akActor, (0.05*vibStrength), 1)
			; Log("XXX VibrateEffect: Done Shaking Camera")
		EndIf
		; Log("XXX VibrateEffect: End Tick "+timeVibrated+".")
		Utility.Wait(1)
		timeVibrated += 1
	EndWhile

	Sound.StopInstance(vsID)
	Sound.StopInstance(msID)
	if IsValidActor(akActor)
		; Reset expression
		ResetExpression(akActor, expression)
	EndIf
	;;;;;;;;;;
	; Make sure actor isn't stuck in animation
	;;;;;;;;;;
	if  vibAnimStarted != 0
		EndThirdPersonAnimation(akActor, cameraState, permitRestrictive=true)
		vibAnimStarted = 0
	EndIf
	StopVibrating(akActor)
	if !silent && akActor == PlayerRef
		NotifyPlayer(BuildPostVibrationString(akActor, vibStrength, vPlug, aPlug, vPiercings, nPiercings))
	Endif
	SendModEvent("DeviceVibrateEffectStop", akActor.GetLeveledActorBase().GetName(), vibStrength * numVibratorsMult)
	UpdateArousalTimeRate(akActor, vibStrength * numVibratorsMult)
	Aroused.GetActorArousal(akActor)
	return actorCame
EndFunction


Function AttrDrain(actor akActor, string attr)
	float randomize = (Utility.RandomInt(1,75) as Float) / 100
	int drain = (akActor.GetAv(attr) * randomize) as Int
	Log(attr+"DrainEffect(): Draining "+drain + "("+randomize+" %)")
	akActor.DamageAv(attr, drain)
EndFunction


Function HealthDrainEffect(actor akActor)
	AttrDrain(akActor, "Health")
EndFunction


Function ManaDrainEffect(actor akActor)
	AttrDrain(akActor, "Magicka")
EndFunction


Function StaminaDrainEffect(actor akActor)
	AttrDrain(akActor, "Stamina")
EndFunction


Bool Function ShouldEdgeActor(actor akActor)
	if ActorHasKeyword(akActor, zad_EffectEdgeOnly)
		return true
	ElseIf ActorHasKeyword(akActor, zad_EffectEdgeRandom) && Utility.RandomInt() >= 25
		return true
	EndIf
	return false
EndFunction

Bool Function ActorHasKeyword(actor akActor, keyword kwd)
	return (akActor.HasMagicEffectWithKeyword(kwd) || akActor.WornHasKeyword(kwd))
EndFunction

Function SpellCastVibrate(Actor akActor, Form tmp)
	Spell theSpell = (tmp as Spell)
	if (akActor.WornHasKeyword(zad_DeviousBelt) || akActor.WornHasKeyword(zad_EffectPossessed)) && akActor.WornHasKeyword(zad_DeviousPlug) && ActorHasKeyword(akActor, zad_EffectVibrateOnSpellCast)
		SendModEvent("EventOnCast")
		Log("OnSpellCast()")
		if !Config.HardcoreEffects && akActor == PlayerRef && akActor.GetCombatState() >= 1
			Log("Player is in combat, and HardCoreEffects == false. Done.")
			return
		EndIf
		Shout isShout = (tmp as Shout)
		; Log("isShout: "+isShout)
		int cost = theSpell.GetEffectiveMagickaCost(akActor)
		if cost <= 1 && !isShout
			return
		EndIf
		int duration = (cost * 0.1) as Int
		int vibStrength = (cost / 50) as Int
		if isShout != none || cost > 500 ;akActor.GetActorValuePercentage("Magicka") ; This would just reintroduce the problem for high-end mages...
			; akSpell as Shout (And WordOfPower) is none for whirlwind sprint, and cost is 500ish. Wtf. Hack workaround.
			Log("Spell is in fact a shout.")
			vibStrength = 2
			duration = 5
		EndIf
		if ActorHasKeyword(akActor, zad_EffectTrainOnSpellCast)
			TrainingViolation(akActor, "SpellCast");
			if vibStrength <= 1
				vibStrength = 3
			Else
				vibStrength *= 2
			EndIf
			duration /= 2
		EndIf
		if vibStrength > 5
			vibStrength = 5
		EndIf
		if vibStrength < 1
			vibStrength = 1
		EndIf
		if duration <= 0
			duration = 1
		EndIf
		;NotifyPlayer("The plugs respond to the magicka flowing through you, and begin to vibrate!")
		if Config.HardcoreEffects && Utility.RandomInt() <= vibStrength * 15
			;Log("Interrupting cast.")
			; PlayerRef.InterruptCast()
			; NotifyPlayer("Your concentration wanes, and the spell fizzles.")
		EndIf
		VibrateEffect(akActor, vibStrength, duration, teaseOnly=ShouldEdgeActor(akActor))
	EndIf
EndFunction

bool Function IsValidActor(actor akActor)
	return (akActor.Is3DLoaded() && !akActor.IsDead() && !akActor.IsDisabled() && akActor.GetCurrentScene() == none)
EndFunction

Function DisableControls()
	; Mimics the behavior of Game.DisablePlayerControls()
	zbfPC.SetDisabledControls(abMovement = True, abFighting = True, abSneaking = False, abMenu = True, abActivate = True)
EndFunction

Function UpdateControls()
	log("UpdateControls()")
	; Centralized control management function.
	bool movement = true
	bool fighting = true
	bool sneaking = true
	bool menu = true
	bool activate = true
	int cameraState = Game.GetCameraState()
	if playerRef.WornHasKeyword(zad_DeviousBlindfold) && (config.BlindfoldMode == 1 || config.BlindfoldMode == 0) && (cameraState == 8 || cameraState == 9)
		movement = false
		sneaking = false
	EndIf
	if IsBound(playerRef)
		fighting = false
		menu = !config.HardcoreEffects
	EndIf
	zbfPC.SetDisabledControls(abMovement = !movement, abFighting = !fighting, abSneaking = !sneaking, abMenu = !menu, abActivate = !activate)
EndFunction

;==================================================
; Mutex Functions
;==================================================
; Is the actor animating through Sexlab, or DD?
bool Function IsAnimating(actor akActor)
	return (akActor.IsInFaction(zadAnimatingFaction) || akActor.IsInFaction(Sexlab.AnimatingFaction))
EndFunction

; Set DD's actor animating status.
Function SetAnimating(actor akActor, bool isAnimating=true)
	if isAnimating
		akActor.AddToFaction(zadAnimatingFaction)
		akActor.SetFactionRank(zadAnimatingFaction, 1)
	Else
		akActor.RemoveFromFaction(zadAnimatingFaction)
	EndIf
EndFunction

; Is the actor currently in a vibration event?
bool Function IsVibrating(actor akActor)
	return akActor.IsInFaction(zadVibratorFaction)
EndFunction

Function SetVibrating(actor akActor, int duration)
	bool oor = false
	if (duration < 0)
		oor = true
		duration = 1
	ElseIf (duration >= 127)
		oor = true
		duration = 126
	EndIf
	if oor
		Warn("SetVibrating(" + duration + ") received out of range value")
	EndIf
	; akActor.AddToFaction(zadVibratorFaction)
	akActor.SetFactionRank(zadVibratorFaction, duration)
EndFunction

; Stop vibration event on actor.
Function StopVibrating(actor akActor)
	akActor.SetFactionRank(zadVibratorFaction, 0)
	akActor.RemoveFromFaction(zadVibratorFaction)
EndFunction

; Get duration left on current vibration event for actor.
int Function GetVibrating(actor akActor)
	if !akActor.IsInFaction(zadVibratorFaction)
		return 0
	EndIf
	return akActor.GetFactionRank(zadVibratorFaction)
EndFunction

Function ApplyGagEffect(actor akActor)
	if (akActor.WornHasKeyword(zbfAnimMouth001) || akActor.WornHasKeyword(zbfEffectOpenMouth)) ; Let Zap handle these.
		return
	EndIf
	if (GetPhonemeModifier(akActor, 0, 1) != 100 || GetPhonemeModifier(akActor, 0, 11) != 70) && GetPhonemeModifier(akActor, 0, 0) != 70 ; Last check is for vibration mouth expressions. HoC
		SetPhonemeModifier(akActor, 0, 1, 100)
		SetPhonemeModifier(akActor, 0, 11, 70)
	EndIf
EndFunction

Function RemoveGagEffect(actor akActor)
	SetPhonemeModifier(akActor, 0, 1, 0)
	SetPhonemeModifier(akActor, 0, 11, 0)
EndFunction

string Function MakeSingularIfPlural(string theString)
	int len = getLength(theString)
	if GetNthChar(theString, (len - 1)) == "s"
		return Substring(theString, 0, len - 1)
	EndIf
	return theString
EndFunction

Idle Function AnimSwitchKeyword(actor akActor, string idleName )
	; w2b switch, map, hash table, etc...
	if idleName == "Horny01"
		if akActor.WornHasKeyword(zad_DeviousArmbinder)
			return DDZaZAPCArmBZaDH01
		ElseIf akActor.WornHasKeyword(zad_DeviousYoke)
			return YokeHorny01
		Else
			return DDZazHornyA
		EndIf
	ElseIf idleName == "Horny02"
		if akActor.WornHasKeyword(zad_DeviousArmbinder)
			return DDZaZAPCArmBZaDH02
		ElseIf akActor.WornHasKeyword(zad_DeviousYoke)
			return YokeHorny01
		Else 
			return DDZazHornyB
		EndIf
	ElseIf idleName == "Horny03"
		if akActor.WornHasKeyword(zad_DeviousArmbinder)
			return DDZaZAPCArmBZaDH01
		ElseIf akActor.WornHasKeyword(zad_DeviousYoke)
			return YokeHorny01
		Else 
			return DDZazHornyC
		EndIf
	ElseIf idleName == "Edged"
		if akActor.WornHasKeyword(zad_DeviousArmbinder)
			return DDZaZAPCArmBZaDH02
		ElseIf akActor.WornHasKeyword(zad_DeviousYoke)
			return YokeHorny02
		Else 
			return DDZazHornyD
		EndIf
	ElseIf idleName == "Orgasm"
		if akActor.WornHasKeyword(zad_DeviousArmbinder)
			return DDZaZAPCArmBZaDH03
		ElseIf akActor.WornHasKeyword(zad_DeviousYoke)
			return YokeHorny03
		Else 
			return DDZazHornyE
		EndIf
	ElseIf idleName == "OutOfBreath"
		if akActor.WornHasKeyword(zad_DeviousArmbinder)
			return ZapArmbBleedoutIdle
		ElseIf akActor.WornHasKeyword(zad_DeviousYoke)
			return ZapYokeBleedoutIdle
		Else 
			return BleedoutIdle
		EndIf
	EndIf
	Error("Failed to find valid animation for presentation.")
EndFunction


Function RepopulateNpcs()
	if repopulateMutex ; Avoid this getting hit too quickly while comparing times.
		Log("RepopulateNpcs() is already processing.")
		return
	EndIf
	repopulateMutex=true
	Log("RepopulateNpcs()")
	if Utility.GetCurrentRealTime() - lastRepopulateTime <= 5
		Log("Aborting repopulation of NPC slots: Hit throttle.")
		repopulateMutex=false
		return
	EndIf
	lastRepopulateTime = Utility.GetCurrentRealTime()
	if zadNPCQuest.IsProcessing
		Log("Waiting, since NPC Events is currently processing.")
		int timeout = 0
		while zadNPCQuest.IsProcessing && timeout <= 24
			Utility.Wait(5)
			timeout += 1
		EndWhile
		if timeout >= 24
			Warn("RepopulateNpcs() spinlock timed out!!")
			zadNPCQuest.IsProcessing = false
		EndIf
	EndIf
	if !zadNPCSlots.IsStopping() && !zadNPCSlots.IsStarting()
		if zadNPCSlots.IsRunning()
			zadNPCSlots.Stop()
		EndIf
		If config.NumNpcs>0
			; Feels like a race condition / timing issue?
			; Perhaps if I call a short wait (Thus suspending execution, giving the quest a chance to fully stop?), it won't occur.
			Utility.Wait(2.0)
			zadNPCSlots.Start()
		Else
			Log("Not repopulating NPC slots: Feature is disabled.")
		EndIf
	Else
		Warn("Not repopulating NPC slots: Quest is changing state.")
	EndIf
	repopulateMutex=false
EndFunction

Function PlugPanelGag(actor akActor)
	if akActor.GetFactionRank(zadGagPanelFaction) <= -1
		Error("PlugPanelGag called on actor that is not wearing a panel gag.")
		return
	EndIf
	SendModEvent("GagPanelStateChange", akActor.GetLeveledActorBase().GetName(), 1.0)
	akActor.RemoveItem(zad_gagPanelPlug, 1)
	akActor.SetFactionRank(zadGagPanelFaction, 1)
EndFunction

Function UnPlugPanelGag(actor akActor)
	if akActor.GetFactionRank(zadGagPanelFaction) <= -1
		Error("UnPlugPanelGag called on actor that is not wearing a panel gag.")
		return
	EndIf
	SendModEvent("GagPanelStateChange", akActor.GetLeveledActorBase().GetName(), 0.0)
	akActor.AddItem(zad_gagPanelPlug, 1)
	akActor.SetFactionRank(zadGagPanelFaction, 0)
EndFunction


bool Function IsBound(actor akActor)
	return akActor.WornHasKeyword(zad_DeviousArmbinder) || akActor.WornHasKeyword(zad_deviousYoke)
EndFunction


Function ToggleCompass(bool show)
	float alpha = 0.0
	if show
		alpha = 100.0
	EndIf
	; Log("ToggleCompass: "+UI.GetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CompassShoutMeterHolder._alpha"))
	UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CompassShoutMeterHolder._alpha", alpha)
	UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CompassShoutMeterHolder.Compass.DirectionRect._alpha", alpha)
	UI.SetNumber("HUD Menu", "_root.HUDMovieBaseInstance.CompassShoutMeterHolder.Compass.CompassFrame._alpha", alpha)
EndFunction

Function TrainingViolation(actor akActor, string violation)
	if akActor == playerRef
		log("TrainingViolation(player, "+violation+")")
		SendModEvent("TrainingViolation", violation, 0.0)
	EndIf
EndFunction


Function ShockActor(actor akActor)
	if akActor == playerRef
		NotifyPlayer("The plugs within you let out a powerful electrical shock!")
	Else
		NotifyNPC(akActor.GetLeveledActorBase().GetName()+" squirms uncomfortably as electricity runs through her.")
	EndIf
	ShockEffect.RemoteCast(akActor, akActor, akActor)
	Aroused.SetActorExposure(akActor, Utility.RandomInt(10,20))
EndFunction


Form Function GetRenderedDeviceInstance(actor akActor, int Slot, Keyword kwd)
	form f1 = akActor.GetWornForm(Slot) 
	if f1 && f1.HasKeyword(kwd)
		return f1
	Endif
	return none
EndFunction

Form Function GetWornHeavyBondageInstance(actor akActor)
	; akActor.GetWornForm(0x20000000)
	; 0x00010000 is slot 46, the new "Heavy Bondage" slot.
	form armb = GetRenderedDeviceInstance(akActor, 0x00010000, zad_DeviousArmbinder)
	if !armb ; Check for yokes
		GetRenderedDeviceInstance(akActor, 0x00010000, zad_DeviousYoke)
	EndIf
	return armb
EndFunction


Function UpdateArousalTimerate(actor akActor, float val)
	if Aroused.GetActorTimerate(akActor) <= 50.0
		Aroused.UpdateActorTimeRate(akActor, val)
	EndIf
EndFunction


Function ApplyBoundAnim(actor akActor, idle theIdle = None)
	if theIdle == None
		if akActor.WornHasKeyword(zad_DeviousYoke)
			theIdle = YokeIdle01
		Else
			theIdle = ArmbinderIdle
		EndIf
	EndIf
	if akActor.GetEquippedWeapon()
		akActor.UnequipItem(akActor.GetEquippedWeapon(), false, true)
	EndIf
	if akActor.GetEquippedWeapon(True)
		akActor.UnequipItem(akActor.GetEquippedWeapon(true), false, true)
	EndIf
	If akActor.GetEquippedShield()
		akActor.UnequipItem(akActor.GetEquippedShield(), false, true)
	EndIf
	if akActor.GetEquippedSpell(0)
		akActor.UnequipSpell(akActor.GetEquippedSpell(0), 0)
	EndIf
	if akActor.GetEquippedSpell(1)
		akActor.UnequipSpell(akActor.GetEquippedSpell(1), 1)
	EndIf
	if akActor.IsWeaponDrawn()
		akActor.SheatheWeapon()
	EndIf
	if akActor.IsOnMount()
		akActor.Dismount()
	EndIf
	if IsValidActor(akActor) && !IsAnimating(akActor)
		akActor.PlayIdle(theIdle)
	EndIf
EndFunction

Function RegisterDevices()
	RegisterGenericDevice(braPadded 			, "bra,metal,padded, DDi")
	RegisterGenericDevice(cuffsPaddedArms 		, "cuffs,arms,metal,padded, DDi")
	RegisterGenericDevice(cuffsPaddedLegs		, "cuffs,legs,metal,padded, DDi")
	RegisterGenericDevice(cuffsPaddedCollar	, "collar,metal,padded,short, DDi")
	RegisterGenericDevice(collarPosture		, "collar,metal,posture,padded, DDi")
	RegisterGenericDevice(armbinder				, "armbinder,leather,black, DDi")
	RegisterGenericDevice(gagBall				, "gag,harness,ball,leather,black, DDi")
	RegisterGenericDevice(gagPanel				, "gag,harness,panel,leather,black, DDi")
	RegisterGenericDevice(gagRing				, "gag,harness,ring,leather,black, DDi")
	RegisterGenericDevice(gagStrapBall			, "gag,strap,ball,leather,black, DDi")
	RegisterGenericDevice(gagStrapRing			, "gag,strap,ring,leather,black, DDi")
	RegisterGenericDevice(blindfold				, "blindfold,leather,black, DDi")
	RegisterGenericDevice(cuffsLeatherArms		, "cuffs,arms,leather,black, DDi")
	RegisterGenericDevice(cuffsLeatherLegs		, "cuffs,legs,leather,black, DDi")
	RegisterGenericDevice(cuffsLeatherCollar	, "collar,leather,black,short, DDi")
	RegisterGenericDevice(collarPostureLeather, "collar,leather,black,posture, DDi")
	RegisterGenericDevice(harnessBody			, "harness,leather,black,full, DDi")
	RegisterGenericDevice(harnessCollar		, "collar,harness,leather,black, DDi")
	RegisterGenericDevice(plugIronVag			, "plug,vaginal,iron,simple, DDi")
	RegisterGenericDevice(plugIronAn			, "plug,anal,iron,simple, DDi")
	RegisterGenericDevice(plugPrimitiveVag		, "plug,vaginal,primitive,simple, DDi")
	RegisterGenericDevice(plugPrimitiveAn		, "plug,anal,primitive,simple, DDi")
	RegisterGenericDevice(plugSoulgemVag		, "plug,vaginal,soulgem,magic, DDi")
	RegisterGenericDevice(plugSoulgemAn		, "plug,anal,soulgem,magic, DDi")
	RegisterGenericDevice(plugInflatableVag	, "plug,pump,vaginal,inflatable, DDi")
	RegisterGenericDevice(plugInflatableAn		, "plug,pump,anal,inflatable, DDi")
	RegisterGenericDevice(beltPaddedOpen		, "belt,metal,padded,open, DDi")
	RegisterGenericDevice(beltPadded			, "belt,metal,padded,full, DDi")
	RegisterGenericDevice(beltIron				, "belt,metal,iron,full, DDi")
	RegisterGenericDevice(piercingNSoul		, "piercing,nipple,soulgem, DDi")
	RegisterGenericDevice(piercingVSoul		, "piercing,vaginal,soulgem, DDi")

	RegisterGenericDevice(collarRestrictive, "DDi,koffii,collar,restrictive,metal,black")
	RegisterGenericDevice(corset, "DDi,restrictive,corset,leather,black")
	RegisterGenericDevice(glovesRestrictive, "DDi,restrictive,gloves,leather,black")
	RegisterGenericDevice(yoke, "DDi,yoke,metal")

	log("Finished registering devices.")
EndFunction

; Turns off dialogue processing. Note that Pausing uses a reference counting
; system, so each pause must be matched with exactly one Resume.
; 
Function PauseDialogue()
	DialogueGagDisable.Mod(1)
	DialogueArmbinderDisable.Mod(1)
EndFunction

; Resumes dialogue processing. Note that Pausing uses a reference counting
; system, so each resume must be in response to exactly one pause. Dialogue 
; processing is not resumed until all pauses have been countered.
; 
Function ResumeDialogue()
	DialogueGagDisable.Mod(-1)
	DialogueArmbinderDisable.Mod(-1)
EndFunction

; Forces resume of dialogue pausing
; 
; Do not call this function directly. It's intended to be used at game load to 
; prevent dialogue from becoming stuck.
; 
Function ResetDialogue()
	DialogueGagDisable.SetValueInt(0)
	DialogueArmbinderDisable.SetValueInt(0)
EndFunction

; Adds the actor to the faction that disables the built in gag
; and armbinder dialogue.
; 
Function AddToDisableDialogueFaction(Actor akActor)
	akActor.AddToFaction(zadDisableDialogueFaction)
EndFunction

; Removes the actor from the faction that disables the built in gag
; and armbinder dialogue.
; 
Function RemoveFromDisableDialogueFaction(Actor akActor)
	akActor.RemoveFromFaction(zadDisableDialogueFaction)
EndFunction

Function StoreNodes(actor akActor)
	float tmp = NetImmerse.GetNodeScale(akActor, "NPC L Breast", false)
	if tmp != 0.0
		BreastNodeScale = tmp
		log("Node Scale: "+BreastNodeScale)
	EndIf
EndFunction


Function StoreBellyNode(actor akActor)
	float tmp = NetImmerse.GetNodeScale(akActor, "NPC Belly", false)
	if tmp != 0.0
		BellyNodeScale = tmp
		log("Belly Node Scale: "+BellyNodeScale)
	EndIf
EndFunction


Function HideBreasts(actor akActor)
	StoreNodes(akActor) ; Handle other mods resizing the breast nodes.
	if config.BreastNodeManagement
		NetImmerse.SetNodeScale(akActor, "NPC L Breast", 0, false)
		NetImmerse.SetNodeScale(akActor, "NPC R Breast", 0, false)
	EndIf
EndFunction


Function ShowBreasts(actor akActor)
	if BreastNodeScale != 0.0 && config.BreastNodeManagement
		NetImmerse.SetNodeScale(akActor, "NPC L Breast", BreastNodeScale, false)
		NetImmerse.SetNodeScale(akActor, "NPC R Breast", BreastNodeScale, false)
	EndIf
EndFunction


Function HideBelly(actor akActor)
	StoreBellyNode(akActor) ; Handle other mods resizing the Belly nodes.
	if config.BellyNodeManagement
		NetImmerse.SetNodeScale(akActor, "NPC Belly", 0, false)
	EndIf
EndFunction


Function ShowBelly(actor akActor)
	if BellyNodeScale != 0.0 && config.BellyNodeManagement
		NetImmerse.SetNodeScale(akActor, "NPC Belly", BellyNodeScale, false)
	EndIf
EndFunction


Function CorsetMagic(actor akActor)
	Form tmp = StorageUtil.GetFormValue(akActor, "zad_StoredCorsetInventory")
	if(!tmp)
		Log("CorsetMagic(): No corset equipped, done.")
		return
	EndIf
	Log("CorsetMagic()")
	if UpdateCorsetState(akActor)
		akActor.UnequipItemEx(tmp, 0, false)  ; Trigger an update
		ObjectReference tmpOr = akActor.DropObject(tmp, 1)
		if tmpOr
			tmpOr.disable()
			tmpOr.delete()
		EndIf
	Endif
EndFunction


bool Function UpdateCorsetState(actor akActor)
	int deviceState
	int tmp = StorageUtil.GetIntValue(akActor, "zad_StoredCorsetRendered", 0)  
	if akActor.WornHasKeyword(zad_DeviousBelt)
		if akActor.WornHasKeyword(zad_PermitAnal)
			deviceState = 1
		Else
			deviceState = 2
		EndIf
	Else
		deviceState = 0
	EndIf
	StorageUtil.SetIntValue(akActor, "zad_StoredCorsetRendered", deviceState)
	return (deviceState != tmp)
EndFunction


string Function LookupDeviceType(keyword kwd)
	if kwd == zad_DeviousPlug
		return "Plug"
	ElseIf kwd == zad_DeviousBelt
		return "Belt" 
	ElseIf kwd == zad_DeviousBra
		return "Bra"  
	ElseIf kwd == zad_DeviousCollar
		return "Collar"  
	ElseIf kwd == zad_DeviousArmCuffs
		return "ArmCuffs"  
	ElseIf kwd == zad_DeviousLegCuffs
		return "LegCuffs"  
	ElseIf kwd == zad_DeviousArmbinder
		return "Armbinder"  
	ElseIf kwd == zad_DeviousYoke
		return "Yoke"  
	ElseIf kwd == zad_DeviousCorset
		return "Corset"  
	ElseIf kwd == zad_DeviousClamps
		return "Clamps"  
	ElseIf kwd == zad_DeviousGloves
		return "Gloves"  
	ElseIf kwd == zad_DeviousHood
		return "Hood"  
	ElseIf kwd == zad_DeviousSuit
		return "Suit"  
	ElseIf kwd == zad_DeviousGag
		return "Gag"  
	ElseIf kwd == zad_DeviousGagPanel
		return "GagPanel"  
	ElseIf kwd == zad_DeviousPlugVaginal
		return "PlugVaginal"  
	ElseIf kwd == zad_DeviousPlugAnal
		return "PlugAnal"  
	ElseIf kwd == zad_DeviousHarness
		return "Harness"  
	ElseIf kwd == zad_DeviousBlindfold
		return "Blindfold"  
	ElseIf kwd == zad_DeviousBoots
		return "Boots"  
	ElseIf kwd == zad_DeviousPiercingsNipple
		return "PiercingsNipple"  
	ElseIf kwd == zad_DeviousPiercingsVaginal
		return "PiercingsVaginal" 
	EndIf
	Error("LookupDeviceType received invalid keyword " + kwd)
EndFunction
