Scriptname zadLibs extends Quest
; Libraries
SexLabFramework property SexLab auto
; import sslExpressionLibrary
import MfgConsoleFunc
import StringUtil

slaUtilScr Property Aroused Auto
zadConfig Property Config Auto
zadNPCQuestScript Property zadNPCQuest Auto
zadArmbinderQuestScript Property abq Auto
zadEventSlots Property EventSlots Auto ; See zadBaseEvent.psc for how to use the new events system.
zadDevicesUnderneathScript Property DevicesUnderneath Auto
Quest Property zadNPCSlots Auto

; Keywords
Keyword Property zad_DeviousPlug Auto
Keyword Property zad_DeviousBelt Auto
Keyword Property zad_DeviousBra Auto
Keyword Property zad_DeviousCollar Auto
Keyword Property zad_DeviousArmCuffs Auto
Keyword Property zad_DeviousLegCuffs Auto
Keyword Property zad_DeviousArmbinder Auto
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
Armor Property harnessCollar Auto                  ; Internal Device
Armor Property harnessCollarRendered Auto          ; Internal Device

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

; Factions
Faction Property zadAnimatingFaction Auto
Faction Property zadVibratorFaction Auto
Faction Property zadGagPanelFaction Auto

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
bool Property BoundAnimsAvailable = False Auto

; Rechargeable Soulgem Stuff
Soulgem Property SoulgemEmpty Auto
Soulgem Property SoulgemFilled Auto
MiscObject Property SoulgemStand Auto
Perk Property LustgemCrafting Auto

; Nipple Piercings
Perk Property PiercedNipples Auto
Perk Property PiercedClit Auto

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

 ; Effect modifiers
Keyword Property zad_EffectPossessed Auto ; Plugs will function stand-alone if this keyword is present.
Keyword Property zad_EffectRemote Auto

Keyword Property zad_EffectLively Auto       ; Increase chance of effect beyond mcm config.
Keyword Property zad_EffectVeryLively Auto   ; Further increase chance of effect. Stacks.

Keyword Property zad_EffectEdgeOnly Auto    ; Will never let the player cum for stimulating events (Vibration)
Keyword Property zad_EffectEdgeRandom Auto    ; Will sometimes let the player cum for stimulating events (Vibration)

Keyword Property zad_EffectsLinked Auto      ; If one effect fires, all effects fire.



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
		if !skipMutex
			akActor.AddItem(deviceRemovalToken, 1, true)
		EndIf
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
		ElseIf cameraOld == 8 || cameraOld == 9	;;; 8 / 9 are third person.
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
		Game.DisablePlayerControls()
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
	bool IsWearingArmbinder = akActor.WornHasKeyword(zad_DeviousArmBinder)
	if (!akActor.Is3DLoaded() ||  akActor.IsDead() || akActor.IsDisabled())
		Log("Actor is not loaded (Or is otherwise invalid). Aborting.")
		return
	EndIf
	if !IsWearingArmbinder
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
	return 2.76
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
		Log("ReEquipExistingDevice() is working")
		while i > 0
			i -= 1
			Form f = akActor.GetNthForm(i)
			if f && f.HasKeyword(zad_DeviousDevice)
				akActor.EquipItem(f, false, true)
			EndIf
		EndWhile
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
	bool[] cameraState = StartThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, zad_DeviousArmbinder, DDZaZAPCArmBZaDH03, DDZazhornye), true)
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
	PlayThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, zad_DeviousArmbinder, DDZaZAPCArmBZaDH02, DDZazhornyD), 15, permitRestrictive=true)
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
	deviceMutex = False
	float numVibratorsMult = 0.0
	if akActor.WornHasKeyword(zad_DeviousPlugVaginal)
		numVibratorsMult += 0.7
	EndIf
	if akActor.WornHasKeyword(zad_DeviousPlugAnal)
		numVibratorsMult += 0.3
	EndIf
	if numVibratorsMult == 0.0
		numVibratorsMult = 1
	EndIf
	if akActor.WornHasKeyword(zad_DeviousBlindfold) ; Increased sensitivity!
		numVibratorsMult += 0.15
	EndIf
	if !wasVibrating
		SendModEvent("DeviceVibrateEffectStart", akActor.GetLeveledActorBase().GetName(), vibStrength * numVibratorsMult)
	EndIf
	int actorCame = 0
	Log("VibrateEffect("+vibStrength +" for "+duration+"). VibrateMult: "+numVibratorsMult)
	sound vibSoundSelect
	
	string msg = ""
	if vibStrength == 5
		msg = "The plug(s) within you begin to vibrate extremely powerfully!"
		vibSoundSelect = VibrateVeryStrongSound
	elseIf vibStrength == 4
		msg = "The plug(s) within you begin to vibrate strongly!"
		vibSoundSelect = VibrateStrongSound
	elseIf vibStrength == 3
		msg = "The plug(s) within you begin to vibrate!"
		vibSoundSelect = VibrateStandardSound
	elseIf vibStrength == 2
		msg = "The plug(s) within you begin to vibrate softly."
		vibSoundSelect = VibrateWeakSound
	elseIf vibStrength == 1
		msg = "The plug(s) within you begin to vibrate agonizingly softly."
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
		PlayThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, zad_DeviousArmbinder, DDZaZAPCArmBZaDH01, DDZazhornyA), 3, permitRestrictive=true)
	Else
		ApplyExpression(akActor, expression, (Aroused.GetActorExposure(akActor) * 0.75) as Int)
	EndIf
	
	; Actor in combat?
	float combatModifier = 1
	if (akActor.GetCombatState() != 0)
		combatModifier = 0.5
	EndIf

	; Main Loop
	While IsValidActor(akActor) && timeVibrated < GetVibrating(akActor) && akActor.WornHasKeyword(zad_DeviousPlug)
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
			cameraState=StartThirdPersonAnimation(akActor, AnimSwitchKeyword(akActor, zad_DeviousArmbinder, DDZaZAPCArmBZaDH01, DDZazhornyA), permitRestrictive=true)
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
		if Aroused.GetActorExposure(akActor) >= ArousalThreshold("Desperate")
			NotifyPlayer("Your pussy clenches around the plugs as they abruptly cease vibrating.")
		else
			NotifyPlayer("The plugs cease vibrating.")
		Endif
	Endif
	SendModEvent("DeviceVibrateEffectStop", akActor.GetLeveledActorBase().GetName(), vibStrength * numVibratorsMult)
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
	if akActor.HasMagicEffectWithKeyword(zad_EffectEdgeOnly)
		return true
	ElseIf akActor.HasMagicEffectWithKeyword(zad_EffectEdgeRandom) && Utility.RandomInt() >= 25
		return true
	EndIf
	return false
