Scriptname zadConfig extends SKI_ConfigBase Conditional

; The power of Emacs compels you.

; Libraries
zadLibs Property libs Auto
zadBeltedAnims Property beltedAnims  Auto  

; Perks
Perk Property zad_keyCraftingEasy Auto ; Obsolete, will remove later
Perk Property zad_keyCraftingHard Auto ; Obsolete, will remove later.

; Config Variables
int Property UnlockThreshold Auto
int thresholdDefault = 185
int Property ThresholdModifier Auto
int ThresholdModifierDefault = 0
float Property BeltRateMult Auto
float beltRateDefault = 1.5
float Property PlugRateMult Auto
float plugRateDefault = 3.0
int Property KeyCrafting Auto Conditional
int keyCraftingDefault = 1
bool Property NpcMessages Auto
bool npcMessagesDefault = true
bool Property PlayerMessages Auto
bool playerMessagesDefault = true

bool Property DestroyKey Auto
bool destroyKeyDefault = False

int Property DestroyKeyProbability Auto
int destroyKeyProbabilityDefault = 0

int Property DestroyKeyJamChance Auto 
int destroyKeyJamChanceDefault = 0

bool Property SkyRe Auto
bool skyreDefault = true
bool Property LogMessages Auto
bool logMessagesDefault = true
bool Property ifp Auto
bool ifpDefault = true
bool Property preserveAggro Auto
bool preserveAggroDefault = true
bool Property breastNodeManagement Auto
bool breastNodeManagementDefault = true
bool Property bellyNodeManagement Auto
bool bellyNodeManagementDefault = true

bool Property useBoundAnims =  true Auto
bool useBoundAnimsDefault = true

; Blindfold
int Property blindfoldMode Auto ; 0 == DD's mode, 1 == DD's mode w/ leeches, 2 == leeches
int blindfoldModeDefault = 0
float Property blindfoldStrength Auto
float blindfoldStrengthDefault = 1.0

; Tooltips
bool Property BlindfoldTooltip Auto
bool Property GagTooltip Auto

; Events and Effects
float Property EventInterval Auto
float eventIntervalDefault = 1.5
int Property EffectVibrateChance Auto
int effectVibrateChanceDefault = 25
int Property EffectHealthDrainChance Auto
int effectHealthDrainChanceDefault = 50
int Property EffectManaDrainChance Auto
int EffectManaDrainChanceDefault = 50
int Property EffectStaminaDrainChance Auto
int EffectStaminaDrainChanceDefault = 50
int Property BaseMessageChance Auto
int baseMessageChanceDefault = 10
int Property BaseHornyChance Auto
int baseHornyChanceDefault = 5
int Property BaseBumpPumpChance Auto
int baseBumpPumpChanceDefault = 17
bool Property HardcoreEffects Auto
bool hardcoreEffectsDefault = true
bool Property MasturbateOnBeltRemoval Auto
bool masturbateOnBeltRemovalDefault = False 
int Property numNpcs Auto Conditional
int numNpcsDefault = 0

; Sounds
float Property VolumeOrgasm Auto
float volumeOrgasmDefault = 1.0
float Property VolumeEdged Auto
float volumeEdgedDefault = 1.0
float Property VolumeVibrator Auto
float volumeVibratorDefault = 1.0

; Quest Monitor Configuration
bool Property ForbiddenTome Auto
bool ForbiddenTomeDefault = true
bool Property SergiusExperiment Auto
bool SergiusExperimentDefault = true
bool Property SurreptitiousStreets Auto
bool SurreptitiousStreetsDefault = true
bool Property RadiantMaster Auto
bool RadiantMasterDefault = false

; Surreptitious Streets Config
int Property ssSleepChance Auto
int ssSleepChanceDefault = 100
int Property ssTrapChance Auto
int ssTrapChanceDefault = 100
bool Property ssWarningMessages Auto
bool ssWarningMessagesDefault = false

; Radiant Master Configuration
float Property rmHeartbeatInterval Auto
float rmHeartbeatIntervalDefault = 2.0
float Property rmSummonHeartbeatInterval Auto
float rmSummonHeartbeatIntervalDefault = 0.25

; Devices Underneath Configuration
bool Property DevicesUnderneathEnabled = True Auto
Int Property DevicesUnderneathSlot Auto
int Property DevicesUnderneathSlotDefault = 12 Auto
bool Property UseQueueNiNode Auto
bool UseQueueNiNodeDefault = False

; Devious Expansion Configuration
bool Property bootsSlowdownToggle = True Auto Conditional
bool bootsSlowdownToggleDefault = True 

; OID's
int thresholdOID
int beltRateOID
int plugRateOID
int keyCraftingOID
int thresholdModifierOID
int animsRegisterOID
int playerMessagesOID
int destroyKeyOID
int npcMessagesOID
int destroyKeyProbabilityOID
int destroyKeyJamChanceOID
int skyreOID
int logMessagesOID
int masturbateOnRemovalOID
int eventIntervalOID
int effectVibrateChanceOID
int effectHealthDrainChanceOID
int effectManaDrainChanceOID
int effectStaminaDrainChanceOID
int baseMessageChanceOID
int baseHornyChanceOID
int baseBumpPumpChanceOID
int VolumeOrgasmOID
int VolumeEdgedOID
int VolumeVibratorOID
int ForbiddenTomeOID
int SergiusExperimentOID
int SurreptitiousStreetsOID
int RadiantMasterOID
int HardcoreEffectsOID
int ssSleepChanceOID
int ssTrapChanceOID
int rmHeartbeatIntervalOID
int rmSummonHeartbeatIntervalOID
int ssWarningMessagesOID
int MasturbateOnBeltRemovalOID
int numNpcsOID
int ifpOID
int preserveAggroOID
int blindfoldModeOID
int blindfoldStrengthOID
int[] eventOIDs
int[] slotMaskOIDs
int DevicesUnderneathSlotOID
int UseQueueNiNodeOID
int breastNodeManagementOID
int bellyNodeManagementOID
int useBoundAnimsOID
int bootsSlowdownToggleOID


string[] difficultyList
string[] blindfoldList
string[] slotMasks
int[] SlotMaskValues


Function SetupBlindfolds()
	blindfoldList = new String[3]
	blindfoldList[0] = "DD blindfold"
	blindfoldList[1] = "DD blindfold w/ Leeches Effect"
	blindfoldList[2] = "Leeches Mode"
EndFunction

Function SetupDifficulties()
	difficultyList = new String[4]
	difficultyList[0] = "Easy"
	difficultyList[1] = "Hard"
	difficultyList[2] = "Medium"
	difficultyList[3] = "Disabled"
EndFunction

Function SetupPages()
	Pages = new string[9]
	Pages[0] = "General"
	Pages[1] = "Devices"
	pages[2] = "Sex Animation Filter"
	Pages[3] = "Events and Effects"
	Pages[4] = "Sounds"
	Pages[5] = "Quests"
	Pages[6] = "Devices Underneath (1)"
	Pages[7] = "Devices Underneath (2)"
	Pages[8] = "Devious Expansion"
