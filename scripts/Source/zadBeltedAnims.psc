scriptname zadBeltedAnims extends sslAnimationFactory
zadLibs Property libs Auto
SexlabFramework Property Sexlab Auto
zadBQ00 Property filterQuest Auto

function LoadAnimations()
	libs.log("Devious Devices is now creating animations.")
	SexLab = SexLabUtil.GetAPI()
	If SexLab == None
		libs.Error("Animation registration failed: Sexlab is none.")
	EndIf
	if filterQuest == None
		libs.Error("Animation registration failed: FilterQuest is none.")
	EndIf
	SexLab.GetSetAnimationObject("DDBeltedSolo", "CreateDDBeltedSolo", filterQuest)
	SexLab.GetSetAnimationObject("DDArmbinderSolo", "CreateDDArmbinderSolo", filterQuest)
	SexLab.GetSetAnimationObject("DDYokeSolo", "CreateDDYokeSolo", filterQuest)
	; PrepareFactory()
	; RegisterAnimation("DDBeltedSolo")
	; RegisterAnimation("DDBeltedSolo")
EndFunction

Function CreateDDBeltedSolo(int id)
	libs.Log("Creating DDBeltedSolo")
	; Creatue your animation under the token "ShortForeplay" which you can use to retrieve
	; it later if needed. Passing the form owner "self" tells it your script objects owns it
	; if whatever you pass as owner ever becomes a none form (mod uninstalled) than the animation
	; is automatically cleaned up and removed at start up.
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDBeltedSolo")
	; Make sure we actually retrieved the animation and it's empty before setting it up
	if Anim != none && Anim.Name != "DDBeltedSolo"
		; At this point it basically becomes no different than creating animations in their callbacks
		; as seen in sslAnimationDefaults.psc, config properties can be accessed from SexLab.Factory
		Anim.Name = "DDBeltedSolo"
		Anim.SetContent(Sexual)
		; Duplicating the arrok standing foreplay animation, only including just the first 2 stages
		int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, "DDBeltedSolo", 0, silent=false)
		
		; (optional) Give them set timed lengths to fit your mods purpose
		Anim.SetStageTimer(1, 20.0) ; 20 seconds for stage 1
		
		; (optional) Add any tags you think are necessary
		Anim.AddTag("Solo")
		;	Anim.AddTag("Masturbation")
		Anim.AddTag("F")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")
		
		; REQUIRED - after configuring the animation, you must call Save() in order to finalize it.
		Anim.Save(-1)
	EndIf
EndFunction

Function CreateDDArmbinderSolo(int id)
	libs.Log("Creating DDArmbinderSolo")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDArmbinderSolo")
	; Make sure we actually retrieved the animatino and it's empty before setting it up
	if Anim != none && Anim.Name != "DDArmbinderSolo"
		; At this point it basically becomes no different than creating animations in their callbacks
		; as seen in sslAnimationDefaults.psc, config properties can be accessed from SexLab.Factory
		Anim.Name = "DDArmbinderSolo"
		Anim.SetContent(Sexual)
		; Duplicating the arrok standing foreplay animation, only including just the first 2 stages
		int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, "ZapArmbHorny01", 0, silent=false)
		
		; (optional) Give them set timed lengths to fit your mods purpose
		Anim.SetStageTimer(1, 20.0) ; 10 seconds for stage 1
		
		; (optional) Add any tags you think are necessary
		Anim.AddTag("Solo")
		;	Anim.AddTag("Masturbation")
		Anim.AddTag("F")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")
		
		; REQUIRED - after configuring the animation, you must call Save() in order to finalize it.
		Anim.Save(-1)
	EndIf
EndFunction


Function CreateDDYokeSolo(int id)
	libs.Log("Creating CreateDDYokeSolo")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDYokeSolo")
	; Make sure we actually retrieved the animatino and it's empty before setting it up
	if Anim != none && Anim.Name != "DDYokeSolo"
		; At this point it basically becomes no different than creating animations in their callbacks
		; as seen in sslAnimationDefaults.psc, config properties can be accessed from SexLab.Factory
		Anim.Name = "DDyokeSolo"
		Anim.SetContent(Sexual)
		; Duplicating the arrok standing foreplay animation, only including just the first 2 stages
		int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, "ZapYokeHorny01", 0, silent=false)
		
		; (optional) Give them set timed lengths to fit your mods purpose
		Anim.SetStageTimer(1, 20.0) ; 10 seconds for stage 1
		
		; (optional) Add any tags you think are necessary
		Anim.AddTag("Solo")
		;	Anim.AddTag("Masturbation")
		Anim.AddTag("F")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")
		
		; REQUIRED - after configuring the animation, you must call Save() in order to finalize it.
		Anim.Save(-1)
	EndIf
EndFunction

