/// @function cpGoreShards(sprite, index, number, size)
/// @desc Emmits shaders, dissolving target sprite
/// @arg {sprite} sprite Sprite to use
/// @arg {int} index Image index
/// @arg {int} number How many shards to drop
/// @arg {int} size Size of each shard in px

var sN, xx, yy, size, spr, in;
sN   = 10;
size = 16;
spr  = sprite_index;
in   = image_index;

if (argument_count > 0) {sN   = argument[2];}
if (argument_count > 1) {size = argument[3];}
if (argument_count > 2) {spr  = argument[0];}
if (argument_count > 3) {in   = argument[1];}

for (var i = 0; i < sN; i++) 
{
	 xx = abs(random(sprite_get_width(spr) - sprite_get_xoffset(spr)) - random(sprite_get_width(spr) - sprite_get_xoffset(spr)));
	 yy = abs(random(sprite_get_height(spr) - sprite_get_yoffset(spr)) - random(sprite_get_height(spr) - sprite_get_yoffset(spr))); 
	 shard = instance_create_depth(x + xx , y + yy, 0, oShard); 
	 shard._x = xx;
	 shard._y = xx;
	 shard._w = size; 
	 shard._h = size;
	 shard.sprite_index = spr;
	 shard.image_index = in; 
	 shard.actAsSolid = false;
	 shard.force      = true;
	 shard.mode = 1;
}