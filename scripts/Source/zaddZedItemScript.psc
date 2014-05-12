Scriptname zaddZedItemScript extends ObjectReference  

zaddForbiddenTomeScript Property questScript Auto
zadLibs Property libs Auto
Int Property MyObjective Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == libs.PlayerRef
		questScript.SetObjectiveCompleted(MyObjective)
		if questScript.IsObjectiveCompleted(30) && questScript.IsObjectiveCompleted(31) && questScript.IsObjectiveCompleted(32)
			questScript.SetStage(40)
			questScript.SetObjectiveDisplayed(40)
		EndIf
	EndIf
EndEvent
