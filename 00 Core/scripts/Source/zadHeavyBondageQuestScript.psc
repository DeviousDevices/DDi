Scriptname zadHeavyBondageQuestScript extends Quest conditional

SexLabFramework Property SexLab Auto
zadLibs Property libs Auto

Message Property CustomStruggleMsg Auto
Message Property CustomStruggleImpossibleMsg Auto

String[] Property struggleIdles Auto
String[] Property struggleIdlesHob Auto

Bool Property IsLocked Auto
Bool Property IsLoose Auto
Int Property StruggleCount Auto
Bool Property MenuMutex Auto
Bool Property DisableStruggle Auto
Bool Property DisableDial Auto Conditional

Armor Property lastInventoryDevice Auto ; last equipped inventory device removed via this quest.
Armor Property lastRenderedDevice Auto ; last equipped rendered device removed via this quest.

Message Property zad_DeviceMsg Auto

Key Property devicekey Auto Hidden

Function DisableDialogue()
	DisableDial = true
EndFunction

Function EnableDialogue()
	DisableDial = false
EndFunction

Function DisableStruggling()
	DisableStruggle = true
EndFunction

Function EnableStruggling()
	DisableStruggle = false
EndFunction

Function SetDeviceKey(key k)
	devicekey = k
EndFunction

String[] Function SelectStruggleArray(actor akActor)
	If akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirt) && !akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirtRelaxed)
		if struggleIdlesHob.length > 0
			return struggleIdlesHob		; Use hobbled struggle idles
		else
			return struggleIdles		; Fall back to standard animations if no hobbled variants are available
		endif
	Else
		return struggleIdles		; Use regular struggle idles
	Endif
EndFunction

Function StruggleScene(actor akActor)
	if libs.IsAnimating(akActor)
		return
	EndIf
	String[] struggleArray = SelectStruggleArray(akActor)
	int len = struggleArray.length - 1
	bool[] cameraState = libs.StartThirdPersonAnimation(akActor, struggleArray[Utility.RandomInt(0, len)], true)
	Utility.Wait(2.5)
	libs.Pant(libs.PlayerRef)
	Utility.Wait(2.5)
	Debug.SendAnimationEvent(akActor, struggleArray[Utility.RandomInt(0, len)])
	Utility.Wait(5)
	libs.EndThirdPersonAnimation(akActor, cameraState, true)
	libs.SexlabMoan(libs.PlayerRef)
EndFunction


; This is here, instead of in it's respective script .psc, to facilitate the tween menu override in zadArmbinderEffect / zadYokeEffect
int Function ShowDeviceMenu(int MsgChoice=0)
	if MenuMutex ; Don't stack menu's
		return 0
	EndIf
	MenuMutex = True
        msgChoice = zad_DeviceMsg.Show() ; display menu
	if msgChoice == 0 ; Take it off
		DeviceMenuRemove()
	elseif msgChoice == 1 ; Struggle
		if libs.PlayerRef.GetAv("Stamina")<=35
			libs.NotifyPlayer("You are far too tired to struggle with your restraints.", true)
		Else
			libs.PlayerRef.DamageAV("Stamina", 35)
			if !DisableStruggle
				StruggleCount += 1
			EndIf
			StruggleScene(libs.PlayerRef)
			DeviceMenuPostStruggle()
		EndIf
	elseif msgChoice == 2 ; Endure Bonds
		DeviceMenuEndureBonds()
	endif
	DeviceMenuExt(msgChoice)
	MenuMutex = False
	return MsgChoice
EndFunction


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


Function RemoveHeavyBondage(keyword kwd)
	libs.Log("RemoveHeavyBondage(" + libs.LookupDeviceType(kwd) + ")")
	Armor id = StorageUtil.GetFormValue(libs.PlayerRef, "zad_Equipped" + libs.LookupDeviceType(kwd) + "_Inventory") as Armor
	Armor rd = StorageUtil.GetFormValue(libs.PlayerRef, "zad_Equipped" + libs.LookupDeviceType(kwd) + "_Rendered") as Armor
	lastInventoryDevice = id
	lastRenderedDevice = rd
	libs.RemoveDevice(libs.playerRef, id, rd, kwd)
EndFunction
