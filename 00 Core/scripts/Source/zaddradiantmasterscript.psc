;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname zaddradiantmasterscript Extends Quest Hidden

;BEGIN ALIAS PROPERTY master
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_master Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
StartupSleepCapture()
;asdf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveDisplayed(100)
BeginSummonCountdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
StartupTrapCapture()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;===============================================================================
;                             Radiant Master
;===============================================================================

; Libs
zadLibs Property libs Auto
zadConfig Property Config Auto
SexLabFramework property SexLab auto
slaUtilScr Property Aroused Auto
zadBQ00 Property BeltQuest Auto
zaddRadiantMasterTasks Property Tasks Auto
zaddReliableForceGreet Property fg Auto

; Quest Setting Variables
zaddRadiantMasterStats Property rm Auto

; Factions
Faction Property zaddRMMasterFaction Auto

; Scenes
;Scene Property MasterGreetSummonedSlave Auto
Scene Property TrappedChest01Scene Auto
Scene Property TrappedChest02Scene Auto
Scene Property InitiationResumeDialogueScene01 Auto
Scene Property InitiationResumeDialogueScene02 Auto
Scene Property InitiationStartScene Auto
Scene Property RudeToMasterScene Auto

; Idles and Animations
Idle Property ZazAPC056 Auto
Idle Property ZazAPC057 Auto
Idle Property ZazAPCAO051 Auto
Idle Property ZazAPCAO052 Auto
Idle Property ZazAPCAO053 Auto
Idle Property ZazAPCAO054 Auto
Idle Property ZazAPCAO055 Auto

; Messages
Message Property TrappedChest01Msg Auto
Message Property TrappedChest02Msg Auto
Message Property TrappedSleepMsg Auto
Message Property Capture01Msg Auto
Message Property Capture02Msg Auto
Message Property Capture03Msg Auto
Message Property Capture04Msg Auto
Message Property CaptureBelted01Msg Auto
Message Property CaptureBelted02Msg Auto
Message Property CaptureBelted03Msg Auto
Message Property ShockSummonMsg Auto

; Etc
LocationRefType Property TGRWealthyHomeChest Auto
LocationRefType Property TGRSLStrongbox Auto
LocationRefType Property LocTypeInn Auto
Faction Property JobApothecaryFaction Auto
Faction Property JobMerchantFaction Auto
Faction Property JobBardFaction Auto
Faction Property JobBlacksmithFaction Auto
Faction Property JobCourtWizardFaction Auto

; Quest Flow Variables
float Property Obedience Auto
float Property Disposition Auto
float Property NextSummonTime Auto
float Property TimeSummonIssued Auto
float Property TimeTaskAssigned Auto
int Property SummonType Auto   ; The summon we're using for this cycle
zaddRadiantMasterBaseQuest Property LastTask Auto
Int Property LastTaskIndex Auto
zaddRadiantMasterBaseQuest Property CurrentTask Auto
zaddRadiantMasterBaseQuest[] Property TaskPool Auto
Bool Property FailedTask Auto

; Spells and Effects
Spell Property ShockSummon Auto

; Player stats
Armor Property CurrentBelt Auto
Armor Property CurrentPlug Auto
Armor Property CurrentCollar Auto

; Quest Objective ID's
int qoAwaitSummons = 100
int qoMasterSummons = 300
int qoPerformTask = 500
int qoReturnPostTask = 699
int qoEscapeBelt = 700


int NumSummonTypes = 2 ; Number of available summons


; temp vars
bool[] cameraState
form[] playerItems

;==================================================
; 
;==================================================
; Event OnInit()
; 	Maintenance()
; EndEvent


Function Maintenance()
	libs.Log("Radiant Master is disabled.")
	return
	libs.Log("Radiant Master is performing maintenance.")
	if SummonType
		libs.Log("Resuming summon sequence.")
		QueueHeartbeat(config.rmSummonHeartbeatInterval)
	else
		QueueHeartbeat(config.rmHeartbeatInterval)
	EndIf
