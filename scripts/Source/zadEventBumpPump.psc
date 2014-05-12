scriptName zadEventBumpPump extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_HasPumps) && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("In your haste, you inadvertently bump one of the pumps dangling from your groin.")
	libs.NotifyPlayer("The plug responds by inflating inside of you, before beginning to deflate slowly.")
	libs.Moan(akActor)
	libs.UpdateExposure(akActor, 1)
EndFunction
