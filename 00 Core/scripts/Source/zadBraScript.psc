Scriptname zadBraScript extends zadEquipScript  

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if !akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Bra).")
			return 0
		EndIf
		; if akActor.WornHasKeyword(libs.zad_DeviousPiercingsNipple)
		; 	MultipleItemFailMessage("Piercings/Bra")
		; 	return 2
		; Endif
	Endif
	return 0
EndFunction


Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You slip the bra around "+GetMessageName(akActor)+" chest, and it locks in place with a soft click.", akActor, true)
	EndIf
EndFunction

