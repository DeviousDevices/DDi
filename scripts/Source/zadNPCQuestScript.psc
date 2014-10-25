Scriptname ZadNPCQuestScript Extends  zadBaseDeviceQuest

; I could have created a base enchantment for the devices to apply periodic effect processing to each relevant actor. Took this approach to reduce script load as much as possible (The same reason I'm executing sequentially, rather than in parallel).

ReferenceAlias[] Property MonitoredNPCs Auto
zadBQ00 Property questScript Auto

Float Property LastUpdateTime Auto
Bool Property IsProcessing Auto

Function DoRegisterGameTime()
	if GetName() == "zadNPCSlots"
		Debug.Trace("[Zad]: Detected remnant script from NPC system upgrade. Aborting update loop. This is safe to ignore.")
		return
	EndIf
	if !libs || !libs.config || !libs.config.EventInterval
		Debug.MessageBox("Libs is none in zadNPCQuestScript. Incomplete uninstall/upgrade attempt?")
		Debug.Trace("[Zad]: Libs is none in zadNPCQuestScript. Incomplete uninstall/upgrade attempt?")
		return
	EndIf
	float duration = libs.Config.EventInterval - (Utility.GetCurrentGameTime() - LastUpdateTime)
	if duration <= 0 || duration > libs.Config.EventInterval ; Sanity check
		duration = libs.Config.EventInterval
	EndIf
	libs.Log("ZadNpc::DoRegister("+duration+")")
	RegisterForSingleUpdateGameTime(duration) ; Periodic Events
EndFunction

Function DoRegister()
	RegisterForSingleUpdate(2.0)
EndFunction

Function Maintenance()
	; Quest has been (re)started. Resume waiting from previous time waited.
	DoRegister()
	DoRegisterGameTime()
EndFunction

Event OnUpdateGameTime()
	if IsStopping() || IsStopped() ; Sanity check
		libs.Log("ZadNpc::OnUpdateGameTime() - Quest is stopping/stopped, aborting.")
		return
	EndIf
	IsProcessing = True
	libs.Log("ZadNpc::OnUpdateGameTime()")
	LastUpdateTime = Utility.GetCurrentGameTime()
	if !libs.GlobalEventFlag
		libs.Log("Event processing is currently disabled.")
		return
	EndIf
	; Parent.OnUpdateGameTime()
	actor akActor
	int i = 0
	while i < libs.Config.NumNpcs
		if MonitoredNpcs[i]
			akActor = MonitoredNpcs[i].GetActorReference()
			if akActor && libs.IsValidActor(akActor)
				; questScript.ProcessEffects(akActor)
				if akActor.WornHasKeyword(libs.zad_DeviousBelt)
					; When I get around to adding more of these, I'll stagger it in the same way I did in zadbq00
					zadBaseEvent horny = libs.EventSlots.GetByName("Horny")
					if horny && horny.Filter(akActor)
						horny.Eval(akActor)
					EndIf
				Endif
				if akActor.WornHasKeyword(libs.zad_DeviousPlug)
					zadBaseEvent vibrate = libs.EventSlots.GetByName("Vibration")
					if vibrate && vibrate.Filter(akActor)
						vibrate.Eval(akActor)
					EndIf
				EndIf
			EndIf
		EndIf
		i += 1
	EndWhile
	DoRegisterGameTime()
	IsProcessing = False
EndEvent


Event OnUpdate()
	int i = 0
	actor akActor
	while i < libs.Config.NumNpcs
		if MonitoredNpcs[i]
			akActor = MonitoredNpcs[i].GetActorReference()
			if akActor && libs.IsValidActor(akActor)
				ProcessGagEffect(akActor)
				ProcessArmbinderEffect(akActor)
			EndIf
		EndIf
		i += 1
	EndWhile
	DoRegister()
EndEvent


Function ProcessGagEffect(actor akActor)
	if libs.ActorHasKeyword(akActor, libs.zad_DeviousGag)
		libs.ApplyGagEffect(akActor)
	EndIf
EndFunction

Function ProcessArmbinderEffect(actor akActor)
	if libs.ActorHasKeyword(akActor, libs.zad_DeviousArmbinder)
		libs.ApplyArmbinderAnim(akActor)
	EndIf
EndFunction
