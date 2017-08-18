/// @desc Render and handle input

libPlayerHandleInput();
libPlayerDraw();

draw_text_colored(x, y - 120, "This is" + _sc("colored text") + _sc("even", c_lime) + _sc("more", c_blue) + _sc("colors", c_red) + "##Icon in" + _sp(sItems, 4) + "text", 256, fntPixelTiny);
//draw_line_width(x + 256, y - 128, x + 256, y + 128, 4); 

draw_text(oCamera.v_nullPosX + 780, oCamera.v_nullPosY, fps);
draw_text(oCamera.v_nullPosX + 780, oCamera.v_nullPosY + 16, instance_count);


/*
draw_rectangle(x - 16, y - 16, x + 16, y + 32, true);

clr(c_white, 0.3);
draw_rectangle(x - 16, y + 16, x + 16, y + 32, false);

clr(c_lime, 0.3);
draw_rectangle(x - 16, y, x + 16, y + 16, false);

clr(c_yellow, 0.3);
draw_rectangle(x - 16, y - 16, x + 16, y, false);
clr();*/

v_collisionMain = [x - 16, y - 16, x + 16, y + 32];
v_collisionLegs = [x - 16, y + 16, x + 16, y + 32];

event_inherited();