EndFunction



Function SetupSlotMasks()
	SlotMasks = new String[33]
	SlotMaskValues = new int[33]
	SlotMasks[0] = "None (Disabled) "
	int i = 1
	while i <= 32
		SlotMasks[i] = "Slot " + (30 + i - 1)
		SlotMaskValues[i] = Math.LeftShift(1, (i - 1))
		i += 1
	EndWhile
	SlotMasks[1] = "Head (30)"
	SlotMasks[2] = "Hair (31)"
	SlotMasks[3] = "Body - Full (32)"
	SlotMasks[4] = "Hands (33)"
	SlotMasks[5] = "Forearms (34)"
	SlotMasks[6] = "Amulet (35)"
	SlotMasks[7] = "Ring (36)"
	SlotMasks[8] = "Feet (37)"
	SlotMasks[9] = "Calves (38)"
	SlotMasks[10] = "Shield (39)"
	SlotMasks[11] = "Tail (40)"
	SlotMasks[12] = "Device Hider + Long Hair (41)"
	SlotMasks[13] = "Circlet (42)"
	SlotMasks[14] = "Ears (43)"
	SlotMasks[15] = "Gags (44)"
	SlotMasks[16] = "Collar (45)"
	SlotMasks[17] = "Armbinders / Yokes / Cloaks (46)"
	SlotMasks[18] = "Backpacks (47)"
	SlotMasks[19] = "Plugs (Anal) (48)"
	SlotMasks[20] = "Chastity Belt (49)"
	SlotMasks[21] = "Vaginal Piercings (50)"
	SlotMasks[22] = "Nipple Piercings (51)"
	SlotMasks[23] = "SoS (52)"
	SlotMasks[24] = "Cuffs (Legs) (53)"
	SlotMasks[25] = "Plug Vaginal (54)"
	SlotMasks[26] = "Blindfold (55)"
	SlotMasks[27] = "Chastity Bra (56)"

	SlotMasks[29] = "Harnesses / Corsets (58)"
	SlotMasks[30] = "Cuffs (Arms) / Armbinder (59)"

EndFunction

Event OnConfigInit()
	libs.Log("Building mcm menu.")
	SetupPages()
	SetupDifficulties()
	SetupBlindfolds()
	SlotMaskOIDS = new int[128]
EndEvent

int Function GetVersion()
	return 16 ; mcm menu version
EndFunction

Event OnVersionUpdate(int newVersion)
	libs.Log("OnVersionUpdate("+newVersion+"/"+CurrentVersion+")")
	if newVersion != CurrentVersion
		SlotMaskOIDS = new int[128]
		SetupPages()
		SetupDifficulties()
		SetupBlindfolds()
		eventOIDs = new int[125]
		if KeyCrafting == keyCraftingDefault && !libs.PlayerRef.HasPerk(zad_keyCraftingEasy) && !libs.PlayerRef.HasPerk(zad_keyCraftingHard)
			libs.PlayerRef.AddPerk(zad_keyCraftingHard)
		EndIf
	EndIf
	; if CurrentVersion == 0 ; New Game
	; 	SexlabFramework SexLab = SexLabUtil.GetAPI()
	; 	If SexLab == None
	; 		libs.Error("Mod initialization failed: Could not fetch Sexlab API.")
	; 	EndIf
	; 	; Wait for Sexlab to finish initializing.
	; 	int timeout = 0
	; 	float waitFor = 5.0
	; 	While (!Sexlab.Enabled && (timeout * waitFor) < 180.0)
	; 		libs.Log("Waiting for Sexlab to initialize... (Waited " + (timeout * waitFor) + " seconds).")
	; 		timeout += 1
	; 		Utility.Wait(waitFor)
	; 	EndWhile
	; 	SendModEvent("__DeviousDevicesInit")
	; EndIf
EndEvent


