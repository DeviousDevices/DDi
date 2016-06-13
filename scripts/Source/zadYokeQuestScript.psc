Scriptname zadYokeQuestScript extends zadHeavyBondageQuestScript Conditional

Scene Property PostRapeScene Auto
zaddReliableForceGreet Property fg Auto
ReferenceAlias Property YokeRescuer Auto
MiscObject Property ItemGold Auto

Message Property zad_YokeRemoveLockedMsg Auto ; "Take it off", no key.
Message Property zad_YokeRemoveUnlockedMsg Auto ; Escaped via manipulated locks.
Message Property zad_YokeRemoveUnlockedFailMsg Auto ; Failed to escape manipulated locks.
Message Property zad_YokeRemoveLooseMsg Auto ; Removed the yoke.
Message Property zad_YokeRemoveLooseFailMsg Auto ; Fail to remove unlocked yoke.
Message Property zad_YokeStruggleMsg Auto ; Base struggle message
Message Property zad_YokeStruggleLooseMsg Auto ; Realization that struggling is impossible message.
Message Property zad_YokeStruggleKeyMsg Auto ; Attempt to use key message.
Message Property zad_YokeStruggleKeyLooseMsg Auto ; Got the locks loose, move to removing the lock.
Message Property zad_YokeImpossibleStruggleMsg Auto ; Struggling disabled

; Merchant Curse
Perk Property MerchantCurse Auto
Spell Property MerchantCurseSpell Auto

; How much gold will the curse steal, per application?
int Property MerchantCurseGoldThreshold = 0 Auto

int Property MerchantCurseGoldOwed  = 0 Auto

; How much gold has been stolen?
Int Property MerchantCurseGoldStolen Auto

Bool Property SmithEscapeDialogueEnabled = true Auto Conditional

Function UpdateBlacksmithRemoval(bool EnableDisable=True)
	 SmithEscapeDialogueEnabled = EnableDisable
EndFunction

bool Function AttemptRemoveYoke()
	if Utility.RandomInt(1,100) <= 25
		RemoveHeavyBondage(libs.zad_DeviousYoke)
		return true
	Else
		; Display failure message
	EndIf
EndFunction



Function DoStruggle()
	StruggleCount += 1
	StruggleScene(libs.PlayerRef)
	DeviceMenuPostStruggle()
EndFunction

Function DeviceMenuRemove()
	if IsLocked
		If IsLoose || libs.PlayerRef.GetItemCount(GetKey()) >= 1
			DoStruggle()
		Else
			zad_YokeRemoveLockedMsg.Show() ; Can't escape like that!
		EndIf
	Else ; Player manipulated locks beforehand.
		DoStruggle()
	EndIf
EndFunction

Key Function GetKey()
	return (StorageUtil.GetFormValue(libs.PlayerRef, "zad_Equipped" + libs.LookupDeviceType(libs.zad_DeviousYoke) + "_Key") as Key)
EndFunction


Function DeviceMenuPostStruggle()
	if !IsLocked
		if !AttemptRemoveYoke()
			zad_YokeRemoveUnlockedFailMsg.Show()
		Else
			zad_YokeRemoveUnlockedMsg.Show()
		EndIf
	else		
		int attempt = Utility.RandomInt()
		libs.UpdateExposure(libs.PlayerRef,0.3)
		if IsLoose
			if !AttemptRemoveYoke()
				zad_YokeRemoveLooseFailMsg.Show()
			Else
				zad_YokeRemoveLooseMsg.Show()
			EndIf		
		Else
			if DisableStruggle
				if CustomStruggleImpossibleMsg != None
					CustomStruggleImpossibleMsg.Show()
				Else
					zad_YokeImpossibleStruggleMsg.Show()
				EndIf
			Else 
				if StruggleCount >= 3 && (attempt*1.5) <= StruggleCount
					If libs.PlayerRef.GetItemCount(GetKey()) >= 1
						IsLoose = true
						zad_YokeStruggleKeyLooseMsg.Show()
					Else
						if CustomStruggleImpossibleMsg != None
							CustomStruggleImpossibleMsg.Show()
						Else
							zad_YokeStruggleLooseMsg.Show()
						EndIf
					EndIf
				Else
					if libs.PlayerRef.GetItemCount(GetKey()) >= 1
						zad_YokeStruggleKeyMsg.Show()
					Else
						if CustomStruggleMsg != None
							CustomStruggleMsg.Show()
						Else
							zad_YokeStruggleMsg.Show()
						EndIf
					Endif
				EndIf	
			EndIf		

		EndIf
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
	YokeRescuer.ForceRefTo(akSpeaker)
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

Function BlacksmithRemoveHeavyBondage(ObjectReference akSpeaker)
	Int Price = libs.config.YokeRemovalCostPerLevel * libs.playerRef.GetLevel()
	MerchantCurseGoldThreshold = Math.Ceiling(Price * 1.5)
	int curGold = libs.PlayerRef.GetItemCount(itemGold)
	if (curGold >= Price)
		libs.PlayerRef.RemoveItem(ItemGold, Price)
	Else
		MerchantCurseGoldOwed += MerchantCurseGoldThreshold
		MerchantCurseGoldStolen = curGold
		libs.PlayerRef.RemoveItem(ItemGold, curGold)
		libs.PlayerRef.AddSpell(MerchantCurseSpell)
	EndIf
	RemoveHeavyBondage(libs.zad_DeviousYoke)
EndFunction
