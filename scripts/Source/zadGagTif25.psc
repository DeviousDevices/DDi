;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname zadGagTif25 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
libs.EdgedSound.Play(PlayerRef)
Libs.EquipDevice(Libs.PlayerRef,Libs.blindfold, Libs.blindfoldRendered, Libs.zad_DeviousBlindfold, false, true)
Debug.MessageBox("Unable to defend myself, my body was quickly turned back. The only thing I could do was instinctively close my eyes when I felt something being pressed into my eyes, confining my world in total darkness. A blindfold was placed tight around my head, which made me feel completely vulnerable and oddly aroused. I moaned aggressively while I heard a loud laugh and as punishment I received a hard slap on my ass.")
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
slaFrameworkScr property sla Auto
Actor Property PlayerRef  Auto  
