scriptName zadEventBlindfoldTrip extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBlindfold) )
EndFunction

Function Execute(actor akActor)
	if UI.IsMenuOpen("Dialogue Menu")
		libs.Log("Dialogue is open, not playing blind-trip.")
	elseif libs.IsAnimating(akActor)
		libs.Log("Not playing blind-trip animation: Actor is already animating.")
	else
		bool IsKeyPressed = Input.IsKeyPressed(Input.GetMappedKey("Forward")) || Input.IsKeyPressed(Input.GetMappedKey("Back")) || Input.IsKeyPressed(Input.GetMappedKey("Strafe Left")) || Input.IsKeyPressed(Input.GetMappedKey("Strafe Right"))
		if !IsKeyPressed
			libs.Log("Not playing blind-trip animation: Player is not moving.")
			return
		EndIf
		libs.NotifyPlayer("You abruptly trip over something unseen, and curse your lack of vision.")
		Game.ForceThirdPerson()
		libs.Trip(akActor)
	EndIf
EndFunction

