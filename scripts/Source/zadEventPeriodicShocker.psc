scriptName zadEventPeriodicShocker extends zadBaseLinkedEvent

bool Function HasKeywords(actor akActor)
	return libs.ActorHasKeyword(akActor, libs.zad_EffectShocking)
EndFunction

Function Execute(actor akActor)
	if akActor == libs.playerRef
		libs.NotifyPlayer("The plugs within you let out a painful jolt!")
	Else
		libs.NotifyNPC(akActor.GetLeveledActorBase().GetName() + " squirms uncomfortably as the plugs within her let out a painful jolt!")
	EndIf
	libs.ShockActor(akActor)
EndFunction