EndFunction


Event OnUpdateGameTime()
	libs.Log("RM OnUpdateGameTime()")
	If CurrentTask != none
		libs.Log("Player currently in task.")
	Else
		If NextSummonTime > 0.0 && Utility.GetCurrentGameTime() >= NextSummonTime
			IssueSummon()
		EndIf
		if TimeSummonIssued > 0.0 ; Is there currently an active summon
			; Check to see if player is taking too long, etc.
			if Utility.GetCurrentGameTime() - TimeSummonIssued >= 8
				rm.SummonedStatus = 2
				libs.Log("Player is taking too long to respond to summons.")
			EndIf
			SummonPlayerEvent()
			QueueHeartbeat(config.rmSummonHeartbeatInterval)
			return
		EndIf
	Endif
	QueueHeartbeat(config.rmHeartbeatInterval)
EndEvent


Function ModObedience(int x)
	libs.Log("Obedience changed by ["+x+"]")
	Obedience += x
EndFunction


;==================================================
; Quest Setup Functions
;==================================================
bool Function SanityCheck()
	libs.Log("Radiant Master SanityCheck()")
	if rm.MasterHome == none
		libs.Error("Master home not set.")
		Stop()
		return false
	EndIf
	if rm.Master == none
		libs.Error("Master not set.")
		Stop()
		return false
	EndIf
	if rm.KeyContainer == none
		libs.Error("Key Container not set.")
		Stop()
		return false
	EndIf
	return true
EndFunction


string Function GetMasterName()
	return rm.Master.GetActorRef().GetLeveledActorBase().GetName()
EndFunction


Function SetupQuest()
	Location loc = rm.MasterHome.GetLocation()
	Actor master = rm.Master.GetActorRef()

	; Initialize variables
	LastTaskIndex = -1
	SummonType = -1

	; Build task pool
	TaskPool = new zaddRadiantMasterBaseQuest[3]
	TaskPool[0] = Tasks.Rewards
	TaskPool[1] = Tasks.Punishments
	TaskPool[2] = Tasks.Retrieval

	master.AddToFaction(zaddRMMasterFaction)
	master.SetFactionRank(zaddRMMasterFaction,10)
	libs.Log("Added "+GetMasterName()+" to faction" + zaddRMMasterFaction)

	; Setup personality
	rm.Profile = 0
	Libs.Log("Master's home is: " + loc.GetName())
	if master.IsInFaction(JobMerchantFaction)
		libs.Log("Master is a merchant.")
		rm.IsMerchant = true
		rm.Profile = 1
	EndIf
	if master.IsInFaction(JobApothecaryFaction)
		libs.Log("Master is an alchemist.")
		rm.IsAlchemist = true
		rm.Profile = 2
	EndIf
	if Stringutil.Find(loc.GetName(), "Temple") >= 0
		libs.Log("Master is a priest.")
		rm.IsPriest = true
		rm.Profile = 3
	EndIf
	if Loc.HasKeyword(LocTypeInn)
		libs.Log("Master is an innkeeper.")
		rm.IsInnkeeper = true
		rm.Profile = 4
	EndIf
	if master.IsInFaction(JobBardFaction)
		libs.Log("Master is a bard.")
		rm.IsBard = true
		rm.Profile = 5
	EndIf
	if master.IsInFaction(JobBlacksmithFaction)
		libs.Log("Master is a blacksmith.")
		rm.IsBlacksmith = true
		rm.Profile = 6
	EndIf
	if Stringutil.Find(loc.GetName(), "Farm") >= 0
		Libs.Log("Master is a farmer.")
		rm.IsFarmer = true
		rm.Profile = 7
	EndIf
	if master.IsInFaction(JobCourtWizardFaction)
		Libs.Log("Master is a Court Wizard.")
		rm.IsCourtWizard = true
		rm.Profile = 8
	EndIf
	if loc.HasRefType(TGRWealthyHomeChest)
		libs.Log("Master is wealthy.")
		rm.IsWealthy = true
	EndIf
