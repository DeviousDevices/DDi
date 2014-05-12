scriptName zadEventTightBra extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBra) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	if libs.Aroused.GetActorExposure(akActor) >= libs.ArousalThreshold("Horny")
		libs.NotifyPlayer("Your hard nipples rub uncomfortably against the cold steel of the Chastity Bra.")
		libs.UpdateExposure(akActor, 0.10)
	else
		libs.NotifyPlayer("Your Chastity Bra is uncomfortably restricts your movements.")
	EndIf	
EndFunction
