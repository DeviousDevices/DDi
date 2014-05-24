scriptname zadBaseLinkedEvent extends zadBaseEvent


Function OnLoad()
	RegisterForModEvent("DeviousEventLinked","OnLinkedEffect")
	Parent.OnLoad()
EndFunction

Function Eval(actor akActor)
	libs.Log("BaseLinkedEvent::Eval("+Name+")")
	if (akActor == libs.PlayerRef && akActor.HasMagicEffectWithKeyword(libs.zad_EffectsLinked))
		akActor.SendModEvent("DeviousEventLinked", Name)
	EndIf
	if HasKeywords(akActor)
		Execute(akActor)
	EndIf
EndFunction

Event OnLinkedEffect(string eventName, string strArg, float numArg, Form sender)
	if strArg != self.Name && HasKeywords(libs.PlayerRef)
		libs.Log("OnLinkedEffect("+Name+"), called by "+strArg)
		Execute(libs.PlayerRef)
	EndIf
EndEvent
