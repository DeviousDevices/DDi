Scriptname zadBoundCombatScript Extends Quest Hidden

;
; A huge thanks to Cedec0 for both the animations, and the logic powering armbinder combat.
;

zadLibs Property libs Auto
zadConfig Property config Auto

; AI Objects
Package Property NPCBoundCombatPackage Auto
Package Property NPCBoundCombatPackageSandbox Auto
Spell Property ArmbinderDebuff Auto

;Arm AA
int Property ABC_ModID Auto
int Property ABC_CRC Auto

int Property ABC_h2heqp Auto
int Property ABC_h2hidle Auto
int Property ABC_h2hatkpow Auto
int Property ABC_h2hatk Auto
int Property ABC_h2hstag Auto
int Property ABC_jump Auto
int Property ABC_sneakmt Auto
int Property ABC_sneakidle Auto
int Property ABC_sprint Auto

int Property ABC_shout Auto
int Property ABC_mtx Auto
int Property ABC_mt Auto
int Property ABC_mtturn Auto
int Property ABC_mtidle Auto

;Hobble AA
int Property HBC_ModID Auto
int Property HBC_CRC Auto

int Property HBC_h2heqp Auto
int Property HBC_h2hidle Auto
int Property HBC_h2hatkpow Auto
int Property HBC_h2hatk Auto
int Property HBC_h2hstag Auto
int Property HBC_jump Auto
int Property HBC_sneakmt Auto
int Property HBC_sneakidle Auto
int Property HBC_sprint Auto

int Property HBC_shout Auto
int Property HBC_mtx Auto
int Property HBC_mt Auto
int Property HBC_mtturn Auto
int Property HBC_mtidle Auto


Function UpdateValues() 
	ABC_ModID = FNIS_aa.GetAAModID("abc", "DeviousDevices", Config.LogMessages) 
	ABC_h2heqp = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2heqp(), "DeviousDevices",Config.LogMessages)
	ABC_h2hidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hidle(), "DeviousDevices",Config.LogMessages)
	ABC_h2hatkpow = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatkpow(), "DeviousDevices",Config.LogMessages)
	ABC_h2hatk = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatk(), "DeviousDevices",Config.LogMessages)
	ABC_h2hstag = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hstag(), "DeviousDevices",Config.LogMessages)
	ABC_jump = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._jump(), "DeviousDevices",Config.LogMessages)
	ABC_sneakmt = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakmt(), "DeviousDevices",Config.LogMessages)
	ABC_sneakidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakidle(), "DeviousDevices",Config.LogMessages)
	ABC_sprint = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sprint(), "DeviousDevices",Config.LogMessages)
	ABC_shout = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._shout(), "DeviousDevices",Config.LogMessages)
	ABC_mtx = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._mtx(), "DeviousDevices",Config.LogMessages)
	ABC_mt = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._mt(), "DeviousDevices",Config.LogMessages)
	ABC_mtturn = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._mtturn(), "DeviousDevices",Config.LogMessages)
	ABC_mtidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._mtidle(), "DeviousDevices",Config.LogMessages)
	
	HBC_ModID = FNIS_aa.GetAAModID("hbc", "DeviousDevices", Config.LogMessages) 
	HBC_h2heqp = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._h2heqp(), "DeviousDevices",Config.LogMessages)
	HBC_h2hidle = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._h2hidle(), "DeviousDevices",Config.LogMessages)
	HBC_h2hatkpow = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._h2hatkpow(), "DeviousDevices",Config.LogMessages)
	HBC_h2hatk = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._h2hatk(), "DeviousDevices",Config.LogMessages)
	HBC_h2hstag = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._h2hstag(), "DeviousDevices",Config.LogMessages)
	HBC_jump = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._jump(), "DeviousDevices",Config.LogMessages)
	HBC_sneakmt = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._sneakmt(), "DeviousDevices",Config.LogMessages)
	HBC_sneakidle = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._sneakidle(), "DeviousDevices",Config.LogMessages)
	HBC_sprint = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._sprint(), "DeviousDevices",Config.LogMessages)
	HBC_shout = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._shout(), "DeviousDevices",Config.LogMessages)
	HBC_mtx = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._mtx(), "DeviousDevices",Config.LogMessages)
	HBC_mt = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._mt(), "DeviousDevices",Config.LogMessages)
	HBC_mtturn = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._mtturn(), "DeviousDevices",Config.LogMessages)
	HBC_mtidle = FNIS_aa.GetGroupBaseValue(HBC_ModID, FNIS_aa._mtidle(), "DeviousDevices",Config.LogMessages)
