scriptName zadEventBlindfold extends zadBaseEvent


Message Property zad_blindfoldEventMsg Auto
MiscObject Property Gold Auto
MiscObject Property Lockpick Auto
MiscObject Property ValuableGemstone Auto
Spell Property PoisonEventSpell Auto


bool Function HasKeywords(actor akActor)
	 return (akActor.WornHasKeyword(libs.zad_DeviousBlindfold) )
EndFunction

Function Execute(actor akActor)
	int encounter =  Utility.RandomInt(0,3)
	; Beartrap
	int choice = zad_blindfoldEventMsg.Show()
	if encounter == 0 ; Bear-trap, TODO.
		libs.NotifyPlayer("You grope around blindly, but find nothing of interest.", true)
	Elseif choice == 0 ; Investigate
		if libs.IsBound(libs.PlayerRef)
			libs.NotifyPlayer("Unsure what to make of it you slowly lower yourself to the ground and nervously reach around for whatever lies in front of you...",true)
		Else
			libs.NotifyPlayer("Unable to use your arms you nervously feel around with your toes for whatever lies in front of you...", true)
		EndIf
		if encounter == 1; Valuables
			if !libs.IsBound(libs.PlayerRef)
				string itemStr=""
				int item = Utility.RandomInt(0,2)
				if item == 0
					itemStr="Lockpick"
					libs.playerRef.Additem(Lockpick)
				ElseIf item == 1
					itemStr="Valuable Gemstone"
					libs.playerRef.Additem(ValuableGemstone)
				ElseIf item == 2
					itemStr = "Pouch filled with coins"
					libs.playerRef.AddItem(Gold, Utility.RandomInt(50,250))
				EndIf
				libs.NotifyPlayer("Before long you smile at your good fortune as you wrap your fingers around what seems to be a "+itemStr+".",true)
			Else
				Libs.NotifyPlayer("You feel something smooth and cool to the touch, definitely man-made. Unfortunately your bonds prevent you from picking anything up.",true)
			EndIf
		ElseIf encounter == 1
			Libs.NotifyPlayer("Suddenly you feel sharp sting and pain begins to flow through your body. You try to back away but your muscles refuse to obey and you collapse on the ground.",true)
			libs.SetAnimating(libs.PlayerRef, True)
			PoisonEventSpell.RemoteCast(libs.PlayerRef, libs.PlayerRef, libs.PlayerRef)
			libs.DisableControls()
			libs.AnimSwitchKeyword(libs.PlayerRef, "OutOfBreath")
			Utility.Wait(10)
			Debug.SendAnimationEvent(libs.PlayerRef, "IdleForceDefaultState")
			libs.UpdateControls()
			libs.SetAnimating(libs.PlayerRef, False)
		ElseIf encounter == 2 ; Insect
			libs.NotifyPlayer("A shriek crosses your lips as you feel a set of small hairy legs brush against your skin. Immediately you back away as quickly as possible.", true)
		ElseIf encounter == 3 ;Sharp Stone
			if libs.IsBound(libs.PlayerRef)
				libs.NotifyPlayer("In doing so you almost cut yourself on the unusually sharp stone in front of you. Employing both your intellect and flexibility you decide to take advantage of the situation and rub your binding against the rock. Even though you don't manage to get free at least your bonds now don't feel quite as tight as before.",true)
				;no longer working under the new struggle system, need to come up with an alternative
			Else
				libs.NotifyPlayer("In doing so you almost cut yourself on the unusually sharp stone in front of you. You quickly step back, and avoid cutting yourself.",true)
			EndIf
		EndIf
	EndIf	
EndFunction
