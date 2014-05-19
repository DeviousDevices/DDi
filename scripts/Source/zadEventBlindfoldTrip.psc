scriptName zadEventBlindfoldTrip extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBlindfold) )
EndFunction

Function Execute(actor akActor)
	if UI.IsMenuOpen("Dialogue Menu")
		libs.Log("Dialogue is open, not playing blind-trip.")
		return
	EndIf
	if libs.IsAnimating(akActor)
		libs.Log("Not playing blind-trip animation: Actor is already animating.")
		return
	EndIf
	bool IsKeyPressed = Input.IsKeyPressed(Input.GetMappedKey("Forward")) || Input.IsKeyPressed(Input.GetMappedKey("Back")) || Input.IsKeyPressed(Input.GetMappedKey("Strafe Left")) || Input.IsKeyPressed(Input.GetMappedKey("Strafe Right"))
	if !IsKeyPressed
		libs.Log("Not playing blind-trip animation: Player is not moving.")
		return
	EndIf
	libs.NotifyPlayer("You abruptly trip over something unseen, and curse your lack of vision.")
	Game.ForceThirdPerson()
	Debug.SendAnimationEvent(akActor, "BleedOutStart")
	Utility.Wait(2.0)
	Debug.SendAnimationEvent(akActor, "BleedOutStop")
EndFunction