EndFunction


Function CONFIG_ABC()
	libs.log("Config_ABC()")
	ABC_CRC = FNIS_aa.GetInstallationCRC()
	if ( ABC_CRC != 0 )
		libs.Log("Initializing ABC values...")
		UpdateValues()
	endif
EndFunction


Function Maintenance_ABC()
	libs.Log("Maintenance_ABC()")
	int current_crc = FNIS_aa.GetInstallationCRC()
	if ( current_crc != ABC_CRC || libs.GetVersion() < 3 || ABC_h2heqp == 0)
		libs.log("Refreshing ABC values...")
		UpdateValues()
		ABC_CRC = current_crc
	endif
EndFunction


;INTERNAL UTILITIES


bool Function HasCompatibleDevice(actor akActor)
	return (akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage) || (akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirt) && !akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirtRelaxed)))
EndFunction


Int Function GetPrimaryAAState(actor akActor)
	If akActor.WornHasKeyword(libs.zad_DeviousCuffsFront)
		return 5	; Wearing frontcuffs
	ElseIf akActor.WornHasKeyword(libs.zad_DeviousYokeBB)
		return 4	; Wearing BByoke
	Elseif akActor.WornHasKeyword(libs.zad_DeviousArmBinderElbow)
		return 3	; Wearing elbowbinder
	ElseIf akActor.WornHasKeyword(libs.zad_DeviousYoke)
		return 2	; Wearing yoke
	ElseIf akActor.WornHasKeyword(libs.zad_DeviousArmBinder)
		return 1	; Wearing armbinder
	ElseIf akActor.WornHasKeyword(libs.zad_DeviousStraitJacket)
		return 1	; Wearing straightjacket
	Else
		return 0	; No primary AA modifiers
	Endif
EndFunction


Int Function GetSecondaryAAState(actor akActor)
	If akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirt) && !akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirtRelaxed)
		return 1	; Wearing hobble skirt
	Else
		return 0	; No secondary AA modifiers
	Endif
EndFunction


Int Function SelectAnimationSet(actor akActor)
	int animSet;
	int AAStateA = GetPrimaryAAState(akActor)
	int AAStateB = GetSecondaryAAState(akActor)
	If AAStateB == 1 ; Hobble subset
		if AAStateA == 1
			animSet = 1 ; Armbinder animation
		elseIf AAStateA == 2
			animSet = 2 ; Yoke animations
		elseIf AAStateA == 3
			animSet = 3 ; Elbowbinder animations
		elseIf AAStateA == 4
			animSet = 4 ; BBYoke animations
		elseIf AAStateA == 5
			animSet = 5 ; FrontCuffs animations
		elseIf AAStateA == 0
			animSet = 0 ; Only hobble restraints
		else
			animSet = 1 ; Unsupported device type.
			libs.Warn("Equipped binding is incompatible with bound combat. Could not determine appropriate animation set. Defaulting to Armbinder Animations.")
		endIf
	Else
		if AAStateA == 1
			animSet = 0 ; Armbinder animation
		elseIf AAStateA == 2
			animSet = 1 ; Yoke animations
		elseIf AAStateA == 3
			animSet = 2 ; Elbowbinder animations
		elseIf AAStateA == 4
			animSet = 3 ; BBYoke animations
		elseIf AAStateA == 5
			animSet = 4 ; FrontCuffs animations
		elseIf AAStateA == 0
			animSet = -1 ; No bound animations
		else
			animSet = 0 ; Unsupported device type
			libs.Warn("Equipped binding is incompatible with bound combat. Could not determine appropriate animation set. Defaulting to Armbinder Animations.")
		endIf
	Endif
	return animSet
EndFunction


;API FUNCTIONS
;These can be called by external sources to apply or remove animations
;EvaluateAA automatically chooses the correct animation set or reverts to default (including compatible AA mods, if applicable) based on equipped devices


