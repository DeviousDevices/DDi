Scriptname zaddSurreptitiousScript Extends Quest Hidden

; Libs
zadLibs Property libs Auto
SexLabFramework property SexLab auto
slaUtilScr Property Aroused Auto
zaddQuestMonitorScript Property QuestMonitor Auto

; Messages
Message Property SleepWarning Auto
Message Property ChestWarning Auto

LocationAlias Property DefaultLocation Auto
ReferenceAlias Property DefaultContainer Auto
ReferenceAlias Property DefaultMaster Auto
ReferenceAlias Property DefaultMarker Auto
ReferenceAlias Property Player Auto

FormList Property SafeLocations Auto

; Event OnInit()
;  	libs.Log("SS is initializing.")
; 	Maintenance()
; EndEvent

; Function Maintenance()
; 	UnregisterForSleep()
; 	RegisterForSleep()
; 	libs.Log("SS is now tracking player.")
; EndFunction


Function StartRadiantMaster(LocationAlias myLocation, ReferenceAlias myContainer, ReferenceAlias myMaster, ReferenceAlias myMarker, int stage)
	if !questMonitor.RadiantMaster.Start()
		libs.Error("RadiantMaster failed to start.")
	else
		questMonitor.RadiantMaster.rm.MasterHome = myLocation
		questMonitor.RadiantMaster.rm.MasterHomeMarker = myMarker
		questMonitor.RadiantMaster.rm.KeyContainer = myContainer
		questMonitor.RadiantMaster.rm.Master = myMaster
		questMonitor.RadiantMaster.rm.SetStage(stage)
	EndIf
EndFunction


Event OnSleepStop(bool abInterrupted)
	if libs.Config.SurreptitiousStreets
		libs.Log("SS OnSleepStop("+abInterrupted+")")
		if !abInterrupted
			; Determine if player is sleeping in a "safe" location.
			bool safe = false
			Location loc = Player.GetActorRef().GetCurrentLocation()
			if loc == none
				libs.Warn("Player location is none. Assuming unsafe location.")
			else
				int i = SafeLocations.GetSize()
				while i > 0 && !safe
					i -= 1
					Keyword tmp = SafeLocations.GetAt(i) as Keyword
					; libs.Log("Checking " + tmp)
					if loc.HasKeyword(tmp)
						safe = true
					EndIf
				EndWhile
			EndIf
			libs.Log("Safe:"+safe)
			if !safe && Utility.RandomInt() <= libs.Config.ssSleepChance
				if libs.Config.ssWarningMessages
					int choice =  SleepWarning.Show()
					if choice == 1
						libs.Log("User aborted capture scene.")
						return
					EndIf
				EndIf
				StartRadiantMaster(DefaultLocation, DefaultContainer, DefaultMaster, DefaultMarker, stage=10)
			EndIf
		EndIf
	EndIf
EndEvent
