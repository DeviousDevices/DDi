scriptName zadEventSlots extends Quest

; See zadBaseEvent.psc for documentation on how to use this system.

zadLibs Property libs Auto

String[] Property Registry Auto
zadBaseEvent[] Property Slots Auto

Int Property Slotted Auto
Int Property ProcessNum = 0 Auto

Int Function Register(string Name, zadBaseEvent TheEvent)
	int id = Registry.Find("")
	int index = Registry.find(Name)
	if index != -1
		return index
	EndIf
	if id != -1
		Registry[id] = Name
		Slots[id] = TheEvent
		Slotted = id + 1
		return id
	EndIf
	return -1
EndFunction


zadBaseEvent Function GetByName(string Name)
	int index = Registry.Find(name)
	if index == -1
		return None
	EndIf
	return Slots[index]
EndFunction


Function Initialize()
	libs.Log("Initializing Events arrays.")
	Registry = new String[125]
	Slots = new zadBaseEvent[125]
	LoadDefaults()
EndFunction


Function LoadDefaults()
	SendModEvent("zadRegisterEvents")
EndFunction


Function UpdateProcessNum()
	ProcessNum=0
	int i = 0
	while i < Slotted
		if Slots[i].Process
			ProcessNum += 1
		EndIf
		i += 1
	EndWhile
EndFunction


Function CheckAllEvents()
	libs.Log("CheckAllEvents()")
	ProcessNum = 0
	int i = 0
	while i < Slotted
		if Slots[i].Filter(libs.PlayerRef)
			Slots[i].Process = True
			ProcessNum += 1
		EndIf
		i += 1
	EndWhile
EndFunction


Bool Function ProcessOneEvent(actor akActor)
	int i = 0
	while i < Slotted
		if Slots[i].Process
			libs.Log("Processing ["+Slots[i].Name+"]")
			Slots[i].Process = False
			SendModEvent("DeviousEvent"+Slots[i].Name, akActor.GetLeveledActorBase().GetName())
			Slots[i].Eval(akActor)
			return True
		EndIf
		i += 1
	EndWhile
	return False
EndFunction


function DoRegister()
	int numEvents = ProcessNum
	if numEvents == 0
		numEvents = 1
	Endif
	libs.Log("Config Interval:" + libs.Config.EventInterval + ". Total number of events: " + ProcessNum +". Next staggered update in " + libs.Config.EventInterval / numEvents)
	if !libs || !libs.config || !libs.Config.EventInterval
		debug.Messagebox("A fatal error has occurred with your installation of Devious Devices. Incomplete uninstall attempt perhaps? Aborting update chain.")
		return
	EndIf
	RegisterForSingleUpdateGameTime(libs.Config.EventInterval / numEvents)
EndFunction



; Processing events in this manner to stagger events. Should provide a better experience, doing it like this.
bool Function ProcessEvents(actor akActor)
	if ProcessOneEvent(akActor)
		;DoRegister()
		return true
	EndIf
	ProcessNum = 0
	return false
EndFunction

	

Event OnUpdateGameTime()
	actor akActor = libs.PlayerRef
	if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousPlug)
		libs.UpdateArousalTimerate(akActor, 1.75)
		libs.UpdateExposure(akActor, 0.5)
	EndIf
	if !libs.GlobalEventFlag
		libs.Log("Event processing is currently disabled.")
		DoRegister()
		return
	EndIf
	if ProcessNum == 0
		CheckAllEvents()
	EndIf
	if ProcessNum > 0 && !ProcessEvents(akActor) ; If we processed the last event, restart.
		if ProcessNum == 0
			libs.Log("Finished processing events. Re-Polling..")
			OnUpdateGameTime()
			return
		EndIf
	EndIf
	DoRegister()
EndEvent


Function Maintenance()
	libs.Log("zadEventSlots::Maintenance()")
	DoRegister()
EndFunction
