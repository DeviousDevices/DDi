Scriptname zadNPCScript extends ReferenceAlias

zadBQ00 Property questScript Auto  
zadLibs Property libs Auto

ReferenceAlias Property NPC Auto


Event OnSpellCast(Form akSpell)
	Spell tmp = (akSpell as Spell)
	if tmp == none
		return
	EndIf
	libs.SpellCastVibrate(NPC.GetActorReference(), akSpell)
EndEvent


