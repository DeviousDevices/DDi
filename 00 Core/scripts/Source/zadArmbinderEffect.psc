ScriptName zadArmbinderEffect extends ActiveMagicEffect

;DEPRECIATED
;All of this is redundant and scheduled for removal and replacement in a future (post 4.0) update
;AA functionality is now handled centrally by zadBoundCombatScript, mechanical triggers and maintenance are handled by zadLibs, zadEquipScript and zadBQ00
;Third party modders should avoid duplicating or incorporating the contents of this script into their own scripts

; Libraries
zadArmbinderQuestScript Property abq Auto
zadLibs Property Libs Auto

; Cache keystroke ID's
Int Property TweenMenuKey Auto

; Internal Variables
Keyword Property zad_DeviousDevice Auto
Actor Property target Auto
bool Property Terminate Auto

Function DoRegister()
	if !Terminate && target
		RegisterForSingleUpdate(8.0)
	EndIf
EndFunction

Function DoUnregister()
	if !Terminate && target
		UnregisterForUpdate()
	EndIf
EndFunction

Function DoReLoad()
	if target && ! Terminate
		PlayBoundIdle()
		DoRegister()
	EndIf
EndFunction

Function DoUnLoad()
	if target && ! Terminate
		DoUnregister()
	EndIf
EndFunction


Event OnUpdate()
	if target == libs.PlayerRef && (Game.IsMenuControlsEnabled() || Game.IsFightingControlsEnabled() )
		if !libs.IsAnimating(target)
			libs.UpdateControls()
		EndIf
	EndIf
	DoRegister()
EndEvent


Event OnEffectStart(Actor akTarget, Actor akCaster)
;	if akTarget != libs.PlayerRef
;		libs.BoundCombat.Apply_ABC(akTarget)
;		libs.BoundCombat.Apply_NPC_ABC(akTarget)
;		return
;	EndIf
	libs.Log("OnEffectStart(): Heavy Bondage")
;	target = akTarget
	Terminate = False
;	if target == libs.PlayerRef
;		UnregisterForAllKeys()
;		TweenMenuKey = Input.GetMappedKey("Tween Menu")
;		RegisterForKey(TweenMenuKey)
;	EndIf
;	PlayBoundIdle()
;	DoRegister()
;	if target == libs.PlayerRef
;		libs.UpdateControls()
;	Endif
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Heavy Bondage")
	Terminate = True
;	Debug.SendAnimationEvent(target, "IdleForceDefaultState")
;	if target == libs.PlayerRef
;		libs.UpdateControls()
		; UnregisterForAllKeys() ; Not necessary: Automatically unregistered on effect expiration
;	else
;		libs.BoundCombat.Remove_NPC_ABC(akTarget)
;	EndIf
;	libs.BoundCombat.Remove_ABC(akTarget)
EndEvent


Event OnKeyDown(Int KeyCode) 
	if !Game.IsMenuControlsEnabled() && KeyCode == TweenMenuKey && !UI.IsMenuOpen("Dialogue Menu") && !UI.IsMenuOpen("BarterMenu") && !UI.IsMenuOpen("ContainerMenu") && !UI.IsMenuOpen("Sleep/Wait Menu")
		libs.playerRef.SheatheWeapon()
		Utility.Wait(0.1)
		abq.ShowDeviceMenu()
	EndIf
EndEvent

Function PlayBoundIdle()
	libs.BoundCombat.Apply_ABC(target)
	if !Terminate && libs.IsValidActor(target) && !libs.IsAnimating(target) && !target.IsInFaction(libs.SexLabAnimatingFaction) 
		libs.ApplyBoundAnim(target)
	EndIf
EndFunction

Event OnCellLoad()
	DoReLoad()
EndEvent

Event OnCellAttach()
	DoReLoad()
EndEvent

Event OnLoad()
	DoReLoad()
EndEvent

Event OnCellDetach()
	DoUnLoad()
EndEvent
