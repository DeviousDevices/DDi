;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname zaddForbiddenTomeScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY ItemToFetch2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ItemToFetch2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ContainerToFetchFrom3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContainerToFetchFrom3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ContainerToFetchFrom
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContainerToFetchFrom Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Zed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Zed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DecoyMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DecoyMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ZedMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ZedMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecondBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SecondBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ZedLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ZedLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DecoyLocation1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DecoyLocation1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemToFetch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ItemToFetch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DecoyMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DecoyMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DecoyLocation2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DecoyLocation2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ContainerToFetchFrom2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ContainerToFetchFrom2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ItemToFetch3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ItemToFetch3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveDisplayed(15)
SetObjectiveDisplayed(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(23)
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(31)
SetObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetObjectiveCompleted(60)
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
SetObjectiveDisplayed(21)
SetObjectiveDisplayed(22)
Alias_ZedMarker.GetReference().AddToMap()
Alias_Zed.GetReference().Enable()
Alias_SecondBook.GetReference().Enable()
Alias_DecoyMarker1.GetReference().AddToMap()
Alias_DecoyMarker2.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveDisplayed(10)
UragCaughtPlayer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


; Libs
SexLabFramework property SexLab auto
slaUtilScr Property Aroused Auto
zadLibs Property libs Auto
zadBQ00 Property BeltQuest Auto

; Messages
Message Property UragBeltPlugMsg Auto
Message Property UragBeltMsg Auto
Message Property ZedInitialBeltMsg Auto
Message Property ZedInitialBeltPlugMsg Auto
Message Property UragSqueezePlugsMsg Auto

Message Property ZedIrritatedMsg Auto
Message Property ZedPleasedMsg Auto 

Scene Property CaughtPlayerScene  Auto
Scene Property UragBeltPlayerScene  Auto
Scene Property UragResumeDialogueScene  Auto
Scene Property UragPostSexScene  Auto
Scene Property ZedBeltPlayerScene  Auto
Scene Property ZedResumeDialogueScene  Auto

; Factions
Faction Property MagesGuild Auto
Int Property PreviousGuildRank Auto

; Quest specific devices.
Armor Property BeltIron Auto
Armor Property BeltIronRendered Auto
Armor Property BeltPadded Auto
Armor Property BeltPaddedRendered Auto
Armor Property PlugSoulgemRendered Auto

Armor Property CursedPlugs Auto
Book Property ChastityBookVol1 Auto

; Animations
Idle Property UragRestrainPlayer Auto
Idle Property UragToyWithPlayer Auto

; Persistent Quest Variables
bool Property BacktalkedUrag Auto
bool Property IrritatedZed Auto

Armor Property CurrentBelt Auto
Armor Property CurrentPlug Auto
Armor Property CurrentCollar Auto
Armor Property CurrentCuffsArms Auto
Armor Property CurrentCuffsLegs Auto
Armor Property CurrentBra Auto


; Local quest variables
form[] playerItems

; Function OnInit()
; 	libs.Log("Forbidden Tome OnInit()")
; EndFunction


;;; Set up wrapper to support custom devices
Function ManipulateDevice(actor akActor, armor device, bool equipOrUnequip, bool skipEvents = false)
	Armor deviceRendered
	Keyword deviceKeyword
	if device == BeltPadded
		deviceRendered = beltPaddedRendered
		deviceKeyword = libs.zad_DeviousBelt
	ElseIf device == BeltIron
		deviceRendered = beltIronRendered
		deviceKeyword = libs.zad_DeviousBelt
	ElseIf device == CursedPlugs
		deviceRendered = plugSoulgemRendered
		deviceKeyword = libs.zad_DeviousPlug
	Else
		libs.ManipulateDevice(akActor, device, equipOrUnequip, skipEvents)
		return
	EndIf
	if equipOrUnequip
		libs.EquipDevice(akActor, device, deviceRendered, deviceKeyword, skipEvents = skipEvents)
	else
		libs.RemoveDevice(akActor, device, deviceRendered, deviceKeyword, skipEvents = skipEvents)
	EndIf
EndFunction


Function UnwearIfValid(actor akActor, Armor device)
	if device != none
		ManipulateDevice(akActor, device, false)
	EndIf
EndFunction


Function RemoveIfValid(actor akActor, Armor device)
	if device != none
		akActor.RemoveItem(device, 1, false)
	EndIf
EndFunction


;==================================================
; Urag Functions
;==================================================
Function UragOffYouGo()
	libs.Log("UragOffYouGo()")
	SetStage(20)
EndFunction


Function UragKickOutPlayer()
	libs.Log("UragKickOutPlayer()")
	actor akActor = libs.PlayerRef
	SetObjectiveDisplayed(15)
	SetObjectiveDisplayed(16)
	SetStage(15)
	; This isn't used anymore, but if it were, SetPlayerExpelled would be the way to do it, not this.
	;PreviousGuildRank = akActor.GetFactionRank(MagesGuild)
	;akActor.SetFactionRank(MagesGuild, -1)
EndFunction


Function UragRejoinCollege()
	libs.Log("UragRejoinCollege()")
	actor akActor = libs.PlayerRef
	;akActor.SetFactionRank(MagesGuild, PreviousGuildRank)
	SetObjectiveFailed(15)
	SetObjectiveCompleted(16)
EndFunction


Function UragCaughtPlayer()
	CaughtPlayerScene.Start()
EndFunction


Function UragSexScene()
	libs.Log("UragSexScene")
	actor akActor = libs.PlayerRef

	(Alias_Urag.GetReference() as Actor).RemoveItem(ChastityBookVol1,1, false, akActor)
	akActor.RemoveItem(ChastityBookVol1,1, false, (Alias_Urag.GetReference()) as Actor)

	BeltQuest.SetStage(100) ; Avoid masturbate scene
	UnwearIfValid(akActor, CurrentBelt)
	UnwearIfValid(akActor, CurrentPlug)
	UnwearIfValid(akActor, CurrentCollar)
	UnwearIfValid(akActor, CurrentBra)
	UnwearIfValid(akActor, CurrentCuffsArms)
	UnwearIfValid(akActor, CurrentCuffsLegs)

	RemoveIfValid(akActor, CurrentBelt)
	RemoveIfValid(akActor, CurrentPlug)
	RemoveIfValid(akActor, CurrentCollar)
	RemoveIfValid(akActor, CurrentBra)
	RemoveIfValid(akActor, CurrentCuffsArms)
	RemoveIfValid(akActor, CurrentCuffsLegs)

	DoUragSexScene()
EndFunction

Function DoUragSexScene()
	libs.Log("DoUragSexScene()")
	RegisterForModEvent("OrgasmEnd", "PostSexScene")
	actor[] actors = new actor[2]
	actors[0] = libs.PlayerRef
	actors[1] = (Alias_Urag.GetReference() as Actor)
	sslBaseAnimation[] anims = SexLab.GetAnimationsByType(2, 1, 1, sexual=true)
	SexLab.StartSex(actors, anims)
EndFunction

Event PostSexScene(string eventName, string argString, float argNum, form sender)
	if GetStage() < 890
		libs.Log("PostSexScene()")
		SetStage(890)
		UnregisterForAllModEvents()
		UragPostSexScene.Start()
	Endif
EndEvent


Function RefuseUrag()
	libs.Log("RefuseUrag()")
	actor akActor = libs.PlayerRef
	(Alias_Urag.GetReference() as Actor).RemoveItem(ChastityBookVol1,1, false, akActor)
	SetStage(60)
EndFunction


Function UragSqueezePlugs()
	libs.Log("UragSqueezePlugs()")
	actor akActor = libs.PlayerRef
	libs.Moan(akActor)
	UragSqueezePlugsMsg.Show()
EndFunction

;====================
; Urag Belt Player Scene
;====================
;;; Start belt scene
Function UragBeltPlayer(bool forced = false)
	libs.Log("UragBeltPlayer()")
	CaughtPlayerScene.Stop()
	actor akActor = libs.PlayerRef
	akActor.RemoveItem(ChastityBookVol1,1, false, Alias_Urag.GetReference())
	Game.DisablePlayerControls()
	Game.ForceThirdPerson()
	libs.PlaySceneAndWait(UragBeltPlayerScene, true, 45)
	; Fix scene getting stuck sometimes.
	if ! akActor.WornHasKeyword(libs.zad_DeviousBelt)
		libs.Log("Fixing stuck scene.")
		UragBeltPlayerScene.Stop()
		DoUragBeltPlayer()
	EndIf
EndFunction


;;; Restrain player.
Function UragBeltPlayerChains()
	actor akActor = libs.PlayerRef
	akActor.PlayIdle(UragRestrainPlayer)
EndFunction


;;; Toy with player before putting belt on.
Function UragPutBeltOn()
	actor akActor = libs.PlayerRef
	(Alias_Urag.GetReference() as Actor).PlayIdleWithTarget(UragToyWithPlayer, akActor)
	playerItems = SexLab.StripActor(akActor, DoAnimate=false)
	Alias_Urag.GetActorRef().SetDontMove(True)
EndFunction


;;; Actually belt the player.
Function DoUragBeltPlayer()
	actor akActor = libs.PlayerRef
	Message tmpMsg
	if BacktalkedUrag
		libs.Log("Player backtalked to urag. Use plugs.")
		CurrentPlug = libs.PlugIron
		ManipulateDevice(akActor, CurrentPlug, true)
		tmpMsg = UragBeltPlugMsg
	Else
		libs.Log("Player was polite enough. Not using plugs.")
		tmpMsg = UragBeltMsg
	Endif
	CurrentBelt = BeltIron
	ManipulateDevice(akActor, CurrentBelt, true)
	CurrentCollar = libs.CuffsPaddedCollar
	ManipulateDevice(akActor, CurrentCollar, true)
	Debug.SendAnimationEvent(akActor, "IdleForceDefaultState") ; Reset idles from scene.
	Debug.SendAnimationEvent((Alias_Urag.GetReference() as Actor), "IdleForceDefaultState") ; Reset idles from scene.
	Alias_Urag.GetActorRef().SetDontMove(False)
	tmpMsg.Show()
	libs.UpdateControls()
	SexLab.UnStripActor(akActor, playerItems)
	UragResumeDialogueScene.ForceStart()
EndFunction


;==================================================
; Zed Functions
;==================================================
Function ZedGiveTasks()
	libs.log("ZedGiveTasks()")
	SetStage(30)
EndFunction


Function ZedBackToUrag()
	libs.Log("ZedBackToUrag()")
	; Remove core from player.
	libs.PlayerRef.RemoveItem(Alias_ItemToFetch.GetReference(), 1, false, Alias_Zed.GetReference())
	libs.PlayerRef.RemoveItem(Alias_ItemToFetch2.GetReference(), 1, false, Alias_Zed.GetReference())
	libs.PlayerRef.RemoveItem(Alias_ItemToFetch3.GetReference(), 1, false, Alias_Zed.GetReference())
	; Give Book to player
	Alias_SecondBook.GetReference().Enable()
	; I gave book to urag on setup to avoid none reference, <_<. Hopefully the player didn't notice lol
	Alias_Urag.GetReference().RemoveItem(Alias_SecondBook.GetReference(), 1, false, libs.PlayerRef)
	SetStage(50)
EndFunction


;====================
; Zed Scene 
;====================
Function ZedSwitchBeltsInitial()
	libs.Log("ZedSwitchBeltsInitial")
	armor OldPlug = CurrentPlug
	armor OldBelt = CurrentBelt
	actor akActor = libs.PlayerRef

	if OldPlug 
		libs.Moan(akActor)
		ZedInitialBeltPlugMsg.Show()
	Else
		ZedInitialBeltMsg.Show()
	EndIf

	ManipulateDevice(akActor, CurrentBelt, false, skipEvents=true)

	UnwearIfValid(akActor, CurrentPlug)

	CurrentPlug = CursedPlugs
	akActor.AddItem(CurrentPlug, 1, false)
	ManipulateDevice(akActor, CurrentPlug, true)

	CurrentBelt = BeltPadded
	akActor.AddItem(CurrentBelt, 1, false)
	ManipulateDevice(akActor, CurrentBelt, true, skipEvents=true)

	if OldPlug 
		akActor.RemoveItem(OldPlug, 1, false)
	EndIf

	; Player may have been unplugged previously, given quest design. We skipped the belt events that would have updated this for us, for a cleaner scene.
        libs.Aroused.SetActorExposureRate(akActor, libs.GetModifiedRate(akActor))
	akActor.RemoveItem(OldBelt, 1, false) ; Show message intentionally for both of these
EndFunction


Function ZedSwitchBeltsSecondary()
	libs.Log("ZedSwitchBeltsSecondary()")
	armor OldPlug = CurrentPlug
	armor oldCollar = CurrentCollar
	actor akActor = libs.PlayerRef
	if !IrritatedZed
		; Unequip belt, so that we can swap plugs.
		ManipulateDevice(akActor, CurrentBelt, false, skipEvents=true)
		; Remove old plugs
		ManipulateDevice(akActor, CurrentPlug, false)
		; Add new plugs
		CurrentPlug = libs.PlugInflatable
		akActor.AddItem(CurrentPlug, 1, false)
		ManipulateDevice(akActor, CurrentPlug, true)
		; Reequip belt.
		ManipulateDevice(akActor, CurrentBelt, true, skipEvents=true)
		; let player keep cursed plugs
		; akActor.RemoveItem(OldPlug, 1, false)
		zedPleasedMsg.show()
	Else
		; Equip bra
		CurrentBra = libs.BraPadded
		ManipulateDevice(akActor, CurrentBra, true)

		; Equip arm cuffs
		CurrentCuffsArms = libs.CuffsPaddedArms
		ManipulateDevice(akActor, CurrentCuffsArms, true)
		
		; Equip leg cuffs
		CurrentCuffsLegs = libs.CuffsPaddedLegs
		ManipulateDevice(akActor, CurrentCuffsLegs, true)

		; Unequip old collar.
		ManipulateDevice(akActor, CurrentCollar, false)

		; And equip the new one.
		CurrentCollar = libs.CollarPosture
		ManipulateDevice(akActor, CurrentCollar, true)

		akActor.RemoveItem(OldCollar, 1, false)
		zedIrritatedMsg.Show()
	EndIf
EndFunction
