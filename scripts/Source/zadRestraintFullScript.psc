Scriptname zadRestraintFullScript extends zadRestraintScript  

Keyword Property zad_DeviousCollar Auto
Keyword Property zad_DeviousCuffsArms Auto
Keyword Property zad_DeviousCuffsLegs Auto

Function OnEquippedPre(actor akActor, bool silent=false)
	if libs.PlayerRef == akActor
		if !silent
			libs.NotifyActor("You slip in to the complete set of restraints, sequentially closing them around your extremeties. As each cuff closes with a soft 'Click', you feel your freedom incrementally slipping away.", akActor, true)
		EndIf
	else
		if !silent
			libs.NotifyActor("You secure each of the cuffs around "+akActor.GetLeveledActorBase().GetName()+"'s extremeties.", akActor, true)
		EndIf
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction


int Function OnEquippedFilter(actor akActor, bool silent=false)
	return EquipDeviceFilter(akActor, silent)
EndFunction

int Function EquipDeviceFilter(actor akActor = none, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if ! akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Full Set).")
			return 0
		EndIf
		if akActor.WornHasKeyword(zad_DeviousCollar)
			MultipleItemFailMessage("Collar")
			return 2
		elseif akActor.WornHasKeyword(zad_DeviousCuffsArms)
			MultipleItemFailMessage("Arm Cuffs")
			return 2
		elseif akActor.WornHasKeyword(zad_DeviousCuffsLegs)
			MultipleItemFailMessage("Leg Cuffs")
			return 2
		Endif
	Endif
	return 0
EndFunction

Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost Full")
EndFunction
