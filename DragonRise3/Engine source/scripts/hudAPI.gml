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
clr(c_black, alpha[ai]);  
draw_rectangle_colour((x + xx + normalxoffset), (y + yy), (x + xx + 27 + normalxoffset), (y + yy + 23), c_white, c_white, c_white, c_white, 0);
     
// Draw icon text on-hover event
clr(c_black, (alpha[ai] * 2));
draw_text((x + xx + 15 + normalxoffset), (y + yy + 12), round(mw));

// Handle hover
if (mouse_in((x + xx + normalxoffset), (x + xx + 27 + normalxoffset), (y + yy), (y + yy + 23))) {if (alpha[ai] < 0.7) {alpha[ai] = lerp(alpha[ai], 0.71, 0.1);}} else {if (alpha[ai] > 0.01) {alpha[ai] = lerp(alpha[ai], 0, 0.1);}}

// Reset drawing mode
clr();


#define scrHudDrawXpBar
/// scrHudDrawXpBar(x, y)

var xx, yy;
xx = 275;
yy = 571;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}

// Draw bar background and cover it with part of filled bar
draw_sprite(sExperienceBarSubs, 0, (x + xx + spellsxPlus), (y + yy + yoffset));
draw_sprite_part(sExperienceBarSubs, 1, 0, 0, (oPlayer.last_xp / oPlayer.vlastnost[vlastnost_max_zkusenosti] * sprite_get_width(sExperienceBarSubs)), sprite_get_height(sExperienceBarSubs), (x + xx + spellsxPlus), (y + yy + yoffset));
draw_sprite(sExperienceBar, 0, (x + (xx - 31) + spellsxPlus), (y + (yy - 11) + yoffset));
  
// Clear draw mode and draw exp text   
clr();
alg("center", fntPixelSmall);
draw_text((x + xx + 119 + spellsxPlus), (y + (yy - 11) + yoffset), (string(oPlayer.last_xp)+ " / " + string(oPlayer.vlastnost[vlastnost_max_zkusenosti])));

// Change font to bigger one and take care of unspent talent points notification
alg("center", fntPixel);
if (oPlayer.talentPoints == 0) 
    {
     draw_text((x + (xx - 15) + spellsxPlus), (y + yy + 4 + yoffset), string(oPlayer.vlastnost[vlastnost_level]));
    }
else 
    {
     draw_text((x + (xx - 15) + spellsxPlus), (y + yy + 4 + yoffset), ("+" + string(oPlayer.talentPoints)));
    }
alg();

// Animate notification alpha when necessary
if (oPlayer.talentPoints > 0)
    {
     if (!skillPointsM)
        {
         if (skillPointsA < 1)  {skillPointsA += 0.02;} else {skillPointsM = true;}
        }
     if (skillPointsM)
        {
         if (skillPointsA > 0.5)  {skillPointsA -= 0.02;} else {skillPointsM = false;}
        }
          
     draw_sprite_ext(sExperienceBar, 1, (x + (xx - 31) + spellsxPlus), (y + (yy - 11) + yoffset), 1, 1 , 0, c_white, skillPointsA);                 
     }

// Check if mouse clicked in the notification area
if (mouse_check_button_pressed(mb_left) && point_in_circle((x + (xx - 15) + spellsxPlus), (y + (yy + 5) + yoffset), mouse_x, mouse_y, 16))
    {
     if (oTalentMenu.mode == "") 
        {
         oTalentMenu.mode = "in"; 
         oTalentMenu.draw = true;
         scrSetActiveComponent(true);
        }
    }

normalxoffset = (view_wview - view_wview); 
halfxoffset   = (oHUD.normalxoffset / 2)
yoffset       = (view_hview - view_hview);
baseFormulaX = (oHUD.x + 540 + oHUD.spellsxPlus);
spellMinY    = (oHUD.y + 560 + oHUD.yoffset - 10);
spellMaxY    = (oHUD.y + 560 + oHUD.yoffset + 30);

for (i = 0; i < 3; i++)
    {
     spellMinX[i] = (baseFormulaX + (44 * i) - 8);
     spellMaxX[i] = (baseFormulaX + (44 * i) + 30);     
    }

// Pick up spell
for (i = 0; i < 3; i++)
    {
     if (mouse_check_button_pressed(mb_right))
        {
         if (mouse_in(spellMinX[i], spellMaxX[i], spellMinY, spellMaxY))
            {
             if (oSpellMenu.mode == "") 
                {
                 oSpellMenu.mode      = "in"; 
                 oSpellMenu.draw      = true;
                 oSpellMenu.fromSpell = i;
                }
            }
        }
    }
