/// scrBestiaryInit(x,y,menuFallSpeedStart,menuFallSpeedMax)

var tX,tY,tMenuFallSpeedStart,tMenuFallSpeedMax;

tX                        = view_xview+800-256;
tY                        = view_yview+155;
tMenuFallSpeedStart       = 4;
tMenuFallSpeedMax         = cNAN;

if (argument_count > 0) {tX                    = argument[0];}
if (argument_count > 0) {tY                    = argument[1];}
if (argument_count > 0) {tMenuFallSpeedStart   = argument[2];}
if (argument_count > 0) {tMenuFallSpeedMax     = argument[3];}


mode                 = 0;
page                 = 0;
item_selected        = -1;
spd                  = 0;
spd_max              = 2;
real_spd             = 0;
rec_height           = 0;
spd2                 = tMenuFallSpeedStart;
spd_max2             = tMenuFallSpeedMax;
pass2                = 0;
detail_alpha         = 0;
active               = bestiaryEnemySlime;
v_x                  = tX;
v_y                  = tY;
activated            = 0;
activated_x          = 0;
activated_speed      = 2;

for (a = 0; a < 10; a++)
    {
     for (b = 0; b < 6; b++)
         {
          alpha[a,b]    = 1;
          text[a,b]     = "";
          if (b != 5) {monster[a,b]  = "";} else {monster[a,b] = 0;}       
         }
         
     title[a]                             = "";
     xx[a]                                = v_x + a*48;
     yy[a]                                = v_y + 48+a*68;
     monster[a,bestiary_monster_sprite]   = sFreeSlot;
     unlocked[a]                          = 0;
     yyy[a]                               = yy[a];
     i_alpha[a]                           = 1;
    }
    