Event OnPageReset(string page)
	Libs.Log("OnPageReset("+page+")")
	if (page == "")
		LoadCustomContent("DeviousIntegrationTitle.dds", 186, 33)
		return
	else
		UnloadCustomContent()
	EndIf
	If page == "General"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway
		if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBelt)
			AddHeaderOption("Device Escape Options are unavailable")
			AddHeaderOption(" while wearing a belt.")
			thresholdOID = -1
			thresholdModifierOID = -1
			keyCraftingOID = -1
			destroyKeyProbabilityOID = -1
			destroyKeyJamChanceOID = -1
			skyreOID = -1
		else
			AddHeaderOption("Device Escape Options")
			thresholdOID = AddSliderOption("Unlock Threshold", UnlockThreshold)
			thresholdModifierOID = AddSliderOption("Unlock Threshold Modifier", ThresholdModifier)
			keyCraftingOID = AddMenuOption("Key Creation Difficulty", difficultyList[KeyCrafting])
			destroyKeyOID = AddToggleOption("Destroy Key", destroyKey)
			destroyKeyProbabilityOID = AddSliderOption("Key Break Chance", destroyKeyProbability, "{1}")
			destroyKeyJamChanceOID = AddSliderOption("Jam LockChance", destroyKeyJamChance, "{1}")
			skyreOID = AddToggleOption("Using SkyRe", SkyRe)
		EndIf
		AddHeaderOption("Camera Configuration")
		ifpOID = AddToggleOption("Immersive First Person", ifp)
		SetCursorPosition(1) ; Move cursor to top right position
		AddHeaderOption("Message Visibility Settings")
		npcMessagesOID = AddToggleOption("Show NPC Messages", NpcMessages)
		playerMessagesOID = AddToggleOption("Show Player Messages", PlayerMessages)
		AddHeaderOption("Debug")
		logMessagesOID = AddToggleOption("Enable Debug Logging", LogMessages)
		SetCursorPosition(1) ; Move cursor to top right position
		; AddHeaderOption("General Settings")
	ElseIf page == "Devices"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway
		AddHeaderOption("Belt Arousal Options")
		beltRateOID = AddSliderOption("Arousal rate belt multiplier", beltRateMult, "{1}")
		plugRateOID = AddSliderOption("Arousal rate plugged multiplier", plugRateMult, "{1}")
		AddHeaderOption("Blindfold Options")
		blindfoldModeOID = AddMenuOption("BlindfoldMode", blindfoldList[blindfoldMode])
		blindfoldStrengthOID = AddSliderOption("Blindfold Strength", blindfoldStrength, "{2}")
		AddHeaderOption("Bra Options")
		if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBra)
			flags = OPTION_FLAG_DISABLED
		EndIf
		breastNodeManagementOID = AddToggleOption("Breast Node Management", breastNodeManagement, flags)
		AddHeaderOption("Belly Options")
		int flags = 0
		if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousCorset)||libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBelt)
			flags = OPTION_FLAG_DISABLED
		EndIf
		bellyNodeManagementOID = AddToggleOption("Belly Node Management", bellyNodeManagement, flags)
	ElseIf page == "Sex Animation Filter"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0) ; Can be removed because it starts at 0 anyway
		AddHeaderOption("Animation Options")
		preserveAggroOID = AddToggleOption("Preserve Scene Aggressiveness", preserveAggro)
		useBoundAnimsOID = AddToggleOption("Use Bound Animations", useBoundAnims)
	ElseIf page == "Events and Effects"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Global Events/Effects Configuration")
		eventIntervalOID = AddSliderOption("Polling Interval", EventInterval, "{2}")
		HardcoreEffectsOID = AddToggleOption("Enable Hardcore Effects", HardcoreEffects)
		numNpcsOID = AddSliderOption("Number of NPC's slotted", numNpcs, "{1}")
		AddHeaderOption("Polled Events Configuration ("+libs.EventSlots.Slotted+"):")
		int i = 0
		while i < libs.EventSlots.Slotted
			eventOIDs[i] = AddSliderOption(libs.EventSlots.Slots[i].Name+" Chance", libs.EventSlots.Slots[i].Probability, "{1}")
			i += 1
		EndWhile
		AddHeaderOption("Special Events Configuration")
		MasturbateOnBeltRemovalOID = AddToggleOption("Masturbate on belt removal", MasturbateOnBeltRemoval)

	ElseIf page == "Sounds"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Audio Configuration")
		VolumeOrgasmOID = AddSliderOption("Orgasm Volume", VolumeOrgasm, "{3}")
		VolumeEdgedOID = AddSliderOption("Edged Volume", VolumeEdged, "{3}")
		VolumeVibratorOID = AddSliderOption("Vibrator Volume ", VolumeVibrator, "{3}")

	ElseIf page == "Quests"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("Quest Toggles for QuestMonitor")
		ForbiddenTomeOID = AddToggleOption("Forbidden Tome", ForbiddenTome)
		SergiusExperimentOID = AddToggleOption("Sergius's Experiment", SergiusExperiment)
		; SurreptitiousStreetsOID = AddToggleOption("Surreptitious Streets", SurreptitiousStreets)
		; RadiantMasterOID = AddToggleOption("Radiant Master", RadiantMaster)
		; AddHeaderOption("Surreptitious Streets Configuration")
		; ssWarningMessagesOID = AddToggleOption("Warning Messages", ssWarningMessages)
		; ssSleepChanceOID = AddSliderOption("Sleep Capture Chance", ssSleepChance, "{1}")
		; ssTrapChanceOID = AddSliderOption("Trap Spawn Chance", ssTrapChance, "{1}")
		; AddHeaderOption("Radiant Master Configuration")
		; rmHeartbeatIntervalOID = AddSliderOption("Heartbeat Interval", rmHeartbeatInterval, "{3}")
		; rmSummonHeartbeatIntervalOID = AddSliderOption("Summon Heartbeat Interval", rmSummonHeartbeatInterval, "{3}")
	ElseIf page == "Devices Underneath (1)"
		SetupSlotMasks()
		SetCursorFillMode(TOP_TO_BOTTOM)
		DevicesUnderneathSlotOID = AddMenuOption("Item Hider Slot", SlotMasks[DevicesUnderneathSlot])
		UseQueueNiNodeOID = AddToggleOption("Use QueueNiNode", UseQueueNiNode)
		; AddMenuOption("Item Hider Slot", SlotMasks[DevicesUnderneathSlot])
		int i = 1
		while i < 16
			int index = (i - 1) * 4
			int j = 0
			AddHeaderOption(SlotMasks[i])
			while j < 4
				slotMaskOIDs[index + j] = AddMenuOption(SlotMasks[i] + " #"+j, SlotMasks[LookupSlotMask(index+j)])
				j += 1
			EndWhile
			if i == 8
				SetCursorPosition(1) ; Move cursor to top right position
			EndIf
			i += 1
		EndWhile
	ElseIf page == "Devices Underneath (2)"
		SetupSlotMasks()
		SetCursorFillMode(TOP_TO_BOTTOM)
		int i = 16
		while i < 32
			int index = (i - 1) * 4
			int j = 0
			AddHeaderOption(SlotMasks[i])
			while j < 4
				slotMaskOIDs[index + j] = AddMenuOption(SlotMasks[i] + " #"+j, SlotMasks[LookupSlotMask(index+j)])
				j += 1
			EndWhile
			if i == 23
				SetCursorPosition(1) ; Move cursor to top right position
			EndIf
			i += 1
		EndWhile
	ElseIf Page == "Devious Expansion"
		; Check for DDx
		if (Game.GetModByName("Devious Devices - Expansion.esm") > 0) ; DDx is present
			bootsSlowdownToggleOID = AddToggleOption("Boots Slowdown Effect", bootsSlowdownToggle)
		Else
			AddTextOption("Devious Devices - Expansion is not loaded.", "", OPTION_FLAG_DISABLED)
			AddTextOption("This menu is disabled.", "", OPTION_FLAG_DISABLED)
		EndIf
	Endif
EndEvent


Event OnOptionMenuOpen(int option)
	if option == keyCraftingOID
		SetMenuDialogOptions(difficultyList)
		SetMenuDialogStartIndex(KeyCrafting)
		SetMenuDialogDefaultIndex(keyCraftingDefault)
	ElseIf option == blindfoldModeOID
		SetMenuDialogOptions(blindfoldList)
		SetMenuDialogStartIndex(BlindfoldMode)
		SetMenuDialogDefaultIndex(blindfoldModeDefault)
	ElseIf option == DevicesUnderneathSlotOID
		SetMenuDialogOptions(SlotMasks)
		SetMenuDialogStartIndex(DevicesUnderneathSlot)
		SetMenuDialogDefaultIndex(DevicesUnderneathSlotDefault)
	EndIf
	int i = 0
	while i < 128
		if option == slotMaskOIDs[i]
			SetMenuDialogOptions(SlotMasks)
			SetMenuDialogStartIndex(LookupSlotMask(i))
			SetMenuDialogDefaultIndex(0)
		EndIf
		i += 1
	EndWhile
EndEvent

Function CheckRemovePerk(Perk perkName)
	if libs.PlayerRef.HasPerk(perkName)
		libs.PlayerRef.RemovePerk(perkName)
	EndIf	
EndFunction

Function UpdateCraftingPerks(int index)
	if index == 0
		CheckRemovePerk(zad_keyCraftingHard)
		libs.PlayerRef.AddPerk(zad_keyCraftingEasy)
	elseif index == 1
		CheckRemovePerk(zad_keyCraftingEasy)
		libs.PlayerRef.AddPerk(zad_keyCraftingHard)
	Else
		CheckRemovePerk(zad_keyCraftingEasy)
		CheckRemovePerk(zad_keyCraftingHard)
	EndIf
EndFunction