EndFunction


;==================================================
; Capture Functions
;==================================================

Bool Property BacktalkedMaster Auto

Function StartupSleepCapture()
	libs.Log("StartupSleepCapture")
	if SanityCheck()
		InitiationStart()
	EndIf
EndFunction


Function StartupTrapCapture()
	libs.Log("StartupTrapCapture")
	if SanityCheck()
		libs.DisableControls()
		int tmp = 2; Utility.RandomInt(1,2)
		if tmp == 1
			TrappedChest01Msg.Show()
			; TrappedChest01Scene
		else
			rm.KeyContainer.GetReference().KnockAreaEffect(1,1500)
			TrappedChest02Msg.Show()
			; libs.PlaySceneAndWait(TrappedChest02Scene, true, 120)
		EndIf
		InitiationStart()
	EndIf
EndFunction

Function InitiationStart()
	libs.Log("Initiation()")

	; No GetPublic function to store this data?
	Alias_Master.ForceRefTo(rm.Master.GetActorRef())
	libs.Log("Setting master's home to public.")
	rm.MasterHomeMarker.GetReference().GetParentCell().SetPublic(true)

	Actor master = Alias_master.GetActorRef()

	Game.FadeOutGame(false, true, 5.0, 10.0)
	libs.PlayerRef.MoveTo(rm.MasterHomeMarker.GetReference())
	master.MoveTo(rm.MasterHomeMarker.GetReference(), -50, -50)
	master.EnableAI(false)
	Game.FadeOutGame(false, true, 5.0, 10.0)

	playerItems = SexLab.StripActor(libs.PlayerRef, DoAnimate=false)
	cameraState = libs.StartThirdPersonAnimation(libs.PlayerRef, "ZazAPCAO052")
	Utility.Wait(5)
	master.EnableAI(true)
	fg.ForceGreet(InitiationStartScene)
	libs.Log("Done with Initiation()")
EndFunction

Function SceneCaptureBelted00()
	libs.Log("SceneCaptureBelted00()")
	Capture01Msg.Show()
EndFunction

Function SceneCaptureBelted01()
	; int timeout = 0
	Scene theScene
	if UI.IsMenuOpen("Dialogue Menu")
		Input.TapKey(Input.GetMappedKey("Tween Menu"))
	EndIf
	; while UI.IsMenuOpen("Dialogue Menu") && timeout <= 100
	; 	Utility.Wait(0.1)
	; 	timeout += 1
	; EndWhile
	; if timeout >= 100
	; 	libs.Warn("Dialogue timed out.")
	; EndIf
	libs.Log("SceneCaptureBelted01()")
	int tmp = Capture02Msg.Show()
	; Do I need a forcegreet mutex?
	if tmp == 0
		CaptureBelted01Msg.Show()
		theScene = InitiationResumeDialogueScene01
	ElseIf tmp == 1
		CaptureBelted02Msg.Show()
		theScene = InitiationResumeDialogueScene01
	ElseIf tmp == 2 ; Player struggling
		CaptureBelted03Msg.Show()
		BacktalkedMaster = true
		theScene = InitiationResumeDialogueScene02
	EndIf

	CurrentPlug = libs.PlugIron
	libs.PlayerRef.AddItem(CurrentPlug, 1, false)
	libs.ManipulateDevice(libs.PlayerRef, CurrentPlug, true)

	CurrentBelt = libs.BeltPadded
	libs.PlayerRef.AddItem(CurrentBelt, 1, false)
	libs.ManipulateDevice(libs.PlayerRef, CurrentBelt, true)

	fg.ForceGreet(theScene)
EndFunction

