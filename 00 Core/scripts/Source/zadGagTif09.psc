;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname zadGagTif09 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
libs.EdgedSound.Play(PlayerRef)
SexLab.StripActor(PlayerRef)
Debug.MessageBox("Unable to defend myself, I was grabbed from behind, each part of my body being fondled and pinched. Reluctant at first, my body quick surrendered when the assaulter increased his vigor, handling me in a more manly way. In frenzy, drooling all over my chest, I got uncontrollable horny. He suddenly stopped the assault and left me all sweaty, panting and frustrated.")
gag.increasePlayerMaso()

int playerexposure = sla.GetActorExposure(PlayerRef)
playerexposure += 40
sla.SetActorExposure(PlayerRef, playerexposure)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

zadGagQuestScript property gag Auto
zadlibs Property libs  Auto
SexLabFramework property SexLab auto
Actor Property PlayerRef  Auto
slaFrameworkScr property sla Auto
