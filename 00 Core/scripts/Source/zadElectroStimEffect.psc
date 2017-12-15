Scriptname zadElectroStimEffect Extends ActiveMagicEffect

zadLibs Property libs Auto
Keyword Property zad_EffectElectroStim Auto
Int Property ShockChance Auto
Spell Property ShockEffect Auto

Actor Property Target Auto


Function DoRegister()
	libs.Log("ElectroStim: Registered for mod events.")
	UnregisterForAllModEvents()
	RegisterForModEvent("DeviceActorOrgasm", "OnOrgasm")
	RegisterForModEvent("DeviceEdgedActor", "OnEdged")
EndFunction

bool Function SanityCheck()
	if !target || !target.HasMagicEffectWithKeyword(zad_EffectElectroStim)
		libs.Warn("Target is none, or target doesn't have electro stim keyword!")
		UnregisterForAllModEvents()
		return false
	EndIf
	return true
EndFunction

bool Function IsTarget(string argString)
	return (argString == target.GetLeveledActorBase().GetName())
EndFunction

Event OnOrgasm(string eventName, string argString, float argNum, form sender)
	libs.Log("ElectroStim: OnOrgasm("+eventName+","+argString+","+argNum+","+sender+")")
	if SanityCheck()
		if IsTarget(argString)
			libs.Log("Matches target.")
		EndIf
	EndIf
EndEvent

Event OnEdged(string eventName, string argString, float argNum, form sender)
	libs.Log("ElectroStim: OnEdged("+eventName+","+argString+","+argNum+","+sender+")")
	if SanityCheck()
		if IsTarget(argString)
			libs.Log("Matches target.")
			if Utility.RandomInt() <= ShockChance
				libs.ShockActor(libs.playerRef)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == libs.PlayerRef
		Target = akTarget
		DoRegister()
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	
EndEvent

Event OnCellAttach()
	DoRegister()
EndEvent

Event OnLoad()
	DoRegister()
EndEvent

Event OnUnload()
	; UnregisterForAllModEvents()
EndEvent
