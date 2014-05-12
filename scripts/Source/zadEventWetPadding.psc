scriptName zadEventWetPadding extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
; There's currently no material keywords. Hmm. This will fire on iron belts for the moment.
	 return (akActor.WornHasKeyword(libs.zad_DeviousBelt) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("The belt-padding between your legs is slick and swollen from your lubrication.")
EndFunction

