Scriptname zadPlayerScript extends ReferenceAlias
 
zadBQ00 Property questScript Auto
zadNPCQuestScript Property npcQuestScript Auto
zadCameraState Property cameraState Auto
 
zadLibs Property libs Auto
Formlist Property SitBlockKeywords Auto

Event OnPlayerLoadGame()
	actor akActor = libs.PlayerRef
	libs.SpellCastVibrateCooldown = 0.0
	questScript.Maintenance()
	cameraState.Maintenance()
	libs.ResetDialogue()
	AddInventoryEventFilter(libs.SoulgemFilled)
	If akActor.WornHasKeyword(libs.zad_DeviousHobbleSkirt)
		Utility.SetINIBool("bDampenPlayerControls:Controls", false)
	Endif
	if akActor.WornHasKeyword(libs.zad_EffectForcedWalk)
		libs.MuteOverEncumberedMSG()
	endif
	Game.UpdateHairColor()
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
				libs.InflateRandomPlug(akActor, 1)	
			else
				libs.UpdateExposure(akActor, 0.15)
				libs.NotifyPlayer("You awkwardly sit down, doing your best to avoid disturbing the plugs inside of you.")
			EndIf
		Else
			libs.NotifyPlayer("The Chastity Belt you are wearing makes sitting down rather awkward.")
		EndIf
	EndIf
EndEvent
 
Event OnSpellCast(Form akSpell)
	if (akSpell as Spell) != none
		libs.SpellCastVibrate(libs.PlayerRef, akSpell)
	EndIf
EndEvent
 
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if libs.config.numNpcs != 0
		libs.RepopulateNpcs()
	EndIf
EndEvent
 
 
Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	actor akActor = libs.PlayerRef
	if akBaseObject as Armor
		armor akArmor = (akBaseObject as Armor)
		if Math.LogicalAnd(akArmor.GetSlotMask(), 0x00000004) && !akArmor.HasKeyword(libs.zad_DeviousHarness)
			if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBra) &&  libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBreasts)
				libs.ShowBreasts(libs.PlayerRef)
			EndIf
			if libs.PlayerRef.WornHasKeyword(libs.zad_DeviousCorset) && libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBelly)
				libs.ShowBelly(libs.PlayerRef)
			EndIf
		EndIf
	EndIf
	if akActor.WornHasKeyword(libs.zad_DeviousHeavyBondage) && ((akBaseObject as Weapon) || (akBaseObject as Spell) || (akBaseObject as Light) || (akBaseObject as Armor).HasKeywordString("ArmorShield"))
		if akActor.GetEquippedItemType(0) > 0
			akActor.UnequipItem((akActor.GetEquippedObject(0) as Weapon), abSilent = true)
			akActor.UnequipItem((akActor.GetEquippedObject(0) as Armor), abSilent = true)
			akActor.UnequipItem((akActor.GetEquippedObject(0) as Light), abSilent = true)
			akActor.UnequipSpell((akActor.GetEquippedObject(0) as Spell), 0)
		endif
		if akActor.GetEquippedItemType(1) > 0
			akActor.UnequipItem((akActor.GetEquippedObject(1) as Weapon), abSilent = true)
			akActor.UnequipSpell((akActor.GetEquippedObject(1) as Spell), 1)
		endif
	endif
EndEvent
 
 
Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	actor akActor = libs.PlayerRef
	if akBaseObject as Armor
		armor akArmor = (akBaseObject as Armor)
		if Math.LogicalAnd(akArmor.GetSlotMask(), 0x00000004)
			if !akArmor.HasKeyword(libs.zad_DeviousBra) && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousBra) && libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBreasts)
				libs.HideBreasts(libs.PlayerRef)
			EndIf
			if !akArmor.HasKeyword(libs.zad_DeviousCorset) && libs.PlayerRef.WornHasKeyword(libs.zad_DeviousCorset) && libs.PlayerRef.HasMagicEffectWithKeyword(libs.zad_EffectCompressBelly)
				libs.HideBelly(libs.PlayerRef)
			EndIf
		EndIf
	EndIf
EndEvent