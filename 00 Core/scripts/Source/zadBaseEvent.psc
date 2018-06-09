scriptName zadBaseEvent extends ReferenceAlias

; Libraries
zadLibs Property libs Auto

; Internal Use Variables
bool Property Process = False Auto Hidden
Int Property Probability = -1 Auto Hidden

; Custom Event Configuration Variables
String Property Name Auto ; Event Name. Note, that events are also based upon this name: If you change it, mods that listen for your event will also need to update.
String Property Help = "" Auto ; MCM Help Text
Int Property DefaultProbability Auto ; Base Event Probability.

;============================================================
;                      Documentation
;============================================================
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
	 return (HasKeywords(akActor) && Utility.RandomInt() <= (Probability + ChanceMod))
EndFunction

; Override this function instead of Filter, if your event does not require more advanced filtering.
; This function must be used for linked events, or your event will always be called.
bool Function HasKeywords(actor akActor)
	return true
EndFunction

; Override this function to change behavior when your event is called.
Function Execute(actor akActor)
	libs.Warn("Default handler called for Event "+Name+".")
EndFunction



;============================================================
;                     Internal Functions
;============================================================
; Placeholder function for linked effects, and the like. 
Function Eval(actor akActor)
	if HasKeywords(akActor)
		Execute(akActor)
	EndIf
EndFunction

Event OnPlayerLoadGame()
	RegisterForModEvent("zadRegisterEvents","OnRegisterEvents")
	if Probability < 0
		Probability = DefaultProbability
	EndIf
	RegisterDeviceEffect() ; attempts auto-registration if possible
	libs.Log("["+name+"] Loaded: "+Probability+"%")
EndEvent


Event OnRegisterEvents(string eventName, string strArg, float numArg, Form sender)
	RegisterDeviceEffect()
EndEvent

Function RegisterDeviceEffect()
	int id = libs.EventSlots.Register(name, self)
	if id == -1
		libs.Warn("Registration of event "+name+" failed.")
	Else
		libs.Log("["+name+"] Registered. Event #"+id)
	EndIf
EndFunction

