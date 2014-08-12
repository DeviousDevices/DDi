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

bool Property FirstRun = True Auto ; Don't initialize until the game is reloaded.
bool Property Tainted Auto ; Not going to offer support for tainted installations.
string[] Property Registry Auto

function Shutdown(bool silent=false)
    ; this is not finished yet.
    UnregisterForAllModEvents()
    if !silent
        Debug.Notification("Devious Devices has completed shutting down. It is now safe-ish to uninstall. (Note: If you have npc's wearing the belt, be sure to remove it from them prior to uninstall! This is not tracked internally at the moment).")
    EndIf
EndFunction

Function Maintenance()
	; benchmark.SetupBenchmarks()
	float curVersion = libs.GetVersion()
	if FirstRun
		libs.Log("New game detected: Not finishing initialization.")
		FirstRun = False
		return
	EndIf
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
	if !libs.PlayerRef.WornHasKeyword(libs.zad_DeviousArmbinder)
		abq.EnableStruggling()
	EndIf
	VersionChecks()
	; Start up periodic events system
	libs.EventSlots.Initialize()
	libs.EventSlots.Maintenance()
	; Check to see if bound anims are available.
	libs.CheckForBoundAnims()
	if !libs.DevicesUnderneath.IsRunning() && libs.config.DevicesUnderneathEnabled
		libs.DevicesUnderneath.Start()
	EndIf
	; ResetAnimCache()
	If regDevices
		libs.RegisterDevices() ; Might take a while, do it last
	EndIf
EndFunction


Function ResetAnimCache()
	int i = Registry.Length
	while i > 0
		i -= 1
		StorageUtil.FormListClear(None, GetCacheStr(i))
	EndWhile
	Registry = new string[125]
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
	CheckCompatibility("Zaz Animation Pack", 555, zbfUtil.GetVersion())
	CheckCompatibility("Aroused", 20140124, Aroused.GetVersion())
	CheckCompatibility("Sexlab", 15400, SexlabUtil.GetVersion())
	libs.Log("[ Third Party Mod Compatibility Checks ]")
	; ...
	libs.Log("[ Sanity Checks ]")
	string status = "OK"
	if Tainted
		status="FAIL"
	EndIf
	libs.Log("Verifying that installation is untainted by an unsupported upgrade: "+status)
	status="OK"
	libs.Log("Okay seriously, I'm going to make fun of you if you post the following as an error. This is not an error, it is a check to ensure that you're not running the obsolete .esp.")
	bool obsoleteEspInstalled = (game.GetFormFromFile(0x0000F624, "Devious Devices - Integration.esp") != none)
	libs.Log("Okay seriously, I'm going to make fun of you if you post the above as an error. This is not an error, it is a check to ensure that you're not running the obsolete .esp.")
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


bool Function IsValidAnimation(sslBaseAnimation anim, bool permitOral, bool permitVaginal, bool permitAnal, bool permitBoobjob, bool isBound, int numExtraTags, string[] ExtraTags)
	if anim.HasTag("DeviousDevice")
		return true
	elseif (permitBoobjob || !anim.HasTag("Boobjob")) &&(permitVaginal || (!anim.HasTag("Vaginal") && !anim.HasTag("Fisting") && !anim.HasTag("Masturbation"))) && (permitAnal || !anim.HasTag("Anal")) && (permitOral || !anim.HasTag("Oral")) && (!isBound || anim.hasTag("Bound")) && !anim.HasTag("Estrus") ; Estrus Chaurus compatibility
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

String Function GetCacheStr(int i)
	return "zadCache_"+i
EndFunction

string Function BuildRegistryStr(int numActors, bool permitOral, bool permitVaginal, bool permitAnal, bool permitBoobjob, int numBoundActors, int NumExtraTags, string[] ExtraTags)
	string ret = ("zadCachedAnims_"+numActors+"_"+permitOral+"_"+permitVaginal+"_"+permitAnal+"_"+permitBoobjob+"_"+numBoundActors+"__" as String)
	int i = 0
	while i < numExtraTags
		ret += "_"+ExtraTags[i]
		i+=1
	EndWhile
	return ret
