Scriptname zadNPCScript extends ReferenceAlias

zadBQ00 Property questScript Auto  
zadLibs Property libs Auto

ReferenceAlias Property NPC Auto


Event OnSpellCast(Form akSpell)
	if (akSpell as Spell) != none
		libs.SpellCastVibrate(NPC.GetActorReference(), akSpell)
	EndIf
EndEvent


