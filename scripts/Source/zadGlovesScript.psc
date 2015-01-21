Scriptname zadGlovesScript extends zadRestraintScript  

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You pull the gloves up "+GetMessageName(akActor)+" arms, and lock the buckles at the top of the gloves and at "+GetMessageName(akActor)+" wrists.", akActor, true)
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction

Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost Gloves")
	
EndFunction
