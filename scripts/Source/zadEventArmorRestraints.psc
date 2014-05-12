scriptName zadEventArmorRestraints extends zadBaseEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (akActor.WornHasKeyword(libs.zad_Lockable) && akActor.GetWornForm(0x00000004) != None && Parent.Filter(akActor, chanceMod))
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("Your restraints brush against your armor, reminding you of their presence.")
EndFunction
