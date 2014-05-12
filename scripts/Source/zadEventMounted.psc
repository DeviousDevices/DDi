scriptName zadEventMounted extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && akActor.IsOnMount() && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	if akActor.WornHasKeyword(libs.zad_DeviousPlug)
		libs.NotifyPlayer("The movements of your mount cause the plugs within you to shift in a distracting manner.")
		libs.Moan(akActor)
		libs.UpdateExposure(akActor, 0.5)
	else
		libs.NotifyPlayer("The Chastity Belt chafes uncomfortably as you ride.")
	EndIf
EndFunction
