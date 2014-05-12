scriptName zadEventStamina extends zadBaseLinkedEvent

Bool Function Filter(actor akActor, int chanceMod=0)
	 return (HasKeywords(akActor) && Parent.Filter(akActor, chanceMod))
EndFunction

bool Function HasKeywords(actor akActor)
	return akActor.HasMagicEffectWithKeyword(libs.zad_EffectStaminaDraining)
EndFunction

Function Execute(actor akActor)
	libs.StaminaDrainEffect(akActor)
EndFunction
