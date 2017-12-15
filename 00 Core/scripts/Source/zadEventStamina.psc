scriptName zadEventStamina extends zadBaseLinkedEvent

bool Function HasKeywords(actor akActor)
	return akActor.HasMagicEffectWithKeyword(libs.zad_EffectStaminaDraining)
EndFunction

Function Execute(actor akActor)
	libs.StaminaDrainEffect(akActor)
EndFunction
