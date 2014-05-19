scriptName zadEventHealth extends zadBaseLinkedEvent

bool Function HasKeywords(actor akActor)
	return libs.ActorHasKeyword(akActor, libs.zad_EffectHealthDraining)
EndFunction

Function Execute(actor akActor)
	libs.HealthDrainEffect(akActor)
EndFunction
