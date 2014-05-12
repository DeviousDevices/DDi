scriptname zadBeltedAnims extends sslAnimationFactory
zadLibs Property libs Auto
SexlabFramework Property Sexlab Auto

function LoadAnimations()
	libs.log("Devious Devices is now registering animations.")
	SexLab = SexLabUtil.GetAPI()
	If SexLab == None
		libs.Error("Animation registration failed: Sexlab is none.")
	EndIf
	PrepareFactory()
	RegisterAnimation("DDBeltedSolo")
EndFunction


function DDBeltedSolo(int id)
	libs.Log("Registering DDBeltedSolo")
	sslBaseAnimation Base = Create(id)

	Base.Name = "DDBeltedSolo"

	Base.SetContent(Sexual)
	Base.SoundFX = Squishing

	int a1 = Base.AddPosition(Female)
	Base.AddPositionStage(a1, "DDBeltedSolo", 0, silent=false)

	Base.AddTag("Solo")
;	Base.AddTag("Masturbation")
	Base.AddTag("F")
	Base.AddTag("DeviousDevice")

	Base.Save(id)
endFunction

