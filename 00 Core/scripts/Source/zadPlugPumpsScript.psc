Scriptname zadPlugPumpsScript extends zadPlugScript

Message Property squeezeMsg Auto

Function DeviceMenuExt(Int msgChoice)
	if msgChoice == 6
		squeezeMsg.show()
		libs.UpdateExposure(libs.PlayerRef,2)
	EndIf
EndFunction
