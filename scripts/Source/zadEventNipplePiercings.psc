scriptName zadEventNipplePiercings extends zadBaseEvent

bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousPiercingsNipple) )
EndFunction

Function Execute(actor akActor)
	string msg = ""
	int num = Utility.RandomInt(0,5)
	if num == 0
		msg = "The piercings rub against your clothes, stimulating you."
	ElseIf num == 1
		msg = "The back-and-forth movement of the piercings chafe your nipples."
	ElseIf num == 2
		msg = "The weight of the piercings make your nipples sore."
	ElseIf num == 4
		msg = "The soul gem piercings vibrate softly, keeping your nipples erect."
	ElseIf num == 5
		msg = "The weight of the piercings keeps you acutely aware of their presence."
	EndIf
	libs.NotifyPlayer(msg)
	;if akActor.WornHasKeyword(zad_DeviousPlug)
	; TODO: Add some sort of animation here. Perhaps a wetness decal.	
EndFunction






