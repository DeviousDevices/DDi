Scriptname zaddSurreptitiousContainerScript Extends ReferenceAlias

zadLibs Property Libs Auto
zaddQuestMonitorScript Property QuestMonitor Auto
zaddSurreptitiousScript Property ssQuest Auto

LocationAlias Property MyLocation Auto
ReferenceAlias Property MyContainer Auto
ReferenceAlias Property MyMaster Auto
ReferenceAlias Property MyMarker Auto
ReferenceAlias Property Player Auto


Event OnOpen(ObjectReference akActionRef)
	
EndEvent

Function OpenedTrappedContainer(ObjectReference akActionRef)
	if akActionRef == player.GetActorRef()
		libs.Log("SS: Player opened trapped container.")
		if QuestMonitor.ShouldStartNewQuest() && libs.Config.SurreptitiousStreets
			if !MyMaster || !MyMarker ; All other parameters are mandatory.
				libs.Log("Location did not contain all mandatory properties. Aborting.")
			else
				if libs.Config.ssWarningMessages
					int choice = ssQuest.ChestWarning.Show()
					if choice == 1
						libs.Log("User aborted capture scene.")
						return
					EndIf
				EndIf
			
				; Randomly select which quest-line to start.
				; Only one possibility for now.
				ssQuest.StartRadiantMaster(MyLocation, MyContainer, MyMaster, MyMarker, stage=5)
			EndIf
		EndIf
	else
		libs.log("SS: Someone (or something) else opened us")
	endIf
EndFunction

Event OnActivate(ObjectReference akActionRef)
	if QuestMonitor.RadiantMaster.GetStage() > 0 && questMonitor.RadiantMaster.GetStage() < 890
		libs.Log("OnActivate(): Player already in rm quest.")
		libs.NotifyPlayer("The chest is locked with some sort of a combination lock, and is impossible to open without the correct code.",1)
	Else
		OpenedTrappedContainer(akActionRef)
	EndIf
EndEvent


Event OnCellLoad()
	; Test if this persists between games.
	libs.Log("SS: Blocking normal container activation.")
	MyContainer.GetReference().BlockActivation()
EndEvent

;;; Reuse this same script for other types of trapped objects? Pick up traps, etc?
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	libs.Log("SS: OnContainerChanged()") 
EndEvent
