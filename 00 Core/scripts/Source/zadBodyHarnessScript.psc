Scriptname zadBodyHarnessScript extends zadEquipScript

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		if akActor == libs.PlayerRef
			libs.NotifyActor("You step in to the harness, securing it tightly against your body.", akActor, true)
		Else
			libs.NotifyActor(GetMessageName(akActor) +" steps in to the harness, securing it tightly against her body.", akActor, true)
			
		EndIf
	EndIf
EndFunction

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if ! akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Harness).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousCorset)
			MultipleItemFailMessage("Corset")
			return 2
		Endif
		; make sure collar harnesses don't do on if the target is already wearing one.
		if akActor.WornHasKeyword(libs.zad_DeviousCollar) && deviceRendered.HasKeyword(libs.zad_DeviousCollar)
			MultipleItemFailMessage("Collar")
			return 2
		Endif
		; make sure belt harnesses don't do on if the target is already wearing one.
		if akActor.WornHasKeyword(libs.zad_DeviousBelt) && deviceRendered.HasKeyword(libs.zad_DeviousBelt)
			MultipleItemFailMessage("Belt")
			return 2
		Endif
	Endif
	return 0
EndFunction


Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost BodyHarness")
EndFunction
