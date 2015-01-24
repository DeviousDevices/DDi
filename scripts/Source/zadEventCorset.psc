scriptName zadEventCorset extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousCorset))
EndFunction

Function Execute(actor akActor)
	libs.Log("FIXME: Finish placeholder corset event.")
EndFunction
