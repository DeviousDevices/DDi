ScriptName zadYokeEffect extends ActiveMagicEffect

; Libraries
zadYokeQuestScript Property ybq Auto
zadLibs Property Libs Auto

; Cache keystroke ID's
Int Property TweenMenuKey Auto

; Internal Variables
Keyword Property zad_DeviousDevice Auto
Actor Property target Auto
bool Property Terminate Auto


Function DoReLoad()
	if target && !Terminate
		PlayBoundIdle()
		DoRegister()
	EndIf
EndFunction

Function DoRegister()
	if !Terminate && target
		RegisterForSingleUpdate(8.0)
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
	target = akTarget
	if target == libs.PlayerRef
		libs.Log("OnEffectStart(): Yoke")
		Terminate = False
		UnregisterForAllKeys()
		; Register keypresses for more responsive idles
		TweenMenuKey = Input.GetMappedKey("Tween Menu")
		RegisterForKey(TweenMenuKey)
		PlayBoundIdle()
		DoRegister()
		libs.UpdateControls()
	Else
		libs.BoundCombat.Apply_ABC(akTarget)	
		libs.BoundCombat.Apply_NPC_ABC(akTarget)
		return
	EndIf
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Terminate = True
	if target == libs.PlayerRef
		libs.Log("OnEffectFinish(): Yoke")
		Debug.SendAnimationEvent(target, "IdleForceDefaultState")
		libs.UpdateControls()
	else
		libs.BoundCombat.Remove_NPC_ABC(akTarget)
	EndIf
	libs.BoundCombat.Remove_ABC(akTarget)
EndEvent


Event OnKeyDown(Int KeyCode) 
	if !Game.IsMenuControlsEnabled() && KeyCode == TweenMenuKey && !UI.IsMenuOpen("Dialogue Menu") && !UI.IsMenuOpen("BarterMenu") && !UI.IsMenuOpen("ContainerMenu") && !UI.IsMenuOpen("Sleep/Wait Menu")
		libs.playerRef.SheatheWeapon()
		Utility.Wait(0.1)
		ybq.ShowDeviceMenu()
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

