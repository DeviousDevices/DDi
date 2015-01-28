ScriptName zadMerchantCurse extends ActiveMagicEffect

zadLibs Property libs Auto
zadYokeQuestScript Property ybq Auto
MiscObject Property ItemGold Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget != libs.PlayerRef
		return
	EndIf
	libs.Log("OnEffectStart(MerchantCurse)")
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(MerchantCurse)")
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem != ItemGold
		return
	EndIf	
	int curGold = libs.PlayerRef.GetItemCount(itemGold) ; Using this instead of aiItemCount to make sure we don't miss any.
	int goldDelta = ybq.MerchantCurseGoldOwed - (ybq.MerchantCurseGoldStolen + curGold)

	libs.PlayerRef.RemoveItem(itemGold, ybq.MerchantCurseGoldOwed - ybq.MerchantCurseGoldStolen, true)
	libs.NotifyPlayer("The gold vanishes from your fingers as you touch it...")
	if goldDelta <= 0
		; Player has paid their debt.
		libs.NotifyPlayer("You feel the Merchant-Curse lift from you.")
		ybq.MerchantCurseGoldOwed = 0
		ybq.MerchantCurseGoldStolen = 0
		libs.PlayerRef.RemoveSpell(ybq.MerchantCurseSpell)
		libs.Log("Player paid off MerchantCurse.")
	Else
		libs.NotifyPlayer("You have " + goldDelta + " remaining gold to pay off.")
		ybq.MerchantCurseGoldStolen += curGold
		libs.Log("MerchantCurse::OnItemAdded() Confiscated player gold ("+ybq.MerchantCurseGoldStolen + " / " + ybq.MerchantCurseGoldOwed+"): " + goldDelta)
	EndIf

EndEvent
