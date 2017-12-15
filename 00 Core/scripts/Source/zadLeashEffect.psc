ScriptName zadLeashEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto
SexlabFramework Property Sexlab Auto

Bool Property Terminate Auto hidden
actor Property Target Auto hidden
ObjectReference Property Master Auto
{Leave empty to use the alias instead}
ReferenceAlias Property MasterAlias Auto
{Leave empty to use the reference instead}
int Property MaxDistanceFromMaster = 350 Auto
{Maximum allowed distance from the master reference, before the plugs start vibrating.}
int Property ZoneLength = 200 Auto
{The distance between different 'zones' of vibration settings.}
float Property EffectInterval = 5.0 Auto
{How often the distance from master is checked and effects applied, in seconds.}
int oor = 0 ; out of range counter

Event OnUpdate()
	if !Terminate
		if MasterAlias != none && MasterAlias.GetReference() != none
			Master = MasterAlias.GetReference()
		endIf
		int dist
		if Target.GetWorldSpace() !=  Master.GetWorldSpace()
			dist = 0
			oor += 1
		else
			dist = Target.GetDistance(Master) as int
			oor = 0
		endif
		if !libs.IsVibrating(Target)
			if dist >= MaxDistanceFromMaster + ZoneLength * 4 || oor >= 9
				SetActorValueModifier("StaminaRate", -1.4)
				SetActorValueModifier("HealRate", -0.7)
				SetActorValueModifier("MagickaRate", -1.4)
				libs.VibrateEffect(Target, 5, 30, teaseOnly = true)
			elseif dist >= MaxDistanceFromMaster + ZoneLength * 3 || oor >= 7
				SetActorValueModifier("StaminaRate", -1.0)
				SetActorValueModifier("HealRate", -0.5)
				SetActorValueModifier("MagickaRate", -1.0)
				libs.VibrateEffect(Target, 4, 20, teaseOnly = true)
			elseif dist >= MaxDistanceFromMaster + ZoneLength * 2 || oor >= 5
				SetActorValueModifier("StaminaRate", -0.6)
				SetActorValueModifier("HealRate", -0.3)
				SetActorValueModifier("MagickaRate", -0.6)
				libs.VibrateEffect(Target, 3, 15, teaseOnly = true)
			elseif dist >= MaxDistanceFromMaster + ZoneLength || oor >= 3
				SetActorValueModifier("StaminaRate", -0.2)
				SetActorValueModifier("HealRate", -0.1)
				SetActorValueModifier("MagickaRate", -0.2)	
				libs.VibrateEffect(Target, 2, 10, teaseOnly = true)
			elseif dist >= MaxDistanceFromMaster || oor >= 1
				; Just a little warning
			;	libs.NotifyPlayer("As you walk further away from your master, the plugs inside you spring to life!")
				SetActorValueModifier("StaminaRate", 0.0)
				SetActorValueModifier("HealRate", 0.0)
				SetActorValueModifier("MagickaRate", 0.0)
				libs.VibrateEffect(Target, 1, 5, teaseOnly = true)
			else
				SetActorValueModifier("StaminaRate", 0.0)
				SetActorValueModifier("HealRate", 0.0)
				SetActorValueModifier("MagickaRate", 0.0)
			endif
		endif
		DoRegister()
	EndIf
EndEvent

Function SetActorValueModifier(String avName, Float newMod)
	String storagename = "zad."+avName
	float currentMod = StorageUtil.GetFloatValue(Target, storagename, 0.0)
	if newMod != currentMod
		Target.ModAv(avName, currentMod * -1) ; clear previous modifier
		Target.ModAv(avName, newMod) ; Set new modifier
		StorageUtil.SetFloatValue(Target, storagename, newMod)
		libs.log("Set " + avName + " modifier for " + Target.GetleveledActorBase().GetName() + " to " + newMod + ".")
	endif
EndFunction

Function DoRegister()
	UnregisterForUpdate()
	RegisterForSingleUpdate(EffectInterval)
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget != libs.PlayerRef
		libs.Log("OnEffectStart(Leash): Not player, doing nothing.")
		return
	EndIf
	libs.Log("OnEffectStart(Leash)")
	Target = akTarget
	Terminate = False
	DoRegister()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Terminate = True
	libs.Log("OnEffectFinish(Leash)")
	SetActorValueModifier("StaminaRate", 0.0)
	SetActorValueModifier("HealRate", 0.0)
	SetActorValueModifier("MagickaRate", 0.0)
EndEvent

Event OnPlayerLoadGame()
	DoRegister()
EndEvent

Event OnUnload()
	UnregisterForUpdate()
EndEvent
