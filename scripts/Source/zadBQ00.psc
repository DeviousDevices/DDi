;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname zadBQ00 Extends zadBaseDeviceQuest Hidden

;BEGIN ALIAS PROPERTY ArmBinderRescuer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArmBinderRescuer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(100)
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(80)
RelieveSelf()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
Rehook()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; Libraries
SexLabFramework property SexLab auto
slaUtilScr Property Aroused Auto
zadBeltedAnims Property zadAnims  Auto  
zadNPCQuestScript Property npcs Auto
zadArmbinderQuestScript Property abq Auto
zadDeviousMagic Property zadMagic Auto
zadAssets Property assets Auto
zadBenchmark Property benchmark Auto
zbfBondageShell Property zbf Auto
zbfSexLab Property zbfSL Auto

; Idles
Idle Property DDBeltedSolo Auto
Idle Property DDZazHornyA Auto
Idle Property DDZazHornyB Auto
Idle Property DDZazHornyC Auto
Idle Property DDZazHornyD Auto
Idle Property DDZazHornyE Auto


; Messages
Message Property zad_eventSleepStopContent auto
Message Property zad_eventSleepStopDesire auto
Message Property zad_eventSleepStopHorny auto
Message Property zad_eventSleepStopDesperate auto

; Persistant Variables
float Property modVersion Auto
bool Property processMountedEvent Auto
bool Property processDripEvent Auto
bool Property processChafeMessageEvent Auto
bool Property processHornyEvent Auto
bool Property processTightBraEvent Auto ; Name not applicable with current bra mesh, lol
bool Property processPostureCollarMessageEvent Auto
bool Property processBumpPumpEvent Auto
bool Property processBlindfoldEvent Auto
bool Property processHarnessEvent Auto
bool Property processPlugsEvent Auto

bool Property Tainted Auto ; Not going to offer support for tainted installations.
string[] Property Registry Auto

import sslUtility

function Shutdown(bool silent=false)
    ; this is not finished yet.
    UnregisterForAllModEvents()
    if !silent
        Debug.Notification("Devious Devices has completed shutting down. It is now safe-ish to uninstall. (Note: If you have npc's wearing the belt, be sure to remove it from them prior to uninstall! This is not tracked internally at the moment).")
    EndIf
EndFunction


Event OnInit()
	RegisterForModEvent("__DeviousDevicesInit", "OnInitialize")
EndEvent


Event OnInitialize(string eventName, string strArg, float numArg, Form sender)
	UnregisterForModEvent("__DeviousDevicesInit")
	Maintenance()
EndEvent


Function Maintenance()
	; benchmark.SetupBenchmarks()
	float curVersion = libs.GetVersion()
	if zad_DeviousDevice == None
		Debug.MessageBox("Devious Devices has not been correctly upgraded from its previous version. Please Clean Save, as per the instructions in the support thread.")
		Libs.Error("zad_DeviousDevice == none in Maintenance()")
	Endif
	bool regDevices = false 
	if modVersion != curVersion
		if modVersion <= 2.65 && modVersion >= 2.0
			Debug.Messagebox("It seems that you're upgrading Devious Devices from a version prior to 2.6.6. Please note, that upgrading from version 2.6.5 to 2.6.6+ is unsupported. Do so at your own risk.")
			Tainted=True
		EndIf
		modVersion = curVersion
		Debug.Notification("Devious Devices, version " + modVersion + " initialized.")
		libs.Log("Initializing.")
		regDevices = true
	EndIf
	if modVersion < 2.8
		; Temporarily disable SS for curious users that enabled it.
		libs.config.SurreptitiousStreets = false
		libs.config.RadiantMaster = false
	EndIf
	Parent.Maintenance()
	; I doubt this will actually fix the MCM issue people are reporting, though who knows. Doesn't make sense that the animation failing 
	; to register with Sexlab would cause zadConfig to not initialize properly. All the same, better to avoid that race condition.
	zadAnims.LoadAnimations()
	libs.EnableEventProcessing()
	; Finish initialization
	Rehook()
	; Make sure nothing got stuck on a previous play-through.
	bool showCompass = true
	if libs.playerRef.WornHasKeyword(libs.zad_DeviousBlindfold)
		showCompass = false
	EndIf
	libs.ToggleCompass(showCompass)
	libs.SetAnimating(libs.PlayerRef, false)
	libs.StopVibrating(libs.PlayerRef)
	zadMagic.IsRunning = False
	libs.DeviceMutex = false
	libs.repopulateMutex = false
	libs.lastRepopulateTime = 0.0
	libs.zadNPCQuest.Maintenance()
	libs.RepopulateNpcs()
	if !HasArmbinder(libs.PlayerRef)
		abq.EnableStruggling()
	EndIf
	VersionChecks()
	; Start up periodic events system
	libs.EventSlots.Initialize()
	libs.EventSlots.Maintenance()
	; Check to see if bound anims are available.
	if !libs.DevicesUnderneath.IsRunning() && libs.config.DevicesUnderneathEnabled
		libs.DevicesUnderneath.Start()
		int timeout = 0
		while !libs.DevicesUnderneath.IsRunning() && timeout < 25
			timeout += 1
			Utility.Wait(0.2)
		EndWhile
		libs.DevicesUnderneath.Maintenance()
	EndIf
	If regDevices
		libs.RegisterDevices() ; Might take a while, do it last
	EndIf
