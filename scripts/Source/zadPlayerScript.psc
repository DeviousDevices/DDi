Scriptname zadPlayerScript extends ReferenceAlias

zadBQ00 Property questScript Auto
zadNPCQuestScript Property npcQuestScript Auto
zadCameraState Property cameraState Auto

zadLibs Property libs Auto
Formlist Property SitBlockKeywords Auto


Event OnPlayerLoadGame()
	questScript.Maintenance()
	cameraState.Maintenance()
	libs.ResetDialogue()
	AddInventoryEventFilter(libs.SoulgemFilled)
EndEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if akBaseItem == libs.SoulgemFilled
		; Replace with base item.
		If akItemReference != None && akDestContainer == None  ; Dropped
			libs.Log("Rechargeable soulgem removed: In world. Doing nothing.")
		ElseIf akDestContainer != None && (akDestContainer as Actor) != libs.PlayerRef ; Gave item to NPC.
			libs.Log("Rechargeable soulgem removed: Gave to an NPC, or stored in a chest.")
		Else
			libs.Log("Rechargeable soulgem removed: Used up. Replacing with empty.")
			libs.playerRef.AddItem(libs.SoulgemEmpty, 1, true)
			if akItemReference
				akItemReference.Delete()
			EndIf
		EndIf
	EndIf
EndEvent


Event OnSit(ObjectReference akFurniture)
	actor akActor = libs.PlayerRef
	int numKeywords = SitBlockKeywords.GetSize()
	int i = 0
	while (i < numKeywords)
		if akFurniture.HasKeyword((SitBlockKeywords.GetAt(i) as Keyword))
			libs.log(akFurniture + " contains blocked keyword " + SitBlockKeywords.GetAt(i) + ". Not OnSitting.")
			return
		EndIf
		i += 1
	endwhile

	if akActor.WornHasKeyword(questScript.zad_DeviousDevice)
		libs.Log("OnSit()")
		SendModEvent("EventOnSit")
		if akActor.WornHasKeyword(libs.zad_DeviousPlug)
			if akActor.WornHasKeyword(libs.zad_HasPumps) && Utility.RandomInt() <= libs.Config.BaseBumpPumpChance * 2
				libs.NotifyPlayer("You mistakenly sit down on one of the pumps dangling from your groin.")
				libs.NotifyPlayer("You immediately regret this as the plugs inflate painfully inside of you.")
				questScript.Libs.Moan(akActor)
				questScript.Libs.UpdateExposure(akActor, 1)
				return
			EndIf
			libs.UpdateExposure(akActor, 0.15)
			libs.NotifyPlayer("You awkwardly sit down, doing your best to avoid disturbing the plugs inside of you.")

		Else
			libs.NotifyPlayer("The Chastity Belt you are wearing makes sitting down rather awkward.")
		EndIf
	EndIf
EndEvent

Event OnSpellCast(Form akSpell)
	Spell tmp = (akSpell as Spell)
	if tmp == none
		return
	EndIf
	actor akActor = libs.PlayerRef
	libs.SpellCastVibrate(akActor, akSpell)
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if libs.config.numNpcs == 0
		return
	EndIf
	libs.RepopulateNpcs()
EndEvent


Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	armor akArmor = (akBaseObject as Armor)
	if !akArmor
		return
	EndIf
	if libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBreasts) && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBra) && (Math.LogicalAnd(akArmor.GetSlotMask(), 0x00000004) && !akArmor.HasKeyword(libs.zad_DeviousHarness))
		libs.ShowBreasts(libs.PlayerRef)
	EndIf
	if libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBelly) && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousCorset) && (Math.LogicalAnd(akArmor.GetSlotMask(), 0x00000004) && !akArmor.HasKeyword(libs.zad_DeviousHarness))
		libs.ShowBelly(libs.PlayerRef)
	EndIf
EndEvent


Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	armor akArmor = (akBaseObject as Armor)
	if !akArmor
		return
	EndIf
	if !akArmor.HasKeyword(libs.zad_DeviousBra) && libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBreasts) && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBra) && Math.LogicalAnd(akArmor.GetSlotMask(), 0x00000004)
		libs.HideBreasts(libs.PlayerRef)
	EndIf
	if !akArmor.HasKeyword(libs.zad_DeviousCorset) && libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBreasts) && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousCorset) && Math.LogicalAnd(akArmor.GetSlotMask(), 0x00000004)
		libs.HideBelly(libs.PlayerRef)
	EndIf
EndEvent
