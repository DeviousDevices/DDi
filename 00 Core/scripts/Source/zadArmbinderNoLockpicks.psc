ScriptName zadArmbinderNoLockpicks extends ActiveMagicEffect

; Libraries
zadLibs Property Libs Auto

actor Property Target Auto

ObjectReference Property TheSafe Auto
MiscObject Property Lockpick Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectStart(armbinder-noLockpicks)")
	target = akTarget
	GoToState("NormalMode")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	libs.Log("OnEffectFinish(armbinder-noLockpicks)")
	int numItems = TheSafe.GetItemCount(Lockpick)
	if target == libs.PlayerRef && numItems > 0
		TheSafe.RemoveAllItems(libs.PlayerRef, true, false)
	endIf
EndEvent

state NormalMode
	event OnBeginState()
		if target == libs.PlayerRef
			int idx = target.GetItemCount(lockpick)
			target.RemoveItem(lockpick, idx, true, theSafe)
		EndIf
	endEvent

	event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		if target == libs.PlayerRef && akBaseItem == lockpick
			target.RemoveItem(akBaseItem, aiItemCount, true, TheSafe)
		endIf
	endEvent
endState
