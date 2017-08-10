/// @description Insert description here
// You can write your code in this editor

image_index = 0;
image_speed = 0;

v_imagesPerSide = 4;
v_dir = e_dirs.valS;
v_mindState = "hostile";
v_action = "";
v_timer = 0;

v_collisionLegs = [x - 16, y, x + 16, y + 16];