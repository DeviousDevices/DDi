Scriptname zadBraScript extends zadEquipScript  

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You slip the bra around "+GetMessageName(akActor)+" chest, and it locks in place with a soft click.", akActor, true)
	EndIf
EndFunction