EndFunction


Function CheckCompatibility(string name, float required, float current)
	string status = ""
	if current == 0
		status = "UNINITIALIZED"
	ElseIf current < required
		libs.Error("Incompatible version of "+name+" detected! Version "+required+" or newer is required, current is "+current+".")
		status="FAIL"
	Else
		status = "OK"
	EndIf
	libs.Log(name+" version [" + current + "]: "+status)
EndFunction


Function VersionChecks()
	libs.Log("==========Begin Compatibility Checks==========")
	libs.Log("Please note that Errors related to missing files should be ignored.")
	libs.Log("[ Dependency Checks ]")

	CheckCompatibility("DDi", modVersion, modVersion)
	if !assets
		libs.Error("Assets is undefined: You're probably running an out of date version of it. Please update Devious Devices - Assets to the latest version.")
	EndIf
	CheckCompatibility("Assets", 2.82, assets.GetVersion())
	CheckCompatibility("Zaz Animation Pack", 600, zbfUtil.GetVersion())
	CheckCompatibility("Aroused", 20140124, Aroused.GetVersion())
	CheckCompatibility("Sexlab", 15900, SexlabUtil.GetVersion())
	libs.Log("[ Third Party Mod Compatibility Checks ]")
	; ...
	libs.Log("[ Sanity Checks ]")
	string status = "OK"
	if Tainted
		status="FAIL"
	EndIf
	libs.Log("Verifying that installation is untainted by an unsupported upgrade: "+status)
	status="OK"
	bool obsoleteEspInstalled = !(Game.GetModByName("Devious Devices - Integration.esp") > 0)
	if obsoleteEspInstalled
		status = "FAIL"
		libs.Error("Obsolete file Devious Devices - Integration.esp detected. Note, that upgrading from 2.6.5 to 2.6.6+ is not supported. Please delete Devious Devices - Integration.esp (Using Devious Devices - Integration.esm instead), and try again.")
	EndIf
	libs.Log("Verifying that old DDi esp is not present: "+status)
	libs.Log("==========End Compatibility Checks==========")
EndFunction


function Rehook()
	libs.Log("Rehooking Mod Events")
	; Skse mod events
	RegisterForModEvent("HookAnimationStart", "OnAnimationStart")
	RegisterForModEvent("HookAnimationEnd", "OnAnimationEnd")
	RegisterForModEvent("HookLeadInEnd", "OnLeadInEnd")
	RegisterForModEvent("HookOrgasmStart", "OnOrgasmStart")
	RegisterForModEvent("HookAnimationChange", "OnAnimationChange")
	; Papyrus mod events
	UnregisterForSleep()
	RegisterForSleep()
EndFunction


bool Function IsValidAnimation(sslBaseAnimation anim, bool permitOral, bool permitVaginal, bool permitAnal, bool permitBoobjob, int numExtraTags, string[] ExtraTags)
	if anim.HasTag("DeviousDevice")
		return true
	elseif (permitBoobjob || !anim.HasTag("Boobjob")) &&(permitVaginal || (!anim.HasTag("Vaginal") && !anim.HasTag("Fisting") && !anim.HasTag("Masturbation"))) && (permitAnal || !anim.HasTag("Anal")) && (permitOral || !anim.HasTag("Oral")) && !anim.HasTag("Estrus") ; Estrus Chaurus compatibility
		int i = 0
		while i < NumExtraTags
			if !anim.HasTag(ExtraTags[i])
				return false
			EndIf
			i += 1
		EndWhile
		return true
	endif
	return false
EndFunction


string Function GetAnimationNames(sslBaseAnimation[] anims)
    string ret = ""
    int i = anims.Length
    while i > 0
        i -= 1
        ret += anims[i].Name
        if i > 0
            ret += ", "
        EndIf
    EndWhile
    return ret
EndFunction


; Dynamically "links" to Zaz Animation Pack
; 
Function LinkZap()
	If zbf == None
		zbf = zbfUtil.GetMain()
	EndIf
	If zbfSL == None
		zbfSL = zbfUtil.GetSexLab()
	EndIf
EndFunction


