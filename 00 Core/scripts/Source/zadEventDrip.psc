scriptName zadEventDrip extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) )
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("You feel a bit of lubrication run down your leg.")
	;if akActor.WornHasKeyword(zad_DeviousPlug)
	; TODO: Add some sort of animation here. Perhaps a wetness decal.	
EndFunction
