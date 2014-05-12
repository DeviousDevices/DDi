ScriptName zadBlindfoldEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto
ImagespaceModifier Property zad_BlindfoldModifier Auto
ImagespaceModifier Property zad_BlindfoldLeeches Auto

actor Property Target Auto
Bool Property Terminate Auto
Bool Property blinded Auto

float lastBlindfoldStrength = 0.0
int lastBlindfoldMode = -1


Function ApplyBlindfold()
	if blinded && libs.config.BlindfoldMode == lastBlindfoldMode && libs.config.BlindfoldStrength == lastBlindfoldStrength
		return
	EndIf
	lastBlindfoldMode = libs.config.BlindfoldMode
	if libs.config.BlindfoldStrength != lastBlindfoldStrength
		zad_BlindfoldLeeches.Remove()
		zad_BlindfoldModifier.Remove()
	EndIf
	lastBlindfoldStrength = libs.config.BlindfoldStrength
	if libs.config.BlindfoldMode == 2  || libs.config.BlindfoldMode == 1;Leeches Mode
		zad_BlindfoldModifier.Remove()
		zad_BlindfoldLeeches.Apply(libs.config.blindfoldStrength)
	ElseIf libs.config.BlindfoldMode == 0
		zad_BlindfoldLeeches.Remove()
		zad_BlindfoldModifier.Apply(libs.config.BlindfoldStrength)
	EndIf
	blinded = true
EndFunction


Event OnPlayerCameraState(int oldState, int newState)
	if libs.config.blindfoldMode == 2 ; Leeches Mode
		ApplyBlindfold()
		libs.UpdateControls()
	Else
		if newState == 3 || newState == 8 || newState == 9 ; Free, Third person 1, Third person 2
			Input.TapKey(Input.GetMappedKey("Forward"))
			blinded = false
			zad_BlindfoldModifier.Remove()
			zad_BlindfoldLeeches.Remove()
		Else
			ApplyBlindfold()			
		EndIf
		libs.UpdateControls()
	EndIf
EndEvent


Event OnUpdate()
	if Target != Libs.PlayerRef
		return
	EndIf
	if Terminate
		libs.ToggleCompass(true)
	Else
		libs.ToggleCompass(false)
	EndIf
	DoRegister()
EndEvent

Function DoRegister()
	if Terminate
		return
	EndIf
	RegisterForSingleUpdate(5.0)
EndFunction


Event OnEffectStart(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectStart(blindfold)")
	target = akTarget
	if akTarget != libs.PlayerRef
		return
	EndIf
	if libs.config.BlindfoldMode == 0 || libs.config.BlindfoldMode == 1 ; Both DD modes.
		if !libs.config.BlindfoldTooltip
			libs.config.BlindfoldTooltip = True
			libs.NotifyPlayer("The Devious Devices Blindfold effect is now active. While in third person, you will be able to see, but unable to move. Switch back to first person at any time to act normally. If you dislike this mode, there are two other modes available in the MCM configuration.", 1)
		EndIf
	EndIf
	blinded = false
	Terminate = False
	lastBlindfoldStrength = libs.config.BlindfoldStrength
	libs.ToggleCompass(false)
	DoRegister()
	OnPlayerCameraState(0, Game.GetCameraState())
	RegisterForCameraState()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(blindfold)")
	Terminate = True
	if akTarget == libs.PlayerRef
		zad_BlindfoldModifier.Remove()
		zad_BlindfoldLeeches.Remove()
		libs.ToggleCompass(true)
		libs.UpdateControls()
	EndIf
EndEvent
