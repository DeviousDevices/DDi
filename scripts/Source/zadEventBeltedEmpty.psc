scriptName zadEventBeltedEmpty extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_DeviousPlug) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("You clench your legs together, achingly empty.")
EndFunction
