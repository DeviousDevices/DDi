Scriptname zad_EffInflatablePlugsAnalScript extends activemagiceffect  

zadLibs Property Libs Auto

Actor Property target Auto Hidden
bool Property Terminate Auto Hidden

; Global properties are declared here for convenience
Keyword Property loctypeplayerhome Auto
Keyword Property LocTypeJail Auto
Keyword Property LocTypeDungeon Auto
Keyword Property LocSetCave Auto
Keyword Property LocTypeDwelling Auto
Keyword Property LocTypeCity Auto
Keyword Property LocTypeTown Auto
Keyword Property LocTypeHabitation Auto
Keyword Property LocTypeDraugrCrypt Auto
Keyword Property LocTypeDragonPriestLair Auto
Keyword Property LocTypeBanditCamp Auto
Keyword Property LocTypeFalmerHive Auto
Keyword Property LocTypeVampireLair Auto
Keyword Property LocTypeDwarvenAutomatons Auto
Keyword Property LocTypeMilitaryFort Auto
Keyword Property LocTypeMine Auto
Keyword Property LocTypeInn Auto
Keyword Property LocTypeHold Auto

Function DoRegister()
	if !Terminate && target
		RegisterForSingleUpdate(30.0)
	EndIf
EndFunction

Function DoStart()	
	if !Terminate && target
		RegisterForSingleUpdate(30.0)
	EndIf
EndFunction

Function DoUnregister()
	if !Terminate && target		
		UnregisterForUpdate()
	EndIf	
EndFunction

bool Function isInHomeorJail()
	Location loc = libs.PlayerRef.GetCurrentLocation()
    if loc != none && (loc.haskeyword(loctypeplayerhome) || loc.haskeyword(loctypejail) ) 
        return true
    endif    
    return false
endfunction

bool Function isInCity()
	Location loc = libs.PlayerRef.GetCurrentLocation()
    if loc != none && (loc.haskeyword(loctypecity) || loc.haskeyword(loctypetown) || loc.haskeyword(loctypehabitation) || loc.haskeyword(loctypedwelling))        
        return true
    endif    
    return false
endfunction

bool Function isInHold()  
	Location loc = libs.PlayerRef.GetCurrentLocation() 
    if !libs.PlayerRef.GetParentCell().IsInterior() && (loc == none || loc.haskeyword(loctypehold))
        return true
    endif    
    return false
endfunction

Event OnUpdate()	
	if !Terminate
		If (Utility.GetCurrentGameTime() - libs.LastInflationAdjustmentAnal) * 24.0 > 5.0 && (libs.zadInflatablePlugStateAnal.GetValueInt() > 0)
			libs.zadInflatablePlugStateAnal.SetValueInt(libs.zadInflatablePlugStateAnal.GetValueInt() - 1)
			libs.notify("Your inflatable plugs lose some pressure...")
			libs.LastInflationAdjustmentAnal = Utility.GetCurrentGameTime()
			DoRegister()
			return
		EndIf
		if !libs.playerRef.IsInCombat() && !libs.IsAnimating(libs.playerRef) && !libs.playerref.IsOnMount() && !libs.playerref.IsSwimming() && !isInHomeorJail() && (isInCity() || isInHold()) && !UI.IsMenuOpen("Dialogue Menu")
			; look for people that 'accidentally' inflate the plugs
			If Utility.RandomInt() < 25 && (Utility.GetCurrentGameTime() - libs.LastInflationAdjustmentAnal) * 24.0 > 1.0 ; can't happen more than once in a while
				libs.log("Inflatable Plugs: Testing for valid NPC.")
				Actor currenttest		
				currenttest = Game.FindRandomActorFromRef(libs.playerRef, 350.0)
				if currenttest && libs.ValidForInteraction(currenttest, genderreq = -1, creatureok = false, animalok = false, beastreaceok = true, elderok = true, guardok = true)
					libs.notify(currenttest.GetActorBase().GetName() + " gives your plug pump a squeeze, inflating it inside you!")
					libs.InflateRandomPlug(libs.playerref, 1)
				ElseIf Utility.RandomInt() < 10 ; when there is nobody there, she has a small chance to do it herself:
					libs.notify("You 'accidentally' give your plug pump a squeeze...")
					libs.InflateRandomPlug(libs.playerref, 1)
				EndIf
			EndIf
		EndIf
		libs.Aroused.UpdateActorExposure(libs.PlayerRef, 2)
	Else ; Avoid race condition		
	EndIf	
	DoRegister()
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)	
	libs.Log("OnEffectStart(): Inflatable Plugs")
	; the effect will not be used for NPCs.
	If akTarget != libs.PlayerRef
		return
	EndIf
	Target = akTarget
	Terminate = False	
	libs.zadInflatablePlugStateAnal.SetValueInt(0)
	libs.LastInflationAdjustmentAnal = Utility.GetCurrentGameTime()
	DoStart()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Inflatable Plugs")	
	If akTarget != libs.PlayerRef
		return
	EndIf
	Terminate = True
	DoUnregister()
EndEvent