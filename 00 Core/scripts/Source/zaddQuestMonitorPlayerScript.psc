Scriptname zaddQuestMonitorPlayerScript Extends ReferenceAlias

; libs
zaddQuestMonitorScript Property questMonitor Auto
zadLibs Property libs Auto

; Monitored objects
Book Property ChastityBook Auto
Key Property ForbiddenKey Auto
MiscObject Property BogusItem Auto

; Surreptitious Streets
FormList Property EligibleLocations Auto

Event OnPlayerLoadGame()
	questMonitor.Maintenance()
	Maintenance()
EndEvent


; Event OnInit()
; 	Maintenance()
; EndEvent


Function Maintenance()
	GoToState("Enabled")
	questMonitor.Maintenance()
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(BogusItem) ; Avoid calls to OnItemAdded when they're not needed anymore.
	AddInventoryEventFilter(ChastityBook)
	AddInventoryEventFilter(ForbiddenKey)
	libs.Log("QuestMonitor is now tracking player.")
EndFunction


Auto State Disabled

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

EndEvent

EndState


State Enabled

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	libs.Log("QuestMonitor: OnItemAdded()")
	if questMonitor.ShouldStartNewQuest() && libs.Config.ForbiddenTome
		if akBaseItem == ChastityBook
			if !questMonitor.zaddForbiddenTomeQuest.Start()
				libs.Error("zaddForbiddenTomeQuest failed to start.")
			else
				if (questMonitor.Urag.GetReference() as Actor).HasLOS(libs.PlayerRef)
					libs.Log("Caught player stealing book. Starting quest.")
					questMonitor.zaddForbiddenTomeQuest.SetStage(10)
				Else
					libs.Log("Player got away with stealing the book. Starting quest.")
					questMonitor.zaddForbiddenTomeQuest.SetStage(5)
				EndIf
				RemoveInventoryEventFilter(ChastityBook)
				RemoveInventoryEventFilter(ForbiddenKey)
			EndIf
		EndIf
	EndIf
EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if libs.Config.SurreptitiousStreets
		; if akOldLoc != none && akNewLoc != none && akOldLoc.IsChild(akNewLoc)
		; 	libs.Log(akOldLoc + " is child of "+ akNewLoc + ". Not regenerating trap list.")
		; 	return
		; EndIf
		if akNewLoc != none
			int chance = Utility.RandomInt()
			libs.Log("Entered new location: " + akNewLoc.GetName()+"["+akNewLoc+"] ("+chance+"/"+libs.Config.ssTrapChance+")")
			if chance <= libs.Config.ssTrapChance
				int i = EligibleLocations.GetSize()
				bool match = false
				while i > 0 && !match
					i -= 1
					Keyword tmp = EligibleLocations.GetAt(i) as Keyword
					; libs.Log("Checking " + tmp)
					if akNewLoc.HasKeyword(tmp)
						libs.Log("New location matches keyword " + tmp)
						match = true
					EndIf
				EndWhile
				libs.Log("OnLocationChange(): New location eligibility for Surreptitious Streets:" + match)
				if match
					if questMonitor.ShouldStartNewQuest()
						if questMonitor.zaddSSQuest.IsRunning()
							questMonitor.zaddSSQuest.Stop()
						EndIf
						if !questMonitor.zaddSSQuest.Start()
							libs.Warn("Surreptitious Streets failed to start for current location.")
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

EndState
