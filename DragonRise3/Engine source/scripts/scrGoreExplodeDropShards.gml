///scrGoreExplodeDropShards(shardsNumber, size)

var sN, xx, yy, size;
sN   = 10;
size = 16

if (argument_count > 0) {sN   = argument[0];}
if (argument_count > 1) {size = argument[1];}

for (i = 0; i < sN; i++) 
{
 xx = (random(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index)) - random(sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index)));
 yy = (random(sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index)) - random(sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index)));
 
 shard = instance_create(x + xx , y + yy, oShard); 
 shard._x = xx;
 shard._y = xx;
 shard._w = size; 
 shard._h = size;
 shard.sprite_index = sprite_index;
 shard.image_single = image_index; 
}
