ScriptName zadShoutStaggerEffect extends ActiveMagicEffect

zadlibs Property libs  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget != libs.PlayerRef
		return
	EndIf
	RegisterForActorAction(4)
	libs.Log("OnEffectStart(ShoutStaggerEffect)")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; UnregisterForActorAction(4) ; This isn't necessary - This is automatically done.
	libs.Log("OnEffectFinish(ShoutStaggerEffect)")
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	if slot == 2
		;libs.Notify("Player just got staggered!")
		libs.PlayThirdPersonAnimation(akActor, libs.AnimSwitchKeyword(akActor, "OutOfBreath"), 3, permitRestrictive=True)		
	EndIf
EndEvent
