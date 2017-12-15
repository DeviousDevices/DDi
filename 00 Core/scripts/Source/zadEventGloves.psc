scriptName zadEventGloves extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousGloves) )
EndFunction

Function Execute(actor akActor)
	if (akActor == libs.PlayerRef)
		libs.NotifyPlayer("A sudden loss of grip reminds you of the gloves you are wearing.")
	endif
EndFunction
