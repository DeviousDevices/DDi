Scriptname zadDeviousMagic extends Quest

zadLibs Property libs Auto
zadBQ00 Property zadQuest Auto

Bool Property IsRunning Auto
Actor Property TheCaster Auto
Actor Property TheVictim Auto

Function StartChannel(Actor caster, Actor victim)
	TheCaster = caster
	TheVictim = victim
	RegisterForKey(Input.GetMappedKey("Left Attack/Block", 1))
	RegisterForKey(Input.GetMappedKey("Left Attack/Block", 2))
	RegisterForKey(Input.GetMappedKey("Right Attack/Block", 1))
	RegisterForKey(Input.GetMappedKey("Right Attack/Block", 2))
	DoRegister()
EndFunction


Event OnKeyUp(int KeyCode, float HoldTime)
	TerminateChannel()
EndEvent


Event OnUpdate()
	if !IsRunning
		libs.StopVibrating(TheVictim)
	else
		if TheCaster.GetAV("Magicka") < 25
			if TheCaster == libs.PlayerRef
				libs.NotifyPlayer("You can sustain the spell no longer...")
			EndIf
			TerminateChannel()
		EndIf
		DoRegister()
	EndIf
EndEvent


Function DoRegister()
	RegisterForSingleUpdate(0.5)
EndFunction

Function TerminateChannel()
	UnregisterForAllKeys()
	TheCaster.InterruptCast()
	libs.StopVibrating(TheVictim)
	IsRunning = False
EndFunction
