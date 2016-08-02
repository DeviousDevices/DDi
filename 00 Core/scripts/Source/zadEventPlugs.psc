scriptName zadEventPlugs extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousPlug) )
EndFunction

Function Execute(actor akActor)
	if utility.RandomInt(1,2) == 1
		libs.NotifyPlayer("The plugs shift around inside of you.")
	Else
		libs.NotifyPlayer("The plugs make your mind wander for a brief moment.")
	EndIf
	libs.Moan(akActor)	
EndFunction
