Scriptname zadGagScript extends zadEquipScript
Message Property callForHelpMsg Auto
Message Property zad_GagPreEquipMsg Auto
Message Property zad_GagEquipMsg Auto
Message Property zad_GagRemovedMsg Auto
Message Property zad_GagPickLockFailMsg Auto
Message Property zad_GagPickLockSuccessMsg Auto
Message Property zad_GagArmsTiedMsg Auto
Message Property zad_GagBruteForceArmsTiedMsg Auto
Message Property zad_GagBruteForceMsg Auto


Function OnEquippedPre(actor akActor, bool silent=false)
	if !silent
		if akActor == libs.PlayerRef
			zad_GagEquipMsg.Show()
		Else
			libs.NotifyActor("You slip the gag into "+GetMessageName(akActor)+" mouth, and lock it securely in place behind "+GetMessageName(akActor)+" head.", akActor, true)
		EndIf
	EndIf
	Parent.OnEquippedPre(akActor, silent)
EndFunction

Function DeviceMenuExt(int msgChoice)
	if msgChoice == 3
		libs.Moan(libs.PlayerRef)
		callForHelpMsg.Show()
	EndIf
EndFunction

int Function OnEquippedFilter(actor akActor, bool silent=false)
	if akActor != libs.PlayerRef || silent
		return 0 ; Proceed.
	EndIf
        int interaction = zad_GagPreEquipMsg.show()
        if interaction == 0 ; Equip Device
		return 0 ; Proceed
	Else
		return 2
	EndIf
EndFunction


string Function DeviceMenuPickLockSuccess()
	RemoveDevice(libs.PlayerRef)
	zad_GagPickLockSuccessMsg.Show()
	return ""
EndFunction
string Function DeviceMenuPickLockModerate()
	return ""
EndFunction
string Function DeviceMenuPickLockFail()
	libs.PlayerRef.RemoveItem(Lockpick)
	zad_GagPickLockFailMsg.Show()
	return ""
EndFunction

Function DeviceMenuPickLock()
	string skillName = ""
	if libs.Config.SkyRe
		skillName = "Pickpocket"
	else
		skillName = "Lockpicking"
	EndIf
	if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousArmbinder)
		zad_GagArmsTiedMsg.Show()
		return
	EndIf
	int unlockChance = libs.CheckDeviceEscape(libs.GetUnlockThreshold(), skillName)
        if (unlockChance == -1)
		DeviceMenuPickLockSuccess()
	else
		DeviceMenuPickLockFail()
	endif
EndFunction

Function DeviceMenuBruteForce()
	if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousArmbinder)
		zad_GagBruteForceArmsTiedMsg.Show()
	Else
		zad_GagBruteForceMsg.show()
	EndIf
EndFunction
