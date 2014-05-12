Scriptname zadBlindfoldScript extends zadRestraintScript

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You slip the blindfold around "+GetMessageName(akActor)+" head, and it locks in place with a soft click.", akActor, true)
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction

Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost Blindfold")
EndFunction
