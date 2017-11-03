/// @description Insert description here
// You can write your code in this editor


entityIni();
v_collisionMain = [x, y + 32, x + 32, y + 48];
alarm[0] = 1;
image_speed = 0;

time = random_range(0, 360);
v_canBeDamaged = true;
v_properties[e_inventoryProperties.valHp] = 5;
v_dropShardsOnHit = true;
v_spriteRest = -1;
v_whole = true;

point1 = [-64, 64];
point2 = [64, 96];
v_sprite = -1;
r = 0;
xx = 0;
yy = 0;
a = 1;
u = 1;
k = sprite_index;
a2 = 1;
kk = k;
scale = 1;

v_reflIndex = -1;
v_reflOffset = 16;