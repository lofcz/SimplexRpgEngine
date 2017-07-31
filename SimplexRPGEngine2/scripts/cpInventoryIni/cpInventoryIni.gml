/// @function cpInventoryIni()
/// @desc Sets up inventory variables

#macro mcInvenotryAtributes 18
#macro mcInventoryProperties 120

enum e_inventoryAtributes
{
	valID,
	valStackable,
	valSprite,
	valImageIndex,
	valInfoTextBody,
	valInfoTextHead,
	valInfoTextFooter,
	valInfoTextColor,
	valOptions,
	valRarityEffect,
	valPickSound,
	valEquipSlot,
	valIsStarred,
	valMaterialType,
	valBeingUsed,
	valInfoTextColorFooter,	
	valItemNumber,
	valCurrentStackSize,
	valMaxStackSize,
}

enum e_inventoryProperties
{
	
}

enum e_items
{
	valNONE,
	valBasicItem, 
	valGold, 
	valPearlRed, 
	valPearlGreen, 
	valSwordWooden, 
	valHelmetLeather, 
	valHerbKalokvet, 
	valPearlRedLvl2,
	valWood,
	valArmorLeather,
	valShoulderRightLeather,
	valShoulderLeftLeather,
	valShieldWooden,
	valRingGolden,
	valNecklaceNormal,
	valCardVoid,
	valMedalBasic,
	valTrophySlime,
	valCrystallisatorFire,
	valBoosterXP,
	valBeltLeather,
	valBootLeftIron,
	valBootRightIron,
	valStone,
	valGolde,
	valLockpick,
	valSteel,
	valQuestAxe1,
	valGiftLof,
	valElixirHP,
	valElixirMP,
	valHerbSuzenka,
	valHerbBazinatka,
	valHerbCtyrlistek,
	valHerbSlidivec,
	valHerbSkucivka,
	valHerbPraznik,
	valHerbBzuklar,
	valHerbKorinky,
	valLetter,
	valGem1,
	valGem2,
	valGem3,
	valGem4,
	valGem5,
	valAlchemyDust,
	valLeaf,
	valShuriken,
	valRelicRightPart,
	valRelicLeftPart,
	valRelic,
	valGem6,
	valGem7,
	valGem8,
	valGem9,
	valGem10,
	valGem11,
	valGem12,
	valGem13,
	valGem14,
	valGemQuest1,
	valPouch,
	valFurRabbit,
	valBone,
	valStick,
	valLiana,
	valKey,
	valFoodCheese,
	valFoodMilk,
	valHelmetHat,
	valArmorMetal,
	valInventoryExtension,
	valElixirStamina,
	valWhetstone,
	valGift2,
	valArcaneUpgrade1,
	valArcaneUpgrade2,
	valArcaneUpgrade3,
	valArcaneUpgrade4,
	valArcaneUpgrade5,
	valEnchanter,
	valEmendation1,
	valSoulShard,
	valPowerWord1,
	valBow1,
	valArrow1,
	valFortuneStatuette,
	valCollectible1,
	valCollectible2,
	valRename,
	valPotatoes,
	valShield1,
	valSpear1,
	valIdentification,
	valLegs1,
	valArmorGolden,
	valArmorLeather2
}




v_slots         = 25;
v_slotsPerRow   = 5;
v_slotsPerPage  = 40;
v_currentPage   = 0;
v_drag          = false;
v_drawSelf      = true;
v_formAlpha     = 1;
v_inventorySprite = sprite91;
v_inventoryTexSprite = sprite92;
v_frameBorder = 4;
v_itemSize = 32;

v_drawStartX = x;
v_drawStartY = y;
v_slotSize   = 32;
v_slotOffsetX = 4;
v_slotOffsetY = 4;

v_expandSlotsY = 2;

t = 0;
u = 0;

v_filterButtons[0, 0] = false;
v_filterButtons[1, 0] = false;
v_filterButtons[2, 0] = false;

v_slotBeingDragged = -1;
v_itemMouse = -1;

v_splitNumber = 0;
v_splitRemainning = 0;
v_hoverAlpha = 0;

v_hoverAlphaFF = 3;

for (var i = 0; i <= v_slots + 1; i++)
{
	
	for (var j = 0; j <= mcInvenotryAtributes; j++)
	{
		if (cpInventoryHelpIsStringAtr(j))
		{
			v_slot[i, j] = "";
		}
		else
		{
			v_slot[i, j] = 0;
		}
	}
	
	for (var j = 0; j <= mcInventoryProperties; j++)
	{
		v_slotProperty[i, j] = 0;
	}
}