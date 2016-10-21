/// set_sprite(sprite, imageSpeed, target)

var sprote, spd, target;
sprite = noone;
spd    = 0;
target = self;

if (argument_count > 0) {sprite    = argument[0];}
if (argument_count > 1) {spd       = argument[1];}
if (argument_count > 2) {target    = argument[2];}


with(target)
            {
             sprite_index = sprite;
             image_speed  = spd;                         
            }
