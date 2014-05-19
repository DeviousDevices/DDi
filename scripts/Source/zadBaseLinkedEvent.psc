scriptname zadBaseLinkedEvent extends zadBaseEvent


Function OnLoad()
	RegisterForModEvent("DeviousEventLinked","OnLinkedEffect")
	Parent.OnLoad()
EndFunction

Function Eval(actor akActor)
	if (akActor == libs.PlayerRef && akActor.HasMagicEffectWithKeyword(libs.zad_EffectsLinked))
		SendModEvent("DeviousEventLinked", Name)
	EndIf
	Parent.Eval(akActor)
EndFunction

Event OnLinkedEffect(string eventName, string strArg, float numArg, Form sender)
	libs.Log("OnLinkedEffect("+Name+")")
	if HasKeywords(libs.PlayerRef)
		Execute(libs.PlayerRef)
	EndIf
EndEvent
