Scriptname zadSLBoundAnims extends sslAnimationFactory

SexlabFramework Property Sexlab Auto
zadLibs Property libs Auto
zadBQ00 Property filterQuest Auto

;This sets up bound animations for private use.
;They will not populate the general sexlab list and must be called specifically. 

function LoadAnimations()
	libs.log("Devious Devices is now creating bound animations.")
	SexLab = SexLabUtil.GetAPI()
	If SexLab == None
		libs.Error("Animation registration failed: Sexlab is none.")
	EndIf
	if filterQuest == None
		libs.Error("Animation registration failed: FilterQuest is none.")
	EndIf
	SexLab.GetSetAnimationObject("DDZapArmbDoggy01", "CreateDDZapArmbDoggy01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbDoggy01Both", "CreateDDZapArmbDoggy01Both", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbMissionary01", "CreateDDZapArmbMissionary01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbSkullFuck01", "CreateDDZapArmbSkullFuck01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbLesbian01", "CreateDDZapArmbLesbian01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbLesbian01Both", "CreateDDZapArmbLesbian01Both", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbBoobjob01", "CreateDDZapArmbBoobjob01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapArmbKissing01", "CreateDDZapArmbKissing01", filterQuest)

	SexLab.GetSetAnimationObject("DDZapYokeMissionary01", "CreateDDZapYokeMissionary01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeMissionary02", "CreateDDZapYokeMissionary02", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeMissionary03", "CreateDDZapYokeMissionary03", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeSkullFuck01", "CreateDDZapYokeSkullFuck01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeLesbian01", "CreateDDZapYokeLesbian01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeLesbian01Both", "CreateDDZapYokeLesbian01Both", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeBlowjob01", "CreateDDZapYokeBlowjob01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeKissing01", "CreateDDZapYokeKissing01", filterQuest)
	SexLab.GetSetAnimationObject("DDZapYokeForeplay01", "CreateDDZapYokeForeplay01", filterQuest)
	SexLab.GetSetAnimationObject("DDFBYokeHolding", "CreateDDFBYokeHolding", filterQuest)
	SexLab.GetSetAnimationObject("DDFBYokeDoggy", "CreateDDFBYokeDoggy", filterQuest)
	SexLab.GetSetAnimationObject("DDFBMolagStandingYoke", "CreateDDFBMolagStandingYoke", filterQuest)

	SexLab.GetSetAnimationObject("DDZapMixLesbian01ArmbYoke", "CreateDDZapMixLesbian01ArmbYoke", filterQuest)
	SexLab.GetSetAnimationObject("DDZapMixLesbian01YokeArmb", "CreateDDZapMixLesbian01YokeArmb", filterQuest)
	
	SexLab.GetSetAnimationObject("DD_SH_armbBJ1", "CreateDD_SH_armbBJ1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_bbyokeBJ1", "CreateDD_SH_bbyokeBJ1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_cuffsFrontBJ1", "CreateDD_SH_cuffsFrontBJ1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_elbBJ1", "CreateDD_SH_elbBJ1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_yokeBJ1", "CreateDD_SH_yokeBJ1", filterQuest)	
	SexLab.GetSetAnimationObject("DD_SH_armbMiss1", "CreateDD_SH_armbMiss1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_bbyokeMiss1", "CreateDD_SH_bbyokeMiss1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_cuffsFrontMiss1", "CreateDD_SH_cuffsFrontMiss1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_elbMiss1", "CreateDD_SH_elbMiss1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_yokeMiss1", "CreateDD_SH_yokeMiss1", filterQuest)	
	SexLab.GetSetAnimationObject("DD_SH_armbCowg1", "CreateDD_SH_armbCowg1", filterQuest)
	SexLab.GetSetAnimationObject("DD_SH_elbCowg1", "CreateDD_SH_elbCowg1", filterQuest)
	
	SexLab.GetSetAnimationObject("DD_Billyy_YokeCowgirl", "CreateDD_Billyy_YokeCowgirl", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_YokeDoggy", "CreateDD_Billyy_YokeDoggy", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_YokeMissionary", "CreateDD_Billyy_YokeMissionary", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_YokeStanding", "CreateDD_Billyy_YokeStanding", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_YokeFaceFuck", "CreateDD_Billyy_YokeFaceFuck", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_Yoke69", "CreateDD_Billyy_Yoke69", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_YokeRevCowgirlAnal", "CreateDD_Billyy_YokeRevCowgirlAnal", filterQuest)
	SexLab.GetSetAnimationObject("DD_Billyy_YokeLayingAnal", "CreateDD_Billyy_YokeLayingAnal", filterQuest)
	
	SexLab.GetSetAnimationObject("DD_B_PS_Doggy", "CreateDD_B_PS_Doggy", filterQuest)
	SexLab.GetSetAnimationObject("DD_B_PS_DoggyA", "CreateDD_B_PS_DoggyA", filterQuest)
	SexLab.GetSetAnimationObject("DD_B_PS_DT", "CreateDD_B_PS_DT", filterQuest)
	SexLab.GetSetAnimationObject("DD_B_PS_Miss", "CreateDD_B_PS_Miss", filterQuest)	
EndFunction

;Defining animations:

;========================
;ARMBINDER
;========================

Function CreateDDZapArmbDoggy01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbDoggy01"
	String asAnim2 = "AggrDoggyStyle"

	libs.Log("Creating DDZapArmbDoggy01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbDoggy01")
	if Anim != none && Anim.Name != "DDZapArmbDoggy01"
		Anim.Name = "DDZapArmbDoggy01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Anal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -100, sos = 5)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -100, sos = 5)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, sos = 7)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, sos = 5)

		Anim.AddTag("Doggystyle")
		Anim.AddTag("Anal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbDoggy01Both(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = armbinder
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbDoggy01"
	String asAnim2 = "DD_ZapArmbDoggy01"

	libs.Log("Creating DDZapArmbDoggy01Both")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbDoggy01Both")
	if Anim != none && Anim.Name != "DDZapArmbDoggy01Both"
		Anim.Name = "DDZapArmbDoggy01Both"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Anal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -100, sos = 5)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -100, sos = 5)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, sos = 7)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, sos = 5)

		Anim.AddTag("Doggystyle")
		Anim.AddTag("Anal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("SubSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbMissionary01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbMissionary01"
	String asAnim2 = "AggrMissionary"

	libs.Log("Creating DDZapArmbMissionary01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbMissionary01")
	if Anim != none && Anim.Name != "DDZapArmbMissionary01"
		Anim.Name = "DDZapArmbMissionary01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -86, sos = 4)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -86, sos = 4)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -86, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -86, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -86, sos = 3)

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbSkullFuck01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbSkullFuck01"
	String asAnim2 = "AP_SkullFuck"

	libs.Log("Creating DDZapArmbSkullFuck01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbSkullFuck01")
	if Anim != none && Anim.Name != "DDZapArmbSkullFuck01"
		Anim.Name = "DDZapArmbSkullFuck01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", 49, rotate = 180, sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", 49, rotate = 180, sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", 49, rotate = 180, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", 49, rotate = 180, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", 49, rotate = 180, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", 49, rotate = 180, sos = 2)

		Anim.AddTag("AP")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")
		Anim.AddTag("Knees")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbLesbian01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(F) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbLesbian01"
	String asAnim2 = "Arrok_Lesbian"

	libs.Log("Creating DDZapArmbLesbian01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbLesbian01")
	if Anim != none && Anim.Name != "DDZapArmbLesbian01"
		Anim.Name = "DDZapArmbLesbian01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = False)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = False, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = False, openMouth = True)

		Int a2 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -110, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105, silent = True, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, silent = False, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, silent = False, openMouth = True)
		
		Anim.SetStageTimer(4, 10.0)

		Anim.AddTag("Arrok")
		Anim.AddTag("Oral")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")

		Anim.AddTag("Sex")
		Anim.AddTag("FF")
		
		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbLesbian01Both(int id)
	; Source = ZAP, a1(F) = armbinder, a2(F) = armbinder
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbLesbian01"
	String asAnim2 = "DD_ZapArmbLesbian01"

	libs.Log("Creating DDZapArmbLesbian01Both")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbLesbian01Both")
	if Anim != none && Anim.Name != "DDZapArmbLesbian01Both"
		Anim.Name = "DDZapArmbLesbian01Both"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = False)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = False, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = False, openMouth = True)

		Int a2 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -110, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105, silent = True, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, silent = False, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, silent = False, openMouth = True)
		
		Anim.SetStageTimer(4, 10.0)

		Anim.AddTag("Arrok")
		Anim.AddTag("Oral")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")

		Anim.AddTag("Sex")
		Anim.AddTag("FF")
		
		Anim.AddTag("SubSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbBoobjob01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbBoobjob01"
	String asAnim2 = "Arrok_Boobjob"

	libs.Log("Creating DDZapArmbBoobjob01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbBoobjob01")
	if Anim != none && Anim.Name != "DDZapArmbBoobjob01"
		Anim.Name = "DDZapArmbBoobjob01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = SexMix

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = true, openMouth = true)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -119, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -119, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -119, sos = -2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -119, sos = -2)

		Anim.AddTag("Arrok")
		Anim.AddTag("Boobjob")
		Anim.AddTag("Breast")
		Anim.AddTag("Knees")

		Anim.AddTag("Foreplay")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbBlowjob01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbBlowjob01"
	String asAnim2 = "Leito_Blowjob"

	libs.Log("Creating DDZapArmbBlowjob01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbBlowjob01")
	if Anim != none && Anim.Name != "DDZapArmbBlowjob01"
		Anim.Name = "DDZapArmbBlowjob01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", sos = -1)

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Leito")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")
		Anim.AddTag("Knees")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapArmbKissing01(int id)
	; Source = ZAP, a1(F) = armbinder, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbKissing01"
	String asAnim2 = "Leito_Kissing"

	libs.Log("Creating DDZapArmbKissing01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapArmbKissing01")
	if Anim != none && Anim.Name != "DDZapArmbKissing01"
		Anim.Name = "DDZapArmbKissing01"
		Anim.SetContent(Foreplay)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", silent = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = False, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = False, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = False, silent = True)

		; Anim.SetStageTimer(1, 1.8)
		; Anim.SetStageTimer(2, 15.0)
		Anim.SetStageTimer(3, 0.7)

		Anim.AddTag("Leito")
		Anim.AddTag("Kissing")
		Anim.AddTag("Standing")
		Anim.AddTag("Loving")

		Anim.AddTag("Foreplay")
		Anim.AddTag("FM")
	
		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

