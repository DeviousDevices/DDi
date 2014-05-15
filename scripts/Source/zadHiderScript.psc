Scriptname zadHiderScript extends ObjectReference  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	self.Delete()
EndEvent
