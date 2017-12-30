/// @description Insert description here
// You can write your code in this editor

x = oCamera.v_nullPosX + v_posX;
y = oCamera.v_nullPosY + oCamera.v_viewSizeY - 100;

var tmp_textW;
tmp_textW = 196;

if (v_mode == 0) {v_posX = lerp(v_posX, 32, 0.2); if (v_posX > 31) {v_posX = 32; v_mode = 1;}}
if (v_mode == 1) {v_time++; if (v_time > 180) {v_mode = 2;}}
if (v_mode == 2) {v_alpha = lerp(v_alpha, 0, 0.2);}

// <name, text, imageIndex, unlocked?>  
fnt(fntPixel);
tmp_textW = max(string_width(oHUD.v_playerAchievements[v_index, 0]), tmp_textW);
fnt(fntPixelTiny);
tmp_textW = max(string_width(oHUD.v_playerAchievements[v_index, 1]), tmp_textW);

clr(c_black, min(0.8, v_alpha));
draw_roundrect_ext(x, y - 23, x + tmp_textW, y + 23, 16, 16, false);

clr(-1, min(1, v_alpha));
draw_roundrect_ext(x, y - 23, x + tmp_textW, y + 23, 16, 16, true);

clr(c_white, -1);
fnt(fntPixel);
draw_text(x + 26, y - 20, oHUD.v_playerAchievements[v_index, 0]);
fnt(fntPixelTiny);
draw_text_colored(x + 26, y, oHUD.v_playerAchievements[v_index, 1], -1, fntPixelTiny, c_white);
clr(c_black, min(1, v_alpha));


image_alpha = v_alpha;
draw_self();
