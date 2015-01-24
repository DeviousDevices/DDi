scriptName zadEventGloves extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousGloves) )
EndFunction

Function Execute(actor akActor)
	libs.Log("FIXME: Finish placeholder gloves event.")
EndFunction
