/// @desc Render and handle input

libPlayerHandleInput();
libPlayerDraw();

//draw_text_colored(x, y - 120, "This is" + _sc("colored text") + _sc("even", c_lime) + _sc("more", c_blue) + _sc("colors", c_red) + "##Icon in" + _sp(sItems, 4) + "text", 256, fntPixelTiny);
//draw_line_width(x + 256, y - 128, x + 256, y + 128, 4); 

fnt(fntPixelSmall);
draw_text(oCamera.v_nullPosX + 780, oCamera.v_nullPosY, fps);
draw_text(oCamera.v_nullPosX + 780, oCamera.v_nullPosY + 16, instance_count);
draw_text(oCamera.v_nullPosX + 760, oCamera.v_nullPosY + 200, fps_real);

draw_text(x, y - 32, "Motion: " + string(v_localMotion));

#region Some shit

/*
draw_rectangle(x - 16, y - 16, x + 16, y + 32, true);

clr(c_white, 0.3);
draw_rectangle(x - 16, y + 16, x + 16, y + 32, false);

clr(c_lime, 0.3);
draw_rectangle(x - 16, y, x + 16, y + 16, false);

clr(c_yellow, 0.3);
draw_rectangle(x - 16, y - 16, x + 16, y, false);
clr();*/

libUtilityDrawRect(v_collisionLegs, true, c_red);
libUtilityDrawRect(v_collisionHead, true, c_red);

v_collisionMain = [x - 16, y - 16, x + 16, y + 32];
v_collisionLegs = [x - 16, y + 16, x + 16, y + 32];
v_collisionHead = [x - 16, y - 16, x + 16, y - 0];
#endregion

event_inherited();

//var tmp_point = collision_line_point(x, y, mouse_x, mouse_y, parSolid, false, true);
//draw_line(x, y, mouse_x, mouse_y);
//draw_line_width(x, y, tmp_point[1], tmp_point[2], 3);