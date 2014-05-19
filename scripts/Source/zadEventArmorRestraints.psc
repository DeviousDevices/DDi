scriptName zadEventArmorRestraints extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_Lockable) && akActor.GetWornForm(0x00000004) != None )
EndFunction

Function Execute(actor akActor)
	libs.NotifyPlayer("Your restraints brush against your armor, reminding you of their presence.")
EndFunction