Function EvaluateAA(actor akActor)
;This function automatically executes the application and removal of FNIS Alternate Animations

	libs.log("EvaluateAA(" + akActor + ")")
	
	libs.UpdateControls()

	If !HasCompatibleDevice(akActor)
		libs.log("EvaluateAA: Reverting to unbound AA")
		ClearAA(akActor)
		ResetExternalAA(akActor)
	Else
		libs.log("EvaluateAA: Applying animSet = " + animSet + ", animState = " + animState)
		ClearAA(akActor)
		int animState = GetSecondaryAAState(akActor)
		int animSet = SelectAnimationSet(akActor)
		if animState == 1
			FNIS_aa.SetAnimGroup(akActor, "_h2heqp", HBC_h2heqp, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hidle", HBC_h2hidle, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", HBC_h2hatkpow, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hatk", HBC_h2hatk, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hstag", HBC_h2hstag, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_jump", HBC_jump, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_sneakmt", HBC_sneakmt, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_sneakidle", HBC_sneakidle, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_sprint", HBC_sprint, animSet, "DeviousDevices", Config.LogMessages)

			FNIS_aa.SetAnimGroup(akActor, "_shout", HBC_shout, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mtx", HBC_mtx, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mt", HBC_mt, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mtturn", HBC_mtturn, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mtidle", HBC_mtidle, animSet, "DeviousDevices", Config.LogMessages)
			;akActor.SetAnimationVariableInt("FNIS_hbc_h2h_LocomotionPose", animSet + 1)
		else
			FNIS_aa.SetAnimGroup(akActor, "_h2heqp", ABC_h2heqp, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hidle", ABC_h2hidle, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", ABC_h2hatkpow, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hatk", ABC_h2hatk, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_h2hstag", ABC_h2hstag, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_jump", ABC_jump, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_sneakmt", ABC_sneakmt, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_sneakidle", ABC_sneakidle, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_sprint", ABC_sprint, animSet, "DeviousDevices", Config.LogMessages)

			FNIS_aa.SetAnimGroup(akActor, "_shout", ABC_shout, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mtx", ABC_mtx, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mt", ABC_mt, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mtturn", ABC_mtturn, animSet, "DeviousDevices", Config.LogMessages)
			FNIS_aa.SetAnimGroup(akActor, "_mtidle", ABC_mtidle, animSet, "DeviousDevices", Config.LogMessages)
			akActor.SetAnimationVariableInt("FNIS_abc_h2h_LocomotionPose", animSet + 1)
		endif
	EndIf
EndFunction

Function ClearAA(actor akActor)
;This function forcibly reverts animations to the vanilla state
;On its own it is used in transitions between different animation sets
;In order to revert to animations from compatible AA mods, remember to use ResetExteralAA() afterwards

	FNIS_aa.SetAnimGroup(akActor, "_h2heqp", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hidle", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatk", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hstag", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_jump", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sneakmt", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sneakidle", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sprint", 0, 0, "DeviousDevices", Config.LogMessages)

	FNIS_aa.SetAnimGroup(akActor, "_shout", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_mtx", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_mt", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_mtturn", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_mtidle", 0, 0, "DeviousDevices", Config.LogMessages)
	akActor.SetAnimationVariableInt("FNIS_abc_h2h_LocomotionPose", 0)
EndFunction


Function ResetExternalAA(actor akActor)
;This function handles compatibility with other mods utilising AA
;In lieu of a centralised framework these have to be added on a case by case basis
	if (akActor == libs.playerRef)		
		; try to reset FNIS mods if they are installed, as the AA will not get reset back to using the ones picked in FNIS otherwise.
		if Game.GetModByName("FNIS_PCEA2.esp") != 255
			SendModEvent("PCEA2Task", "refresh")
		Endif
		if Game.GetModByName("FNISSexyMove.esp") != 255
			; nothing to do for guy characters
			If libs.playerref.GetLeveledActorBase().GetSex() != 1
				return
			Endif
			FNISSMConfigMenu FNISSM = Game.GetFormFromFile(0x000012C7, "FNISSexyMove.esp") As FNISSMConfigMenu
			int SM = FNISSM.FNISSMquest.iSMplayer
			if SM == 0
				FNIS_aa.SetAnimGroup(Game.GetPlayer(), "_mt", 0, 0, "FNIS Sexy Move", true)
				FNIS_aa.SetAnimGroup(Game.GetPlayer(), "_mtx", 0, 0, "FNIS Sexy Move", true)
			else
				if FNISSM.FNISSMquest.FNISs3ModID >= 0 && FNISSM.FNISSMquest.SM360 ; 360 pack installed and activated
					FNIS_aa.SetAnimGroup(Game.GetPlayer(), "_mt", FNISSM.FNISSMquest.FNISs3MtBase, SM - 1, "FNIS Sexy Move(360)", true)
					FNIS_aa.SetAnimGroup(Game.GetPlayer(), "_mtx", FNISSM.FNISSMquest.FNISs3MtxBase, SM - 1, "FNIS Sexy Move(360)", true)
				else
					FNIS_aa.SetAnimGroup(Game.GetPlayer(), "_mt", FNISSM.FNISSMquest.FNISsmMtBase, SM - 1, "FNIS Sexy Move", true)
					FNIS_aa.SetAnimGroup(Game.GetPlayer(), "_mtx", FNISSM.FNISSMquest.FNISsmMtxBase, SM - 1, "FNIS Sexy Move", true)
				endif
			endif
		Endif
	EndIf
EndFunction


;NPC MANAGEMENT
;These are all the hacky measures we use to pretend that NPCs can use our devices... if they feel like it


Function Apply_NPC_ABC(actor akActor)
	libs.Log("Apply_NPC_ABC( " + akActor.GetLeveledActorBase().GetName() + ", UnarmedDamage: " + akActor.GetActorValue("UnarmedDamage") + " )")
	; ActorUtil.AddPackageOverride(akActor, NPCBoundCombatPackageSandbox, 100)
	StorageUtil.FormListAdd(libs.zadNPCQuest, "BoundCombatActors", akActor, true)
	ActorUtil.AddPackageOverride(akActor, NPCBoundCombatPackage, 100)
	akActor.AddSpell(ArmbinderDebuff)
EndFunction


Function Remove_NPC_ABC(actor akActor)
	libs.Log("Removing NPC Bound Combat Package")
	akActor.RemoveSpell(ArmbinderDebuff)
	ActorUtil.RemovePackageOverride(akActor, NPCBoundCombatPackage)
	StorageUtil.FormListRemove(libs.zadNPCQuest, "BoundCombatActors", akActor, true)
EndFunction


Function CleanupNPCs()
	int i = StorageUtil.FormListCount(libs.zadNPCQuest, "BoundCombatActors")
	while (i > 0)
		i = i - 1
		Actor akActor = StorageUtil.FormListGet(libs.zadNPCQuest, "BoundCombatActors", i) as Actor
		if !akActor
			StorageUtil.FormListRemoveAt(libs.zadNPCQuest, "BoundCombatActors", i)
		ElseIf libs.IsValidActor(akActor) && !akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage)
			Remove_NPC_ABC(akActor)
		EndIf
	EndWhile
EndFunction


;OLD FUNCTIONS, no longer used as of version 3.4.0
;Only EvaluateAA should be used directly, Apply_ABC and Remove_ABC no longer have independent functionality and should be considered depreciated


Function Apply_ABC(actor akActor)
	libs.log("Apply_ABC(akActor) is depreciated, please use EvaluateAA(akActor) instead!")
	EvaluateAA(akActor)
EndFunction


Function Remove_ABC(actor akActor)
	libs.log("Remove_ABC(akActor) is depreciated, please use EvaluateAA(akActor) instead!")
	EvaluateAA(akActor)
EndFunction


Function Apply_HBC(actor akActor)
	libs.log("Apply_HBC(akActor) is depreciated, please use EvaluateAA(akActor) instead!")
	EvaluateAA(akActor)
EndFunction


Function Remove_HBC(actor akActor)
	libs.log("Remove_HBC(akActor) is depreciated, please use EvaluateAA(akActor) instead!")
	EvaluateAA(akActor)
EndFunction