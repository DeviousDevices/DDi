Scriptname zadHiderScript extends ObjectReference  
zadLibs Property libs Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	self.Delete()
EndEvent
