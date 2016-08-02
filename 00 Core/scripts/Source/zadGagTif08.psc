;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname zadGagTif08 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
libs.EdgedSound.Play(PlayerRef)
QuestScript.DisableStruggling()
Debug.MessageBox("As I turned around, she start working in the laces of armbinder, pulling with force and taking out any slack. I lost my breath when my elbows touched. Still not satisfied, she rebuckled all the straps as tight as possible. I will never do the armbinder this tight by myself. As my arms are already going numb I feel more helpless than ever.")
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