Function SceneCaptureBelted02()
	libs.Log("SceneCaptureBelted02()")
	fg.DialogueDone = false

	libs.PlayerRef.AddItem(libs.cuffsPaddedLegs, 1, false)
	libs.ManipulateDevice(libs.PlayerRef, libs.cuffsPaddedLegs, true)
	libs.PlayerRef.AddItem(libs.cuffsPaddedArms, 1, false)
	libs.ManipulateDevice(libs.PlayerRef, libs.cuffsPaddedArms, true)

	if !BacktalkedMaster
		Capture03Msg.Show()
		CurrentCollar = libs.cuffsPaddedCollar
	Else
		Capture04Msg.Show()
		CurrentCollar = libs.collarPosture
	EndIf
	libs.PlayerRef.AddItem(CurrentCollar, 1, false)
	libs.ManipulateDevice(libs.PlayerRef, CurrentCollar, true)

	libs.EndThirdPersonAnimation(libs.PlayerRef, cameraState)
	SexLab.UnStripActor(libs.PlayerRef, playerItems)
	SetupQuest()
	SetStage(100)
EndFunction

;==================================================
; Summon Functions
;==================================================
Function QueueHeartbeat(float offset)
	if !libs || !config || !config.rmHeartbeatInterval || !config.rmSummonHeartbeatInterval
		debug.Messagebox("A fatal error has occurred with your installation of Devious Devices. Incomplete uninstall attempt perhaps? Aborting update chain.")
	else
		RegisterForSingleUpdateGameTime(offset)
	EndIf
EndFunction


Function IssueSummon()
	SetObjectiveCompleted(qoAwaitSummons, true)
	SetObjectiveCompleted(qoMasterSummons, false)
	SetObjectiveDisplayed(qoMasterSummons, true)
	NextSummonTime = 0.0
	TimeSummonIssued = Utility.GetCurrentGameTime()
	if SummonType < 0
		SummonType = Utility.RandomInt(0, NumSummonTypes - 1)
	EndIf
	rm.SummonedStatus = 1
	; TODO: Add more summon types.
	ShockSummonMsg.show()
	SummonPlayerEvent()
EndFunction


Function BeginSummonCountdown()
	libs.Log("BeginSummonCountdown("+Utility.GameTimeToString(TimeSummonIssued)+")")
	SetObjectiveCompleted(qoAwaitSummons, false)
	SetObjectiveDisplayed(qoAwaitSummons, true)
	NextSummonTime = Utility.GetCurrentGameTime()
	QueueHeartbeat(config.rmHeartbeatInterval)
EndFunction


Function SummonPlayerEvent()
;	if SummonType == 0
	libs.Log("Playing Shock Summon")
	ShockSummon.RemoteCast(libs.PlayerRef, libs.PlayerRef, libs.PlayerRef)
	; ElseIf SummonType == 1
	; 	; Vibrator Summon
	; 	libs.Log("Playing Vibrator Summon")
	; 	libs.NotifyPlayer("Vibrator Summon")
	; EndIf
	QueueHeartbeat(config.rmSummonHeartbeatInterval)
EndFunction

;==================================================
; Arrival
;==================================================
Function PlayerRespondedToSummon()
	libs.Log("PlayerRespondedToSummon()")
	; Player arrived at master, stop summon events.
	NextSummonTime = 0.0
	TimeSummonIssued = 0.0
	rm.SummonedStatus = 0
	fg.DialogueDone = false
EndFunction


Function RudeToMaster()
	libs.Log("RudeToMaster()")
	fg.DialogueDone = false
	tasks.Punishments.DoRandomPunishment(eval=true)
	fg.ForceGreet(RudeToMasterScene)
EndFunction

