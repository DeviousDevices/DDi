Scriptname zadPiercingVaginalScript extends zadRestraintScript  

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if !akActor.HasPerk(libs.PiercedClit)
		libs.NotifyPlayer(akActor.GetLeveledActorBase().GetName() + " lacks vaginal piercings, and cannot wear these.", true)
			return 2
	Endif
	if !akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Piercings + vPlug).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousBra)
			MultipleItemFailMessage("Piercings/Vaginal Plugs")
			return 2
		Endif
	Endif
	return 0
EndFunction


Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		libs.NotifyActor("You carefully slip the piercing into "+GetMessageName(akActor)+" labia. A quiet 'Click' is heard as the band clicks together, now seemingly seamless. ", akActor, true)
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction


Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost PiercingVaginal")
	
EndFunction