;========================
;YOKE
;========================

Function CreateDDZapYokeMissionary01(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeMissionary01"
	String asAnim2 = "AggrMissionary"

	libs.Log("Creating DDZapYokeMissionary01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeMissionary01")
	if Anim != none && Anim.Name != "DDZapYokeMissionary01"
		Anim.Name = "DDZapYokeMissionary01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -86, sos = 4)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -86, sos = 4)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -86, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -86, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -86, sos = 3)

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeMissionary02(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeMissionary02"
	String asAnim2 = "Zyn_Missionary"

	libs.Log("Creating DDZapYokeMissionary02")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeMissionary02")
	if Anim != none && Anim.Name != "DDZapYokeMissionary02"
		Anim.Name = "DDZapYokeMissionary02"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = VaginalOral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")

		int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -105)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -105, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -105, sos = 7)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", -105, sos = 7)

		Anim.AddTag("Zyn")
		Anim.AddTag("Lying")
		Anim.AddTag("Missionary")
		Anim.AddTag("Vaginal")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeMissionary03(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeMissionary03"
	String asAnim2 = "Arrok_Missionary"

	libs.Log("Creating DDZapYokeMissionary03")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeMissionary03")
	if Anim != none && Anim.Name != "DDZapYokeMissionary03"
		Anim.Name = "DDZapYokeMissionary03"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -105)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -105, sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -107, sos = 7)

		Anim.AddTag("Arrok")
		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeSkullFuck01(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeSkullFuck01"
	String asAnim2 = "AP_SkullFuck"

	libs.Log("Creating DDZapYokeSkullFuck01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeSkullFuck01")
	if Anim != none && Anim.Name != "DDZapYokeSkullFuck01"
		Anim.Name = "DDZapYokeSkullFuck01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", 49, rotate = 180, sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", 49, rotate = 180, sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", 49, rotate = 180, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", 49, rotate = 180, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", 49, rotate = 180, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", 49, rotate = 180, sos = 2)

		Anim.AddTag("AP")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")
		Anim.AddTag("Knees")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeLesbian01(int id)
	; Source = ZAP, a1(F) = yoke, a2(F) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeLesbian01"
	String asAnim2 = "Arrok_Lesbian"

	libs.Log("Creating DDZapYokeLesbian01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeLesbian01")
	if Anim != none && Anim.Name != "DDZapYokeLesbian01"
		Anim.Name = "DDZapYokeLesbian01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = False)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = False, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = False, openMouth = True)

		Int a2 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -110, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105, silent = True, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, silent = False, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, silent = False, openMouth = True)
		
		Anim.SetStageTimer(4, 10.0)

		Anim.AddTag("Arrok")
		Anim.AddTag("Oral")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")

		Anim.AddTag("Sex")
		Anim.AddTag("FF")
		
		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeLesbian01Both(int id)
	; Source = ZAP, a1(F) = yoke, a2(F) = yoke
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeLesbian01"
	String asAnim2 = "DD_ZapYokeLesbian01"

	libs.Log("Creating DDZapYokeLesbian01Both")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeLesbian01Both")
	if Anim != none && Anim.Name != "DDZapYokeLesbian01Both"
		Anim.Name = "DDZapYokeLesbian01Both"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = False)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = False, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = False, openMouth = True)

		Int a2 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -110, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105, silent = True, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, silent = False, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, silent = False, openMouth = True)
		
		Anim.SetStageTimer(4, 10.0)

		Anim.AddTag("Arrok")
		Anim.AddTag("Oral")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")

		Anim.AddTag("Sex")
		Anim.AddTag("FF")
		
		Anim.AddTag("SubSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeBlowjob01(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeBlowjob01"
	String asAnim2 = "Leito_Blowjob"

	libs.Log("Creating DDZapYokeBlowjob01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeBlowjob01")
	if Anim != none && Anim.Name != "DDZapYokeBlowjob01"
		Anim.Name = "DDZapYokeBlowjob01"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", sos = 3)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", sos = -1)

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Leito")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")
		Anim.AddTag("Knees")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeKissing01(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeKissing01"
	String asAnim2 = "Leito_Kissing"

	libs.Log("Creating DDZapYokeKissing01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeKissing01")
	if Anim != none && Anim.Name != "DDZapYokeKissing01"
		Anim.Name = "DDZapYokeKissing01"
		Anim.SetContent(Foreplay)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", silent = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = False, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = False, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = False, silent = True)

		; Anim.SetStageTimer(1, 1.8)
		; Anim.SetStageTimer(2, 15.0)
		Anim.SetStageTimer(3, 0.7)

		Anim.AddTag("Leito")
		Anim.AddTag("Kissing")
		Anim.AddTag("Standing")
		Anim.AddTag("Loving")

		Anim.AddTag("Foreplay")
		Anim.AddTag("FM")
	
		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapYokeForeplay01(int id)
	; Source = ZAP, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeForeplay01"
	String asAnim2 = "Arrok_Foreplay"

	libs.Log("Creating DDZapYokeForeplay01")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapYokeForeplay01")
	if Anim != none && Anim.Name != "DDZapYokeForeplay01"
		Anim.Name = "DDZapYokeForeplay01"
		Anim.SetContent(Foreplay)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", 0, strapon = False, sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", 0, strapon = False, sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", 0, strapon = False, sos = 5)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", 0, strapon = False, sos = 5)

		Anim.AddTag("Arrok")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")
		Anim.AddTag("Oral")

		Anim.AddTag("Foreplay")
		Anim.AddTag("FM")
	
		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDFBYokeHolding(int id)
	; Source = FunnyBizness, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_FBYokeHolding"
	String asAnim2 = "DD_FBYokeHolding"

	libs.Log("Creating DDFBYokeHolding")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDFBYokeHolding")
	if Anim != none && Anim.Name != "DDFBYokeHolding"
		Anim.Name = "DDFBYokeHolding"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True, sos = 2)

		Anim.AddTag("FB")
		Anim.AddTag("Dirty")
		Anim.AddTag("Standing")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDFBYokeDoggy(int id)
	; Source = FunnyBizness, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_FBYokeDoggy"
	String asAnim2 = "DD_FBYokeDoggy"

	libs.Log("Creating DDFBYokeDoggy")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDFBYokeDoggy")
	if Anim != none && Anim.Name != "DDFBYokeDoggy"
		Anim.Name = "DDFBYokeDoggy"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Anal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True, sos = 4)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True, sos = 2)

		Anim.AddTag("FB")
		Anim.AddTag("Dirty")
		Anim.AddTag("Doggystyle")
		Anim.AddTag("Anal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDFBMolagStandingYoke(int id)
	; Source = FunnyBizness, a1(F) = yoke, a2(M) = free
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_FBMolagStandingYoke"
	String asAnim2 = "DD_FBMolagStandingYoke"

	libs.Log("Creating DDFBMolagStandingYoke")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDFBMolagStandingYoke")
	if Anim != none && Anim.Name != "DDFBMolagStandingYoke"
		Anim.Name = "DDFBMolagStandingYoke"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True, sos = 2)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True, sos = 2)

		Anim.SetStageTimer(1, 5.0)

		Anim.AddTag("FB")
		Anim.AddTag("Dirty")
		Anim.AddTag("Standing")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

