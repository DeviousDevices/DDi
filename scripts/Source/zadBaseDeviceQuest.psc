Scriptname zadBaseDeviceQuest Extends Quest Hidden

Keyword Property zad_DeviousDevice Auto
zadLibs Property libs Auto


Event OnInit()
	Maintenance(SkipAnims=true)
EndEvent

Function Maintenance(bool SkipAnims=false)
	libs.Log("Starting update chain.")
	; Hmm. This should be safe, because calls to RegisterForSingleUpdate just override previous calls.
	RegisterForSingleUpdateGameTime(libs.Config.EventInterval)
EndFunction

Event OnUpdateGameTime()
	RegisterForSingleUpdateGameTime(libs.Config.EventInterval)
EndEvent

; Event OnUpdate()
; 	actor akActor = libs.PlayerRef
; 	ProcessEvents(akActor)
; EndEvent

bool Function ProcessEvents(actor akActor)
	libs.Log("ProcessEvents()")
 	return false
EndFunction
