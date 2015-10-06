///scrLog(text,color,sprite,override_rarity,animation_speed,x,y,font,shatter)

var text,color,sprite,override,ani,xx,yy;
text     = "Nedefinovaný log"
color    = c_lime;
sprite   = -1;
override = 0;
ani      = 0.2;
xx       = oPlayer.x-32;
yy       = oPlayer.y-48;
font     = fntPixel;


if (argument_count > 0) {text     = string(argument[0]);}
if (argument_count > 1) {color    = argument[1];}
if (argument_count > 2) {sprite   = argument[2];}
if (argument_count > 3) {override = argument[3];}
if (argument_count > 4) {ani      = argument[4];}
if (argument_count > 5) {xx       = argument[5];}
if (argument_count > 6) {yy       = argument[6];}
if (argument_count > 7) {font     = argument[7];}

if (override) 
   {
   switch(itm_info_color)
                         {
                          case rarity_junk:
                               {
                                color = c_dkgray;
                                break;
                               }
                           case rarity_normal:
                               {
                                color = c_white;
                                break;
                               }
                           case rarity_fine:
                               {
                                color = c_blue;
                                break;
                               }
                           case rarity_rare:
                               {
                                color = c_lime;
                                break;
                               }

                         }
   }

log = instance_create(xx,yy,oLog);

log.sprite = sprite;
log.text   = text;
log.color  = color;
log.ani    = ani;
log.parsed = dialogueParse(text);
log.font   = font;
