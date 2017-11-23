/// @desc Set up variables

randomize();

v_hudFrameTopX = 16;
v_hudFrameTopY = 40;

v_hudFrameMidX = 478;
v_hudFrameMidY = 24;

v_hudFrameBottomX = 478;
v_hudFrameBottomY = 80;

v_hudTextureX = 864;
v_hudTextureY = 568;

v_hudSlotX = 190;
v_hudSlotY = 292;

v_hudSlotUseX = 316;
v_hudSlotUseY = 292;

v_hudButtonX = 770;
v_hudButtonY = 25;

v_hudButtonPressedX = 770;
v_hudButtonPressedY = 50;

v_hudPortraitX = 446;
v_hudPortraitY = 180;

v_hudBarBaseX = 533;
v_hudBarBaseY = 184;

v_hudBaseBarEndX = 551;
v_hudBaseBarEndY = 182;

v_hudBaseBarFillX = 592;
v_hudBaseBarFillY = 186;

v_hudBarXpX = 259;
v_hudBarXpY = 40;

v_hudBarSlotX = 30;
v_hudBarSlotY = 288;

v_hudBarConnectX = 70;
v_hudBarConnectY = 288;

v_hudBarStartX = 16;
v_hudBarEndX = 160;

v_hudMapX = 714;
v_hudMapY = 289;

v_hudBallX = 64;
v_hudBallY = 105;

v_hudMapModeX = 815;
v_hudMapModeY = 308;

v_hudMapZoomInX = 729;
v_hudMapZoomInY = 378;

v_hudMapZoomOutX = 745;
v_hudMapZoomOutY = 394;

v_realXP = 0;
v_realHP = 0;
v_realMP = 0;
v_realSP = 0;

hp = 100;
max_hp = 120;

v_gold = 0;
v_goldD = 0;
v_l = 1;
v_l = 1;
for (var i = 0; i < mcInventoryProperties; i++)
{
	v_playerProperty[i] = choose(1, 2, 3, 4);
	v_playerPropertyStatic[i] = choose(1, 2, 0);
}

v_lang = "en";
v_mouseFree = true;
v_hudSprite = texUI;

v_baseBarSlots = 20;

v_fatigueSpStart = 0.1

v_playerProperty[e_inventoryProperties.valMaxXp] = 100;
v_playerProperty[e_inventoryProperties.valHp] = 100;
v_playerProperty[e_inventoryProperties.valMp] = 100;
v_playerProperty[e_inventoryProperties.valSp] = 100;

v_playerProperty[e_inventoryProperties.valMaxHp] = 100;
v_playerProperty[e_inventoryProperties.valMaxMp] = 100;
v_playerProperty[e_inventoryProperties.valMaxSp] = 100;

v_playerProperty[e_inventoryProperties.valHpRegenDelay] = 240;
v_playerProperty[e_inventoryProperties.valHpRegenTick] = 60;
v_playerProperty[e_inventoryProperties.valHpRegenValue] = 1;

v_playerProperty[e_inventoryProperties.valSpRegenDelay] = 240;
v_playerProperty[e_inventoryProperties.valSpRegenTick] = 10;
v_playerProperty[e_inventoryProperties.valSpRegenValue] = 1;


depth = -10000;

v_mouseClickedUI = false;
v_keyboardClickedUI = false;

v_alphaH = 0;
v_alphaM = 0;
v_alphaS = 0;
v_alphaH2 = 0;
v_alphaM2 = 0;
v_alphaS2 = 0;

v_delayHP = -1;
v_delayMP = -1;
v_delaySP = -1;

v_tickHP = -1;
v_tickMP = -1;
v_tickSP = -1;

v_playerSkillPointsAttributes = 10;
v_playerSkillPointsAbilities = 20;

v_hotbarSlots = 9;

#macro mcSpells 2

enum e_spells
{
	valFireball,
	valIcicles
}

v_playerSpell[e_spells.valFireball, 0] = "Fire ball";
v_playerSpell[e_spells.valFireball, 1] = 0;
v_playerSpell[e_spells.valFireball, 2] = "Mighty spell of gods. Quisque porta. Etiam commodo dui eget wisi. Praesent vitae arcu tempor neque lacinia pretium. Vivamus porttitor turpis ac leo.";

// attribute
// <name, value, upgradeCost, suffix>
v_playerSpellStaticstics[e_spells.valFireball, 0] = "Mana cost";
v_playerSpellStaticstics[e_spells.valFireball, 1] = 60;
v_playerSpellStaticstics[e_spells.valFireball, 2] = -1;
v_playerSpellStaticstics[e_spells.valFireball, 3] = "";

v_playerSpellStaticstics[e_spells.valFireball, 4] = "Burst damage";
v_playerSpellStaticstics[e_spells.valFireball, 5] = 24;
v_playerSpellStaticstics[e_spells.valFireball, 6] = -1;
v_playerSpellStaticstics[e_spells.valFireball, 7] = "";

v_playerSpellStaticstics[e_spells.valFireball, 8] = "Sparks damage";
v_playerSpellStaticstics[e_spells.valFireball, 9] = 3;
v_playerSpellStaticstics[e_spells.valFireball, 10] = -1;
v_playerSpellStaticstics[e_spells.valFireball, 11] = "";

v_playerSpellStaticstics[e_spells.valFireball, 12] = "Ablaze chance";
v_playerSpellStaticstics[e_spells.valFireball, 13] = 12;
v_playerSpellStaticstics[e_spells.valFireball, 14] = -1;
v_playerSpellStaticstics[e_spells.valFireball, 15] = "%";

v_playerSpellStaticstics[e_spells.valFireball, 16] = "Cooldown";
v_playerSpellStaticstics[e_spells.valFireball, 17] = 20;
v_playerSpellStaticstics[e_spells.valFireball, 18] = -1;
v_playerSpellStaticstics[e_spells.valFireball, 19] = "s";

// upgrade
// <name, level, maxLevel, upgradeCost, upgradeUnlocked, detailText, isVisible, isKnown> 
v_playerSpellUpgrade[e_spells.valFireball, 0] = "Eternal fire";
v_playerSpellUpgrade[e_spells.valFireball, 1] = 0;
v_playerSpellUpgrade[e_spells.valFireball, 2] = 1;
v_playerSpellUpgrade[e_spells.valFireball, 3] = 120;
v_playerSpellUpgrade[e_spells.valFireball, 4] = 1;
v_playerSpellUpgrade[e_spells.valFireball, 5] = "Forces u to you to fuck your own mom";
v_playerSpellUpgrade[e_spells.valFireball, 6] = 1;
v_playerSpellUpgrade[e_spells.valFireball, 7] = 1;

// req
// <reqIndex1, reqVal1...>

v_playerSpell[e_spells.valIcicles, 0] = "Icicles";
v_playerSpell[e_spells.valIcicles, 1] = 1;
v_playerSpell[e_spells.valIcicles, 2] = "Icicles. Quisque porta. Etiam commodo dui eget wisi. Praesent vitae arcu tempor neque lacinia pretium. Vivamus porttitor turpis ac leo.";

v_playerSpellStaticstics[e_spells.valIcicles, 0] = "Mana cost";
v_playerSpellStaticstics[e_spells.valIcicles, 1] = 40;
v_playerSpellStaticstics[e_spells.valIcicles, 2] = -1;

// <mode, id> 
// mode: -1 = noone, 0 = spell, 1 = item

for (var i = 0; i < v_hotbarSlots; i++)
{
	v_hotbar[i, 0] = -1;
	v_hotbar[i, 1] = -1;
}