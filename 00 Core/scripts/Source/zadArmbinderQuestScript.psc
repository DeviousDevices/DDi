Scriptname zadArmbinderQuestScript extends zadHeavyBondageQuestScript Conditional

Scene Property PostRapeScene Auto
zaddReliableForceGreet Property fg Auto
ReferenceAlias Property ArmbinderRescuer Auto

Message Property zad_ArmBinderRemoveLockedMsg Auto
Message Property zad_ArmBinderRemoveUnlockedMsg Auto
Message Property zad_ArmBinderRemoveLooseMsg Auto
Message Property zad_ArmBinderStruggleMsg Auto
Message Property zad_ArmBinderStruggleLooseMsg Auto
Message Property zad_ArmbinderImpossibleStruggleMsg Auto

Function DeviceMenuRemove()
	if IsLocked
		if IsLoose
			zad_ArmBinderRemoveLooseMsg.Show()
			RemoveHeavyBondage(libs.zad_DeviousArmbinder)
			libs.SendDeviceRemovalEvent("Armbinder", libs.PlayerRef)
			libs.Aroused.UpdateActorExposure(libs.PlayerRef,1)
		Else
			zad_ArmBinderRemoveLockedMsg.Show()
		EndIf
	Else
		zad_ArmBinderRemoveUnlockedMsg.Show()
		RemoveHeavyBondage(libs.zad_DeviousArmbinder)
		libs.SendDeviceRemovalEvent("Armbinder", libs.PlayerRef)
		CustomStruggleImpossibleMsg = None
		CustomStruggleMsg = None
		libs.UpdateExposure(libs.PlayerRef,1)
	EndIf
EndFunction

Function DeviceMenuPostStruggle()
	if IsLoose || (StruggleCount >= Libs.Config.ArmbinderMinStruggle) && (Utility.RandomFloat(0.0, 99.9) < Libs.Config.ArmbinderStruggleBaseChance + StruggleCount)
		zad_ArmBinderStruggleLooseMsg.Show()
		libs.Aroused.UpdateActorExposure(libs.PlayerRef, 1)
		IsLoose = true
	Else
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
EndFunction


Function DeviceMenuEndureBonds()
	;
EndFunction


Function DeviceMenuExt(int msgChoice=0)
	;
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
	else
        	actor[] actors = new actor[2]
	        actors[0] = libs.PlayerRef
        	actors[1] = otherActor
	        SexLab.StartSex(actors, anims)	
	EndIf
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


Function PostRape(ObjectReference akSpeaker)
	fg.DialogueDone = false
	libs.Log("PostRape()")
	libs.EquipDevice(libs.PlayerRef, lastInventoryDevice, lastRenderedDevice, libs.zad_DeviousArmbinder)
	IsLoose = False
	StruggleCount = 0
	IsLocked = true
EndFunction


Event StartPostRape(string eventName, string argString, float argNum, form sender)
	libs.Log("Armbinder: OnAnimationEnd()")
	fg.ForceGreet(PostRapeScene)
	UnregisterForModEvent("AnimationEnd")
EndEvent

