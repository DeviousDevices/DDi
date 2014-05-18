ScriptName zadArmbinderEffect extends ActiveMagicEffect

; Libraries
zadArmbinderQuestScript Property abq Auto
zadLibs Property Libs Auto

; Idles
Idle[] Property idles Auto

; Cache keystroke ID's
Int Property TweenMenuKey Auto
Int Property SprintKey Auto
Int Property JumpKey Auto
Int Property ForwardKey Auto
Int Property BackKey Auto
Int Property StrafeLeftKey Auto
Int Property StrafeRightKey Auto
Int Property SneakKey Auto

; Internal Variables
Keyword Property zad_DeviousDevice Auto
Idle Property CurrentStandIdle Auto
Actor Property target Auto
bool Property Terminate Auto

Function DoRegister()
	if !Terminate
		RegisterForSingleUpdate(0.75)
	EndIf
EndFunction


Event OnUpdate()
	if target == libs.PlayerRef && ((Game.IsMenuControlsEnabled() && libs.config.HardcoreEffects) || Game.IsFightingControlsEnabled() )
		if !libs.IsAnimating(target)
			libs.UpdateControls()
		EndIf
	EndIf
	; if target.GetAnimationVariableFloat("Speed") == 0 && !target.IsSneaking()
	;  	PlayBoundIdle(CurrentStandIdle)
	; ElseIf target == libs.PlayerRef || target.GetAnimationVariableFloat("Speed") != 0
	; 	PlayBoundIdle(idles[0])
	; EndIf
	PlayBoundIdle(CurrentStandIdle)
	DoRegister()
EndEvent


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget != libs.PlayerRef
		return
	EndIf
	libs.Log("OnEffectStart(): Armbinder")
	target = akTarget
	Terminate = False
	CurrentStandIdle = idles[0] ; Readd this later, once I use other poses. No point for now.
	if target == libs.PlayerRef
		UnregisterForAllKeys()
		; Register keypresses for more responsive idles
		TweenMenuKey = Input.GetMappedKey("Tween Menu")
		SprintKey = Input.GetMappedKey("Sprint")
		JumpKey = Input.GetMappedKey("Jump")
		ForwardKey = Input.GetMappedKey("Forward")
		BackKey = Input.GetMappedKey("Back")
		StrafeLeftKey = Input.GetMappedKey("Strafe Left")
		StrafeRightKey = Input.GetMappedKey("Strafe Right")
		SneakKey = Input.GetMappedKey("Sneak")
		RegisterForKey(SprintKey)
		RegisterForKey(JumpKey)
		RegisterForKey(TweenMenuKey)
		RegisterForKey(ForwardKey)
		RegisterForKey(BackKey)
		RegisterForKey(StrafeLeftKey)
		RegisterForKey(StrafeRightKey)
		RegisterForKey(SneakKey)
	EndIf
	PlayBoundIdle(idles[0])
	DoRegister()
	if target == libs.PlayerRef
		libs.UpdateControls()
	Endif
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Armbinder")
	Terminate = True
	Debug.SendAnimationEvent(target, "IdleForceDefaultState")
	if target == libs.PlayerRef
		libs.UpdateControls()
		; UnregisterForAllKeys() ; Not necessary: Automatically unregistered on effect expiration
	EndIf
EndEvent


Event OnKeyDown(Int KeyCode) 
	PlayBoundIdle(idles[0]); Work around pose issue from skyrim limitations by reapplying on sprint.
	if !Game.IsMenuControlsEnabled() && KeyCode == TweenMenuKey && !UI.IsMenuOpen("Dialogue Menu") && !UI.IsMenuOpen("BarterMenu") && !UI.IsMenuOpen("ContainerMenu") && !UI.IsMenuOpen("Sleep/Wait Menu")
		abq.ShowArmbinderMenu()
	EndIf
EndEvent


Event OnKeyUp(int KeyCode, float HoldTime) ; Reduce time player slides around during transition from other animation's  by quickly beginning offset animation
	if KeyCode == StrafeLeftKey || KeyCode == StrafeRightKey || KeyCode == ForwardKey || KeyCode == BackKey
		if KeyCode == SneakKey || target.IsSneaking()
			PlayBoundIdle(idles[0])
			return
		EndIf
		if Input.IsKeyPressed(StrafeLeftKey) || Input.IsKeyPressed(StrafeRightKey) || Input.IsKeyPressed(ForwardKey) || Input.IsKeyPressed(BackKey)
			return
		EndIf
		PlayBoundIdle(CurrentStandIdle)
	EndIf
EndEvent

Function PlayBoundIdle(idle theIdle)
	if !Terminate && libs.IsValidActor(target) && !libs.IsAnimating(target) && !target.IsInFaction(libs.SexLabAnimatingFaction) 
		libs.ApplyArmbinderAnim(target, theIdle)
	EndIf
EndFunction

Event OnCellLoad()
	PlayBoundIdle(CurrentStandIdle)
	DoRegister()
EndEvent

Event OnCellAttach()
	OnCellLoad()
EndEvent

Event OnLoad()
	PlayBoundIdle(CurrentStandIdle)
	DoRegister()
EndEvent

Event OnUnload()
	; UnregisterForUpdate()
EndEvent
