Scriptname zadBeltScript extends zadEquipScript  

; Frameworks
SexLabFramework property SexLab auto

; This stuff is deprecated and is no longer used by anything in this script. It's left in here not to make custom scripts inheriting these property cough errors into the log.
Keyword Property zad_DeviousPlug Auto 
Idle Property ZazAPCAO104 Auto

Function DeviceMenuExt(Int msgChoice)
	; Struggle (was pee in the old script, but nothing will break this way, so it's all good)
	if msgChoice == 3
		StruggleScene(libs.playerref)
	endif
	; Masturbate
	if msgChoice == 4
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

function BeltMenuMasturbate()
	libs.NotifyPlayer("You attempt to seek relief from the burning desire that fills you...")
	sslBaseAnimation[] anims = SexLab.GetAnimationsByTag(1, "Solo", "F", "DeviousDevice", requireAll=true)
	actor[] tmp = new actor[1]
	tmp[0] = libs.PlayerRef
        Aroused.UpdateActorExposure(libs.PlayerRef,3)
	SexLab.StartSex(tmp, anims)
EndFunction

Function OnEquippedPre(actor akActor, bool silent=false)
	libs.StoreExposureRate(akActor)
	string msg = ""
	if akActor == libs.PlayerRef		
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
	libs.CorsetMagic(akActor)
EndFunction

Function OnContainerChangedPre(ObjectReference akNewContainer, ObjectReference akOldContainer)
	libs.NotifyPlayer("The belt remains firmly locked around your hips.")
EndFunction

Function OnRemoveDevice(actor akActor)	
	RestoreSettings(akActor)
	libs.CorsetMagic(akActor)
EndFunction

Function RestoreSettings(actor akActor)
	float originalExposureRate = libs.GetOriginalRate(akActor)
        libs.Log("Restoring original exposure rate to " + originalExposureRate)
        Aroused.SetActorExposureRate(akActor, originalExposureRate)
	StorageUtil.UnSetFloatValue(akActor, "zad.StoredExposureRate")
EndFunction
