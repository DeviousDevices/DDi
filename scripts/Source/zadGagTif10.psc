;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname zadGagTif10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
libs.EdgedSound.Play(PlayerRef)
Libs.EquipDevice(Libs.PlayerRef, Libs.harnessCollar, Libs.harnessCollarRendered, Libs.zad_DeviousCollar, false, true)
Debug.MessageBox("Before I noticed it, my head was pushed down and something was place tightly around my neck. It was some kind of leather collar which somehow connected to the armbinder and made everything appear tighter. If wasn't already hard enough to struggle with the armbinder, now is even more as the merciless straps appear to not have any slack. A click sound tells me I won´t remove my collar any time soon.")
gag.increasePlayerMaso()

int playerexposure = sla.GetActorExposure(PlayerRef)
playerexposure += 20
sla.SetActorExposure(PlayerRef, playerexposure)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

zadGagQuestScript property gag Auto
zadlibs Property libs  Auto
zadArmbinderQuestScript Property QuestScript Auto
slaFrameworkScr property sla Auto
Actor Property PlayerRef  Auto  
