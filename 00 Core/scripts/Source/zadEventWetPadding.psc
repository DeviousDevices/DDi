scriptName zadEventWetPadding extends zadBaseEvent

Float EventCooldown = 0.0

bool Function HasKeywords(actor akActor)
	if Utility.GetCurrentRealTime() < Eventcooldown || akActor.IsWeaponDrawn()
		Return False
	Else	 
		return !akActor.IsOnMount() && (akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage) && !libs.BoundCombat.HasCompatibleDevice(akActor)) 	 
	EndIf
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("The belt-padding between your legs is slick and swollen from your lubrication.")
	Utility.Wait(1)
	libs.ChastityBeltStruggle(akActor)
	Eventcooldown = Utility.GetCurrentRealTime() + 600 ; add a 10 min real time cooldown
EndFunction

