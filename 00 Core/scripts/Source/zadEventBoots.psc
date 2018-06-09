scriptName zadEventBoots extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBoots))
EndFunction

Function Execute(actor akActor)
	if (akActor == libs.PlayerRef)
		libs.NotifyPlayer("You trip over your heels...")
		libs.Trip(akActor)
	EndIf	
EndFunction