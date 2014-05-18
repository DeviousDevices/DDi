Scriptname zadBeltScript extends zadEquipScript  

; Frameworks
SexLabFramework property SexLab auto

; Keywords
Keyword Property zad_DeviousPlug Auto 

; Animations
Idle Property ZazAPCAO104 Auto

Function DeviceMenuExt(Int msgChoice)
; ; Insert Plugs
; 	if msgChoice == 3
;             BeltMenuInsertPlugs()
; ; Remove Plugs
; 	elseif msgChoice == 4
;             BeltMenuRemovePlugs()
; Excrete
	if msgChoice == 3
		BeltMenuExcrete()
; Masturbate
	elseif msgChoice == 4
		BeltMenuMasturbate()
	endif
EndFunction


function DeviceMenuRemoveWithKey()
    if RemoveDeviceWithKey()
	    string msg = ""
	    if Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Desire")
		    msg = "You unlock and remove the chastity belt - more due to discomfort than your desire for pleasure."
	    elseif Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Horny")
		    msg = "You remove the belt from your waist and let out a sigh of relief over your newly found freedom."
	    elseif Aroused.GetActorExposure(libs.PlayerRef) < libs.ArousalThreshold("Desperate")
		    msg = "Unable to resist your carnal desires any longer you anxiously unlock the belt around your waist."
	    else
		    msg = "After several frenzied attempts your trembling fingers finally manage to somehow turn the key and unlock the belt."
	    endif
	    libs.Notify(msg, true)
    Endif
EndFunction


string Function DeviceMenuPickLockFail()
	libs.PlayerRef.RemoveItem(Lockpick)
	Aroused.UpdateActorExposure(libs.PlayerRef,1)
	return "In addition, your struggles with the lock have left you aroused. "
EndFunction

string function ReturnMagicAroused()
	Aroused.UpdateActorExposure(libs.PlayerRef,1)
	return "Furthermore, the tingling magical energies so near your groin leave you feeling aroused. "
EndFunction

string Function DeviceMenuDestructionModerate()
	return ReturnMagicAroused()
EndFunction

string Function DeviceMenuAlterationSuccess()
	return ReturnMagicAroused()
EndFunction

string Function DeviceMenuAlterationFail()
	return ReturnMagicAroused()
EndFunction

string Function DeviceMenuRestorationFail()
	return ReturnMagicAroused()
EndFunction
string Function DeviceMenuIllusionFail()
	return ReturnMagicAroused()
EndFunction

string Function DeviceMenuBruteForceFail()
	Aroused.UpdateActorExposure(libs.PlayerRef,2, "Brute force fail")
	return "Your efforts leave you both exhausted, and aroused."
EndFunction

function BeltMenuExcrete()
	Game.DisablePlayerControls()
	libs.PlayerRef.PlayIdle(ZazAPCAO104)
	;debug.notification("You answer the call of nature before cleaning yourself around the edges of the belt as much as possible.")
	libs.Notify("A stream of urine escapes your bladder")
	Utility.Wait(6) 				
	Debug.SendAnimationEvent(libs.PlayerRef, "IdleForceDefaultState")
	;libs.PlayerRef.PlayIdle(IdlePlayerStop)
	Game.EnablePlayerControls()
EndFunction



function BeltMenuMasturbate()
	libs.NotifyPlayer("You attempt to seek relief from the burning desire that fills you...")
	sslBaseAnimation[] anims = SexLab.GetAnimationsByTag(1, "Solo", "F", "DeviousDevice", requireAll=true)
	actor[] tmp = new actor[1]
	tmp[0] = libs.PlayerRef
        Aroused.UpdateActorExposure(libs.PlayerRef,3)
	SexLab.StartSex(tmp, anims)
EndFunction



function SetupQuest()
        deviceQuest.SetObjectiveCompleted(00)
	if libs.PlayerRef.WornHasKeyword(zad_DeviousPlug)
		deviceQuest.setStage(20)
		deviceQuest.SetObjectivedisplayed(20)
	else
		deviceQuest.setStage(10)
		deviceQuest.SetObjectivedisplayed(10)
	Endif
