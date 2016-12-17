#define hudAPI
/// hudAPi()

/*

Note - All hud scripts take x and y arguments relative to the view not room!

#define scrHudDrawBar
/// scrHudDrawBar(x, y, iconIndex, fadedBarIndex, fullBarIndex, actualValue, maxValue, alphaIndex)

var xx, yy, ii, fbi, fbI, av, mv, ai;
xx  = x;
yy  = y;
ii  = 0;
fbi = 0;
fbI = 0;
av  = 0;
mw  = 1;
ai  = 0;

if (argument_count > 0) {xx  = argument[0];}
if (argument_count > 1) {yy  = argument[1];}
if (argument_count > 2) {ii  = argument[2];}
if (argument_count > 3) {fbi = argument[3];}
if (argument_count > 4) {fbI = argument[4];}
if (argument_count > 5) {av  = argument[5];}
if (argument_count > 6) {mw  = argument[6];}
if (argument_count > 7) {ai  = argument[7];}

// Draw icon + faded bar
draw_sprite(sHUDBars, fbi, (x + xx + normalxoffset), (y + yy));
draw_sprite(sHUDBars, ii, (x + xx  + normalxoffset), (y + yy));

// Cover it with part of full bar and draw property text over it
fnt(fntPixelSmall);
draw_sprite_part(sHudBarsSubs, fbI, 0, 0, (av / mw) * sprite_get_width(sHudBarsSubs), sprite_get_height(sHudBarsSubs), (x + xx + 28 + normalxoffset), (y + yy + 4));
draw_text((x + xx + 110 + normalxoffset), (y + yy + 12), round(av));

// Draw icon overall
fnt(fntPixelTiny);  
clr(c_black, min(alpha[ai], hudAlpha));  
draw_rectangle_colour((x + xx + normalxoffset), (y + yy), (x + xx + 27 + normalxoffset), (y + yy + 23), c_white, c_white, c_white, c_white, 0);
     
// Draw icon text on-hover event
clr(c_black, min(alpha[ai] * 2, hudAlpha));
draw_text((x + xx + 15 + normalxoffset), (y + yy + 12), round(mw));

// Handle hover
if (mouse_in((x + xx + normalxoffset), (x + xx + 27 + normalxoffset), (y + yy), (y + yy + 23))) {if (alpha[ai] < 0.7) {alpha[ai] = lerp(alpha[ai], 0.71, 0.1);}} else {if (alpha[ai] > 0.01) {alpha[ai] = lerp(alpha[ai], 0, 0.1);}}

// Reset drawing mode
clr(c_black, hudAlpha);


#define scrHudDrawXpBar
/// scrHudDrawXpBar(x, y)

var xx, yy;
xx = 275;
yy = 571;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}

// Draw bar background and cover it with part of filled bar
draw_sprite(sExperienceBarNew, 0, (x + xx + spellsxPlus), (y + yy + yoffset));
draw_sprite_part(sExperienceBarNew, 1, 0, 0, (oPlayer.last_xp / oPlayer.vlastnost[vlastnost_max_zkusenosti] * sprite_get_width(sExperienceBarNew)), sprite_get_height(sExperienceBarNew), (x + xx + spellsxPlus), (y + yy + yoffset));
draw_sprite(sExperienceBarNew, 2, (x + (xx) + spellsxPlus), (y + (yy) + yoffset));
  
// Clear draw mode and draw exp text   
clr(c_black, hudAlpha);
alg("center", fntPixelSmall);
draw_text(view_xview + xx + 400 - (string_width((string(oPlayer.last_xp)+ " / " + string(oPlayer.vlastnost[vlastnost_max_zkusenosti]))) / 2), (y + (yy - 11) + yoffset) + 15, (string(oPlayer.last_xp)+ " / " + string(oPlayer.vlastnost[vlastnost_max_zkusenosti])));
