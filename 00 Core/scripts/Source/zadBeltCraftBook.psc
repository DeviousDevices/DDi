Scriptname zadBeltCraftBook extends ObjectReference  

Perk Property zad_BeltCrafting Auto
Perk Property zad_keyCraftingEasy Auto
Perk Property zad_keyCraftingHard Auto
zadConfig Property config Auto
Message Property zad_beltCraftBookMsg auto 

Event OnRead()
	if (Game.GetPlayer().HasPerk(zad_BeltCrafting) == 0)
  		Game.GetPlayer().AddPerk(zad_BeltCrafting)
		if config.KeyCrafting == 0
  			Game.GetPlayer().AddPerk(zad_keyCraftingEasy)
		elseif config.KeyCrafting == 1
			Game.GetPlayer().AddPerk(zad_keyCraftingHard)
		EndIf
		zad_beltCraftBookMsg.Show()
	endIf
	
EndEvent
