;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname zadGagTif24 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
libs.EdgedSound.Play(PlayerRef)
Libs.EquipDevice(Libs.PlayerRef, Libs.collarPosture, Libs.collarPostureRendered, Libs.zad_DeviousCollar, false, true)
Debug.MessageBox("Before I noticed it, my head was pushed down and I heard the sound of a lock being released.  The yoke twisted open around my neck and my head was pulled back.  Next, an extremely tall metal collar was locked around my neck, nearly choking me in the process.  With my hands still locked into the yoke, I couldn't resist as I was forced back into the yoke and locked up once more.  With this oppressive collar on under the yoke, I had even less ability to move around and struggle.")
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