EndFunction


Function SpellCastVibrate(Actor akActor, Form tmp)
	Spell theSpell = (tmp as Spell)
	if (akActor.WornHasKeyword(zad_DeviousBelt) || akActor.WornHasKeyword(zad_EffectPossessed)) && akActor.WornHasKeyword(zad_DeviousPlug) && akActor.HasMagicEffectWithKeyword(zad_EffectVibrateOnSpellCast)
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
		if akActor.HasMagicEffectWithKeyword(zad_EffectTrainOnSpellCast)
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
			;libs.Log("Interrupting cast.")
			; libs.PlayerRef.InterruptCast()
			; libs.NotifyPlayer("Your concentration wanes, and the spell fizzles.")
		EndIf
		VibrateEffect(akActor, vibStrength, duration, teaseOnly=ShouldEdgeActor(akActor))
	EndIf
EndFunction

bool Function IsValidActor(actor akActor)
	return (akActor.Is3DLoaded() && !akActor.IsDead() && !akActor.IsDisabled() && akActor.GetCurrentScene() == none)
EndFunction


Function UpdateControls()
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
	if playerRef.WornHasKeyword(zad_DeviousArmbinder)
		fighting = false
		menu = !config.HardcoreEffects
	EndIf
	Game.EnablePlayerControls(abMovement = movement, abFighting = fighting, abSneaking = sneaking, abMenu = menu, abActivate = activate)
	Game.DisablePlayerControls(abMovement = !movement, abFighting = !fighting, abSneaking = !sneaking, abMenu = !menu, abActivate = !activate)
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

Idle Function AnimSwitchKeyword(actor akActor, keyword filter, idle ifFilter, idle ifNotFilter)
	if akActor.WornHasKeyword(filter)
		return ifFilter
	Else
		return ifNotFilter
	EndIf
EndFunction


Function RepopulateNpcs()
	if repopulateMutex ; Avoid this getting hit too quickly while comparing times.
		Log("RepopulateNpcs() is already processing.")
		return
	EndIf
	repopulateMutex=true
	Log("RepopulateNpcs()")
	if Utility.GetCurrentRealTime() - lastRepopulateTime <= 15
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
			Utility.Wait(1.0)
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
	return akActor.WornHasKeyword(zad_DeviousArmbinder)
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

Form Function GetWornArmbinderInstance(actor akActor)
	; akActor.GetWornForm(0x20000000)
	return GetRenderedDeviceInstance(akActor, 0x00000008, zad_DeviousArmbinder)
EndFunction


Function CheckForBoundAnims()
	if SexLab == None || Sexlab.AnimSlots == None
		Log("CheckForBoundAnims: SexLab isn't yet initialized. Assuming no bound anims are available.")
		BoundAnimsAvailable = False
		return
	EndIf
	BoundAnimsAvailable = (Sexlab.GetAnimationsByTag(2, "Bound").length >= 1)
	Log("Bound Animation Status: " + BoundAnimsAvailable)
EndFunction
