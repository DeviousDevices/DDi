Scriptname zadBoundCombatScript Extends Quest Hidden

;
; A huge thanks to Cedec0 for both the animations, and the logic powering armbinder combat.
;

zadLibs Property libs Auto
zadConfig Property config Auto

int Property ABC_ModID Auto
int Property ABC_h2heqp Auto
int Property ABC_h2hidle Auto
int Property ABC_h2hatkpow Auto
int Property ABC_h2hatk Auto
int Property ABC_h2hstag Auto
int Property ABC_jump Auto
int Property ABC_sneakmt Auto
int Property ABC_sneakidle Auto
int Property ABC_CRC Auto

Function CONFIG_ABC()
	ABC_CRC = FNIS_aa.GetInstallationCRC()
	if ( ABC_CRC != 0 )
		ABC_ModID = FNIS_aa.GetAAModID("abc", "DeviousDevices", true) ; true during test only
		ABC_h2heqp = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2heqp(), "DeviousDevices",true)
		ABC_h2hidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hidle(), "DeviousDevices",true)
		ABC_h2hatkpow = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatkpow(), "DeviousDevices",true)
		ABC_h2hatk = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatk(), "DeviousDevices",true)
		ABC_h2hstag = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hstag(), "DeviousDevices",true)
		ABC_jump = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._jump(), "DeviousDevices",true)
		ABC_sneakmt = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakmt(), "DeviousDevices",true)
		ABC_sneakidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakidle(), "DeviousDevices",true)
	endif
EndFunction


Function Maintenance_ABC()
	int current_crc = FNIS_aa.GetInstallationCRC()
	if ( current_crc != ABC_CRC )
		ABC_ModID = FNIS_aa.GetAAModID("abc", "DeviousDevices", true) ; true during test only
		ABC_h2heqp = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2heqp(), "DeviousDevices",true)
		ABC_h2hidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hidle(), "DeviousDevices",true)
		ABC_h2hatkpow = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatkpow(), "DeviousDevices",true)
		ABC_h2hatk = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hatk(), "DeviousDevices",true)
		ABC_h2hstag = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._h2hstag(), "DeviousDevices",true)
		ABC_jump = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._jump(), "DeviousDevices",true)
		ABC_sneakmt = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakmt(), "DeviousDevices",true)
		ABC_sneakidle = FNIS_aa.GetGroupBaseValue(ABC_ModID, FNIS_aa._sneakidle(), "DeviousDevices",true)
		ABC_CRC = current_crc
	endif
EndFunction

Function Apply_ABC(actor akActor)

	ConsoleUtil.ExecuteCommand("set zbfSettingDisableEffects to 1.0")

	FNIS_aa.SetAnimGroup(akActor, "_h2heqp", ABC_h2heqp, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hidle", ABC_h2hidle, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", ABC_h2hatkpow, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatk", ABC_h2hatk, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hstag", ABC_h2hstag, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_jump", ABC_jump, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_sneakmt", ABC_ModID, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_sneakidle", ABC_ModID, 0, "DeviousDevices", true)

EndFunction

Function Remove_ABC(actor akActor)
	FNIS_aa.SetAnimGroup(akActor, "_h2heqp", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hidle", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatkpow", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hatk", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_h2hstag", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_jump", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_sneakmt", 0, 0, "DeviousDevices", true)
	FNIS_aa.SetAnimGroup(akActor, "_sneakidle", 0, 0, "DeviousDevices", true)
EndFunction


Function Apply_NPC_ABC(actor akActor)

	String Actor_RefID = "\"" + IntToHex(akActor.GetFormID()) + "\""

	ConsoleUtil.ExecuteCommand(Actor_RefID + ".setav MagickaRateMult -500")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".DamageActorValue Magicka -1000")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".setav AttackDamageMult .001")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".setav UnarmedDamage 4000")

	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 00034182 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000139c0 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000139bc 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 0007b932 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000139bf 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000139bd 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 00038341 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000cee9e 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000139be 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 0001397d 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000139bb 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 000e738a 999")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".removeitem 0001397f 999")

	;libs.NotifyActor("akActor="+akActor+"Actor_RefID= "+Actor_RefID+" GetFormID ="+akActor.GetFormID()+" MagickaRateMult="+akActor.GetActorValue("MagickaRateMult"), Game.GetPlayer(), true)

