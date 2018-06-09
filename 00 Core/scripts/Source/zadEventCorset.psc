scriptName zadEventCorset extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousCorset))
EndFunction

Function Execute(actor akActor)
	if (akActor == libs.PlayerRef)
		libs.NotifyPlayer("You feel light-headed momentarily and are forced to stop and catch your breath.")
		libs.CatchBreath(akActor)
	EndIf	
EndFunction