;========================
;MIXED
;========================

Function CreateDDZapMixLesbian01ArmbYoke(int id)
	; Source = ZAP, a1(F) = armbinder, a2(F) = yoke
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapArmbLesbian01"
	String asAnim2 = "DD_ZapYokeLesbian01"

	libs.Log("Creating DDZapMixLesbian01ArmbYoke")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapMixLesbian01ArmbYoke")
	if Anim != none && Anim.Name != "DDZapMixLesbian01ArmbYoke"
		Anim.Name = "DDZapMixLesbian01ArmbYoke"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = False)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = False, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = False, openMouth = True)

		Int a2 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -110, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105, silent = True, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, silent = False, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, silent = False, openMouth = True)
		
		Anim.SetStageTimer(4, 10.0)

		Anim.AddTag("Arrok")
		Anim.AddTag("Oral")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")

		Anim.AddTag("Sex")
		Anim.AddTag("FF")
		
		Anim.AddTag("SubSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDDZapMixLesbian01YokeArmb(int id)
	; Source = ZAP, a1(F) = yoke, a2(F) = armbinder
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_ZapYokeLesbian01"
	String asAnim2 = "DD_ZapArmbLesbian01"

	libs.Log("Creating DDZapMixLesbian01YokeArmb")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DDZapMixLesbian01YokeArmb")
	if Anim != none && Anim.Name != "DDZapMixLesbian01YokeArmb"
		Anim.Name = "DDZapMixLesbian01YokeArmb"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0, silent = False)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0, silent = False, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0, silent = False, openMouth = True)

		Int a2 = Anim.AddPosition(Female)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", -110, silent = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", -105, silent = True, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", -100, silent = False, openMouth = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", -100, silent = False, openMouth = True)
		
		Anim.SetStageTimer(4, 10.0)

		Anim.AddTag("Arrok")
		Anim.AddTag("Oral")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Lying")
		Anim.AddTag("Loving")

		Anim.AddTag("Sex")
		Anim.AddTag("FF")
		
		Anim.AddTag("SubSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

; Spacehamster

Function CreateDD_SH_armbBJ1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_armbBJ1"
	String asAnim2 = "DD_SH_armbBJ1"

	libs.Log("Creating DD_SH_armbBJ1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_armbBJ1")
	if Anim != none && Anim.Name != "DD_SH_armbBJ1"
		Anim.Name = "DD_SH_armbBJ1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", silent = True, openMouth = False)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5")

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Spacehamster")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")		

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_bbyokeBJ1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_bbyokeBJ1"
	String asAnim2 = "DD_SH_bbyokeBJ1"

	libs.Log("Creating DD_SH_bbyokeBJ1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_bbyokeBJ1")
	if Anim != none && Anim.Name != "DD_SH_bbyokeBJ1"
		Anim.Name = "DD_SH_bbyokeBJ1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", silent = True, openMouth = False)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5")

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Spacehamster")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")		

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("BBYoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_cuffsFrontBJ1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_cuffsFrontBJ1"
	String asAnim2 = "DD_SH_cuffsFrontBJ1"

	libs.Log("Creating DD_SH_cuffsFrontBJ1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_cuffsFrontBJ1")
	if Anim != none && Anim.Name != "DD_SH_cuffsFrontBJ1"
		Anim.Name = "DD_SH_cuffsFrontBJ1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", silent = True, openMouth = False)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5")

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Spacehamster")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")		

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("FontCuffs")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_elbBJ1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_elbBJ1"
	String asAnim2 = "DD_SH_elbBJ1"

	libs.Log("Creating DD_SH_elbBJ1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_elbBJ1")
	if Anim != none && Anim.Name != "DD_SH_elbBJ1"
		Anim.Name = "DD_SH_elbBJ1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", silent = True, openMouth = False)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5")

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Spacehamster")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")		

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Elbowbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_yokeBJ1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_yokeBJ1"
	String asAnim2 = "DD_SH_yokeBJ1"

	libs.Log("Creating DD_SH_yokeBJ1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_yokeBJ1")
	if Anim != none && Anim.Name != "DD_SH_yokeBJ1"
		Anim.Name = "DD_SH_yokeBJ1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", 0.0, silent = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", 0.0, silent = True, openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", 0.0, silent = True, openMouth = True)

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", silent = True, openMouth = False)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", sos = 1)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5")

		Anim.SetStageSoundFX(1, None)

		Anim.AddTag("Spacehamster")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Oral")		

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_armbMiss1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_armbMiss1"
	String asAnim2 = "DD_SH_armbMiss1"

	libs.Log("Creating DD_SH_armbMiss1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_armbMiss1")
	if Anim != none && Anim.Name != "DD_SH_armbMiss1"
		Anim.Name = "DD_SH_armbMiss1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = true)

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_bbyokeMiss1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_bbyokeMiss1"
	String asAnim2 = "DD_SH_bbyokeMiss1"

	libs.Log("Creating DD_SH_bbyokeMiss1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_bbyokeMiss1")
	if Anim != none && Anim.Name != "DD_SH_bbyokeMiss1"
		Anim.Name = "DD_SH_bbyokeMiss1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("BBYoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_cuffsFrontMiss1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_cuffsFrontMiss1"
	String asAnim2 = "DD_SH_cuffsFrontMiss1"

	libs.Log("Creating DD_SH_cuffsFrontMiss1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_cuffsFrontMiss1")
	if Anim != none && Anim.Name != "DD_SH_cuffsFrontMiss1"
		Anim.Name = "DD_SH_cuffsFrontMiss1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("FrontCuffs")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_elbMiss1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_elbMiss1"
	String asAnim2 = "DD_SH_elbMiss1"

	libs.Log("Creating DD_SH_elbMiss1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_elbMiss1")
	if Anim != none && Anim.Name != "DD_SH_elbMiss1"
		Anim.Name = "DD_SH_elbMiss1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Elbowbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_yokeMiss1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_yokeMiss1"
	String asAnim2 = "DD_SH_yokeMiss1"

	libs.Log("Creating DD_SH_yokeMiss1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_yokeMiss1")
	if Anim != none && Anim.Name != "DD_SH_yokeMiss1"
		Anim.Name = "DD_SH_yokeMiss1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")

		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_armbCowg1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_armbCowg1"
	String asAnim2 = "DD_SH_armbCowg1"

	libs.Log("Creating DD_SH_armbCowg1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_armbCowg1")
	if Anim != none && Anim.Name != "DD_SH_armbCowg1"
		Anim.Name = "DD_SH_armbCowg1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = true)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = true)

		Anim.AddTag("Cowgirl")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Armbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_SH_elbCowg1(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_SH_elbCowg1"
	String asAnim2 = "DD_SH_elbCowg1"

	libs.Log("Creating DD_SH_elbCowg1")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_SH_elbCowg1")
	if Anim != none && Anim.Name != "DD_SH_elbCowg1"
		Anim.Name = "DD_SH_elbCowg1"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4")

		Anim.AddTag("Cowgirl")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Elbowbinder")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction


Function CreateDD_Billyy_YokeCowgirl(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeCowgirl"
	String asAnim2 = "DD_Billyy_YokeCowgirl"

	libs.Log("Creating DD_Billyy_YokeCowgirl")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeCowgirl")
	if Anim != none && Anim.Name != "DD_Billyy_YokeCowgirl"
		Anim.Name = "DD_Billyy_YokeCowgirl"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True, sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True, sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True, sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True, sos = 0)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True, sos = 5)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True, sos = 5)
		
		Anim.AddTag("Cowgirl")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_YokeDoggy(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeDoggy"
	String asAnim2 = "DD_Billyy_YokeDoggy"

	libs.Log("Creating DD_Billyy_YokeDoggy")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeDoggy")
	if Anim != none && Anim.Name != "DD_Billyy_YokeDoggy"
		Anim.Name = "DD_Billyy_YokeDoggy"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Doggy")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_YokeMissionary(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeMissionary"
	String asAnim2 = "DD_Billyy_YokeMissionary"

	libs.Log("Creating DD_Billyy_YokeMissionary")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeMissionary")
	if Anim != none && Anim.Name != "DD_Billyy_YokeMissionary"
		Anim.Name = "DD_Billyy_YokeMissionary"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Missionary")
		Anim.AddTag("Lying")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_YokeStanding(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeStanding"
	String asAnim2 = "DD_Billyy_YokeStanding"

	libs.Log("Creating DD_Billyy_YokeStanding")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeStanding")
	if Anim != none && Anim.Name != "DD_Billyy_YokeStanding"
		Anim.Name = "DD_Billyy_YokeStanding"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Standing")
		Anim.AddTag("Vaginal")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_YokeFaceFuck(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeFaceFuck"
	String asAnim2 = "DD_Billyy_YokeFaceFuck"

	libs.Log("Creating DD_Billyy_YokeFaceFuck")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeFaceFuck")
	if Anim != none && Anim.Name != "DD_Billyy_YokeFaceFuck"
		Anim.Name = "DD_Billyy_YokeFaceFuck"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", openMouth = True)
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Kneeling")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_Yoke69(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_Yoke69"
	String asAnim2 = "DD_Billyy_Yoke69"

	libs.Log("Creating DD_Billyy_Yoke69")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_Yoke69")
	if Anim != none && Anim.Name != "DD_Billyy_Yoke69"
		Anim.Name = "DD_Billyy_Yoke69"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Sucking

		Int a1 = Anim.AddPosition(Female, addCum = Oral)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4", openMouth = True)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5", openMouth = True)
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Blowjob")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_YokeRevCowgirlAnal(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeRevCowgirlAnal"
	String asAnim2 = "DD_Billyy_YokeRevCowgirlAnal"

	libs.Log("Creating DD_Billyy_YokeRevCowgirlAnal")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeRevCowgirlAnal")
	if Anim != none && Anim.Name != "DD_Billyy_YokeRevCowgirlAnal"
		Anim.Name = "DD_Billyy_YokeRevCowgirlAnal"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Anal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Anal")
		Anim.AddTag("Cowgirl")
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_Billyy_YokeLayingAnal(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_Billyy_YokeLayingAnal"
	String asAnim2 = "DD_Billyy_YokeLayingAnal"

	libs.Log("Creating DD_Billyy_YokeLayingAnal")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_Billyy_YokeLayingAnal")
	if Anim != none && Anim.Name != "DD_Billyy_YokeLayingAnal"
		Anim.Name = "DD_Billyy_YokeLayingAnal"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Anal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")

		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Anal")		
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("Yoke")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
endFunction

Function CreateDD_B_PS_Doggy(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_B_PS_Doggy"
	String asAnim2 = "DD_B_PS_Doggy"

	libs.Log("Creating DD_B_PS_Doggy")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_B_PS_Doggy")
	if Anim != none && Anim.Name != "DD_B_PS_Doggy"
		Anim.Name = "DD_B_PS_Doggy"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Vaginal")		
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("PetSuit")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
EndFunction

Function CreateDD_B_PS_DoggyA(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_B_PS_DoggyA"
	String asAnim2 = "DD_B_PS_DoggyA"

	libs.Log("Creating DD_B_PS_DoggyA")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_B_PS_DoggyA")
	if Anim != none && Anim.Name != "DD_B_PS_DoggyA"
		Anim.Name = "DD_B_PS_DoggyA"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Vaginal")		
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("PetSuit")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
EndFunction

Function CreateDD_B_PS_DT(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_B_PS_DT"
	String asAnim2 = "DD_B_PS_DT"

	libs.Log("Creating DD_B_PS_DT")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_B_PS_DT")
	if Anim != none && Anim.Name != "DD_B_PS_DT"
		Anim.Name = "DD_B_PS_DT"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Vaginal")		
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("PetSuit")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
EndFunction

Function CreateDD_B_PS_Miss(int id)	
	; Define animation prefixes for each actor (must correspond to names in FNIS), add more if necessary
	String asAnim1 = "DD_B_PS_Miss"
	String asAnim2 = "DD_B_PS_Miss"

	libs.Log("Creating DD_B_PS_Miss")
	sslBaseAnimation Anim = SexLab.GetAnimationObject("DD_B_PS_Miss")
	if Anim != none && Anim.Name != "DD_B_PS_Miss"
		Anim.Name = "DD_B_PS_Miss"
		Anim.SetContent(Sexual)
		Anim.SoundFX = Squishing

		Int a1 = Anim.AddPosition(Female, addCum = Vaginal)
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S1")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S2")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S3")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S4")
		Anim.AddPositionStage(a1, asAnim1 + "_A1_S5")
		
		Int a2 = Anim.AddPosition(Male)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S1", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S2", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S3", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S4", strapon = True)
		Anim.AddPositionStage(a2, asAnim2 + "_A2_S5", strapon = True)
		
		Anim.AddTag("Laying")
		Anim.AddTag("Vaginal")		
		Anim.AddTag("Aggressive")

		Anim.AddTag("Sex")
		Anim.AddTag("FM")

		Anim.AddTag("DomSub")
		Anim.AddTag("PetSuit")
		Anim.AddTag("DeviousDevice")
		Anim.AddTag("NoSwap")

		Anim.Save(-1)
	EndIf
EndFunction
