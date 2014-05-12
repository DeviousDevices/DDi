scriptName zadEventBeltChafe extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("The skin around the edge of your belt chafes slightly.")	
EndFunction
