DDi
===

Devious Devices - Integration



Basic Documentation:
From zadLibs.psc:
```
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

; Equip device on actor.
;;; Function EquipDevice(actor akActor, ; The actor that this should operate on.
;;;                      armor deviceInventory ; The inventory device (See above explanation)
;;;                      armor deviceRendered ; The rendered device (See above explanation)
;;;                      keyword zad_DeviousDevice ; The keyword for this class of objects (See above explanation)
;;;                      bool skipEvents ; Skip onequipped event for this call. Useful for swapping items of the same type (Switching plugs, belts, collars, etc)
;;;                      bool skipMutex ; Internal use parameter only. Used for speedily recovering from remove-all, and similar effects. Don't use this.
;;;                      )
Function EquipDevice(actor akActor, armor deviceInventory, armor deviceRendered, keyword zad_DeviousDevice, bool skipEvents=false, bool skipMutex=false)

; Remove device from actor.
Function RemoveDevice(actor akActor, armor deviceInventory, armor deviceRendered, keyword zad_DeviousDevice, bool destroyDevice=false, bool skipEvents=false, bool skipMutex=false)

; Returns 0 if the actor is not wearing a device of this type, 1 if she is wearing
; that specific device, or 2 if she's wearing another device of the same type.
int Function IsWearingDevice(actor akActor, armor deviceRendered, keyword zad_DeviousDevice)

; Globally enable periodic event processing.
Function EnableEventProcessing()

; Globally disable periodic event processing.
Function DisableEventProcessing()

;====================
; Camera Manipulation
;====================
bool[] Function StartThirdPersonAnimation(actor akActor, idle animation, bool permitRestrictive=false)

; Wrapper for both Start/End third person animation. Use this unless you need more control during the wait period.
Function PlayThirdPersonAnimation(actor akActor, idle animation, int duration, bool permitRestrictive=false)

Function EndThirdPersonAnimation(actor akActor, bool[] cameraState, bool permitRestrictive=false)

; Cause actor to have an orgasm.
;;; Function ActorOrgasm(actor akActor, int setArousalTo=-1, int vsID=-1)
;;;             actor akActor, ; The actor to operate on.
;;;             int setArousalTo=-1, ; The arousal value the actor should be set to post-orgasm
;;;             int vsID=-1, ; Vibrating sound ID. If provided, will stop vibration sound.
Function ActorOrgasm(actor akActor, int setArousalTo=-1, int vsID=-1)

; Play panting sound from actor
Function Pant(actor akActor)

;;; wrapper for Sexlab Aroused integrated / gag integrated moan.
Function SexlabMoan(actor akActor, int arousal=-1, sslBaseVoice voice = none)

; Play non-sexlab-moans
Function Moan(actor akActor, int arousal=-1, sslBaseVoice voice = none)

; Cause an actor to experience being edged.
Function EdgeActor(actor akActor)

;;; Returns number of times actor came from this effect, -1 if it edged them, or -2 if an event was already ongoing.
; This function has suffered from feature creep pretty hard since it's inception, and is in need of refactoring. Still works, but very messy.
; Will split this up to a small library in the future. Will document this properly at that point.
int Function VibrateEffect(actor akActor, int vibStrength, int duration, bool teaseOnly=false, bool silent = false)

; Is the actor animating through Sexlab, or DD?
bool Function IsAnimating(actor akActor)
return (akActor.IsInFaction(zadAnimatingFaction) || akActor.IsInFaction(Sexlab.AnimatingFaction))
EndFunction

; Set DD's actor animating status.
Function SetAnimating(actor akActor, bool isAnimating=true)

; Is the actor currently in a vibration event?
bool Function IsVibrating(actor akActor)

; Stop vibration event on actor.
Function StopVibrating(actor akActor)

; Get duration left on current vibration event for actor.
int Function GetVibrating(actor akActor)
```








Events System Documentation:
```
; So, I overhauled the Events system today: You can now supply periodic events, that will be executed alongside DD's via the same staggered system (To avoid too many events from spamming the player, the system does (and always has) stagger events depending on how many there are, and what the current update interval is). Furthermore, these events will automatically be included in the MCM menu.
 
; The following mod-events are now used:
; DeviousEvent<EventName> is automatically sent whenever any event is executed (As per Srende's request).
; DeviousEventLinked is automatically sent whenever a device with a linked effect keyword is executed (Probably internal use only).
; zadRegisterEvents may be sent to force the framework to dump / reregister all periodic events. This will not reset stored MCM configuration values.
 
; See any of the new zadEventWhatever.psc files for an example of how to create new events.
 
; Each new event requires a new script that extends either zadBaseEvent, or zadBaseLinkedEvent. The former is a standard event. The latter will automatically be called when any other linked event is called. This is used for the moment for Cursed plugs and the like (If mana drain procs on the plug, it will also vibrate). This script must be attached to the PlayerRef, which will probably be housed in a quest that you create as a container for your new events.
 
; Two functions exist within zadBaseEvent that you will want to extend to define your own event behavior: Filter(actor akActor), and Execute(actor akActor). See zadBaseEvent.psc (Or any of the zadEventWhatever.psc) files for more information.

;============================================================
;                   Customization Functions
;============================================================
; Override this function to change conditions on which your event can fire. Don't forget to && your return with Parent.Filter(akActor, chanceMod)
; Return true if your event should execute, false if it should not.
Bool Function Filter(actor akActor, int chanceMod = 0)
	 return (Utility.RandomInt() <= (Probability + ChanceMod))
EndFunction

; Override this function to change behavior when your event is called.
Function Execute(actor akActor)
	libs.Warn("Default handler called for Event "+Name+".")
EndFunction
```