sslBaseAnimation[] function FindValidAnimations(sslThreadController controller, int numActors, sslBaseAnimation previousAnim, bool permitOral, bool permitVaginal, bool permitAnal, bool permitBoobjob, int NumExtraTags, string[] ExtraTags)
	; It is my understanding that these arrays will only contain references. Assuming this works similarly
	; to C (As is my current understanding), each reference will not take up much memory (4ish bytes per
	; reference) Thus, storing it like this, while not optimal, will not require further change, and
	; will permit me to easily debug this.
	; What I wouldnt do for a 2d array, or a dict...

	;;;; Build list of available animations. 
	sslBaseAnimation[] allAnims
	int totalAnims = 0
	if previousAnim.HasTag("Creature")
		allAnims = SexLab.CreatureSlots.GetByRace(numActors, Controller.positions[(Controller.positions.Length - 1)].GetRace())
		totalAnims = allAnims.Length
	Else
		sslBaseAnimation[] ownerAnims = SexLab.GetOwnerAnimations(self)
		sslBaseAnimation[] sexlabAnims = Sexlab.AnimSlots.Animations
		int len = ownerAnims.length + Sexlab.AnimSlots.Slotted
		allAnims = sslUtility.AnimationArray(len)
		int i = 0
		int j = 0
		int tlen = Sexlab.AnimSlots.Slotted
		While i < tlen && j < 128
			if sexlabAnims[i].enabled && sexlabAnims[i].registered
				allAnims[j] = sexlabAnims[i]
				j += 1
			EndIf
			i += 1
		EndWhile
		i = 0
		tlen = ownerAnims.length
		While i < tlen && j < 128
			allAnims[j] = ownerAnims[i]
			j += 1
			i += 1
		EndWhile
		totalAnims = j
	EndIf
	sslBaseAnimation[] chastityAnims
	sslBaseAnimation[] aggroAnims
	sslBaseAnimation[] foreplayAnims
	sslBaseAnimation[] boundAnims
	int i = totalAnims

	while i >0 ; Filter out chastity-unfriendly animations
		i -= 1
		;            if SexLab.AnimSlots.Searchable(previousAnim) && numActors==allAnims[i].ActorCount() && IsValidAnimation(allAnims[i])
		if numActors==allAnims[i].PositionCount && IsValidAnimation(allAnims[i], permitOral, permitVaginal, permitAnal, permitBoobjob, NumExtraTags, ExtraTags)
			if allAnims[i].HasTag("Aggressive")
				aggroAnims = sslUtility.PushAnimation(allAnims[i], aggroAnims)
			EndIf
			if allAnims[i].HasTag("Foreplay")
				foreplayAnims = sslUtility.PushAnimation(allAnims[i], foreplayAnims)
			else
				if allAnims[i].HasTag("Bound") || allAnims[i].HasTag("Armbinder")
					boundAnims = sslUtility.PushAnimation(allAnims[i], boundAnims)
				Else
					chastityAnims = sslUtility.PushAnimation(allAnims[i], chastityAnims)
				EndIf
			EndIf
		Endif
	EndWhile

	libs.Log("FindValidAnimations(numActors="+numActors+", previousAnim="+previousAnim.name+ ", permitOral="+permitOral+", permitVaginal="+permitVaginal+",permitAnal="+permitAnal+")")
	libs.Log("Sexlab Animations Available (Chastity): " + chastityAnims.length + "/" + totalAnims + "(" + GetAnimationNames(chastityAnims) + ")")
	libs.Log("Sexlab Animations Available (Aggressive): " + aggroAnims.length + "/" + totalAnims + "(" + GetAnimationNames(aggroAnims) + ")")
	libs.Log("Sexlab Animations Available (Foreplay): " + foreplayAnims.length + "/" + totalAnims + "(" + GetAnimationNames(foreplayAnims) + ")")
	libs.Log("Sexlab Animations Available (Bound): " +boundAnims.length + "/" + totalAnims + "(" + GetAnimationNames(boundAnims) + ")")

	If previousAnim!=none && previousAnim.HasTag("foreplay") && foreplayAnims.length>=1
		libs.Log("Using only foreplay animation list.")
		return foreplayAnims
	Elseif previousAnim!=none && previousAnim.HasTag("Aggressive") && aggroAnims.length>=1 && libs.config.PreserveAggro
		libs.Log("Using only aggressive animation list.")
		return aggroAnims
	else
		libs.Log("Using full chastity animation list.")
		return chastityAnims
	Endif
EndFunction


int function CountRestrictedActors(actor[] actors, keyword permit, keyword restricted1, keyword restricted2=none, keyword restricted3=none)
	int ret = 0
	int i = actors.length
	while i > 0
		i -= 1
		if (permit == None || !actors[i].WornHasKeyword(permit)) && (actors[i].WornHasKeyword(restricted1) || (restricted2 && actors[i].WornHasKeyword(restricted2)) || (restricted3 && actors[i].WornHasKeyword(restricted3)))
			ret += 1
		Endif
	EndWhile
	return ret
EndFunction


int function CountBeltedActors(actor[] actors)
	return CountRestrictedActors(actors, libs.zad_PermitVaginal, zad_DeviousDevice)
EndFunction


Function TogglePanelGag(actor[] actors, bool insert)
	int i = actors.length
	while i > 0
		i -= 1
		if actors[i].WornHasKeyword(libs.zad_DeviousGagPanel)
			if insert
				libs.PlugPanelGag(actors[i])
			Else
				libs.UnPlugPanelGag(actors[i])
			EndIf
		EndIf
	EndWhile
EndFunction


Function StoreArmbinders(actor[] originalActors)
	int i = originalActors.Length
	while i > 0
		i -= 1
		Form storedArmbinder = libs.GetWornArmbinderInstance(originalActors[i])
		if storedArmbinder != None
			libs.Log("Stored armbinder: " + storedArmbinder)
			StorageUtil.SetFormValue(originalActors[i], "zadStoredArmbinder", storedArmbinder)
			originalActors[i].UnequipItem(storedArmbinder, false, true)
		EndIf
	EndWhile
