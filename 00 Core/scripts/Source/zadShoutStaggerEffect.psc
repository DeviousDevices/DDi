ScriptName zadShoutStaggerEffect extends ActiveMagicEffect

zadlibs Property libs  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == libs.PlayerRef
		RegisterForActorAction(4)
		libs.Log("OnEffectStart(ShoutStaggerEffect)")
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; UnregisterForActorAction(4) ; This isn't necessary - This is automatically done.
	libs.Log("OnEffectFinish(ShoutStaggerEffect)")
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)	
    if akActor != libs.PlayerRef
        return
    endif    
	if slot == 2
		;libs.Notify("Player just got staggered!")
		libs.PlayThirdPersonAnimation(akActor, libs.AnimSwitchKeyword(akActor, "OutOfBreath"), 3, permitRestrictive=True)		
	EndIf
EndEvent
