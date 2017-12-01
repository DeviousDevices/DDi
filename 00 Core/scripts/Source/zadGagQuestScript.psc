Scriptname zadGagQuestScript extends Quest  Conditional

Bool Property canTalk = false  Auto  Conditional
Actor Property PlayerRef  Auto  
GlobalVariable Property zadGagExpertise  Auto  
GlobalVariable Property zadPlayerMasochism  Auto  
Spell      Property zadgag_SpeechDebuff  Auto
slaFrameworkScr Property sla Auto
zadLibs Property libs Auto

function enableTalk()
	canTalk = true
;	Libs.NotifyPlayer("Speak Enabled")
endFunction

event OnInit()
	RegisterForMenu("Dialogue Menu")
endEvent
 
event OnMenuClose(String asMenuName)
	if asMenuName == "Dialogue Menu" && canTalk
		canTalk = false
		PlayerRef.RemoveSpell(zadgag_SpeechDebuff)
;		Libs.NotifyPlayer("Speak Disabled!")
	endIf
endEvent

;Both of these are depreciated
;Kept in case we decide to reuse the fonctions or their associated globals in the future

function increaseGagExp()
	float gagexp = zadGagExpertise.GetValue()
	gagexp += 1
	if gagexp < 20
		float percent = gagexp*5
		int value = percent as int
		Libs.NotifyPlayer("Gag talk skill "+value+"% mastered.")
	endif
	if gagexp == 20
		Libs.NotifyPlayer("All your gag struggles and frustrated moans were not in vain. Now you are an experienced gag talker, people will understand you more easily. On the other hand your devious gag experience can encourage people to do more intimate actions.", true)
	endif
	zadGagExpertise.SetValue(gagexp)
endFunction

function increasePlayerMaso()
	float playermaso = zadPlayerMasochism.GetValue()
	if playermaso < 20
		playermaso += 1
	endif	
	if playermaso == 20
		Libs.NotifyPlayer("All your little adventures have made you a true exhibitionist. Now you are used to be seen naked in restraints and this makes you feel even more aroused.", true)
	endif
	if playermaso >= 20
		sla.SetActorExhibitionist(PlayerRef, true)
	endif
	zadPlayerMasochism.SetValue(playermaso)
endFunction