EndFunction


Function RetrieveArmbinders(actor[] originalActors)
	int i = originalActors.Length
	while i > 0
		i -= 1
		Form storedArmbinder = StorageUtil.GetFormValue(originalActors[i], "zadStoredArmbinder")
		if storedArmbinder != None
			StorageUtil.UnSetFormValue(originalActors[i], "zadStoredArmbinder")
			originalActors[i].EquipItem(storedArmbinder, true, true)
		EndIf
	EndWhile
EndFunction

; Returns true if anal sex on this actor is blocked.
; 
Bool Function IsBlockedAnal(Actor akActor)
	Return akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_PermitAnal)
EndFunction

; Returns true if vaginal sex on/by this actor is blocked.
; 
Bool Function IsBlockedVaginal(Actor akActor)
	Return akActor.WornHasKeyword(libs.zad_DeviousBelt) && !akActor.WornHasKeyword(libs.zad_PermitVaginal)
EndFunction

; Returns true if "breast sex" on this actor is blocked.
; 
Bool Function IsBlockedBreast(Actor akActor)
	Return akActor.WornHasKeyword(libs.zad_DeviousBra)
EndFunction

; Returns true if oral sex by this actor is blocked.
; 
Bool Function IsBlockedOral(Actor akActor)
	; Two kinds of gags _allow_ "oral": "panel" and "ring". Ring is equipped with PermitOral, panel with DeviousGagPanel.
	Return akActor.WornHasKeyword(libs.zad_DeviousGag) && !akActor.WornHasKeyword(libs.zad_DeviousGagPanel) && !akActor.WornHasKeyword(libs.zad_PermitOral)
EndFunction

; Returns the set of blocked tags on the specified actor by looking at worn keywords.
; 
; Tags returned from this function can be used for SexLab filtering, but are expected to primarily
; conform to zbfSexLabBaseEntry actor specific tags.
; 
String[] Function GetBlockedTagsFromKeywords(Actor akActor)
	String[] list = New String[4]
	Int i = 0
	If IsBlockedVaginal(akActor)
		list[i] = "Vaginal"
		i += 1
	EndIf
	If IsBlockedAnal(akActor)
		list[i] = "Anal"
		i += 1
	EndIf
	If IsBlockedOral(akActor)
		list[i] = "Oral"
		i += 1
	EndIf
	If IsBlockedBreast(akActor)
		list[i] = "Breast"
		i += 1
	EndIf

	libs.Log("Blocked tags on " + akActor.GetActorBase().GetName() + " are " + list)
	Return list
EndFunction


; Returns a list of tags required on the actor
; 
; Currently checks for armbinders only, mimicing the previous behavior.
; 
String[] Function GetRequiredTagsFromKeywords(Actor akActor)
	String[] list = New String[1]
	If libs.IsBound(akActor)
		list[0] = zbf.GetSexLabBoundTag(zbf.iBindArmbinder)
	EndIf
	Return list
EndFunction


; Returns a fully qualified animation name from the worn keywords
; 
; Checks for armbinder only at the moment.
; 
String Function GetAnimationNameFromKeywords(zbfSexLabBaseEntry akEntry, Actor akActor)
	Int iBindType = zbf.iBindUnbound
	If libs.IsBound(akActor) ; May be more appropriate to check for animation type here
		iBindType = zbf.iBindArmbinder
	EndIf
	Return zbf.GetSexLabAnimationName(akEntry, iBindType)
EndFunction


zbfSexLabBaseEntry[] Function GetEntries(String asVanillaPriorityId = "")
	zbfSexLabBaseEntry[] list = zbfSL.GetEntries()
	Int iFirstFree = list.Find(None)
	list[iFirstFree] = list[0]
	list[0] = zbfSL.GetEntryByVanillaId(asVanillaPriorityId)
	Return list
EndFunction


; Filters the list based on akActor worn keywords.
; 
Function FilterActor(zbfSexLabBaseEntry[] akList, Actor akActor, Int aiActorIndex)
	String[] required = GetRequiredTagsFromKeywords(akActor)
	String[] blocked = GetBlockedTagsFromKeywords(akActor)
	Bool bTagFound

	bTagFound = bTagFound || (required[0] != "")
	bTagFound = bTagFound || (blocked[0] != "")

	zbfSL.FilterEntries(akList, aiActorIndex, required, blocked)
EndFunction


; Returns a shallow copy of a list of zbfSexLabBaseEntry objects
; 
zbfSexLabBaseEntry[] Function CopyList(zbfSexLabBaseEntry[] akList)
	zbfSexLabBaseEntry[] filtered = New zbfSexLabBaseEntry[15]
	Int i = akList.Length
	While i > 0
		i -= 1
		filtered[i] = akList[i]
	EndWhile
	Return filtered
EndFunction


