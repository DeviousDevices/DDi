Scriptname zadRestraintScript extends zadEquipScript  

Function OnEquippedPre(actor akActor, bool silent=false)
	; Waste of a function, to work around absolutely fucking retarded papyrus OO implementation.
	Parent.OnEquippedPre(akActor, silent)
EndFunction
