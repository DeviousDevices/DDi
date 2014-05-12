Scriptname zadArmbinderQuestScript extends Quest

SexLabFramework Property SexLab Auto
zadLibs Property libs Auto
Scene Property PostRapeScene Auto
zaddReliableForceGreet Property fg Auto
ReferenceAlias Property ArmbinderRescuer Auto

Message Property zad_ArmBinderRemoveLockedMsg Auto
Message Property zad_ArmBinderRemoveUnlockedMsg Auto
Message Property zad_ArmBinderRemoveLooseMsg Auto
Message Property zad_ArmBinderStruggleMsg Auto
Message Property zad_ArmBinderStruggleLooseMsg Auto
Message Property zad_DeviceMsg Auto
Message Property zad_ArmbinderImpossibleStruggleMsg Auto

Message Property CustomStruggleMsg Auto
Message Property CustomStruggleImpossibleMsg Auto

Idle[] Property struggleIdles Auto


Bool Property IsLocked Auto
Bool Property IsLoose Auto
Int Property StruggleCount Auto
Bool Property MenuMutex Auto
Bool Property DisableStruggle Auto

Function DisableStruggling()
	DisableStruggle = true
EndFunction

Function EnableStruggling()
	DisableStruggle = false
EndFunction

Function StruggleScene(actor akActor)
	if libs.IsAnimating(akActor)
		return
	EndIf
	int len = struggleIdles.length - 1
	bool[] cameraState = libs.StartThirdPersonAnimation(akActor, struggleIdles[Utility.RandomInt(0, len)], true)
	Utility.Wait(2.5)
	libs.Pant(libs.PlayerRef)
	Utility.Wait(2.5)
	akActor.PlayIdle(struggleIdles[Utility.RandomInt(0, len)])
	Utility.Wait(5)
	libs.EndThirdPersonAnimation(akActor, cameraState, true)
	libs.SexlabMoan(libs.PlayerRef)
EndFunction


; This is here, instead of in zadArmbinderQuestScript.psc, to facilitate the tween menu override in zadArmbinderEffect
int Function ShowArmbinderMenu(int MsgChoice=0)
	if MenuMutex ; Don't stack menu's
		return 0
	EndIf
	MenuMutex = True
        msgChoice = zad_DeviceMsg.Show() ; display menu
	if msgChoice == 0 ; Take it off
		if IsLocked
			if IsLoose
				zad_ArmBinderRemoveLooseMsg.Show()
				libs.ManipulateDevice(libs.PlayerRef, libs.Armbinder, false)
				libs.SendDeviceRemovalEvent("Armbinder", libs.PlayerRef)
				libs.Aroused.UpdateActorExposure(libs.PlayerRef,1)
			Else
				zad_ArmBinderRemoveLockedMsg.Show()
			EndIf
		Else
			zad_ArmBinderRemoveUnlockedMsg.Show()
			libs.ManipulateDevice(libs.PlayerRef, libs.Armbinder, false)
			libs.SendDeviceRemovalEvent("Armbinder", libs.PlayerRef)
			CustomStruggleImpossibleMsg = None
			CustomStruggleMsg = None
			libs.UpdateExposure(libs.PlayerRef,1)
		EndIf
	elseif msgChoice == 1 ; Struggle
		if libs.PlayerRef.GetAv("Stamina")<=35
			libs.NotifyPlayer("You are far too tired to struggle with the armbinder.", true)
		Else
			libs.PlayerRef.DamageAV("Stamina", 35)
			StruggleCount += 1
			if IsLoose || StruggleCount >= 5 && Utility.RandomInt() <= StruggleCount
				zad_ArmBinderStruggleLooseMsg.Show()
				libs.UpdateExposure(libs.PlayerRef,0.3)
				IsLoose = true
			Else
				StruggleScene(libs.PlayerRef)
				if DisableStruggle
					if CustomStruggleImpossibleMsg != None
						CustomStruggleImpossibleMsg.Show()
					Else
						zad_ArmbinderImpossibleStruggleMsg.show()
					EndIf
				Else
					if CustomStruggleMsg != None
						CustomStruggleMsg.Show()
					Else
						zad_ArmBinderStruggleMsg.Show()
					EndIf
				Endif
			EndIf
		EndIf
	elseif msgChoice == 2 ; Endure Bonds
		
	endif
	MenuMutex = False
	return MsgChoice
EndFunction

;==================================================
; Generic Quest Hooks
;==================================================
Function SexScene(ObjectReference akSpeaker, bool aggressive)
	if UI.IsMenuOpen("Dialogue Menu")
		Input.TapKey(Input.GetMappedKey("Tween Menu"))
	EndIf
	ArmbinderRescuer.ForceRefTo(akSpeaker)
	actor otherActor = (akSpeaker as Actor)
	libs.Log("SexScene("+otherActor.GetLeveledActorBase().GetName()+")")
	sslBaseAnimation[] anims = SexLab.GetAnimationsByType(2, aggressive=aggressive)
	if anims.length <=0
		libs.Error("No animations available.")
		return
	EndIf
        actor[] actors = new actor[2]
        actors[0] = libs.PlayerRef
        actors[1] = otherActor
        SexLab.StartSex(actors, anims)
EndFunction


Function ConsensualSex(ObjectReference akSpeaker)
	libs.Log("ConsensualSex()")
	UnregisterForModEvent("AnimationEnd")
	SexScene(akSpeaker, false)
EndFunction


Function RapeSex(ObjectReference akSpeaker)
	libs.Log("RapeSex()")
	if UI.IsMenuOpen("Dialogue Menu")
		Input.TapKey(Input.GetMappedKey("Tween Menu"))
	EndIf
	UnregisterForModEvent("AnimationEnd")
	RegisterForModEvent("AnimationEnd", "StartPostRape")
	SexScene(akSpeaker, true)
EndFunction


Function RemoveArmbinder(ObjectReference akSpeaker)
	libs.Log("RemoveArmbinder()")
	libs.ManipulateDevice(libs.PlayerRef, libs.ArmBinder, false)
EndFunction


Function PostRape(ObjectReference akSpeaker)
	fg.DialogueDone = false
	libs.Log("PostRape()")
	libs.ManipulateDevice(libs.PlayerRef, libs.ArmBinder, true)
	IsLoose = False
	StruggleCount = 0
	IsLocked = true
EndFunction


Event StartPostRape(string eventName, string argString, float argNum, form sender)
	libs.Log("Armbinder: OnAnimationEnd()")
	fg.ForceGreet(PostRapeScene)
	UnregisterForModEvent("AnimationEnd")
EndEvent