Event OnOptionMenuAccept(int option, int index)
	if option == keyCraftingOID
		UpdateCraftingPerks(index)
		KeyCrafting = index
		SetMenuOptionValue(keyCraftingOID, difficultyList[KeyCrafting])
	ElseIf option == blindfoldModeOID
		BlindfoldMode = index
		SetMenuOptionValue(BlindfoldModeOID, blindfoldList[blindfoldMode])
		game.ForceFirstPerson()
		game.ForceThirdPerson()
		libs.UpdateControls()
	ElseIf option == DevicesUnderneathSlotOID
		DevicesUnderneathSlot = index
		libs.DevicesUnderneath.UpdateDeviceHiderSlot()
		SetMenuOptionValue(DevicesUnderneathSlotOID, SlotMasks[DevicesUnderneathSlot])
	EndIf
	int i = 0
	while i < 128
		if option == slotMaskOIDs[i]
			int value = 0
			value = Math.LeftShift(1, (index - 1))
			libs.Log("Index:" + index + " = " + value + "/" + SlotMaskValues.find(value))
			libs.DevicesUnderneath.SlotMaskFilters[i] = value
			SetMenuOptionValue(option, SlotMasks[index])
			libs.DevicesUnderneath.RebuildSlotmask(libs.PlayerRef)
			; if libs.DevicesUnderneath.IsStopped()
			; 	libs.DevicesUnderneath.Start()
			; EndIf
		EndIf
		i += 1
	EndWhile
EndEvent

