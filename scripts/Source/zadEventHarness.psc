scriptName zadEventHarness extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousHarness) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	int weatherClass = Weather.GetCurrentWeather().GetClassification()
	if weatherClass == 2 ; Rain
		if libs.Aroused.GetActorExposure(libs.PlayerRef) >= libs.ArousalThreshold("Horny")
			libs.NotifyPlayer("The wetness from around and inside you causes the leather to tighten across your body.")
		Else
			libs.NotifyPlayer("The rain causes the leather straps to tighten around your wet skin.")
		EndIf
	Else
		if libs.Aroused.GetActorExposure(libs.PlayerRef) >= libs.ArousalThreshold("Horny")
			libs.NotifyPlayer("You feel the leather around your crotch contracting due to the excessive moisture.")
		Else
			;
		EndIf
	EndIf
EndFunction