EndFunction


sslBaseAnimation[] function FindValidAnimations(sslThreadController controller, int numActors, sslBaseAnimation previousAnim, bool permitOral, bool permitVaginal, bool permitAnal, bool permitBoobjob, int numBoundActors, int NumExtraTags, string[] ExtraTags)
	; It is my understanding that these arrays will only contain references. Assuming this works similarly
	; to C (As is my current understanding), each reference will not take up much memory (4ish bytes per
	; reference) Thus, storing it like this, while not optimal, will not require further change, and
	; will permit me to easily debug this.
	; What I wouldnt do for a 2d array, or a dict...

	If zbf == None
		zbf = zbfUtil.GetMain()
	EndIf

	; Special Cases
	; Two Actors, both wearing Armbinders
	if numActors == numBoundActors == 2
		ExtraTags[numExtraTags] = "SubSub"
		numExtraTags+=1
	; One actor, bound. Don't use both-bound anims.
	ElseIf numBoundActors == 1
		ExtraTags[numExtraTags] = "DomSub"
		numExtraTags+=1
	EndIf

	; string cache = BuildRegistryStr(numActors, permitOral, permitVaginal, permitAnal, permitBoobjob, numBoundActors, NumExtraTags, ExtraTags)
	; Registry.find(cache)

	sslBaseAnimation[] allAnims = SexLab.AnimSlots.Animations
	int totalAnims = SexLab.AnimSlots.Slotted
	if previousAnim.HasTag("Creature")
		allAnims = SexLab.CreatureSlots.GetByRace(numActors, Controller.positions[(Controller.positions.Length - 1)].GetRace())
		totalAnims = allAnims.Length
	EndIf
	sslBaseAnimation[] chastityAnims
	sslBaseAnimation[] aggroAnims
	sslBaseAnimation[] foreplayAnims
	sslBaseAnimation[] boundAnims
	int i = totalAnims
	bool isBound = (numBoundActors > 0)
	If isBound
		ExtraTags[numExtraTags] = zbf.GetSexLabBoundTag(zbf.iBindArmbinder) ; Conservatively assume only armbinder support atm.
		numExtraTags += 1
	EndIf

	while i >0 ; Filter out chastity-unfriendly animations
		i -= 1
		;            if SexLab.AnimSlots.Searchable(previousAnim) && numActors==allAnims[i].ActorCount() && IsValidAnimation(allAnims[i])
		if allAnims[i].enabled && allAnims[i].registered && numActors==allAnims[i].PositionCount && IsValidAnimation(allAnims[i], permitOral, permitVaginal, permitAnal, permitBoobjob, isBound, NumExtraTags, ExtraTags)
			if allAnims[i].HasTag("Aggressive")
				aggroAnims = sslUtility.PushAnimation(allAnims[i], aggroAnims)
			EndIf
			if allAnims[i].HasTag("Foreplay")
				foreplayAnims = sslUtility.PushAnimation(allAnims[i], foreplayAnims)
			else
				chastityAnims = sslUtility.PushAnimation(allAnims[i], chastityAnims)
			EndIf
			if allAnims[i].HasTag("Bound")
				boundAnims = sslUtility.PushAnimation(allAnims[i], boundAnims)
			EndIf
		Endif
	EndWhile

	libs.Log("FindValidAnimations(numActors="+numActors+", previousAnim="+previousAnim.name+ ", permitOral="+permitOral+", permitVaginal="+permitVaginal+",permitAnal="+permitAnal+", isBound="+isBound+")")
	libs.Log("Sexlab Animations Available (Chastity): " + chastityAnims.length + "/" + totalAnims + "(" + GetAnimationNames(chastityAnims) + ")")
	libs.Log("Sexlab Animations Available (Aggressive): " + aggroAnims.length + "/" + totalAnims + "(" + GetAnimationNames(aggroAnims) + ")")
	libs.Log("Sexlab Animations Available (Foreplay): " + foreplayAnims.length + "/" + totalAnims + "(" + GetAnimationNames(foreplayAnims) + ")")
	libs.Log("Sexlab Animations Available (Bound): " +boundAnims.length + "/" + totalAnims + "(" + GetAnimationNames(boundAnims) + ")")

	If isBound && boundAnims.length > 0
		libs.log("Using only bound animation list.")
		return boundAnims
	Elseif previousAnim!=none && previousAnim.HasTag("foreplay") && foreplayAnims.length>=1
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