; Returns a random matching entry
; 
; Entries have been pre-filtered based on bindings and other constraints on the actors.
; 
; Finally, entries are also selected based on the number of active actors in the animation. Since the 
; DD filtering algorithm will progressively add actors, it's not practical to filter the set of animations
; based on the number of actors.
; 
zbfSexLabBaseEntry Function SelectRandomEntry(zbfSexLabBaseEntry[] akList, Int aiActorCount)
	If (akList[0] != None) && (aiActorCount == akList[0].NumActors)
		Return akList[0]
	EndIf

	Int[] iFoundIndex = New Int[15] ; All found entry indices are stored here, then referenced again
	Int iActive = 0
	Int i = akList.Length
	While i > 0
		i -= 1
		If (akList[i] != None) && (aiActorCount == akList[i].NumActors)
			iFoundIndex[iActive] = i
			iActive += 1
		EndIf
	EndWhile
	If iActive < 1
		Return None
	EndIf

	Debug.Trace("Entries " + iActive + " found from " + iFoundIndex)
	Return akList[iFoundIndex[Utility.RandomInt(0, iActive - 1)]]
EndFunction


Function OpenPanelGags(zbfSexLabBaseEntry akEntry, Actor[] akActors)
	If akEntry != None
		Actor[] oralActors
		Int i = akActors.Length
		While i > 0
			i -= 1
			If akEntry.HasTagForActor(i + 1, "Oral")
				oralActors = sslUtility.PushActor(akActors[i], oralActors)
			EndIf
		EndWhile
		TogglePanelGag(oralActors, insert = False)
	EndIf
EndFunction


