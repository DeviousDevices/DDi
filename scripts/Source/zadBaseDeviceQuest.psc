Scriptname zadBaseDeviceQuest Extends Quest Hidden

Keyword Property zad_DeviousDevice Auto
zadLibs Property libs Auto

Function Maintenance()
	libs.Log("Starting update chain.")
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