int function CountBoundActors(actor[] actors)
	int ret = 0
	int i = actors.length
	while i > 0
		i -= 1
		if libs.IsBound(actors[i])
			ret += 1
		EndIf
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

function Logic(int threadID, bool HasPlayer)
	sslThreadController Controller = Sexlab.ThreadSlots.GetController(threadID)
	actor[] originalActors = Controller.Positions
	sslBaseAnimation previousAnim = Controller.Animation

	If previousAnim.HasTag("NoSwap")
		libs.Log("Animation should not be replaced. Done.")
		Return
	EndIf

	If zbf == None
		zbf = zbfUtil.GetMain()
	EndIf

	int numBeltedActors = CountRestrictedActors(originalActors, libs.zad_PermitVaginal, libs.zad_DeviousBelt)
	int numAnalBeltedActors = CountRestrictedActors(originalActors, libs.zad_PermitAnal, libs.zad_DeviousBelt)
	int numGaggedActors = CountRestrictedActors(originalActors, libs.zad_PermitOral, libs.zad_DeviousGag)
	int numBoundActors = CountBoundActors(originalActors)
	int numBraedActors = CountRestrictedActors(originalActors, None, libs.zad_DeviousBra)
	if numGaggedActors > 0
		int tmp = CountRestrictedActors(originalActors, libs.zad_DeviousGagPanel, libs.zad_DeviousGag)
		if  tmp < numGaggedActors
			numGaggedActors = tmp
		EndIf
	EndIf

	if previousAnim.HasTag("Oral")
		TogglePanelGag(originalActors, false)
	EndIf
	if (numBeltedActors + numBraedActors + numGaggedActors + numBoundActors) <=0
		libs.Log("No sex-act-restricted actors present in this sex scene. Done.")
		return
	Endif

	bool permitOral = (numGaggedActors==0)
	bool permitVaginal = (numBeltedActors==0)
	bool permitAnal = (numAnalBeltedActors==0)
	bool permitBoobjob = (numBraedActors==0)
	bool isBound = (numBoundActors > 0)
	int NumExtraTags = 0
	string[] ExtraTags = new String[12]

	if isBound && (!libs.BoundAnimsAvailable || !libs.config.useBoundAnims)
		libs.Log("One or more actors were bound, but there are no bound animations available. Removing armbinder(s).")
		StoreArmbinders(originalActors)
		isBound = False
		numBoundActors = 0
	EndIf

	If isBound
		ExtraTags[numExtraTags] = zbf.GetSexLabBoundTag(zbf.iBindArmbinder) ; Conservatively assume only armbinder support atm.
		numExtraTags += 1
	EndIf

	if IsValidAnimation(previousAnim, permitOral, permitVaginal, permitAnal, permitBoobjob, isBound, numExtraTags, ExtraTags) ; && numRestrictedActors != originalActors.length  ; XXX1-SerendeVeladarius
		libs.Log("Original animation (" + previousAnim.name + ") does not conflict. Done.")
		return
	EndIf

	actor[] actors
	actor[] solos
	int actorIter = 0
	int currentActorCount = originalActors.length

	while actorIter < currentActorCount
		if originalActors[actorIter].WornHasKeyword(zad_DeviousDevice) && actorIter!=0
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
	sslBaseAnimation[] anims = FindValidAnimations(controller, actors.length, previousAnim, permitOral, permitVaginal, permitAnal, permitBoobjob, numBoundActors, numExtraTags, ExtraTags)
	if anims.length <= 0
		libs.Log("No animations available! Trying fallbacks...")
	EndIf

	int workaroundID = 0
	int numWorkarounds = 2
	actor[] actorsBak = actors
	; This implementation is a workaround for papyrus not properly supporting pass-by-reference arrays.
	while anims.length <= 0 && workaroundID < numWorkarounds
		actors = actorsBak
		if workaroundID == 0 && actors.length >=3
			; Try removing actors, and shuffling them to solo scenes.
			libs.Log("Trying to resize actors...")
		EndIf
		if workaroundID == 1 && isBound ; No anims, while bound.
			; Still no animations, after resizing actors. Drop armbinders, and try again.
			libs.Log("Removing armbinders, Trying to resize actors...")
			StoreArmbinders(actors)
			numBoundActors = 0
			isBound = False
			anims = FindValidAnimations(controller, actors.length, previousAnim, permitOral, permitVaginal, permitAnal, permitBoobjob, numBoundActors, numExtraTags, ExtraTags)
		EndIf
		if anims.length <= 0 ; No flow-control keywords like continue/break...
			int i = actors.length
			while i >= 2 && anims.length==0
				i -= 1
				libs.Log("Reduced number of actors to " + i)
				anims = FindValidAnimations(controller, i, previousAnim, permitOral, permitVaginal, permitAnal, permitBoobjob, numBoundActors, numExtraTags, ExtraTags)
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

	if anims.length <= 0
		if previousAnim.HasTag("Creature")
			If hasPlayer
				libs.NotifyPlayer("You are being dry-humped!")
			EndIf
			libs.Log("Failed to find any valid animations. PreviousAnim has creature tag. Done.")
			return
		Else
			libs.Error("Failed to find any valid animations. Aborting.")
			Controller.EndAnimation(quickly=true)
		EndIf
	Endif

	Controller.SetForcedAnimations(anims)
	if actors.length != originalActors.length || solos.length >= 1
		libs.Log("Requesting actor change to " + actors.length + " actors.")
		int i = 0
		while i < actors.length
			libs.Log("Actor ["+i+"]: "+actors[i].GetLeveledActorBase().GetName())
			i += 1
		EndWhile
		Controller.ChangeActors(actors)
	Else
		Controller.SetAnimation()
	Endif
	libs.Log("Overriding animations.")
	Controller.RealignActors()
	; Process Solo Animations, if any
	ProcessSolos(solos)
