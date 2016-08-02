Scriptname zaddRadiantMasterRewards Extends zaddRadiantMasterBaseQuest

int Function DetermineEligibility()
	int ret = Parent.DetermineEligibility()
	return ret
EndFunction


Function Begin(bool eval=false)
	libs.Log("Rewards: Begin()")
	libs.NotifyPlayer("Reward Scene Placeholder.",1)
	MasterScript.TaskDoneNoPostScene()
EndFunction
