Scriptname zaddQuestMonitorScript Extends Quest Hidden


; libs 
zadLibs Property libs Auto

; All quests that we're monitoring.
Quest Property zaddForbiddenTomeQuest  Auto
Quest Property zaddSSQuest Auto
Quest Property zaddSGQuest Auto
zaddRadiantMasterScript Property RadiantMaster Auto

; All actors that we're monitoring.
ReferenceAlias Property Urag Auto


; Event OnInit()
; 	Maintenance()
; EndEvent


Function Maintenance()
	UnregisterForAllModEvents()
	RegisterForModEvent("DeviceRemovedBelt", "OnBeltRemoved")
	libs.Log("QuestMonitor is now watching for device events.")
	if libs.config.SergiusExperiment && !zaddSGQuest.IsRunning()
		libs.Log("Starting Sergius' Experiment...")
		zaddSGQuest.Start()
	ElseIf !libs.config.SergiusExperiment
		libs.Log("Stopping Sergius' Experiment...")
		zaddSGQuest.Stop()
	EndIf
EndFunction


Function TerminateQuestIfRunning(Quest tmp)
	if IsQuestActive(tmp)
		tmp.SetStage(900)
		; Don't terminate here, quests may have special termination scenes/events.
		; Ex: Attempt to recapture player, etc.
	EndIf
EndFunction


Event OnBeltRemoved(string eventName, string argString, float argNum, form sender)
	libs.Log("QuestMonitor OnDeviceRemoved("+argString+": "+argNum+")")
	if zaddForbiddenTomeQuest.GetStage() >= 20 && argNum == 1 ; Chastity belt, PC removed.
		TerminateQuestIfRunning(zaddForbiddenTomeQuest)
	EndIf
EndEvent


bool Function IsQuestActive(Quest theQuest)
	;  Can't want to use IsRunning here.
	return (theQuest.GetStage() < 890 && theQuest.GetStage() > 0)
EndFunction


bool Function ShouldStartNewQuest()
	actor akActor = libs.PlayerRef
	if akActor.WornHasKeyword(libs.zad_DeviousBelt)
		libs.Log("ShouldStartNewQuest() Already belted")
		return false
	EndIf
	if IsQuestActive(zaddForbiddenTomeQuest)
		libs.Log("ShouldStartNewQuest() Already in FT quest")
		return false
	EndIf
	if isQuestActive(RadiantMaster)
		libs.Log("ShouldStartNewQuest() Already in RM quest")
		return false
	EndIf
	libs.Log("ShouldStartNewQuest(): "+true)
	return true
EndFunction
