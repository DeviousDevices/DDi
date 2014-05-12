ScriptName zaddSergiusScript extends Quest Conditional

zadLibs Property libs Auto
zaddReliableForceGreet Property fg Auto

Message Property zaddsgBeltInexperiencedMsg Auto
Message Property zaddsgBeltExperiencedMsg Auto
Message Property zaddsgUnbeltMsg Auto

Armor Property beltInventory Auto
Armor Property beltRendered Auto

Quest Property beltQuest Auto
Scene Property ComeBackTomorrowScene Auto
Float Property ComeBackTime Auto Conditional
GlobalVariable Property GameDaysPassed Auto
LeveledItem Property FavorRewardEnchArmor Auto
Book Property LustGemNote Auto

Function SergiusBeltPlayerScene(bool experienced)
	libs.Log("SergiusBeltPlayerScene("+experienced+")")
	if experienced
		zaddsgBeltExperiencedMsg.Show()
	Else
		zaddsgBeltInexperiencedMsg.Show()
	EndIf
	libs.ManipulateDevice(libs.PlayerRef, libs.plugChargeableVag, true)
	libs.EquipDevice(libs.PlayerRef, beltInventory, beltRendered, libs.zad_DeviousBelt)
	SetStage(10)
	SetObjectiveDisplayed(10)
EndFunction


Function SergiusUnBeltPlayerScene()
	libs.Log("SergiusUnBeltPlayerScene()")
	ComeBackTime = GameDaysPassed.GetValue() + 1
	SetStage(20)
	beltQuest.SetStage(100)
	libs.RemoveDevice(libs.PlayerRef, beltInventory, beltRendered, libs.zad_DeviousBelt)
	libs.ManipulateDevice(libs.PlayerRef, libs.plugChargeableVag, false, skipEvents=true)
	zaddsgUnbeltMsg.Show()
	libs.SetAnimating(libs.PlayerRef, false)
	libs.ActorOrgasm(libs.PlayerRef)
	libs.PlayerRef.RemoveItem(beltInventory, 1, true)
	libs.PlayerRef.RemoveItem(libs.plugChargeableVag, 1, true)
	SetObjectiveCompleted(10)
	SetObjectiveDisplayed(20)
	ComeBackTomorrowScene.Start()
EndFunction


Function StopFG()
	fg.DialogueDone = False
EndFunction

Function ComeBackTomorrow()
	libs.Log("ComeBackTomorrow()")
EndFunction


Function QuestComplete()
	libs.Log("QuestComplete()")
	SetObjectiveCompleted(20)
	SetStage(100)
	libs.PlayerRef.AddItem(FavorRewardEnchArmor)
	libs.PlayerRef.AddItem(libs.SoulgemEmpty)
	libs.PlayerRef.AddItem(libs.SoulgemStand)
	libs.PlayerRef.AddItem(LustGemNote)
	libs.PlayerRef.AddPerk(libs.LustgemCrafting)
	CompleteQuest()
EndFunction
