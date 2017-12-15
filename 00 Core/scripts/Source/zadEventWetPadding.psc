scriptName zadEventWetPadding extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return !akActor.IsOnMount() && (akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !libs.BoundCombat.HasCompatibleDevice(akActor)) 	 
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("The belt-padding between your legs is slick and swollen from your lubrication.")
	Utility.Wait(1)
	libs.ChastityBeltStruggle(akActor)
EndFunction

