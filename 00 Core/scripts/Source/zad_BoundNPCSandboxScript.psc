;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname zad_BoundNPCSandboxScript Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
	BoundCombat.EvaluateAA(akActor)
	;BoundCombat.Apply_NPC_ABC(akActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

zadLibs Property libs Auto
zadBoundCombatScript Property BoundCombat auto