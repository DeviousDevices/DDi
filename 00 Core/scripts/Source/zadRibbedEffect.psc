Scriptname zadRibbedEffect Extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto
SexLabFramework Property Sexlab Auto

; Control Cache
Int[] Property MovementKeys Auto
Int Property JumpKey Auto
Int Property SneakKey Auto
Int Property SprintKey Auto

; Internal Variables
Int Property NumKeysMonitored Auto
actor Property Target Auto

; Cache actor states for comparison with current state.
Bool Property ActorInCombat Auto ; Detect if player is changing combat state, since OnCombatStateChanged doesn't work for PC's.
Bool Property ActorIsMounted Auto ; Detect if player is mounting/dismounting, since OnSit doesn't fire for mounts.
Bool Property ActorIsSprinting Auto

; Function DoRegister()
; 	RegisterForSingleUpdate(1.0)
; EndFunction

; Event OnUpdate()
; 	ApplyGagEffect()
; 	DoRegister()
; EndEvent


int Function RegisterKey(string keyName)
	NumKeysMonitored += 1
	int ret = Input.GetMappedKey(keyName)
	RegisterForKey(ret)
	return ret
EndFunction


Function ClearKeys()
	NumKeysMonitored = 0
	UnregisterForAllKeys()
EndFunction


Function ApplyEffect()
	libs.Log("Building control cache, registering for actor actions.")
	UpdateCachedStates()
	;;;;;;;;;; Build Control Cache 
	; Movement Keys
	MovementKeys = new int[4]
	MovementKeys[0] = RegisterKey("Forward")
	MovementKeys[1] = RegisterKey("Back")
	MovementKeys[2] = RegisterKey("Strafe Left")
	MovementKeys[3] = RegisterKey("Strafe Right")
	; Movement Modifiers
	SneakKey = RegisterKey("Sneak")
	SprintKey = RegisterKey("Sprint")
	; Special Actions
	JumpKey = RegisterKey("Jump")
	RegisterForActorAction(0) ; Melee swings
	RegisterForActorAction(6) ; Bow Release
	RegisterForActorAction(7) ; Bow Draw Begin
EndFunction


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == libs.PlayerRef
		libs.Log("OnEffectStart(ribbed)")
		target = akTarget
		ApplyEffect()
	EndIf
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(ribbed)")
EndEvent


Event OnCellAttach()
	ApplyEffect()
EndEvent


Function UpdateCachedStates()
	ActorInCombat = (Target.GetCombatState() == 0)
	ActorIsMounted = Target.IsOnMount()
EndFunction


bool Function IsConflictingMenuOpen()
	return (UI.IsMenuOpen("Sleep/Wait Menu") || UI.IsMenuOpen("Dialogue Menu") || UI.IsMenuOpen("BarterMenu") || UI.IsMenuOpen("ContainerMenu") )
EndFunction


bool Function ShouldProcessInput()
	return !(libs.IsAnimating(Target) || IsConflictingMenuOpen())
EndFunction

; Target.GetAnimationVariableFloat("Speed")
; 


Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	libs.Log("OnActorAction("+actionType+","+akActor+","+source+","+slot+")")
	if akActor == Target
		if actionType == 0 ; Melee Swing
			OnMeleeSwing()
		ElseIf actionType == 6 ; Bow Release
			OnBowRelease()
		EndIf
	EndIf
EndEvent


Function ProcessInput(int KeyCode, bool KeyDown, float holdTime=-1.0)
	if ShouldProcessInput()
		libs.Log("ProcessInput("+keyCode+","+KeyDown+","+holdTime+")")
		int i = MovementKeys.Length
		while i > 0
			i -= 1
			if KeyCode == MovementKeys[i]			
			EndIf
		EndWhile
		if KeyCode  ==  JumpKey && keyDown  && Target.GetAnimationVariableBool("bInJumpState")
			OnJump()
		EndIf
		if KeyCode  ==  SneakKey && keyDown
			OnSneak()
		EndIf
		if KeyCode  ==  SprintKey
			ActorIsSprinting = keyDown
		EndIf
		UpdateCachedStates()
	EndIf
EndFunction


Event OnKeyDown(Int KeyCode)
	ProcessInput(keyCode, true)
EndEvent


Event OnKeyUp(int KeyCode, float HoldTime)
	ProcessInput(keyCode, false, HoldTime)
EndEvent


Function StartEffect(int strength, int duration)
	libs.VibrateEffect(libs.PlayerRef, strength, duration)
EndFunction


Function StopEffect()
	libs.StopVibrating(libs.PlayerRef)
EndFunction


;;;;;;;;;;;;;
; Events
;;;;;;;;;;;;;

Function OnJump()
	libs.Log("OnJump()")
	StartEffect(3,1)
	int timeout = 0
	while Target.GetAnimationVariableBool("bInJumpState") && timeout <= 15
		Utility.Wait(0.15)
		timeout += 1
	EndWhile
	StopEffect()
EndFunction


Function OnSneak()
	libs.Log("OnSneak()")
	StartEffect(2,1)
EndFunction


Function OnMeleeSwing()
	libs.Log("OnMeleeSwing(): "+Target.GetAnimationVariableInt("iRegularAttack"))
	; if Target.GetAnimationVariableInt("attackPowerStartTime")
	; 	libs.Log("OnMeleeSwing(): Power Attack.")
	; 	; StartEffect(2, 2)
	; EndIf
EndFunction


Function OnBowRelease()
	libs.Log("OnBowRelease()")
	; StartEffect(3, 2)
EndFunction
