; This file is necessary for accessing these elements in dialogues
Scriptname zaddRadiantMasterStats Extends Quest Conditional

LocationAlias Property MasterHome Auto Conditional
ReferenceAlias Property MasterHomeMarker Auto Conditional
ReferenceAlias Property Master Auto Conditional
ReferenceAlias Property KeyContainer Auto Conditional

Int Property Profile Auto Conditional
Bool Property IsMerchant Auto Conditional
Bool Property IsAlchemist Auto Conditional
Bool Property IsPriest Auto Conditional
Bool Property IsInnkeeper Auto Conditional
Bool Property IsBard Auto Conditional
Bool Property IsBlacksmith Auto Conditional
Bool Property IsFarmer Auto Conditional
Bool Property IsCourtWizard Auto Conditional

Bool Property IsWealthy Auto Conditional


Bool Property InTask Auto Conditional
; 0 == not summoned, 1 == summon in progress, 2 == summon in progress, slow to respond. Mostly needed for dialogues.
Int Property SummonedStatus Auto Conditional
