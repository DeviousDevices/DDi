ScriptName zadArmbinderEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto

Perk Property zad_bc_wristXPPerk_1 Auto
Perk Property zad_bc_wristXPPerk_2 Auto
Perk Property zad_bc_wristXPPerk_3 Auto
Perk Property zad_bc_wristXPPerk_4 Auto
Perk Property zad_bc_wristXPPerk_5 Auto

Float DeviceEquippedAt 
Int MsgCounter

Actor Me

Event OnUpdate()
	RegisterForSingleUpdate(45)
	If (((Utility.GetCurrentGameTime() - DeviceEquippedAt) * 24) > 2.0) && (MsgCounter == 0)
		If Me == libs.PlayerRef
			libs.Notify("You start to get used to being tied.")
		EndIf
		Me.AddPerk(zad_bc_wristXPPerk_1)		
		MsgCounter += 1
	EndIf
	If (((Utility.GetCurrentGameTime() - DeviceEquippedAt) * 24) > 5.0) && (MsgCounter == 1)		
		If Me == libs.PlayerRef
			libs.Notify("Your wrist restraints don't hurt so much anymore.")		
		EndIf
		Me.AddPerk(zad_bc_wristXPPerk_2)
		MsgCounter += 1
	EndIf
	If (((Utility.GetCurrentGameTime() - DeviceEquippedAt) * 24) > 12.0) && (MsgCounter == 2)
		If Me == libs.PlayerRef
			libs.Notify("You don't notice your wrist restraints anymore.")		
		EndIf
		Me.AddPerk(zad_bc_wristXPPerk_3)
		MsgCounter += 1
	EndIf
	If (((Utility.GetCurrentGameTime() - DeviceEquippedAt) * 24) > 24.0) && (MsgCounter == 3)
		If Me == libs.PlayerRef
			libs.Notify("Your wrist restraints start to feel really comfortable!")
		EndIf
		Me.AddPerk(zad_bc_wristXPPerk_4)
		MsgCounter += 1
	EndIf
	If (((Utility.GetCurrentGameTime() - DeviceEquippedAt) * 24) > 48.0) && (MsgCounter == 4)
		If Me == libs.PlayerRef
			libs.Notify("Wearing wrist restraints feels completely natural now!")		
		EndIf
		Me.AddPerk(zad_bc_wristXPPerk_5)
		MsgCounter += 1
	EndIf
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)				
	float naplength = afDesiredSleepEndTime - afSleepStartTime	
	DeviceEquippedAt += naplength	
EndEvent
	
Event OnEffectStart(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectStart(): Heavy Bondage: " + akTarget.GetLeveledActorBase().GetName())
	If Libs.Config.UseBoundCombatPerks == False
		return
	EndIf
	Me = akTarget	
	MsgCounter = 0	
	DeviceEquippedAt = Utility.GetCurrentGameTime()
	RegisterForSingleUpdate(45)
	If Me != libs.PlayerRef
		return
	EndIf
	RegisterForSleep()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(): Heavy Bondage: " + akTarget.GetLeveledActorBase().GetName())
	Me.RemovePerk(zad_bc_wristXPPerk_1)
	Me.RemovePerk(zad_bc_wristXPPerk_2)
	Me.RemovePerk(zad_bc_wristXPPerk_3)
	Me.RemovePerk(zad_bc_wristXPPerk_4)
	Me.RemovePerk(zad_bc_wristXPPerk_5)	
	UnregisterForUpdate()
EndEvent
