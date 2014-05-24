scriptName zadBenchmark extends Quest

zadLibs property libs Auto
int SneakKey = 0
import zadNativeFunctions

Function ReEquipUsingPapyrus(actor akActor, keyword zad_DeviousDevice)
	int i = akActor.GetNumItems();
	while i > 0
		i -= 1
		Form f = akActor.GetNthForm(i)
		if f && f.HasKeyword(zad_DeviousDevice)
			akActor.EquipItem(f, false, true)
		EndIf
	EndWhile
EndFunction

Function ReEquipUsingSKSE(actor akActor, keyword zad_DeviousDevice)
	Form f = FindMatchingDevice(akActor, zad_DeviousDevice)
	if f
		akActor.EquipItem(f, false, true)
	EndIf
EndFunction

Event OnKeyDown(Int KeyCode) 
	if KeyCode == SneakKey ; ReEquipExistingDevice Benchamrk
		libs.NotifyPlayer("Beginning ReEquipExistingDevice benchmark.", true)
		int i =0
		libs.PlayerRef.RemoveAllItems()
		libs.NotifyPlayer("Adding items...")
		libs.PlayerRef.AddItem(libs.braPaddedRendered, 20000, true)
		libs.PlayerRef.AddItem(libs.beltPaddedRendered, 1, true)
		i = 0
		libs.Log("Beginning benchmark.")
		float startTime = Utility.GetCurrentRealTime()
		while i < 100
			ReEquipUsingSKSE(libs.PlayerRef, libs.zad_DeviousBelt)
			i += 1
		EndWhile
		float endTime = Utility.GetCurrentRealTime()
		string msg = "New method took "+ (endTime - startTime) + " seconds."
		libs.Log(msg)
		libs.NotifyPlayer(msg)
		startTime = Utility.GetCurrentRealTime()
		endTime = 0
		i = 0
		while i < 100
			ReEquipUsingPapyrus(libs.PlayerRef, libs.zad_DeviousBelt)
			i += 1
		EndWhile
		endTime = Utility.GetCurrentRealTime()
		msg = "Old method took "+ (endTime - startTime) + " seconds."
		libs.Log(msg)
		libs.NotifyPlayer(msg)
		libs.NotifyPlayer("Benchmark Complete. Check the log for results.", true)
	EndIf
EndEvent

Function SetupBenchmarks()
	SneakKey = Input.GetMappedKey("Sneak")
	RegisterForKey(SneakKey)
EndFunction
