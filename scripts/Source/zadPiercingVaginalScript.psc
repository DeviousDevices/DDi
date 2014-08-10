Scriptname zadPiercingVaginalScript extends zadRestraintScript  

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if !akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Vaginal Piercings).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousPiercingsVaginal)
			MultipleItemFailMessage("Vaginal Piercings")
			return 2
		Endif
	Endif
	return 0
EndFunction


Function OnEquippedPre(actor akActor, bool silent=false)
	if !akActor.HasPerk(libs.PiercedClit)
		akActor.AddSpell(libs.PiercedClitSpell, true)
	Endif
	if !silent
		libs.NotifyActor("You carefully slip the piercing into "+GetMessageName(akActor)+" clitoris. A quiet 'Click' is heard as the band clicks together, now seemingly seamless. ", akActor, true)
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction


Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost PiercingVaginal")
	
EndFunction