EndFunction


Function ResetQuest()
      deviceQuest.SetObjectiveDisplayed(10,false)
      deviceQuest.SetObjectiveCompleted(10,false)
      deviceQuest.SetObjectiveDisplayed(20,false)
      deviceQuest.SetObjectiveCompleted(20,false)
      deviceQuest.SetObjectiveDisplayed(30,false)
      deviceQuest.SetObjectiveCompleted(30,false)
      deviceQuest.SetObjectiveDisplayed(80,false)
      deviceQuest.SetObjectiveCompleted(80,false)
      deviceQuest.SetObjectiveDisplayed(100,false)
      deviceQuest.SetObjectiveCompleted(100,false)
      deviceQuest.Reset()
EndFunction


int Function OnEquippedFilter(actor akActor, bool silent=false)
    ; if akActor==libs.PlayerRef && deviceQuest.getstage() >= 10; && menuDisable==false)

    ; Endif
    return 0
EndFunction


Function OnEquippedPre(actor akActor, bool silent=false)
	libs.StoreExposureRate(akActor)
	string msg = ""
	if akActor == libs.PlayerRef
		; Quest setup
		if deviceQuest.GetStage() >= 10; && menuDisable==false)
			libs.Log("Resetting... (Stage>=10)")
			ResetQuest()
		EndIf
		SetupQuest()
		; Dialogue
		if Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Desire")
			msg = "Calmly and with confidence you lock the chastity belt around your waist."
		elseif Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Horny")
			msg = "With more confidence than foresight you lock the chastity belt around your waist."
		elseif Aroused.GetActorExposure(akActor) < libs.ArousalThreshold("Desperate")
			msg = "Fighting against the urges inside your body you proceed to lock the chastity belt around your waist."
		else
			msg = "In an act that seems like complete madness you (barely) manage to lock the chastity belt around your waist."
		endif
	Else
		msg = akActor.GetLeveledActorBase().GetName() + " blushes as you lock the belt around her hips."
	EndIf
	if !silent
		libs.NotifyActor(msg, akActor, true)
	EndIf
EndFunction


Function OnEquippedPost(actor akActor)
	float modRate = libs.GetModifiedRate(akActor)
        libs.Log("original exposure rate was " + libs.GetOriginalRate(akActor) + ". Setting to " + modRate + ".")
        Aroused.SetActorExposureRate(akActor, modRate)
EndFunction
 
int Function OnContainerChangedFilter(ObjectReference akNewContainer, ObjectReference akOldContainer)
	return 0
EndFunction


Function OnContainerChangedPre(ObjectReference akNewContainer, ObjectReference akOldContainer)
	libs.NotifyPlayer("The belt remains firmly locked around your hips.")
EndFunction


Function OnRemoveDevice(actor akActor)
	if akActor == libs.PlayerRef
		if deviceQuest.GetStage()>=80
			libs.Log("OnRemoveDevice() called when stage >=80")
		Else
			;        deviceQuest.SetObjectiveCompleted(100)
			;        deviceQuest.SetObjectivedisplayed(100)
			if Aroused.GetActorExposure(libs.PlayerRef) >= libs.ArousalThreshold("Desperate") && libs.Config.MasturbateOnBeltRemoval
				deviceQuest.SetObjectiveCompleted(10)
				deviceQuest.SetObjectiveFailed(20)
				deviceQuest.setStage(80)
			else
				deviceQuest.SetObjectiveCompleted(10)
				deviceQuest.SetObjectiveCompleted(20)
				deviceQuest.setStage(100)
			EndIf	
		Endif
	EndIf
	RestoreSettings(akActor)
EndFunction


Function RestoreSettings(actor akActor)
	float originalExposureRate = libs.GetOriginalRate(akActor)
        libs.Log("Restoring original exposure rate to " + originalExposureRate)
        Aroused.SetActorExposureRate(akActor, originalExposureRate)
	StorageUtil.UnSetFloatValue(akActor, "zad.StoredExposureRate")
EndFunction
