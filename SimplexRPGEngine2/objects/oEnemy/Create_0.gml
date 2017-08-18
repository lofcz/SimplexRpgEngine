/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < room_height div 32; i++)
{
	for (var j = 0; j < room_width div 32; j++)
	{
		cellArray[i, j] = 0;
	}
}

//grid_cellChecked = ds_grid_create((room_width div 32), (room_height div 32));

image_index = 0;
image_speed = 0;

v_imagesPerSide = 4;
v_dir = e_dirs.valS;
v_mindState = "idle";
v_action = "rest";
v_timer = 0;
v_attackArea = [x - 256, y - 256, x + 256, y + 256];
v_attackNote = 64;

v_enemyType = choose("goblin");
if (v_enemyType == "golem") {sprite_index = sGolemMove; v_animationFrames = [7, 7]; v_moveAnim = sGolemMove; v_attackAnim = sGolemAttack;}
else {v_animationFrames = [8, 9]; v_moveAnim = sGoblinMove; v_attackAnim = sGoblinAttack;}

event_inherited();
v_collisionLegs = [x - 16, y, x + 16, y + 16];
v_canBeDamaged = true;

for (var i = 0; i < mcInventoryProperties; i++)
{
	v_properties[i] = 0;
}

v_properties[e_inventoryProperties.valHp] = irandom(3) * 5 + 10;
v_properties[e_inventoryProperties.valMaxHp] = v_properties[e_inventoryProperties.valHp];

v_sprite = sprite_duplicate(sprite_index);
v_spriteRest = -1;
v_restAlpha = 1;
v_restRot = 0;
v_restStartX = x;
v_restStartY = x;
v_restX2 = 0;
v_weaponSprite = choose(sGoblinMoveSword, sGoblinMoveMace);

v_currentAnimation = 0;


v_targetLastPosX = -1;
v_targetLastPosY = -1;
