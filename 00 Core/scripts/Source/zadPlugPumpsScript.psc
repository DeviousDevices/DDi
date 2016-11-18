Scriptname zadPlugPumpsScript extends zadPlugScript

Message Property squeezeMsg Auto

Function DeviceMenuExt(Int msgChoice)
	if msgChoice == 2
		squeezeMsg.show()
		If deviceRendered.HasKeyword(libs.zad_DeviousPlugAnal)
			libs.InflateAnalPlug(libs.PlayerRef, 1)
		Else	
			libs.InflateVaginalPlug(libs.PlayerRef, 1)
		EndIf
	EndIf
	if msgChoice == 3		
		int currentVal
		If deviceRendered.HasKeyword(libs.zad_DeviousPlugAnal)
			currentVal = libs.zadInflatablePlugStateAnal.GetValueInt()
		Else
			currentVal = libs.zadInflatablePlugStateVaginal.GetValueInt()
		EndIf
		if currentVal == 0
			libs.notify("Your plug is completely deflated and doesn't stimulate you very much. You could slide it out of you, if you wish. That or you could give the pump a healthy squeeze and make it more fun!", messagebox = true)
		elseif currentVal == 1
			libs.notify("Your plug is a bit inflated but doesn't stimulate you too much - just enough to make you long for more. You could give the pump a healthy squeeze!", messagebox = true)
		elseif currentVal == 2
			libs.notify("Your plug is inflated. Its gentle movements inside you please you without causing you discomfort. You are getting more horny and wonder if you should inflate it even more?", messagebox = true)
		elseif currentVal == 3
			libs.notify("Your fairly inflated plug is impossible to ignore as it moves around inside of you, constantly pleasing you and making you more horny as you already are.", messagebox = true)
		elseif currentVal == 4
			libs.notify("Your plug is almost inflated to capacity. You cannot move at all without shifting it around inside of you, making you squeal in an odd sensation of pleasurable pain.", messagebox = true)
		elseif currentVal == 5
			libs.notify("Your plug is fully inflated and almost bursting inside you. It's causing you more discomfort than anything. But no matter what - you won't be able to remove it from your body anytime soon.", messagebox = true)		
		EndIf				
	EndIf	
	if msgChoice == 4
		libs.zad_PlugsDeflatePumpsFail.show()
	EndIf
EndFunction
