Scriptname zadPlugPumpsScript extends zadPlugScript

Message Property squeezeMsg Auto

Function DeviceMenuExt(Int msgChoice)
	if msgChoice == 4
		squeezeMsg.show()
		libs.UpdateExposure(libs.PlayerRef,2)
	EndIf
EndFunction
