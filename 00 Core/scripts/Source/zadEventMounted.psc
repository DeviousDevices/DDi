scriptName zadEventMounted extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousPlug) || akActor.WornHasKeyword(libs.zad_DeviousBelt) && akActor.IsOnMount() )
EndFunction

Function Execute(actor akActor)
	if akActor.WornHasKeyword(libs.zad_DeviousPlug)
		libs.NotifyPlayer("The movements of your mount cause the plugs within you to shift in a distracting manner.")
		libs.Moan(akActor)
		libs.UpdateExposure(akActor, 0.5)
	endif
	if akActor.WornHasKeyword(libs.zad_DeviousBelt)
		libs.NotifyPlayer("The Chastity Belt chafes uncomfortably as you ride.")
	EndIf
EndFunction
