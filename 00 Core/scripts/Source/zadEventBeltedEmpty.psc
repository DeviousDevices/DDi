scriptName zadEventBeltedEmpty extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return !akActor.IsOnMount() && (akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_DeviousPlug) && !akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !libs.BoundCombat.HasCompatibleDevice(akActor))	 
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("You clench your legs together, achingly empty.")
	Utility.Wait(1)
	libs.ChastityBeltStruggle(akActor)
EndFunction
