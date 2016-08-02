scriptName zadEventMana extends zadBaseLinkedEvent

bool Function HasKeywords(actor akActor)
	return libs.ActorHasKeyword(akActor, libs.zad_EffectManaDraining)
EndFunction

Function Execute(actor akActor)
	libs.ManaDrainEffect(akActor)
EndFunction
