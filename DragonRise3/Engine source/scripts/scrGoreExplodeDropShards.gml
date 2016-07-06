///scrGoreExplodeDropShards(shardsNumber, size, sprite)

var sN, xx, yy, size, spr;
sN   = 10;
size = 16;
spr  = -1;

if (argument_count > 0) {sN   = argument[0];}
if (argument_count > 1) {size = argument[1];}
if (argument_count > 2) {spr  = argument[2];}

if (spr == -1) {spr = sprite_index;} 

for (i = 0; i < sN; i++) 
{
 xx = (random(sprite_get_width(spr) - sprite_get_xoffset(spr)) - random(sprite_get_width(spr) - sprite_get_xoffset(spr)));
 yy = (random(sprite_get_height(spr) - sprite_get_yoffset(spr)) - random(sprite_get_height(spr) - sprite_get_yoffset(spr)));
 
 shard = instance_create(x + xx , y + yy, oShard); 
 shard._x = xx;
 shard._y = xx;
 shard._w = size; 
 shard._h = size;
 shard.sprite_index = spr;
 shard.image_single = image_index; 
 shard.actAsSolid = false;
 shard.force      = true;
}
