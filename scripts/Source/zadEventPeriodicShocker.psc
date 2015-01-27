scriptName zadEventPeriodicShocker extends zadBaseLinkedEvent

bool Function HasKeywords(actor akActor)
	return libs.ActorHasKeyword(akActor, libs.zad_EffectShocking)
EndFunction

Function Execute(actor akActor)
	if akActor == libs.playerRef
		bool hasPlugs = false
		bool hasPiercings = false
		armor vPlug = StorageUtil.GetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(libs.zad_DeviousPlugVaginal) + "_Rendered") as Armor
		armor vPiercing = StorageUtil.GetFormValue(akActor, "zad_Equipped" + libs.LookupDeviceType(libs.zad_DeviousPiercingsVaginal) + "_Rendered") as Armor
		if vPiercing && (vPiercing.HasKeyword(libs.zad_EffectShocking))
			libs.NotifyPlayer("The piercings within you let out a painful jolt!")
		ElseIf vPlug && (vPlug.HasKeyword(libs.zad_EffectShocking))
			libs.NotifyPlayer("The plug within you let out a painful jolt!")
		Else
			libs.NotifyPlayer("A painful jolt courses through you!")
		EndIf
	Else
		libs.NotifyNPC(akActor.GetLeveledActorBase().GetName() + " squirms uncomfortably as a painful jolt courses through her!")
	EndIf
	libs.ShockEffect.RemoteCast(akActor, akActor, akActor)
	libs.Aroused.UpdateActorExposure(akActor, (-1 * Utility.RandomInt(10,20)))
EndFunction
