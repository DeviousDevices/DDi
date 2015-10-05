scriptName zadBenchmark extends Quest

zadLibs property libs Auto
int SneakKey = 0
int SprintKey = 0
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
      if keyCode == SprintKey
          libs.Log("Devel - Removing generic device, belt.")
	  libs.ManipulateGenericDeviceByKeyword(libs.playerRef, libs.zad_DeviousBelt, false);
          return;
      ElseIf KeyCode == SneakKey
          libs.Log("Devel - Removing generic device, corset.")
          libs.ManipulateGenericDeviceByKeyword(libs.playerRef, libs.zad_DeviousCorset, false);
          return;
	EndIf
EndEvent

Function SetupBenchmarks()
	SneakKey = Input.GetMappedKey("Sneak")
	RegisterForKey(SneakKey)
	SprintKey = Input.GetMappedKey("Sprint")
	RegisterForKey(SprintKey)
EndFunction
