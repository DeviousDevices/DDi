Scriptname zaddRadiantMasterTaskRetrieval Extends zaddRadiantMasterBaseQuest

Scene Property ResumeDialogue Auto


int Function DetermineEligibility()
	int ret = parent.DetermineEligibility()
	ret += 0;200 ;testing
	return ret
EndFunction


Function Begin(bool eval=false)
	Parent.Begin()
	libs.Log("Retrieval Task: Begin()")
	; MasterScript.TaskCompleted()
EndFunction


Function EndedDialogue()
	Parent.EndedDialogue()
	MasterScript.Fg.DialogueDone=false
	libs.Log("Retrieval Task: EndedDialogue()")
EndFunction


Function ReturnHome()
	libs.Log("Retrieval Task: ReturnHome()")
	
	Parent.ReturnHome()
EndFunction


Function Done(int end=0)
	libs.Log("Retrieval Task: Done()")
	CompleteAllObjectives()
	Parent.Done(end)
EndFunction


Function StartPunishment()
	libs.Log("StartPunishment()")
	MasterScript.Tasks.Punishments.DoRandomPunishment(eval=true)
	libs.Log("StartPunishment() done. Resuming dialogue.")
	if !MasterScript.fg.ForceGreet(ResumeDialogue)
		libs.Warn("Dialogue scene failed to resume.")
	EndIf
EndFunction

