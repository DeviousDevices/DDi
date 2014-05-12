scriptName zadEventPostureCollar extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 ; no keyword specifically for posture collars. Should ask zadil to add one for more further effects.
	 return (akActor.WornHasKeyword(libs.zad_DeviousCollar) && akActor.IsEquipped(libs.collarPosture) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
		libs.NotifyPlayer("The posture collar uncomfortably continues to train you to keep a more refined posture.")	
EndFunction
