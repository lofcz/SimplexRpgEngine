/// @function scrFrostIni(width, height, quality, blurAmount, blurColor, sprite)
/// @desc Initializes frost system
/// @arg {int} width Screen width
/// @arg {int} height Screen height
/// @arg {int} quality 16 is ok, go up for 64
/// @arg {int} blurAmount 16 is ok, go up for 64
/// @arg {color} blurColor Color of frost
/// @arg {sprite} sprite Sprite to draw

v_frostWidth   = argument0;
v_frostHeight  = argument1;
v_frostQuality = argument2;
v_frostBlur    = argument3;
v_frostColor   = argument4;
v_frostSprite  = argument5;

w = v_frostWidth;
h = v_frostHeight;

ss = surface_create(v_frostWidth,v_frostHeight);

sss = surface_create(v_frostWidth,v_frostHeight);

surface_set_target(ss);
draw_clear_alpha(v_frostColor, 0);
surface_reset_target();

surface_set_target(sss);
draw_clear_alpha(c_black, 1);
surface_reset_target();