;==================================================
; Tasks
;==================================================
zaddRadiantMasterBaseQuest Function GetTask()
	int i = TaskPool.Length
	int tmp = 0
	int bestMatch = 1
	int bestTaskIndex = -1
	while i > 0
		i -= 1
		tmp = Utility.RandomInt() + TaskPool[i].DetermineEligibility()
		if i == LastTaskIndex
			libs.Log("Task " + TaskPool[i] + " (#"+i+") was previous quest. Assigning low priority.")
			tmp -= 100
		EndIf
		libs.Log("Processing Task #"+i + " ("+TaskPool[i]+"): "+tmp)
		if tmp >= bestMatch
			libs.Log("Found new best canidate: #"+i+", score:"+tmp)
			bestMatch = tmp
			bestTaskIndex = i
		EndIf
	EndWhile
	if bestTaskIndex <0
		libs.Error("No tasks available for assignment.")
		return TaskPool[0]
	EndIf
	LastTaskIndex = bestTaskIndex
	return TaskPool[bestTaskIndex]
EndFunction


Function BeginTask(zaddRadiantMasterBaseQuest task)
	libs.log("BeginTask("+task+")")
	CurrentTask = task
	TimeTaskAssigned = Utility.GetCurrentGameTime()
	rm.InTask=true
	task.Begin()
EndFunction


Function GiveRandomTask()
	PlayerRespondedToSummon()
	libs.Log("GiveRandomTask()")
	SetObjectiveCompleted(qoMasterSummons)
	SetObjectiveCompleted(qoPerformTask, false)
	SetObjectiveDisplayed(qoPerformTask, true)
	FailedTask = false
	CurrentTask = GetTask()
	BeginTask(CurrentTask)
	QueueHeartbeat(config.rmHeartbeatInterval)
EndFunction


Function TaskCompleted()
	libs.Log("TaskCompleted()")
	libs.NotifyPlayer("Task Completed.",1)
	PostTask()
EndFunction


Function TaskFailed()
	libs.Log("TaskFailed()")
	Failedtask = true
	libs.NotifyPlayer("Task Failed.",1)
	PostTask()
EndFunction


Function TaskDoneNoPostScene() ; For punishment/reward tasks
	Libs.Log("TaskDoneNoPost()")
	rm.InTask=false
	libs.NotifyPlayer("Done.")
	PostTaskSceneComplete()
EndFunction


Function PostTask()
	SetObjectiveCompleted(qoPerformTask, true)
	libs.Log("PostTask()")
	rm.InTask=false
	LastTask = CurrentTask
	CurrentTask.CompleteQuest()
	CurrentTask.Stop()
	CurrentTask = none
	Location playerLoc = libs.PlayerRef.GetCurrentLocation()
	Location masterLoc = rm.Master.GetActorRef().GetCurrentLocation()
	if playerLoc.IsSameLocation(masterLoc)
		libs.Log("Player already at same location as master.")
		BeginPostTaskScene()
	else
		libs.Log("Player needs to head to master.")
		SetObjectiveCompleted(qoReturnPostTask, false)
		SetObjectiveDisplayed(qoReturnPostTask, true)
	EndIf
	QueueHeartbeat(config.rmHeartbeatInterval)
EndFunction


Function PostTaskReturned()
	libs.Log("PostTaskReturned()")
	SetObjectiveCompleted(qoReturnPostTask)
	BeginPostTaskScene()
EndFunction


Function BeginPostTaskScene()
	libs.Log("Post Task Scene")
	if FailedTask
		libs.Log("Player failed last task. Punish them.")
		libs.NotifyPlayer("In for a punishment.")
		Tasks.Punishments.Begin(eval=true)
	Else
		libs.Log("Player completed last task. Reward them.")
		libs.NotifyPlayer("In for a reward.")
		Tasks.Rewards.Begin(eval=true)
	EndIf
EndFunction


Function PostTaskSceneComplete()
	libs.Log("PostTaskSceneComplete()")
	CurrentTask = none
	rm.InTask=false
	SetObjectiveDisplayed(qoPerformTask, false)
	SetObjectiveDisplayed(qoReturnPostTask, false)
	SetObjectiveDisplayed(qoMasterSummons, false)
	BeginSummonCountdown()
EndFunction
