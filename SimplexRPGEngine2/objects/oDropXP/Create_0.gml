/// @description Insert description here
// You can write your code in this editor

entityIni();

z = 8;
zspeed = 4;
zgravity = -0.5;
direction = random(360);
speed = random_range(0, 6);
friction = 0.1;
image_index = random(image_number);
image_speed=1;
scale = random_range(0.7, 1);
qqa=1;
f = choose(1, -1);
h = choose(3, 4);

v_canBeDamaged = false;
v_canCollide = false;
v_staticDepth = true;

image_xscale = scale;
image_yscale = scale;