EndFunction

Function Remove_NPC_ABC(actor akActor)

	String Actor_RefID = IntToHex(akActor.GetFormID())

	ConsoleUtil.ExecuteCommand(Actor_RefID + ".setav MagickaRateMult 100")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".restoreactorvalue Magicka 1000")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".setav AttackDamageMult 1")
	ConsoleUtil.ExecuteCommand(Actor_RefID + ".setav UnarmedDamage 4")

	ConsoleUtil.ExecuteCommand(Actor_RefID + ".Additem 000139c0 5") ;Daedric arrow

EndFunction



String function IntToHex (int dez)
	String hex = ""
	int rest = dez
	if (rest < 0)
		int m16_1 = ((4294967296 + rest) % 16) + 1
		rest = (4294967296 + rest)  / 16
		if (m16_1 == 1)
			hex = "1"
		elseif (m16_1 == 2)
			hex = "2"
		elseif (m16_1 == 3)
			hex = "3"
		elseif (m16_1 == 4)
			hex = "4"
		elseif (m16_1 == 5)
			hex = "5"
		elseif (m16_1 == 6)
			hex = "6"
		elseif (m16_1 == 7)
			hex = "7"
		elseif (m16_1 == 8)
			hex = "8"
		elseif (m16_1 == 9)
			hex = "9"
		elseif (m16_1 == 10)
			hex = "A"
		elseif (m16_1 == 11)
			hex = "B"
		elseif (m16_1 == 12)
			hex = "C"
		elseif (m16_1 == 13)
			hex = "D"
		elseif (m16_1 == 14)
			hex = "E"
		elseif (m16_1 == 15)
			hex = "F"
		else
			hex = "0"
		endif
		
		int i = 0
		while i < 6
			int m16_2 = rest % 16
			rest = rest / 16
			String temp = ""
			if (m16_2 == 1)
				temp = "1"
			elseif (m16_2 == 2)
				temp = "2"
			elseif (m16_2 == 3)
				temp = "3"
			elseif (m16_2 == 4)
				temp = "4"
			elseif (m16_2 == 5)
				temp = "5"
			elseif (m16_2 == 6)
				temp = "6"
			elseif (m16_2 == 7)
				temp = "7"
			elseif (m16_2 == 8)
				temp = "8"
			elseif (m16_2 == 9)
				temp = "9"
			elseif (m16_2 == 10)
				temp = "A"
			elseif (m16_2 == 11)
				temp = "B"
			elseif (m16_2 == 12)
				temp = "C"
			elseif (m16_2 == 13)
				temp = "D"
			elseif (m16_2 == 14)
				temp = "E"
			elseif (m16_2 == 15)
				temp = "F"
			else
				temp = "0"
			endif
			hex = temp + hex
			i = i +1
		endWhile
		return "F" + hex
	endif
	
	while (rest > 0)
		int m16 = rest % 16
		rest = rest / 16
		String temp = ""
		if (m16 == 1)
			temp = "1"
		elseif (m16 == 2)
			temp = "2"
		elseif (m16 == 3)
			temp = "3"
		elseif (m16 == 4)
			temp = "4"
		elseif (m16 == 5)
			temp = "5"
		elseif (m16 == 6)
			temp = "6"
		elseif (m16 == 7)
			temp = "7"
		elseif (m16 == 8)
			temp = "8"
		elseif (m16 == 9)
			temp = "9"
		elseif (m16 == 10)
			temp = "A"
		elseif (m16 == 11)
			temp = "B"
		elseif (m16 == 12)
			temp = "C"
		elseif (m16 == 13)
			temp = "D"
		elseif (m16 == 14)
			temp = "E"
		elseif (m16 == 15)
			temp = "F"
		else
			temp = "0"
		endif
		hex = temp + hex
	endWhile
	return hex
endFunction


