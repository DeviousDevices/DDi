Scriptname zaddForbiddenTomeMarkerScript extends ReferenceAlias

zaddForbiddenTomeScript Property questScript Auto
zadLibs Property libs Auto

Actor Property Player Auto
bool Property IsDecoy Auto
int Property ObjectiveID Auto

; Event OnLoad()
; 	libs.Log("OnLoad( XXX)")
; 	libs.NotifyPlayer("OnLoad")
; EndEvent

; Event OnCellAttach()
; 	libs.Log("OnCellAttach XXX")
; 	libs.NotifyPlayer("OnCellAttach")
; EndEvent

Event OnCellLoad()
	libs.Log("OnCellLoad()")
;	If akActionRef == Player
	if questScript.GetStage() > 10
		if !questScript.IsObjectiveCompleted(ObjectiveID)
			if IsDecoy
				libs.NotifyPlayer("Zed doesn't seem to be anywhere near here.")
				questScript.SetObjectiveDisplayed(ObjectiveID, false)
				questScript.SetObjectiveCompleted(ObjectiveID)
			Else
				questScript.SetObjectiveCompleted(20)
				questScript.SetObjectiveDisplayed(21, false)
				questScript.SetObjectiveCompleted(21)
				questScript.SetObjectiveDisplayed(22, false)
				questScript.SetObjectiveCompleted(22)
				libs.NotifyPlayer("Aha! I think I see Zed up ahead.")
				questScript.SetObjectiveDisplayed(23)
			EndIf
		EndIf
	EndIf
;	EndIf
EndEvent


; Event OnTriggerEnter(ObjectReference akActionRef)

; EndEvent
