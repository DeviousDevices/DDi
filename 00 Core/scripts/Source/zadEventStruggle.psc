scriptName zadEventStruggle extends zadBaseEvent

Float EventCooldown = 0.0

bool Function HasKeywords(actor akActor)
	; don't play the animation in combat
	if akActor.IsInCombat() 
		return false
	Endif
	if Utility.GetCurrentRealTime() < Eventcooldown || akActor.IsWeaponDrawn()
		Return False
	Else	 
		; no wrist restraints for now. I will add them later! Make sure to give them priority!
		return (akActor.WornHasKeyword(libs.zad_Lockable) && !akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage))
	EndIf
EndFunction

Function Execute(actor akActor)
	if libs.IsAnimating(akActor)
		return
	EndIf
	; If Papyrus had dynamic arrays, I wouldn't have to write ugly code like this...Meh!
	String[] struggleStrings = new String[50]  ; increment that in case there will ever be more than 50 struggle anims!
	int len = 0
	If akActor.WornHasKeyword(libs.zad_DeviousGag)
		struggleStrings[len] = "ft_struggle_gag_1"
		len += 1
	EndIf
	If akActor.WornHasKeyword(libs.zad_DeviousBlindfold)
		struggleStrings[len] = "ft_struggle_blindfold_1"
		len += 1
	EndIf
	If akActor.WornHasKeyword(libs.zad_DeviousBoots)
		struggleStrings[len] = "ft_struggle_boots_1"
		len += 1
	EndIf
	If akActor.WornHasKeyword(libs.zad_DeviousGloves)
		struggleStrings[len] = "ft_struggle_gloves_1"
		len += 1
	EndIf
	If akActor.WornHasKeyword(libs.zad_DeviousHood)
		struggleStrings[len] = "ft_struggle_head_1"
		len += 1
	EndIf
	If akActor.WornHasKeyword(libs.zad_DeviousBelt)
		struggleStrings[len] = "DDChastityBeltStruggle01"
		len += 1
		struggleStrings[len] = "DDChastityBeltStruggle02"
		len += 1
	EndIf
	; sanity check
	If len == 0
		return
	EndIf
	Eventcooldown = Utility.GetCurrentRealTime() + 300 ; add a 5 min real time cooldown
	bool[] cameraState = libs.StartThirdPersonAnimation(akActor, struggleStrings[Utility.RandomInt(0, (len - 1) )], true)
	Utility.Wait(5)
	libs.Pant(libs.PlayerRef)
	Utility.Wait(5)
	libs.EndThirdPersonAnimation(akActor, cameraState, true)
	libs.SexlabMoan(libs.PlayerRef)
EndFunction