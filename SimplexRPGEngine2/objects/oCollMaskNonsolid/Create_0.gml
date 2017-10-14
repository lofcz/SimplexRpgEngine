/// @description Insert description here
// You can write your code in this editor

entityIni();
v_canBeDamaged = true;
v_canCollide = false;
v_isMask = true;

v_properties[e_inventoryProperties.valHp] = 1;
v_properties[e_inventoryProperties.valMaxHp] = v_properties[e_inventoryProperties.valHp];
v_iniSelf = true;
v_currentTile = 0;
alarm[0] = 1;

v_collisionMain = [x, y, x + 32 * image_xscale, y + 32 * image_yscale];

alarm[0] = 2;