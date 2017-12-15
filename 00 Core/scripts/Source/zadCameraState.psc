scriptname zadCameraState extends Quest Conditional

zadLibs Property  libs Auto
Int Property CameraState Auto Conditional

Event Maintenance()
	libs.Log("Monitoring Camera state.")
	CameraState = Game.GetCameraState()
	RegisterForCameraState()
EndEvent

Event OnPlayerCameraState(int oldState, int newState)
	CameraState = NewState
EndEvent
