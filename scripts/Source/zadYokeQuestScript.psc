Scriptname zadYokeQuestScript extends zadHeavyBondageQuestScript Conditional

Scene Property PostRapeScene Auto
zaddReliableForceGreet Property fg Auto
ReferenceAlias Property YokeRescuer Auto

Message Property zad_YokeRemoveLockedMsg Auto
Message Property zad_YokeRemoveUnlockedMsg Auto
Message Property zad_YokeRemoveUnlockedFailMsg Auto
Message Property zad_YokeRemoveLooseMsg Auto
Message Property zad_YokeRemoveLooseFailMsg Auto
Message Property zad_YokeStruggleMsg Auto
Message Property zad_YokeStruggleLooseMsg Auto
Message Property zad_YokeStruggleKeyMsg Auto
Message Property zad_YokeStruggleKeyLooseMsg Auto


Function DeviceMenuRemove()
	;
EndFunction


Function DeviceMenuPostStruggle()
	;
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
	YokeRescuer.ForceRefTo(akSpeaker)
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


Function PostRape(ObjectReference akSpeaker)
	fg.DialogueDone = false
	libs.Log("PostRape()")
	libs.EquipDevice(libs.PlayerRef, lastInventoryDevice, lastRenderedDevice, libs.zad_DeviousYoke)
	libs.playerRef.RemoveItem(libs.restraintsKey, 1, false, akSpeaker)
	IsLoose = False
	StruggleCount = 0
	IsLocked = true
EndFunction


Event StartPostRape(string eventName, string argString, float argNum, form sender)
	libs.Log("Yoke: OnAnimationEnd()")
	fg.ForceGreet(PostRapeScene)
	UnregisterForModEvent("AnimationEnd")
EndEvent