Event OnOptionSliderOpen(int option)
	;Libs.Log("OnOptionSliderOpen("+option+")")
	int i = 0;
	while i < libs.EventSlots.Slotted
		if option == eventOIDs[i]
			SetSliderDialogStartValue(libs.EventSlots.Slots[i].Probability)
			SetSliderDialogDefaultValue(libs.EventSlots.Slots[i].DefaultProbability)
			SetSliderDialogRange(0,100)
			SetSliderDialogInterval(1)			
			return
		EndIf
		i+= 1
	EndWhile
	if option == thresholdOID
		SetSliderDialogStartValue(UnlockThreshold)
		SetSliderDialogDefaultValue(thresholdDefault)
		SetSliderDialogRange(1,350)
		SetSliderDialogInterval(1)
	elseif option == thresholdModifierOID
		SetSliderDialogStartValue(ThresholdModifier)
		SetSliderDialogDefaultValue(thresholdModifierDefault)
		SetSliderDialogRange(0,100)
		SetSliderDialogInterval(1)
	elseif option == blindfoldStrengthOID
		SetSliderDialogStartValue(blindfoldStrength)
		SetSliderDialogDefaultValue(blindfoldStrengthDefault)
		SetSliderDialogRange(0.2,1.0)
		SetSliderDialogInterval(0.01)
	elseif option == beltRateOID
		SetSliderDialogStartValue(BeltRateMult)
		SetSliderDialogDefaultValue(beltRateDefault)
		SetSliderDialogRange(1,5)
		SetSliderDialogInterval(0.1)	
	elseif option == plugRateOID
		SetSliderDialogStartValue(PlugRateMult)
		SetSliderDialogDefaultValue(plugRateDefault)
		SetSliderDialogRange(1,5)
		SetSliderDialogInterval(0.1)
	elseif option == eventIntervalOID
		SetSliderDialogStartValue(EventInterval)
		SetSliderDialogDefaultValue(eventIntervalDefault)
		SetSliderDialogRange(0.5, 12)
		SetSliderDialogInterval(0.05)
	elseIf option == effectVibrateChanceOID
		SetSliderDialogStartValue(EffectVibrateChance)
		SetSliderDialogDefaultValue(effectVibrateChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == effectHealthDrainChanceOID
		SetSliderDialogStartValue(EffectHealthDrainChance)
		SetSliderDialogDefaultValue(effectHealthDrainChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == effectManaDrainChanceOID
		SetSliderDialogStartValue(EffectManaDrainChance)
		SetSliderDialogDefaultValue(effectManaDrainChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == effectStaminaDrainChanceOID
		SetSliderDialogStartValue(EffectStaminaDrainChance)
		SetSliderDialogDefaultValue(effectStaminaDrainChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == baseMessageChanceOID
		SetSliderDialogStartValue(BaseMessageChance)
		SetSliderDialogDefaultValue(baseMessageChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == baseHornyChanceOID
		SetSliderDialogStartValue(BaseHornyChance)
		SetSliderDialogDefaultValue(baseHornyChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == baseBumpPumpChanceOID
		SetSliderDialogStartValue(BaseBumpPumpChance)
		SetSliderDialogDefaultValue(baseBumpPumpChanceDefault)
		SetSliderDialogRange(1, 100)
		SetSliderDialogInterval(1)
	elseIf option == VolumeOrgasmOID
		SetSliderDialogStartValue(VolumeOrgasm)
		SetSliderDialogDefaultValue(VolumeOrgasmDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.01)
	elseIf option == VolumeEdgedOID
		SetSliderDialogStartValue(VolumeEdged)
		SetSliderDialogDefaultValue(VolumeEdgedDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.01)
	elseIf option == VolumeVibratorOID
		SetSliderDialogStartValue(VolumeVibrator)
		SetSliderDialogDefaultValue(VolumeVibratorDefault)
		SetSliderDialogRange(0, 1)
		SetSliderDialogInterval(0.01)
	elseIf option == ssSleepChanceOID
		SetSliderDialogStartValue(ssSleepChance)
		SetSliderDialogDefaultValue(ssSleepChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	elseIf option == ssTrapChanceOID
		SetSliderDialogStartValue(ssTrapChance)
		SetSliderDialogDefaultValue(ssTrapChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	elseIf option == rmHeartbeatIntervalOID
		SetSliderDialogStartValue(rmHeartbeatInterval)
		SetSliderDialogDefaultValue(rmHeartbeatIntervalDefault)
		SetSliderDialogRange(0.5, 24)
		SetSliderDialogInterval(0.01)
	elseIf option == rmSummonHeartbeatIntervalOID
		SetSliderDialogStartValue(rmSummonHeartbeatInterval)
		SetSliderDialogDefaultValue(rmSummonHeartbeatIntervalDefault)
		SetSliderDialogRange(0.125, 12)
		SetSliderDialogInterval(0.01)
	elseIf option == numNpcsOID
		SetSliderDialogStartValue(numNpcs)
		SetSliderDialogDefaultValue(numNpcsDefault)
		SetSliderDialogRange(0, 20)
		SetSliderDialogInterval(1)
	elseIf option == destroyKeyProbabilityOID
		SetSliderDialogStartValue(destroyKeyProbability)
		SetSliderDialogDefaultValue(destroyKeyProbabilityDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	elseIf option == destroyKeyJamChanceOID
		SetSliderDialogStartValue(destroyKeyJamChance)
		SetSliderDialogDefaultValue(destroyKeyJamChanceDefault)
		SetSliderDialogRange(0, 100)
		SetSliderDialogInterval(1)
	Endif
EndEvent

Event OnOptionSelect(int option)
	Libs.Log("OnOptionSelect("+option+")")	
	if option == animsRegisterOID
		beltedAnims.LoadAnimations()
		SetTextOptionValue(animsRegisterOID, "Done.")
	elseif option == npcMessagesOID
		NpcMessages = !NpcMessages
		SetToggleOptionValue(npcMessagesOID, NpcMessages)
	elseif option == playerMessagesOID
		PlayerMessages = !PlayerMessages
		SetToggleOptionValue(playerMessagesOID, PlayerMessages)
	elseif option == destroyKeyOID
		destroyKey = !destroyKey
		SetToggleOptionValue(destroyKeyOID, destroyKey)
	elseif option == preserveAggroOID
		PreserveAggro = !PreserveAggro
		SetToggleOptionValue(PreserveAggroOID, PreserveAggro)
	elseif option == useBoundAnimsOID
		useBoundAnims = !useBoundAnims
		SetToggleOptionValue(useBoundAnimsOID, useBoundAnims)
	elseif option == skyreOID
		SkyRe = !SkyRe
		SetToggleOptionValue(skyreOID, SkyRe)
	elseif option == logMessagesOID
		 LogMessages = !LogMessages
		SetToggleOptionValue(logMessagesOID, LogMessages)
	elseif option == HardcoreEffectsOID
		 HardcoreEffects = !HardcoreEffects
		SetToggleOptionValue(HardcoreEffectsOID, HardcoreEffects)
	elseif option == ForbiddenTomeOID
		 ForbiddenTome = !ForbiddenTome
		SetToggleOptionValue(ForbiddenTomeOID, ForbiddenTome)
	elseif option == SergiusExperimentOID
		 SergiusExperiment = !SergiusExperiment
		SetToggleOptionValue(SergiusExperimentOID, SergiusExperiment)
	elseif option == SurreptitiousStreetsOID
		 SurreptitiousStreets = !SurreptitiousStreets
		SetToggleOptionValue(SurreptitiousStreetsOID, SurreptitiousStreets)
	elseif option == RadiantMasterOID
		 RadiantMaster = !RadiantMaster
		SetToggleOptionValue(RadiantMasterOID, RadiantMaster)
	elseif option == MasturbateOnBeltRemovalOID
		 MasturbateOnBeltRemoval = !MasturbateOnBeltRemoval
		SetToggleOptionValue(MasturbateOnBeltRemovalOID, MasturbateOnBeltRemoval)
	elseif option == ssWarningMessagesOID
		 ssWarningMessages = !ssWarningMessages
		SetToggleOptionValue(ssWarningMessagesOID, ssWarningMessages)
	elseif option == UseQueueNiNodeOID
		 UseQueueNiNode = !UseQueueNiNode
		SetToggleOptionValue(UseQueueNiNodeOID, UseQueueNiNode)
	elseif option == bootsSlowdownToggleOID
		 bootsSlowdownToggle = !bootsSlowdownToggle
		SetToggleOptionValue(bootsSlowdownToggleOID, bootsSlowdownToggle)
	elseif option == ifpOID
		ifp = !ifp
		SetToggleOptionValue(ifpOID, ifp)
	elseif option == breastNodeManagementOID
		breastNodeManagement = !breastNodeManagement
		SetToggleOptionValue(breastNodeManagementOID, breastNodeManagement)
	elseif option == bellyNodeManagementOID
		bellyNodeManagement = !bellyNodeManagement
		SetToggleOptionValue(bellyNodeManagementOID, bellyNodeManagement)
	EndIf
EndEvent

Event OnOptionDefault(int option)
	;Libs.Log("OnOptionDefault("+option+")")	
	int i = 0
	while i < libs.EventSlots.Slotted
		if option == eventOIDs[i]
			libs.EventSlots.Slots[i].Probability = libs.EventSlots.Slots[i].DefaultProbability
			SetSliderOptionValue(eventOIDs[i], libs.EventSlots.Slots[i].DefaultProbability, "{1}")
			return
		EndIf
		i+= 1
	EndWhile
	if (option == thresholdOID)
		UnlockThreshold = thresholdDefault
		SetSliderOptionValue(thresholdOID, thresholdDefault, "{0}")
	elseif (option == thresholdModifierOID)
		ThresholdModifier = ThresholdModifierDefault
		SetSliderOptionValue(thresholdModifierOID, thresholdModifierDefault, "{0}")
	elseif (option == blindfoldStrengthOID)
		blindfoldStrength = blindfoldStrengthDefault
		SetSliderOptionValue(blindfoldStrengthOID, blindfoldStrengthDefault, "{2}")
	elseIf (option == beltRateOID)
		BeltRateMult = beltRateDefault
		SetSliderOptionValue(beltRateOID, beltRateDefault, "{1}")
	elseIf (option == plugRateOID)
		PlugRateMult = plugRateDefault
		SetSliderOptionValue(plugRateOID, plugRateDefault, "{1}")
	elseIf (option == keyCraftingOID)
		UpdateCraftingPerks(keyCraftingDefault)
		KeyCrafting = keyCraftingDefault
		SetMenuOptionValue(keyCraftingOID, difficultyList[KeyCrafting])
	elseIf (option == blindfoldModeOID)
		BlindfoldMode = BlindfoldModeDefault
		SetMenuOptionValue(BlindfoldModeOID, blindfoldList[BlindfoldMode])
	elseIf (option == DevicesUnderneathSlotOID)
		DevicesUnderneathSlot = DevicesUnderneathSlotDefault
		SetMenuOptionValue(DevicesUnderneathSlotOID, SlotMasks[DevicesUnderneathSlot])
	elseIf (option == npcMessagesOID)
		NpcMessages = npcMessagesDefault
		SetToggleOptionValue(npcMessagesOID, npcMessagesDefault)
	elseIf (option == playerMessagesOID)
		PlayerMessages = playerMessagesDefault
		SetToggleOptionValue(playerMessagesOID, playerMessagesDefault)
	elseIf (option == destroyKeyOID)
		destroyKey = destroyKeyDefault
		SetToggleOptionValue(destroyKeyOID, destroyKeyDefault)
	elseIf (option == destroyKeyProbabilityOID)
		destroyKeyProbability = destroyKeyProbabilityDefault
		SetToggleOptionValue(destroyKeyProbabilityOID, destroyKeyProbabilityDefault)
	elseIf (option == destroyKeyJamChanceOID)
		destroyKeyJamChance = destroyKeyJamChanceDefault
		SetToggleOptionValue(destroyKeyJamChanceOID, destroyKeyJamChanceDefault)
	elseIf (option == PreserveAggroOID)
		PreserveAggro = PreserveAggroDefault
		SetToggleOptionValue(PreserveAggroOID, PreserveAggroDefault)
	elseIf (option == useBoundAnimsOID)
		useBoundAnims = useBoundAnimsDefault
		SetToggleOptionValue(useBoundAnimsOID, useBoundAnimsDefault)
	elseIf (option == skyreOID)
		SkyRe = skyreDefault
		SetToggleOptionValue(skyreOID, skyreDefault)
	elseIf (option == logMessagesOID)
		LogMessages = logMessagesDefault
		SetToggleOptionValue(logMessagesOID, LogMessages)
	elseIf (option == eventIntervalOID)
		EventInterval = eventIntervalDefault
		SetToggleOptionValue(eventIntervalOID, eventIntervalDefault)
	elseIf (option == effectVibrateChanceOID)
		EffectVibrateChance = effectVibrateChanceDefault
		SetSliderOptionValue(effectVibrateChanceOID, effectVibrateChanceDefault, "{1}")
	elseIf (option == effectHealthDrainChanceOID)
		EffectHealthDrainChance = effectHealthDrainChanceDefault
		SetSliderOptionValue(effectHealthDrainChanceOID, effectHealthDrainChanceDefault, "{1}")
	elseIf (option == effectManaDrainChanceOID)
		EffectManaDrainChance = effectManaDrainChanceDefault
		SetSliderOptionValue(effectManaDrainChanceOID, effectManaDrainChanceDefault, "{1}")
	elseIf (option == effectStaminaDrainChanceOID)
		EffectStaminaDrainChance = effectStaminaDrainChanceDefault
		SetSliderOptionValue(effectStaminaDrainChanceOID, effectStaminaDrainChanceDefault, "{1}")
	elseIf (option == baseMessageChanceOID)
		BaseMessageChance = baseMessageChanceDefault
		SetSliderOptionValue(baseMessageChanceOID, baseMessageChanceDefault, "{1}")
	elseIf (option == baseHornyChanceOID)
		BaseHornyChance = baseHornyChanceDefault
		SetSliderOptionValue(baseHornyChanceOID, baseHornyChanceDefault, "{1}")
	elseIf (option == baseBumpPumpChanceOID)
		BaseBumpPumpChance = BaseBumpPumpChanceDefault
		SetSliderOptionValue(baseBumpPumpChanceOID, BaseBumpPumpChanceDefault, "{1}")
	elseIf (option == VolumeOrgasmOID)
		VolumeOrgasm = VolumeOrgasmDefault
		SetSliderOptionValue(VolumeOrgasmOID, VolumeOrgasmDefault, "{3}")
	elseIf (option == VolumeEdgedOID)
		VolumeEdged = VolumeEdgedDefault
		SetSliderOptionValue(VolumeEdgedOID, VolumeEdgedDefault, "{3}")
	elseIf (option == VolumeVibrator)
		VolumeVibrator = VolumeVibratorDefault
		SetSliderOptionValue(VolumeVibratorOID, VolumeVibratorDefault, "{3}")
	elseif option == ForbiddenTomeOID
		ForbiddenTome = ForbiddenTomeDefault
		SetToggleOptionValue(ForbiddenTomeOID, ForbiddenTome)
	elseif option == SergiusExperimentOID
		SergiusExperiment = SergiusExperimentDefault
		SetToggleOptionValue(SergiusExperimentOID, SergiusExperiment)
	elseif option == SurreptitiousStreetsOID
		SurreptitiousStreets = SurreptitiousStreetsDefault
		SetToggleOptionValue(SurreptitiousStreetsOID, SurreptitiousStreets)
	elseif option == RadiantMasterOID
		RadiantMaster = RadiantMasterDefault
		SetToggleOptionValue(RadiantMasterOID, RadiantMaster)
	elseIf (option == HardcoreEffectsOID)
		HardcoreEffects = HardcoreEffectsDefault
		SetToggleOptionValue(HardcoreEffectsOID, HardcoreEffectsDefault)
	elseIf (option == ssSleepChanceOID)
		ssSleepChance = ssSleepChanceDefault
		SetSliderOptionValue(ssSleepChanceOID, ssSleepChanceDefault, "{1}")
	elseIf (option == ssTrapChanceOID)
		ssTrapChanceDefault = ssTrapChanceDefault
		SetSliderOptionValue(ssTrapChanceOID, ssTrapChanceDefault, "{1}")
	elseIf (option == rmHeartbeatIntervalOID)
		rmHeartbeatInterval = rmHeartbeatIntervalDefault
		SetSliderOptionValue(rmHeartbeatIntervalOID, rmHeartbeatIntervalDefault, "{3}")
	elseIf (option == rmSummonHeartbeatIntervalOID)
		rmSummonHeartbeatInterval = rmSummonHeartbeatIntervalDefault
		SetSliderOptionValue(rmSummonHeartbeatIntervalOID, rmSummonHeartbeatIntervalDefault, "{3}")
	elseIf (option == MasturbateOnBeltRemovalOID)
		MasturbateOnBeltRemoval = MasturbateOnBeltRemovalDefault
		SetToggleOptionValue(MasturbateOnBeltRemovalOID, MasturbateOnBeltRemovalDefault)
	elseIf (option == ssWarningMessagesOID)
		ssWarningMessages = ssWarningMessagesDefault
		SetToggleOptionValue(ssWarningMessagesOID, ssWarningMessagesDefault)
	elseIf (option == UseQueueNiNodeOID)
		UseQueueNiNode = UseQueueNiNodeDefault
		SetToggleOptionValue(UseQueueNiNodeOID, UseQueueNiNodeDefault)
	elseIf (option == bootsSlowdownToggleOID)
		bootsSlowdownToggle = bootsSlowdownToggleDefault
		SetToggleOptionValue(bootsSlowdownToggleOID, bootsSlowdownToggleDefault)
	elseIf (option == numNpcsOID)
		numNpcs = numNpcsDefault
		SetSliderOptionValue(numNpcsOID, numNpcs, "{1}")
	elseIf (option == ifpOID)
		ifp = ifpDefault
		SetToggleOptionValue(ifpOID, ifp)
	elseIf (option == breastNodeManagementOID)
		breastNodeManagement = breastNodeManagementDefault
		SetToggleOptionValue(breastNodeManagementOID, breastNodeManagement)
	elseIf (option == bellyNodeManagementOID)
		bellyNodeManagement = bellyNodeManagementDefault
		SetToggleOptionValue(bellyNodeManagementOID, bellyNodeManagement)
	endIf
EndEvent

Event OnOptionHighlight(int option)
	int i = 0
	while i < libs.EventSlots.Slotted
		if option == eventOIDs[i]
			string help = libs.EventSlots.Slots[i].help
			if help == ""
				help = "Configure the probability for a "+libs.EventSlots.Slots[i].Name +" event to occur."
			EndIf
			SetInfoText(help+"\nDefault:"+libs.EventSlots.Slots[i].DefaultProbability)
			return
		EndIf
		i+= 1
	EndWhile

	;Libs.Log("OnOptionHighlight("+option+")")			
	if (option == thresholdOID)
		SetInfoText("Base escape difficulty threshold. Higher is harder, lower is easier. At skill 100 and threshold 185, you would have a 15% chance to escape if not particularly aroused. At skill 100 and threshold 150, you would have a 50% chance to escape, and so forth. Note, that this is the base threshold, and that your actual milage will vary depending on the skill you attempt to escape with.\nDefault: "+thresholdDefault)
	elseif (option == thresholdModifierOID)
		SetInfoText("The Unlock Threshold will be increased by this much every time the player successfully escapes a device.\nDefault:"+thresholdModifierDefault)
	elseif (option == blindfoldStrengthOID)
		SetInfoText("Controls the strength of the blindfold effect.\nDefault:"+blindfoldStrengthDefault)
	elseIf (option == beltRateOID)
		SetInfoText("Arousal exposure multiplier while belted.\nDefault: "+beltRateDefault)
	elseIf (option == plugRateOID)
		SetInfoText("Arousal exposure multiplier while belted/plugged.\nDefault: "+plugRateDefault)
	elseIf (option == keyCraftingOID)
		SetInfoText("Key crafting difficulty.\nEasy: 1 iron ingot. Medium: 1 malachite ingot. Hard: 1 ebony ingot + 1 flawless diamond.")
	elseIf (option == blindfoldModeOID)
		SetInfoText("Switch between the three provided blindfold modes. DD's mode is intended for First Person play. While in first person, you will be able to move freely, and one of two effects will be applied to your screen. While in third person, you will be unable to move, but will be able to see clearly. The advantage of this mode is that you will be able to clearly see yourself in scenes (Sex, animations, etc), while still being forced to endure the blindfold to advance gameplay.\nLeeche's mode applies a dof-based blindfold effect constantly, and is intended for third person play.\nDefault:"+blindfoldList[blindfoldModeDefault])
	elseIf (option == DevicesUnderneathSlotOID)
		SetInfoText("Configure which slot the hidden (Device / Equipment) Hider operates on. It doesn't matter what slot is set, though a slot must be set. If you set this to the same slot as a slot that is being used by a device, bad things will happen. Don't touch this unless you know what you're doing.\nDefault: "+SlotMasks[DevicesUnderneathSlotDefault])
	elseIf (option == animsRegisterOID)
		SetInfoText("Reregister animations provided by this mod.")
	elseIf (option == npcMessagesOID)
		SetInfoText("Enable/disable device related messages for NPC's.\nDefault:"+npcMessagesDefault)
	elseIf (option == playerMessagesOID)
		SetInfoText("Enable/disable device related messages for the player. Note: Messages crucial to device functionality (Such as the menu) will display regardless of this setting. The creator of this mod recommends that you leave this option enabled, unless you really loathe his writing.\nDefault:"+playerMessagesDefault+".")
	elseIf (option == preserveAggroOID)
		SetInfoText("Toggle the preservation of a scene's aggressiveness. Disable this for more variety in animations (At the cost of seeing consensual animations in rape-scenes, etc).\nDefault:"+preserveAggroDefault)
	elseIf (option == useBoundAnimsOID)
		SetInfoText("Toggle the use of bound animations within scenes. Without this option, Yokes / Armbinders / etc will be removed until the sex act has concluded.\nDefault:"+useBoundAnimsDefault)
	elseIf (option == destroyKeyOID)
		SetInfoText("Toggle whether or not the key should be destroyed after device removal.")
	elseIf (option == destroyKeyProbabilityOID)
		SetInfoText("Set the chance of the key being destroyed prior to device removal.\nDefault:"+destroyKeyProbabilityDefault)
	elseIf (option == destroyKeyJamChanceOID)
		SetInfoText("Set the chance of the lock jamming, if the key is destroyed.\nWARNING: If you do not have an alternative method of escape (Such as through a mod like Captured Dreams), do not enable this feature, or you will permanently be stuck wearing the device!\nDefault:"+destroyKeyJamChanceDefault)
	elseIf (option == skyreOID)
		SetInfoText("Enable/disable SkyRe support. If enabled, this option will use the player's Pickpocket skill instead of their lockpick skill for escape attempts (Lockpick is Wayfaring in SkyRe, and Pickpocket is Fingersmithing).\nDefault:"+skyreDefault)
	elseIf (option == logMessagesOID)
		SetInfoText("Toggles display of debug messages in Papyrus.0.log. You can disable this if everything is working correctly.")
	elseIf (option == eventIntervalOID)
		SetInfoText("Configure how frequently device events are polled, measured in game hours. The lower this is, the more frequent all periodic events / effects are.\nDefault: " + eventIntervalDefault)
	elseIf (option == effectVibrateChanceOID)
		SetInfoText("Controls the probability of a Vibration effect being started via event polling.\nDefault:"+EffectVibrateChanceDefault)
	elseIf (option == effectHealthDrainChanceOID)
		SetInfoText("Controls the probability of a Health Drain effect being started via event polling.\nDefault:"+EffectHealthDrainChanceDefault)
	elseIf (option == effectManaDrainChanceOID)
		SetInfoText("Controls the probability of a Mana Drain effect being started via event polling.\nDefault:"+EffectManaDrainChanceDefault)
	elseIf (option == effectStaminaDrainChanceOID)
		SetInfoText("Controls the probability of a Stamina effect being started via event polling.\nDefault:"+effectStaminaDrainChanceDefault)
	elseIf (option == baseMessageChanceOID)
		SetInfoText("Controls the base probability of a Message Event being started via event polling. This chance will vary for some messages: This is merely the base chance.\nDefault:"+baseMessageChanceDefault)
	elseIf (option == baseHornyChanceOID)
		SetInfoText("Controls the base probability of a Horny-Animation Event being started via event polling. The chance for this event is highly influenced / increased by player arousal.\nDefault:"+baseHornyChanceDefault)
	elseIf (option == baseBumpPumpChanceOID)
		SetInfoText("Controls the base probability of a Bump-Pump Event being started via event polling, or via sitting/jumping. The chance for this event varies depending on what caused it.\nDefault:"+baseBumpPumpChanceDefault)
	elseIf (option == VolumeOrgasmOID)
		SetInfoText("Controls the volume of an an actor's moans during an orgasm.\nDefault:" + volumeOrgasmDefault)
	elseIf (option == VolumeEdgedOID)
		SetInfoText("Controls the volume of an actor's moans after being edged.\nDefault:" + volumeEdgedDefault)
	elseIf (option == VolumeVibrator)
		SetInfoText("Controls the volume of a vibrator. Note, that the stronger vibrators are inherently louder than the weaker ones. If you set this too low, you may not be able to hear the weaker ones.\nDefault:" + volumeVibratorDefault)
	elseIf (option == ForbiddenTomeOID)
		SetInfoText("Enable/disable the triggers to start the Forbidden Tome quest. Hint: This quest is started in the Arcanaeum.\nDefault:"+ForbiddenTomeDefault)
	elseIf (option == SergiusExperimentOID)
		SetInfoText("Enable/disable the triggers to start Sergius's Experiment quest. Hint: This quest is started by talking to Sergius.\nDefault:"+SergiusExperimentDefault)
	elseIf (option == SurreptitiousStreetsOID)
		SetInfoText("Enable/disable the 'Catch All' triggers that start the radiant master quests. Hint: Booty-trapped containers, sleep encounters, etc.\nDefault:"+SurreptitiousStreetsDefault)
	elseIf (option == RadiantMasterOID)
		SetInfoText("Enable/disable the 'Radiant Master' quest. This is a Surreptitious Streets quest. If there are no elligible quests enabled, Surreptitious Streets will do nothing.\nDefault:"+RadiantMaster)
	elseIf (option == HardcoreEffectsOID)
		SetInfoText("Enable/disable the more detrimental effects that some items (Such as restraints) apply.\nDefault:"+HardcoreEffectsDefault)
	elseIf (option == ssSleepChanceOID)
		SetInfoText("Configure the probability of a sleep capture event occuring while sleeping in an unsafe area.\nDefault:"+ssSleepChanceDefault)
	elseIf (option == ssTrapChanceOID)
		SetInfoText("Configure the probability of a trapped container spawning in an elligible location.\nDefault:"+ssTrapChanceDefault)
	elseIf (option == rmHeartbeatIntervalOID)
		SetInfoText("Configure how frequently master is polled / status is checked.\nDefault:"+rmHeartbeatIntervalDefault)
	elseIf (option == rmSummonHeartbeatIntervalOID)
		SetInfoText("Configure the frequency of summon reminders.\nDefault:"+rmSummonHeartbeatIntervalDefault)
	elseIf (option == MasturbateOnBeltRemovalOID)
		SetInfoText("Enable/disable the Masturbate On Belt Removal event that occurs when the belt is voluntarily unequipped while over a certain arousal threshold.\nDefault:"+MasturbateOnBeltRemovalDefault)
	elseIf (option == ssWarningMessagesOID)
		SetInfoText("Enable/disable warning messages prior to Surreptitious Streets events. This option will give provide a way to avoid traps / capture events in an immersion friendly manner, without disabling them all-together.\nDefault:"+ssWarningMessagesDefault)
	elseIf (option == UseQueueNiNodeOID)
		SetInfoText("Toggles the use of QueueNiNode after Item Equip/Unequips. The advantage of QueueNiNode is that it will apply changes while you're in your inventory, and won't have an equip/unequip sound. This will work fine for some users, but for others will cause the game to lag briefly after an equip/unequip takes place.\nDefault:"+UseQueueNiNodeDefault)
	elseIf (option == bootsSlowdownToggleOID)
		SetInfoText("Toggles the slowdown effect caused by some boots within DDx.\nDefault:"+bootsSlowdownToggleDefault)
	elseIf (option == numNpcsOID)
		SetInfoText("Configure the number of nearby belted NPCs (Per Area) that will be processed by event polling. Set to 0 to disable altogether. Higher values will increase script load.\nDefault:"+numNpcsDefault)
	elseIf (option == ifpOID)
		SetInfoText("Configures support for Immersive First Person.\nDefault:"+ifpDefault)
	elseIf (option == breastNodeManagementOID)
		SetInfoText("If enabled, breasts will be resized while the chastity bra is worn, to minimized HDT clipping.\nDefault: "+breastNodeManagementDefault)
	elseIf (option == bellyNodeManagementOID)
		SetInfoText("If enabled, belly will be resized while the corset is worn, to minimized HDT clipping.\nDefault: "+bellyNodeManagementDefault)
	endIf
EndEvent


Event OnOptionSliderAccept(int option, float value)
	int i = 0;
	while i < libs.EventSlots.Slotted
		if option == eventOIDs[i]
			libs.EventSlots.Slots[i].Probability = value as int
			SetSliderOptionValue(option, value, "{1}")
			return
		EndIf
		i+= 1
	EndWhile
	;Libs.Log("OnOptionSliderAccept("+option+"/"+value+")")	
	if (option == thresholdOID)
		UnlockThreshold = value as int
		SetSliderOptionValue(option, value, "{0}")
	elseif (option == thresholdModifierOID)
		thresholdModifier = value as int
		SetSliderOptionValue(option, value, "{0}")
	elseif (option == blindfoldStrengthOID)
		blindfoldStrength = value
		SetSliderOptionValue(option, value, "{2}")
		Game.ForceFirstPerson()
		Game.ForceThirdPerson()
	elseIf (option == beltRateOID)
		BeltRateMult = value
		SetSliderOptionValue(option, value, "{1}")
	elseIf (option == plugRateOID)
		PlugRateMult = value
		SetSliderOptionValue(option, value, "{1}")
	elseIf (option == eventIntervalOID)
		EventInterval = value
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == effectVibrateChanceOID
		effectVibrateChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == effectHealthDrainChanceOID
		effectHealthDrainChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == effectManaDrainChanceOID
		effectManaDrainChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == effectStaminaDrainChanceOID
		effectStaminaDrainChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == baseMessageChanceOID
		baseMessageChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == baseHornyChanceOID
		baseHornyChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == baseBumpPumpChanceOID
		BaseBumpPumpChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == VolumeOrgasmOID
		VolumeOrgasm = (value as Float)
		SetSliderOptionValue(option, value, "{3}")
	elseIf option == VolumeVibratorOID
		VolumeVibrator = (value as Float)
		SetSliderOptionValue(option, value, "{3}")
	elseIf option == VolumeEdgedOID
		VolumeEdged = (value as Float)
		SetSliderOptionValue(option, value, "{3}")
	elseIf option == ssSleepChanceOID
		ssSleepChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == ssTrapChanceOID
		ssTrapChance = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == rmHeartbeatIntervalOID
		rmHeartbeatInterval = (value as Float)
		SetSliderOptionValue(option, value, "{3}")
	elseIf option == rmSummonHeartbeatIntervalOID
		rmSummonHeartbeatInterval = (value as Float)
		SetSliderOptionValue(option, value, "{3}")
	elseIf (option == destroyKeyProbabilityOID)
		destroyKeyProbability = value as Int
		SetSliderOptionValue(option, value, "{1}")
	elseIf (option == destroyKeyJamChanceOID)
		destroyKeyJamChance = value as Int
		SetSliderOptionValue(option, value, "{1}")
	elseIf option == numNpcsOID
		numNpcs = (value as Int)
		SetSliderOptionValue(option, value, "{1}")
	EndIf
EndEvent

int function LookupSlotMask(int i)
	int value = (libs.DevicesUnderneath.SlotMaskFilters[i])
	if value == 0
		return 0
	Else
		return SlotMaskValues.Find(value)
	EndIf
EndFunction
