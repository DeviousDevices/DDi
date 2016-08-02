scriptName zadEventBeltedEmpty extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_DeviousPlug) )
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("You clench your legs together, achingly empty.")
EndFunction
