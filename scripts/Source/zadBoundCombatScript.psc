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
zbfConfig Property zbfc Auto

int Property ABC_ModID Auto
int Property ABC_h2heqp Auto
int Property ABC_h2hidle Auto
int Property ABC_h2hatkpow Auto
int Property ABC_h2hatk Auto
int Property ABC_h2hstag Auto
int Property ABC_jump Auto
int Property ABC_sneakmt Auto
int Property ABC_sneakidle Auto
int Property ABC_sprint Auto
int Property ABC_CRC Auto

Function CONFIG_ABC()
	libs.log("Config_ABC()")
	ABC_CRC = FNIS_aa.GetInstallationCRC()
	if ( ABC_CRC != 0 )
		libs.Log("Initializing ABC values...")
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
	endif
EndFunction


Function Maintenance_ABC()
	libs.Log("Maintenance_ABC()")
	if (!zbfc)
		zbfc = zbfUtil.GetConfig()
	EndIf
	int current_crc = FNIS_aa.GetInstallationCRC()
	if ( current_crc != ABC_CRC )
		libs.log("Refreshing ABC values...")
		ABC_ModID = FNIS_aa.GetAAModID("abc", "DeviousDevices", Config.LogMessages) ; true during test only
		ABC_h2heqp = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2heqp(), "DeviousDevices",Config.LogMessages)
		ABC_h2hidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hidle(), "DeviousDevices",Config.LogMessages)
		ABC_h2hatkpow = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatkpow(), "DeviousDevices",Config.LogMessages)
		ABC_h2hatk = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatk(), "DeviousDevices",Config.LogMessages)
		ABC_h2hstag = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hstag(), "DeviousDevices",Config.LogMessages)
		ABC_jump = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._jump(), "DeviousDevices",Config.LogMessages)
		ABC_sneakmt = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakmt(), "DeviousDevices",Config.LogMessages)
		ABC_sneakidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakidle(), "DeviousDevices",Config.LogMessages)
		ABC_sprint = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sprint(), "DeviousDevices",Config.LogMessages)
		ABC_CRC = current_crc
	endif
EndFunction

Function Apply_ABC(actor akActor)
	libs.log("Apply_ABC()")
	; ConsoleUtil.ExecuteCommand("set zbfSettingDisableEffects to 1.0")
	if (akActor == libs.playerRef)
		; This is bad, and should be removed.
		; I need to figure out why zbf is preventing attacks with fighting=true first, though.
		zbfc.zbfSettingDisableEffects.SetValue(1.0)
	EndIf
	FNIS_aa.SetAnimGroup(akActor, "_h2heqp", ABC_h2heqp, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hidle", ABC_h2hidle, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", ABC_h2hatkpow, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatk", ABC_h2hatk, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hstag", ABC_h2hstag, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_jump", ABC_jump, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sneakmt", ABC_sneakmt, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sneakidle", ABC_sneakidle, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sprint", ABC_sprint, 0, "DeviousDevices", Config.LogMessages)

EndFunction

Function Remove_ABC(actor akActor)
	libs.log("Remove_ABC()")
	if (akActor == libs.playerRef)
		; This is bad, and should be removed.
		; I need to figure out why zbf is preventing attacks with fighting=true first, though.
		zbfc.zbfSettingDisableEffects.SetValue(0.0)
	EndIf
	FNIS_aa.SetAnimGroup(akActor, "_h2heqp", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hidle", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatk", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_h2hstag", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_jump", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sneakmt", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sneakidle", 0, 0, "DeviousDevices", Config.LogMessages)
	FNIS_aa.SetAnimGroup(akActor, "_sprint", 0, 0, "DeviousDevices", Config.LogMessages)
EndFunction


Function Apply_NPC_ABC(actor akActor)
	libs.Log("Applying NPC Bound Combat Package")	
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
		ElseIf libs.IsValidActor(akActor) && !akActor.WornHasKeyword(libs.zad_DeviousArmbinder)
			Remove_NPC_ABC(akActor)
		EndIf
	EndWhile
EndFunction
