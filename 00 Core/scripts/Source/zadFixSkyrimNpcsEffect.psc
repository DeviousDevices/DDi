ScriptName zadFixSkyrimNpcsEffect Extends ActiveMagicEffect

zadLibs Property libs Auto

Armor Property DeviceRendered Auto
Armor Property DeviceInventory Auto
String Property deviceName Auto
Actor Property Target Auto

Bool Property Terminate Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectStart("+deviceName+"-FixNPCs). Registering for DeviceRemoved"+deviceName)
	Target = akTarget
	Terminate = False
	RegisterForModEvent("DeviceRemoved"+deviceName, "OnDeviceRemoved")
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(fix-skyrim-npcs: "+deviceName+")")
	Target = akTarget
	if akTarget == libs.PlayerRef
		libs.Log("Target is player. Done.")
	else
		Utility.Wait(0.1) ; Wait for menu to close
		if !Terminate && Target.GetItemCount(DeviceInventory) >= 1
			libs.Log("Not so fast, Skyrim!")
			Utility.Wait(0.5)
			if akTarget.IsEquipped(deviceRendered)
				akTarget.RemoveItem(DeviceRendered, 1, true) 
			EndIf
			Utility.Wait(0.5)
			akTarget.EquipItem(DeviceRendered, true, true) 
		Else
			libs.Log("Legitimate removal, not skyrim derping. Done.")
		EndIf
	EndIf
EndEvent



Event OnDeviceRemoved(string eventName, string argString, float argNum, form sender)
	libs.Log("Fix-skyrim-npcs: OnDeviceRemoved("+argString+","+argNum+")")
	if target == libs.PlayerRef
		libs.Log("Target is player. Done.")
	else
		if target.GetLeveledActorBase().GetName() != argString
			libs.Log("Not Target. Done.")
			return
		EndIf
		Terminate=True
		Target.RemoveItem(DeviceRendered, 1, true)
	EndIf
EndEvent
