Scriptname zaddReliableForceGreet Extends Quest

zadLibs Property libs Auto
Bool Property DialogueDone Auto

; Internal
Scene Property LastScene Auto

; Wrapper to work-around janky unreliable forcegreet scenes.
bool Function ForceGreet(Scene theScene)
	if LastScene && LastScene.IsPlaying()
		libs.Log("Last scene is still playing. Attempting to end it.")
		DialogueDone = false
		LastScene.Stop()
		int timeout = 0
		while LastScene.IsPlaying() && timeout <= 100
			timeout += 1
			Utility.Wait(0.1)
		EndWhile
	EndIf
	LastScene = TheScene
	int timeout = 0
	while UI.IsMenuOpen("Dialogue Menu") && timeout <= 100
		Utility.Wait(0.1)
	EndWhile
	if timeout >= 100
		libs.Warn("Dialogue timed out.")
	EndIf
	DialogueDone = true
	timeout = 0
	libs.Log("Beginning forcegreet ["+theScene+"]")
	while DialogueDone && timeout <= 10
		if !libs.PlaySceneAndWait(theScene, false, 60, increment=5)
			; DialogueDone = false
		EndIf
		Utility.Wait(1)
		timeout += 1
	EndWhile
	; libs.Log("Scene done.")
	if timeout >= 10
		libs.Warn("DialogueDone was never reset, timed out!")
		return false
	EndIf
	libs.Log("Forcegreet ["+theScene+"] completed.")
	return true	
EndFunction
