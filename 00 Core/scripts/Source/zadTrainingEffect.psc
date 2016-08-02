ScriptName zadTrainingEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto
SexlabFramework Property Sexlab Auto

Bool Property Terminate Auto
actor Property Target Auto

; Extend this function to set a day passed event.
Function OnTrainingDayPassed(int daysRemaining)
	if daysRemaining == 1
		libs.NotifyPlayer("You hear a single chime originating from inside of you.")
	Else
		libs.NotifyPlayer("You hear a set of "+daysRemaining+" chimes originating from inside of you.")
	EndIf
EndFunction

; Extend this function to set training completed event.
Function OnTrainingComplete() 
	libs.Log("The training plug within you lets out a chime, and begins to vibrate!")
	ModDaysRemaining(7, maxRange=GetTrainingRange())
	libs.VibrateEffect(Target, 5, 120, teaseOnly=false)
EndFunction

; Extend this function to set the maximum training duration.
int Function GetTrainingRange()
	return 7
EndFunction

; Extend this function to easily set your own criteria for violations.
Event OnTrainingViolation(string eventName, string argString, float argNum, form sender)
	libs.Log("OnTrainingViolation("+argString+")")
	if argString == "SpellCast"
		ModDaysRemaining(1, maxRange=GetTrainingRange())
		libs.NotifyPlayer("Your mental reserves are dramatically drained as the plug punishes you.")
		libs.PlayerRef.DamageAv("Magicka", 200)
	EndIf
EndEvent

Function DoRegisterModEvent()
	UnregisterForModEvent("TrainingViolation")
	RegisterForModEvent("TrainingViolation", "OnTrainingViolation")
EndFunction


Event OnUpdateGameTime()
	if !Terminate
		DoRegister()
	EndIf
EndEvent

float Function InitNextTickTime()
	float ret = Utility.GetCurrentGameTime() + 1.0
	StorageUtil.SetFloatValue(Target, "zad.NextTickTime", ret)
	return ret
EndFunction

Function DoRegister()
	float nextTime = StorageUtil.GetFloatValue(Target, "zad.NextTickTime", -1.0)
	if nextTime == -1.0
		nextTime = InitNextTickTime()
	EndIf
	libs.Log("DoRegister(Training):"+Utility.GetCurrentGameTime()+" / "+ nextTime)
	if !Terminate && Utility.GetCurrentGameTime() >= nextTime
		InitNextTickTime()
		int daysRemaining = ModDaysRemaining(-1, maxRange=GetTrainingRange())
		libs.Log("DoRegister(Training): Day passed. Days Remaining: "+daysRemaining +".")
		if daysRemaining == 0
			libs.Log("Player has completed training.")
			OnTrainingComplete()
		Else
			OnTrainingDayPassed(daysRemaining)
		EndIf
	EndIf
	RegisterForSingleUpdateGameTime(1.0)
EndFunction
		
int Function ModDaysRemaining(int changeBy, int maxRange) 
	int daysRemaining = StorageUtil.GetIntValue(Target, "zad.TrainingDaysRemaining", maxRange)
	int newDaysRemaining = daysRemaining + changeBy
	if newDaysRemaining <0
		newDaysRemaining = 0
	EndIf
	if newDaysRemaining > maxRange
		newDaysRemaining = maxRange
	EndIf
	InitNextTickTime()
	libs.log("Days remaining was: "+daysRemaining+". Now set to "+newDaysRemaining+".")
	StorageUtil.SetIntValue(Target, "zad.TrainingDaysRemaining", newDaysRemaining)
	return newDaysRemaining
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Target = akTarget
	if Target != libs.PlayerRef
		libs.Log("OnEffectStart(Training): Not player, doing nothing.")
	else
		libs.Log("OnEffectStart(Training)")
		Terminate = False
		DoRegisterModEvent()
		DoRegister()
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Terminate = True
	UnregisterForModEvent("TrainingViolation")
	UnregisterForUpdateGameTime()
	libs.Log("OnEffectFinish(Training)")
EndEvent


Event OnLoad()
	if Target == libs.PlayerRef
		DoRegisterModEvent()
		DoRegister()
	Endif
EndEvent

