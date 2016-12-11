///scrLog(text, color, sprite, overrideRarity, animationSpeed, x, y, font, mode)

var text,color,sprite,override,ani,xx,yy,mode,log;
text     = "Nedefinovaný log"
color    = c_lime;
sprite   = -1;
override = 0;
ani      = 0.2;
xx       = oPlayer.x-32;
yy       = oPlayer.y-48;
font     = fntPixel;
mode     = "normal";

if (argument_count > 0) {text     = string(argument[0]);}
if (argument_count > 1) {color    = argument[1];}
if (argument_count > 2) {sprite   = argument[2];}
if (argument_count > 3) {override = argument[3];}
if (argument_count > 4) {ani      = argument[4];}
if (argument_count > 5) {xx       = argument[5];}
if (argument_count > 6) {yy       = argument[6];}
if (argument_count > 7) {font     = argument[7];}
if (argument_count > 8) {mode     = argument[8];}

if (text   == "-1") {text   = "+ " + itm_info_head;}
if (color  == -1)   {color  = itm_effect;}
if (sprite == -1)   {sprite = tempSpr;}

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
                           case rarity_legendary:
                               {
                                color = c_yellow;
                                break;
                               } 
                           case 10027084:
                               {
                                color = 10027084;
                                break;
                               }  
                           case 4980889:
                               {
                                color = 4980889;
                                break;
                               }                                                                                            
                         }
   }

log = instance_create(xx, yy, oLog);
log.sprite = sprite;
log.text   = text;
log.color  = color;
log.ani    = ani;
log.parsed = dialogueParse(text);
log.font   = font;
log.mode   = mode;
