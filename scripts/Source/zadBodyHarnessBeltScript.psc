Scriptname zadBodyHarnessBeltScript extends zadBeltScript

Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		if akActor == libs.PlayerRef
			libs.NotifyActor("You step in to the harness, securing it tightly against your body.", akActor, true)
		Else
			libs.NotifyActor(GetMessageName(akActor) +" steps in to the harness, securing it tightly against her body.", akActor, true)
			
		EndIf
	EndIf
	Parent.OnEquippedPre(akActor, silent=true)
EndFunction

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor == none
		akActor == libs.PlayerRef
	EndIf
	if ! akActor.IsEquipped(deviceRendered)
		if akActor!=libs.PlayerRef && ShouldEquipSilently(akActor)
			libs.Log("Avoiding FTM duplication bug (Harness + Collar).")
			return 0
		EndIf
		if akActor.WornHasKeyword(libs.zad_DeviousCollar)
			MultipleItemFailMessage("Collar")
			return 2
		Endif
		if akActor.WornHasKeyword(libs.zad_DeviousCorset)
			MultipleItemFailMessage("Corset")
			return 2
		Endif
	Endif
	return 0
EndFunction


Function OnEquippedPost(actor akActor)
	libs.Log("RestraintScript OnEquippedPost BodyHarness")
	Parent.OnEquippedPost(akActor)
EndFunction

Function DeviceMenuExt(Int msgChoice)

EndFunction