EndFunction


; Pass by reference isn't working. Verify that it actually works like this, as per papyrus docs...
function testArrayRef(int[] to)
	int i = 0
	while i < to.length
		to[i] = i * i
		i += 1
	EndWhile
EndFunction


function ProcessSolos(actor[] solos)
	int i = solos.length
	while i > 0
		i -= 1
		if solos[i] != none
			libs.Log("Starting solo scene for " + solos[i].GetLeveledActorBase().GetName())
			sslBaseAnimation[] soloAnims
			string gender = "F"
			if SexLab.GetGender(solos[i]) == 0
				gender = "M"
			Endif
				if solos[i].WornHasKeyword(zad_DeviousDevice)
					soloAnims = SexLab.GetAnimationsByTag(1, "Solo", "F", "DeviousDevice", requireAll=true)
				else
					soloAnims = SexLab.GetAnimationsByTag(1, "Solo", "Masturbation", gender, requireAll=true)
				Endif
				if soloAnims.length <=0
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
	 	if actors[i].WornHasKeyword(zad_DeviousDevice) || StorageUtil.GetFloatValue(actors[i], "zad.StoredExposureRate", 0.0) >= 1; Avoid potential race-condition
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
	if (numBeltedActors > 0) && previousAnim.name=="DDBeltedSolo" && actors.length==1
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
	if !akActor.WornHasKeyword(zad_DeviousDevice)
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