function Logic(int threadID, bool HasPlayer)
	Int i

	sslThreadController Controller = Sexlab.ThreadSlots.GetController(threadID)
	Actor[] originalActors = Controller.Positions
	sslBaseAnimation previousAnim = Controller.Animation

	If previousAnim.HasTag("NoSwap") || previousAnim.HasTag("DeviousDevice")
		libs.Log("Animation should not be replaced. Done.")
		Return
	EndIf

	LinkZap() ; Link ZAP dynamically if not done before.

	Bool bPermitAnal = True
	Bool bPermitOral = True
	Bool bPermitVaginal = True
	Bool bPermitBoobs = True
	Bool bNoBindings = True
	int NumExtraTags = 0
	string[] ExtraTags = new String[12]
	bool UsingArmbinder = False
	i = originalActors.Length
	While i > 0
		i -= 1
		bPermitAnal = bPermitAnal && !IsBlockedAnal(originalActors[i])
		bPermitVaginal = bPermitVaginal && !IsBlockedVaginal(originalActors[i])
		bPermitBoobs = bPermitBoobs && !IsBlockedBreast(originalActors[i])
		bPermitOral = bPermitOral && !IsBlockedOral(originalActors[i])
		bNoBindings = bNoBindings && !HasArmbinder(originalActors[i])
		; This step is needed, in order to determine if the prior animation is valid (Prevent replacing valid bound anims).
		if !UsingArmbinder && HasArmbinder(originalActors[i])
			ExtraTags[NumExtraTags] = "Armbinder"
			NumExtraTags+=1
		EndIf
		; Yoke support
	EndWhile
	Bool bIsCreatureAnim = previousAnim.HasTag("Creature")
	
	libs.Log("bPermitAnal " + bPermitAnal)
	libs.Log("bPermitVaginal " + bPermitVaginal)
	libs.Log("bPermitBoobs " + bPermitBoobs)
	libs.Log("bPermitOral " + bPermitOral)
	libs.Log("bNoBindings " + bNoBindings)
	libs.Log("bIsCreatureAnim " + bIsCreatureAnim)

	; If no actor was restrained in any way we can detect, then don't change the animation.
	If bPermitAnal && bPermitVaginal && bPermitOral && bPermitBoobs && bNoBindings
		libs.Log("No sex-act-restricted actors present in this sex scene.")
		; Actors could still be wearing a panel gag that can be opened and doesn't flag as restricted ....
		OpenPanelGags(zbfSL.GetEntryByVanillaId(previousAnim.Name), originalActors)
		Return
	EndIf
	
	if IsValidAnimation(previousAnim, bPermitOral, bPermitVaginal, bPermitAnal, bPermitBoobs, numExtraTags, ExtraTags)
		libs.Log("Original animation (" + previousAnim.name + ") does not conflict. Done.")
		return
	EndIf
	NumExtraTags = 0 ; Reset.
	;branch off code to handle vanilla animations if bNoBindings is set.

	; Objective of this part of the function is to fill variables
	; actors - with all actors remaining in the sex scene
	; solos - all actors going solo
	; anims - all animations that are still available after filtering
	; 
	Actor[] actors
	Actor[] solos
	sslBaseAnimation[] anims
	If bNoBindings || bIsCreatureAnim
		libs.Log("Selecting the DD path.")
		int actorIter = 0
		int currentActorCount = originalActors.length

		while actorIter < currentActorCount
			if HasBelt(originalActors[actorIter]) && actorIter!=0
				; Can't have a belted actor pitching. Move to solo.
				libs.Log("Moving belted actor " + originalActors[actorIter].GetLeveledActorBase().GetName() + " to solos")
				solos = sslUtility.PushActor(originalActors[actorIter], solos)
			Else
				actors = sslUtility.PushActor(originalActors[actorIter], actors)
			Endif
			actorIter += 1
		EndWhile

		if actors.length == 1;  && !actors[0].WornHasKeyword(zad_DeviousDevice); Abusing belted npc? ;XXX2-SrendeVeladarius
			; Slot 0 is (almost) always the female role. Just need to rearrange actors, I think?
			if solos.length > 0
				libs.Log("Moved too many actors to Solos. Rearranging actors list.")
				actor[] tmp
				tmp = sslUtility.PushActor(solos[0], tmp)
				solos[0] = none
				tmp = sslUtility.Pushactor(actors[0], tmp)
				actors = tmp
			EndIf
		Endif

		libs.Log("Total actors: " + originalActors.length + ". Participating Actors: " + actors.length + ". Animation: " + previousAnim.name)
		anims = FindValidAnimations(controller, actors.length, previousAnim, bPermitOral, bPermitVaginal, bPermitAnal, bPermitBoobs, numExtraTags, ExtraTags)
		if anims.length <= 0
			libs.Log("No animations available! Trying fallbacks...")
		EndIf

		int workaroundID = 0
		int numWorkarounds = 2
		actor[] actorsBak = actors
		; This implementation is a workaround for papyrus not properly supporting pass-by-reference arrays.
		while anims.length <= 0 && workaroundID < numWorkarounds
			Utility.Wait(0.2)
			libs.Log("Inner loop " + workaroundID)
			actors = actorsBak
			if workaroundID == 0 && actors.length >=3
				; Try removing actors, and shuffling them to solo scenes.
				libs.Log("Trying to resize actors...")
			EndIf
			if anims.length <= 0 ; No flow-control keywords like continue/break...
				i = actors.length
				while i >= 2 && anims.length==0
					i -= 1
					libs.Log("Reduced number of actors to " + i)
					anims = FindValidAnimations(controller, i, previousAnim, bPermitOral, bPermitVaginal, bPermitAnal, bPermitBoobs, numExtraTags, ExtraTags)
				EndWhile
				if anims.length >=1
					libs.Log("Found valid animation. Rebuilding actor lists.")
					actor[] tmp
					int j = 0
					while j < actors.length
						if j < i
							tmp = sslUtility.PushActor(actors[j], tmp)
						Else
							solos = sslUtility.PushActor(actors[j], solos)
						Endif
						j += 1
					EndWhile
					actors = tmp
				EndIf
			EndIf
			workaroundID += 1
		EndWhile
	Else
		libs.Log("Selecting the ZAP path.")

		; Fetch a list of all entries
		zbfSexLabBaseEntry[] list = GetEntries(asVanillaPriorityId = previousAnim.Name)

		; Global filter on creatures
		If bIsCreatureAnim
			String[] tags = zbfSL.StrList("Creature", MiscUtil.GetActorRaceEditorID(originalActors[originalActors.Length - 1]))
			zbfSL.FilterEntries(list, 0, tags, zbfSL.StrList())
		EndIf

		; Filter tags for each actor in the original animation
		zbfSexLabBaseEntry entry
		i = 0
		While i < originalActors.Length
			FilterActor(list, originalActors[i], i + 1)
			zbfSexLabBaseEntry tempEntry = SelectRandomEntry(list, aiActorCount = (i + 1))
			If tempEntry != None
				entry = tempEntry
				libs.Log("Entry selected, " + entry.Name + ", with " + entry.NumActors + " actors.")
			EndIf

			i += 1
		EndWhile

		; Split solo actors from regular actors. If no entry was found, all actors become solo actors.
		i = 0
		If entry != None
			While i < entry.NumActors
				actors = sslUtility.PushActor(originalActors[i], actors)
				i += 1
			EndWhile
		EndIf
		While i < originalActors.Length
			solos = sslUtility.PushActor(originalActors[i], solos)
			i += 1
		EndWhile

		; If there are any actors left, and an animation was selected, define that animation and override
		If (actors.Length > 0) && (entry != None)
			anims = New sslBaseAnimation[1]
			anims[0] = zbfSL.NewAnimation("Devious Devices") ; Will auto release after animation finished playing

			; Set up animation names for all involved actors
			String[] sAnim = New String[4]
			i = actors.Length
			While i > 0
				i -= 1
				sAnim[i] = GetAnimationNameFromKeywords(entry, actors[i])
				libs.Log("Actor ["+i+"]: "+actors[i].GetLeveledActorBase().GetName())
			EndWhile

			; Set up the sslBaseAnimation to play
			zbfSL.DefineAnimationFromEntry(entry.BaseId, anims[0], "DD_ZAP_" + entry.BaseId, sAnim[0], sAnim[1], sAnim[2], sAnim[3])

			; If actors have tags "Oral", then make sure any panel gags are opened, because panel gags will not block Oral.
			OpenPanelGags(entry, originalActors)

			libs.Log("Requesting ZAP animation change to " + anims[0].Name + ".")

		ElseIf actors.Length == 0
			; Potential opportunity to reuse the Thread, so do that. Prioritize the player if possible.
			Int index = solos.Find(libs.PlayerRef)
			If index < 0
				index = 0
			EndIf

			actors = New Actor[1]
			actors[0] = solos[index]
			solos[index] = None

			; No array/list remove function
			Actor[] tmpSolos
			i = 0
			While i < solos.Length
				If solos[i] != None
					tmpSolos = sslUtility.PushActor(solos[i], tmpSolos)
				EndIf
				i += 1
			EndWhile
			solos = tmpSolos

			anims = GetSoloAnimations(actors[0])
		EndIf
	EndIf

	; Internal consistency checks; solos and actors are now selected.
	If actors.Length + solos.Length != originalActors.Length
		libs.Warn("SexLab override lost actors when assigning solo animations.")
	EndIf

	; Could not find any animations, but creatures can dry-hump. Check for dry-humping.
	; If not dry humping creatures, then terminate the animation. All actors are sent off to solos.
	If actors.Length <= 0
		If bIsCreatureAnim
			If hasPlayer
				libs.NotifyPlayer("You are being dry-humped!")
			EndIf
			libs.Log("Failed to find any valid animations. PreviousAnim has creature tag. Done.")
			Return
		Else
			libs.Log("Failed to find any valid animations. Sending off all actors to solos.")
			Controller.EndAnimation(quickly = True)
		EndIf
	EndIf

	Controller.SetForcedAnimations(anims)
	if actors.Length != originalActors.Length || solos.Length >= 1
		libs.Log("Requesting actor change to " + actors.Length + " actors.")
		i = 0
		while i < actors.Length
			libs.Log("Actor ["+i+"]: "+actors[i].GetLeveledActorBase().GetName())
			i += 1
		EndWhile
		i = 0
		while i < solos.Length
			libs.Log("Solo ["+i+"]: "+solos[i].GetLeveledActorBase().GetName())
			i += 1
		EndWhile
		Controller.ChangeActors(actors)
	Else
		Controller.SetAnimation()
	Endif
	libs.Log("Overriding animations.")
	Controller.RealignActors()

	; Process Solo Animations, if any
	;ProcessSolos(solos)
	; Optional code to use if SexLab doesn't crash.... 
	If solos.Length > 0
		Faction animatingFaction = SexLab.ActorLib.AnimatingFaction
		i = solos.Length
		While i > 0
			i -= 1
			solos[i].RemoveFromFaction(animatingFaction)
		EndWhile
		ProcessSolos(solos)
	EndIf
