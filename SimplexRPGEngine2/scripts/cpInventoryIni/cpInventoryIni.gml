/// @function cpInventoryIni()
/// @desc Sets up inventory variables

#macro mcInvenotryAtributes 26
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
	valRarity,
	valPickSound,
	valEquipSlot,
	valLabel,
	valMaterialType,
	valBeingUsed,
	valInfoTextColorFooter,	
	valItemNumber,
	valCurrentStackSize,
	valMaxStackSize,
	valPriceBase,
	valLerpColor,
	valWeight,
	valIdentified,
	valDurability,
	valMaxDurability,
	valGemSlots
}

enum e_inventoryProperties
{
	valLevel,
	valMaxHp,
	valMaxMp,
	valMaxSp,
	valDamage,
	valStrenght,
	valDexterity,
	valEndurance,
	valAccuray,
	valSwiftness,
	valHp,
	valMp,
	valSp,
	valXp,
	valMaxXp,
	valSpRegenDelay,
	valHpRegenDelay,
	valMpRegenDelay,
	valSpRegenValue,
	valHpRegenValue,
	valMpRegenValue,
	valHpRegenTick,
	valMpRegenTick,
	valSpRegenTick,
	valIntellect, 
	valFortitude,
	valCharisma,
	valPsyche,
	valResolve,
	valPerception,
	valFate,
	valResistEarth,
	valResistFire,
	valResistAir,
	valResistWater,
	valPersuasion,
	valIntimidation,
	valBargaining,
	valTrustfulness,
	valDefense,
	valCriticalChance,
	valCriticalDamage,
	valDefenseMagic,
	valMagicMultiplier,
	valLuck,
	valTrapDetection,
	valMasterySwords,
	valMasterySpears,
	valMasteryBows,
	valMasteryDaggers,
	valMasteryAxes,
	valMasteryShields,
	valMasteryMaces
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




v_slots         = 75;
v_slotsPerRow   = 5;
v_slotsPerPage  = 25;
v_currentPage   = 0;
v_drag          = false;
v_drawSelf      = true;
v_formAlpha     = 1;
v_inventorySprite = texUI;
v_inventoryTexSprite = texUIFill;
v_frameBorder = 4;
v_itemSize = 32;

v_drawStartX = x;
v_drawStartY = y + 64;
v_slotSize   = 32;
v_slotOffsetX = 4;
v_slotOffsetY = 4;
v_actualY = 64;

v_expandSlotsY = 2;

t = 0;
u = 0;
hj = 0;
yj = 0;

v_filterButtons[0, 0] = false;
v_filterButtons[1, 0] = false;
v_filterButtons[2, 0] = false;

v_slotBeingDragged = -1;
v_itemMouse = -1;

v_splitNumber = 0;
v_splitRemainning = 0;
v_hoverAlpha = 0;

v_hoverAlphaFF = 3;
v_lastHover = -1;

tmp_lastHover = -1;
v_containerID = -1;

v_formExtW = 48;
v_formExtH = 12;

v_formExtMode = "crafting";
v_changingForm = false;
v_formExtModeStack = v_formExtMode;

v_formBaseMaxX = 0;
v_formBaseMaxY = 0;

v_formExtAlpha = 0;

v_formExt = [0, 0, 0];
v_actualLerp = 0;
v_lerpMode = 0;

v_weight = 0;
v_drawForm = true;

v_hoverContainerForm = "";
tmp_equipmentLastHover = 0;

v_menuItem = -1;
g_menuList = ds_list_create();
v_menuItemStartX = -1;
v_menuItemStartY = -1;
v_secondMenu = -1;
v_secondMenuX = -1;
v_secondMenuY = -1;
v_secondMenuW = -1;
v_secondMenuH = -1;
v_secondMenuLast = -1;

v_secondMenuText[0] = "Star";
v_secondMenuText[1] = "Trash";
v_secondMenuText[2] = "Unmark";

v_drawCombinations = false;
v_usedItem = -1;
v_usedOption = 0;


for (var i = 0; i <= v_slots; i++)
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
		v_slotReq[i, j] = 0;
		v_slotPropertyStatic[i, j] = 0;
	}
	
	for (var j = 0; j < mcAnimations; j++)
	{
		v_slotAnimations[i, j] = 0;
	}

	for (var j = 0; j < 16; j++)
	{
		v_itemOptions[i, j] = "";
	}
	
	for (var j = 0; j < 24; j++)
	{
		v_slotGems[i, j] = "";	
	}
}

cpEquipmentIni();
cpCraftingIni();