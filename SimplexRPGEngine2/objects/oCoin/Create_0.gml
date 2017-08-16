/// @desc [Simplex description line]

entityIni();

z = 8;
zspeed = 4;
zgravity = -0.5;
direction = random(360);
speed = random_range(2, 5);
friction = 0.15;
image_index = random(image_number);
image_speed=1;
qqa=1;
f = choose(1, -1);
h = choose(3, 4);

v_canBeDamaged = false;
v_canCollide = false;
v_staticDepth = true;