EndFunction


Bool Function HasBelt(Actor akActor)
	Return (akActor != None) && (akActor.WornHasKeyword(zad_DeviousDevice))
EndFunction


Bool Function HasArmbinder(Actor akActor)
	Return (akActor != None) && (akActor.WornHasKeyword(libs.zad_DeviousArmbinder))
EndFunction


sslBaseAnimation[] Function GetSoloAnimations(Actor akActor)
	sslBaseAnimation[] soloAnims
	Bool bHasBelt = HasBelt(akActor)
	Bool bHasArmbinder = HasArmbinder(akActor) ; Conservative with binding support

	String gender = "F"
	if SexLab.GetGender(akActor) == 0
		gender = "M"
	Endif

	if bHasBelt || bHasArmbinder
		libs.Log("Devious Devices solo scene.")

		soloAnims = New sslBaseAnimation[1]
		If bHasArmbinder
			soloAnims[0] = SexLab.GetAnimationObject("DDArmbinderSolo")
		Else
			soloAnims[0] = SexLab.GetAnimationObject("DDBeltedSolo")
		EndIf
	else
		libs.Log("Vanilla solo scene.")
		soloAnims = SexLab.GetAnimationsByTag(1, "Solo", "Masturbation", gender, requireAll = True)
	Endif

	Return soloAnims
EndFunction


function ProcessSolos(actor[] solos)
	int i = solos.length
	while i > 0
		i -= 1
		if solos[i] != none
			libs.Log("Starting solo scene for " + solos[i].GetLeveledActorBase().GetName())
			sslBaseAnimation[] soloAnims = GetSoloAnimations(solos[i])

			if soloAnims.length <= 0
				libs.Log("Could not find valid solo scene for " + solos[i].GetLeveledActorbase().GetName())
				libs.Notify("Could not find valid solo scene for " + solos[i].GetLeveledActorBase().GetName() + ".")
			else
				actor[] solosTmp = new actor[1] ; There must be a better way.
				solosTmp[0] = solos[i]
				SexLab.UnequipStrapon(solos[i])
				SexLab.StartSex(solosTmp, soloAnims)
			Endif
		EndIf
	EndWhile
EndFunction


Event OnAnimationStart(int threadID, bool HasPlayer)
    libs.Log("OnAnimationStart()")
    Logic(threadID, hasPlayer)
EndEvent


Event OnLeadInEnd(int threadID, bool HasPlayer)
    libs.Log("OnLeadInEnd()")
    Logic(threadID, hasPlayer)
EndEvent


Event OnAnimationChange(int threadID, bool HasPlayer)
    libs.Log("OnAnimationChange()")
    Logic(threadID, hasPlayer)
EndEvent


