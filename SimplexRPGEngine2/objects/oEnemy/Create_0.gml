/// @description Insert description here
// You can write your code in this editor

image_index = 0;
image_speed = 0;

v_imagesPerSide = 4;
v_dir = e_dirs.valS;
v_mindState = "idle";
v_action = "";
v_timer = 0;
v_attackArea = [x - 256, y - 256, x + 256, y + 256];
v_attackNote = 196;

event_inherited();
v_collisionLegs = [x - 16, y, x + 16, y + 16];
v_canBeDamaged = true;

for (var i = 0; i < mcInventoryProperties; i++)
{
	v_properties[i] = 0;
}

v_sprite = sprite_duplicate(sprite_index);
v_spriteRest = -1;
v_restAlpha = 1;
v_restRot = 0;
v_restStartX = x;
v_restStartY = x;
v_restX2 = 0;

v_currentAnimation = 0;
v_animationFrames = [8, 9];

v_targetLastPosX = -1;
v_targetLastPosY = -1;
