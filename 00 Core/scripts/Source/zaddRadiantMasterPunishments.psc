Scriptname zaddRadiantMasterPunishments Extends zaddRadiantMasterBaseQuest

Scene Property PostBlowjob Auto
Scene Property PostBlowjobCourtWizard Auto
Scene Property PostPunishment Auto


int Function DetermineEligibility()
	int ret = Parent.DetermineEligibility()
	; ret += 100
	return ret
EndFunction


Function Begin(bool eval=false)
	libs.Log("Punishments: Begin("+eval+")")
	Parent.Begin()
	MasterScript.rm.master.GetActorRef().EnableAI(false)
EndFunction


Function Blowjob(Scene postScene)
	libs.Log("Punishment: Blowjob()")
	libs.NotifyPlayer("Blowjob Placeholder",1)
	if !libs.PlaySceneAndWait(postScene, true, 10)
		libs.Warn("Post-Blowjob scene timed out!")
	EndIf
EndFunction


Function DoRandomPunishment(bool eval=false)
	libs.Log("DoRandomPunishment()")
	libs.NotifyPlayer("DoRandomPunishment Placeholder", 1)
	if eval
		libs.Log("Eval: End DoRandomPunishment()")
	else
		if !MasterScript.fg.ForceGreet(PostPunishment)
			libs.Warn("Post-Punishment scene timed out!")
			libs.NotifyPlayer("Debug: Scene timed out.",1)
			Post()
		EndIf
		libs.Log("End DoRandomPunishment()")
	EndIf
EndFunction


Function Post(int a=0)
	MasterScript.fg.DialogueDone = false
	MasterScript.rm.master.GetActorRef().EnableAI(true)
	libs.Log("Post("+a+")")
	MasterScript.ModObedience(a)
	Done(end=2)
EndFunction


Function TauntMaster()
	libs.Log("TauntMaster()")
	MasterScript.fg.DialogueDone = false
	MasterScript.ModObedience(-1)
	DoRandomPunishment()
EndFunction

