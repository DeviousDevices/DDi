;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname zadGagTif22 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
libs.EdgedSound.Play(PlayerRef)
QuestScript.DisableStruggling()
Debug.MessageBox("As I held still, she produced some small ebonite bits from her bag.  She leant over and examined the locks dangling below my yoke.  She affixed the ebonite bits over the locks and snapped them shut.  As long as these covers were on the locks, I wouldn't be able to use any keys I find to escape!  Now I'm at the mercy of others to release me, even with the key in hand.")
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
zadYokeQuestScript Property QuestScript Auto
slaFrameworkScr property sla Auto
Actor Property PlayerRef  Auto  
