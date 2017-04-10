scriptName zadEventBeltChafe extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("The skin around the edge of your belt chafes slightly.")	
	Utility.Wait(1)
	libs.ChastityBeltStruggle(akActor)
EndFunction