Function ChangeLockState(actor[] actors, bool lockState)
	int i = actors.length
	while i > 0
		i -= 1
	 	if HasBelt(actors[i]) || StorageUtil.GetFloatValue(actors[i], "zad.StoredExposureRate", 0.0) >= 1; Avoid potential race-condition
			string 	tmp
			float exposureRate = 0
			if !lockState
				tmp = "Unlocked"
				exposureRate = 	libs.GetModifiedRate(actors[i])
				SexLab.Stats.SetFloat(actors[i], "LastSex.GameTime", StorageUtil.GetFloatValue(actors[i], "zad.GameTimeLock"))
				SexLab.Stats.SetFloat(actors[i], "LastSex.RealTime", StorageUtil.GetFloatValue(actors[i], "zad.RealTimeLock"))
				StorageUtil.UnsetFloatValue(actors[i], "zad.GameTimeLock")
				StorageUtil.UnsetFloatValue(actors[i], "zad.RealTimeLock")
			else
				tmp = "Locked"
				StorageUtil.SetFloatValue(actors[i], "zad.RealTimeLock", Sexlab.Stats.GetFloat(actors[i], "LastSex.RealTime"))
				StorageUtil.SetFloatValue(actors[i], "zad.GameTimeLock", Sexlab.Stats.GetFloat(actors[i], "LastSex.GameTime"))
				exposureRate = 0
			Endif
			libs.Log("" + tmp + " arousal for actor " + actors[i].GetLeveledActorBase().GetName())
			Aroused.SetActorExposureRate(actors[i], exposureRate)
		Endif
	EndWhile
EndFunction


Event OnOrgasmStart(int threadID, bool HasPlayer)
	actor[] actors = Sexlab.ThreadSlots.GetController(threadID).Positions
	if CountBeltedActors(actors) <= 0
	 	return
	endif
	libs.Log("OnOrgasmStart()")
	ChangeLockState(actors, true)
EndEvent


Function RefreshBlindfoldState(actor[] actors)
	int i = actors.length
	while i > 0
		i -= 1
		if actors[i] == libs.PlayerRef && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBlindfold)
			game.ForceFirstPerson()
			game.ForceThirdPerson()
		EndIf
	EndWhile
EndFunction


Event OnAnimationEnd(int threadID, bool HasPlayer)
	libs.Log("OnAnimationEnd()")
	sslThreadController Controller = Sexlab.ThreadSlots.GetController(threadID)
	actor[] actors = controller.Positions
	sslBaseAnimation previousAnim = controller.Animation
	int numBeltedActors = CountBeltedActors(controller.Positions)
	if previousAnim.name == "DDArmbinderSolo" && actors.length == 1
		if actors[0]!=libs.PlayerRef
			libs.NotifyNPC(actors[0].GetLeveledActorbase().GetName() + " ceases her efforts, looking both frustrated and aroused.")
		else
			libs.NotifyPlayer("With a sigh, you realize that this is futile. You cannot possibly reach yourself, bound as you are. Your struggle has left you feeling even more aroused than when you began.", true)
		Endif
	EndIf
	If (numBeltedActors > 0) && previousAnim.name=="DDBeltedSolo" && actors.length==1
		if actors[0]!=libs.PlayerRef
			libs.NotifyNPC(actors[0].GetLeveledActorbase().GetName() + " ceases her efforts, looking both frustrated and aroused.")
		else
			libs.NotifyPlayer("With a sigh, you realize that this is futile. You cannot fit even a single finger beneath the cruel embrace of the belt. Your struggle has left you feeling even more aroused than when you began.", true)
		Endif
	Endif
	if previousAnim.HasTag("Aggressive")
		TogglePanelGag(actors, true)
	EndIf
	RetrieveArmbinders(actors)
	RefreshBlindfoldState(actors)
	Utility.Wait(5)
	ChangeLockState(actors, false)
EndEvent


function RelieveSelf()
    libs.Log("RelieveSelf()")
    sslBaseAnimation[] anims = SexLab.GetAnimationsByTag(1, "Solo", "Masturbation", "F", requireAll=true)
    if anims.length <=0
        libs.Warn("No masturbation animations available. Skipping scene.")
    else
        actor[] actors = new actor[1]
        actors[0] = libs.PlayerRef
        SexLab.StartSex(actors, anims)
    endif
    SetStage(100)
EndFunction


Event OnSleepStop(bool abInterrupted)
	libs.Log("OnSleepStop()")
	if abInterrupted
		return
	EndIf
	actor akActor = libs.PlayerRef
	if !HasBelt(akActor)
		return
	Endif
	int arousal = Aroused.GetActorExposure(akActor)
	int chance = 5
	Message tmp
	if arousal >= libs.ArousalThreshold("Desperate")
		chance += 45
		tmp = zad_eventSleepStopDesperate
	elseIf arousal >= libs.ArousalThreshold("Horny")
		chance += 25
		tmp = zad_eventSleepStopHorny
	elseIf arousal >= libs.ArousalThreshold("Desire")
		chance += 10
		tmp = zad_eventSleepStopDesire
	else
		tmp = zad_eventSleepStopContent
	Endif
	; if Utility.RandomInt() <= libs.config.BaseMessageChance
	; 	tmp.Show()
	; EndIf
	tmp.Show()
	libs.PlayThirdPersonAnimation(akActor, libs.AnimSwitchKeyword(akActor, libs.zad_DeviousArmbinder, libs.ddZazaparmbzad03, DDZazhornyA), utility.RandomInt(5,9))
EndEvent
