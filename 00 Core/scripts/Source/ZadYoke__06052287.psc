;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname ZadYoke__06052287 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.RemoveItem(ItemGold, 2000)
questScript.RemoveHeavyBondage(questScript.libs.zad_DeviousYoke)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
zadYokeQuestScript Property QuestScript Auto
Actor Property PlayerRef Auto
MiscObject Property ItemGold Auto
