Scriptname zaddRadiantMasterBaseQuest Extends Quest

zaddRadiantMasterScript Property MasterScript Auto
zadLibs Property libs Auto
Float Property SoftTimeout Auto
Float Property HardTimeout Auto

Bool Property Failed Auto

int Function DetermineEligibility()
	return 0
EndFunction


Function Begin(bool eval=false)
	libs.Log("BaseQuest: Begin("+eval+")")
	failed = false
	Reset()
	Start()
EndFunction


Function EndedDialogue()
	libs.Log("BaseQuest: EndedDialogue()")
	SetStage(10)
	SetObjectiveDisplayed(10)
EndFunction


Function ReturnHome()
	libs.Log("BaseQuest: ReturnHome()")
	SetStage(180)
	SetObjectiveDisplayed(180)
EndFunction


Function Done(int end=0)
	libs.Log("baseQuest: Done()")
	SetStage(200)
	CompleteQuest()
	Stop()
	if end == 0
		MasterScript.TaskCompleted()
	elseif end == 1
		MasterScript.TaskFailed()
	elseif end == 2
		MasterScript.TaskDoneNoPostScene()
	else
		libs.Error("Quest received invalid ending code.")
	EndIf
EndFunction
