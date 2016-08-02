scriptName zadEventRestrictiveCollar extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 ; no keyword specifically for restrictive collars. Need one for further effects.
	 return (akActor.WornHasKeyword(libs.zad_DeviousCollar) && akActor.IsEquipped(libs.collarRestrictive) )
EndFunction

Function Execute(actor akActor)
	if Utility.RandomInt(1,2) == 1
		libs.NotifyPlayer("Your neck feels sore from the strict posture imposed upon you.")
	Else
		libs.NotifyPlayer("You are reminded of the sturdy bar under your chin")
		libs.NotifyPlayer("as you try to look down to see where you are going.")
	EndIf
EndFunction
