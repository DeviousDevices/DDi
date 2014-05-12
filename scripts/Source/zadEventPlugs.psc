scriptName zadEventPlugs extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_DeviousPlug) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	if utility.RandomInt(1,2) == 1
		libs.NotifyPlayer("The plugs shift around inside of you.")
	Else
		libs.NotifyPlayer("The plugs make your mind wander for a brief moment.")
	EndIf
	libs.Moan(akActor)	
EndFunction
