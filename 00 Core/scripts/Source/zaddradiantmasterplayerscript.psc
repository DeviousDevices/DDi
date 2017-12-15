Scriptname zaddRadiantMasterPlayerScript extends ReferenceAlias

; libs
zaddRadiantMasterScript Property MasterScript Auto
zadLibs Property libs Auto

Event OnPlayerLoadGame()
	MasterScript.Maintenance()
	Maintenance()
EndEvent

Function Maintenance()

EndFunction
