scriptName zadEventDrip extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("You feel a bit of lubrication run down your leg.")
	;if akActor.WornHasKeyword(zad_DeviousPlug)
	; TODO: Add some sort of animation here. Perhaps a wetness decal.	
EndFunction
