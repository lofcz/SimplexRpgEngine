/// @desc Set up variables

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

hp = 100;
max_hp = 120;

for (var i = 0; i < mcInventoryProperties; i++)
{
	v_playerProperty[i] = 0;
}

v_lang = "en";
v_mouseFree = true;
v_hudSprite = texUI;

v_baseBarSlots = 20;

v_playerProperty[e_inventoryProperties.valMaxXp] = 100;
v_playerProperty[e_inventoryProperties.valHp] = 80;
depth = -10000;

v_mouseClickedUI = false;
