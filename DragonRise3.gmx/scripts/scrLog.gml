///scrLog(text,color,sprite)

text   = "Nedefinovaný log"
color  = c_lime;
sprite = -1;

if (argument_count > 0) {text   = argument[0];}
if (argument_count > 1) {color  = argument[1];}
if (argument_count > 2) {sprite = argument[2];}

log = instance_create(oPlayer.x-32,oPlayer.y-48,oLog);

log.sprite = sprite;
log.text   = text;
log.color  = color;

