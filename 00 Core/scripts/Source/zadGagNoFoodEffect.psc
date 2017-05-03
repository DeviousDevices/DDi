ScriptName zadGagNoFoodEffect extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto

actor Property Target Auto

ObjectReference Property Refrigerator Auto
Keyword Property FoodKeyword Auto
Keyword Property RawFoodKeyword Auto
Keyword Property PotionKeyword Auto
Keyword Property zad_PermitOral Auto

bool panelGagOpen = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == libs.PlayerRef
		libs.Log("OnEffectStart(gag-noFood)")
		target = akTarget
		UpdateState()
		RegisterForModEvent("GagPanelStateChange", "OnGagPanelStateChange")
	EndIf
EndEvent

Event OnGagPanelStateChange(string eventName, string argString, float argNum, form sender)
	libs.Log("OnGagPanelStateChange("+argString+","+argNum+")")
	if target != libs.PlayerRef || target.GetLeveledActorBase().GetName() != argString
		libs.Log("Not player. Done.")
	else
		if argNum == 0 ; Open
			panelGagOpen = true
			UpdateState()
			RemoveFromFridge()
		ElseIf argNum == 1 ;Closed
			; StoreInFridge() ; Called in HardcoreMode OnBeginState()
			panelGagOpen = false
			UpdateState()
		Else
			libs.Error("OnGagPanelStateChange received invalid state:"+argNum)
		EndIf
	EndIf
EndEvent

Function UpdateState()
	if target == libs.PlayerRef && !target.WornHasKeyword(zad_PermitOral) && !panelGagOpen
		if !libs.config.GagTooltip
			libs.config.GagTooltip = True
			libs.NotifyPlayer("The Devious Devices Gag no-food effect is now active. While wearing a gag, you will be unable to eat, or to consume potions. As such, all food / potions you obtain will be removed from your inventory. Upon removing the gag (Or removing the plug, in the case of a Panel-gag), the items removed by this effect will be returned.", true)
		EndIf
		GoToState("HardcoreMode")
	else
		GoToState("NormalMode")
	endIf
EndFunction

Function RemoveFromFridge()
	libs.Log("RemoveFromFridge(gag-noFood)")
	int numItems = Refrigerator.GetItemCount(FoodKeyword) + Refrigerator.GetItemCount(RawFoodKeyword) + Refrigerator.GetItemCount(PotionKeyword)
	if target == libs.PlayerRef && numItems > 0
		Refrigerator.RemoveAllItems(libs.PlayerRef, true, false)
	endIf
EndFunction

Function StoreInFridge()
	libs.Log("StoreInFridge(gag-noFood)")
	int idx = target.GetNumItems()
	while idx > 0
		idx -= 1
		Form nthForm = target.GetNthForm(idx)
		Potion tmp = nthForm as Potion
		if tmp && !tmp.IsHostile() ;nthForm.HasKeyword(FoodKeyword) || nthForm.HasKeyword(RawFoodKeyword) || nthForm.HasKeyword(PotionKeyword)
			target.RemoveItem(nthForm, target.GetItemCount(nthForm), true, Refrigerator)
		endIf
	endWhile
EndFunction

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(gag-noFood)")
	RemoveFromFridge()
EndEvent

state HardcoreMode
	event OnBeginState()
		if target == libs.PlayerRef
			StoreInFridge()
		EndIf
	endEvent

	event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		Potion tmp = akBaseItem as Potion
		if target == libs.PlayerRef && tmp && !tmp.IsHostile();(akBaseItem.HasKeyword(FoodKeyword) || akBaseItem.HasKeyword(RawFoodKeyword) || akBaseItem.HasKeyword(PotionKeyword))
			target.RemoveItem(akBaseItem, aiItemCount, true, Refrigerator)
		endIf
	endEvent
endState

state NormalMode
	event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	endEvent
endState
