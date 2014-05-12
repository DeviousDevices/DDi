Scriptname ZadNPCQuestScript Extends  zadBaseDeviceQuest

; I could have created a base enchantment for the devices to apply periodic effect processing to each relevant actor. Took this approach to reduce script load as much as possible (The same reason I'm executing sequentially, rather than in parallel).

ReferenceAlias[] Property MonitoredNPCs Auto
zadBQ00 Property questScript Auto

Float Property LastUpdateTime Auto
Bool Property IsProcessing Auto

Function DoRegister()
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
	RegisterForSingleUpdateGameTime(duration)
EndFunction

Event OnInit()
	; Quest has been (re)started. Resume waiting from previous time waited.
	DoRegister()
EndEvent

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
				if akActor.WornHasKeyword(questScript.zad_DeviousDevice)
					; When I get to adding more of these, I'll stagger it in the same way I did in zadbq00
					zadBaseEvent horny = libs.EventSlots.GetByName("Horny")
					if horny && horny.Filter(akActor)
						horny.Execute(akActor)
					EndIf
				Endif
			EndIf
		EndIf
		i += 1
	EndWhile
	DoRegister()
	IsProcessing = False
EndEvent
