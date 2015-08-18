///scrGoreExplode(xsize,ysize)

var xsize,ysize;
xsize = 10;
ysize = 10;

for( i = x - sprite_xoffset; i < x - sprite_xoffset + sprite_width; i += xsize) 
{
 for( j = y - sprite_yoffset; j < y - sprite_yoffset + sprite_height; j += ysize) 
 {
 shard = instance_create(i,j,oShard);
 
 shard._x = i - x + sprite_xoffset;
 shard._y = j - y + sprite_yoffset;
 shard._w = xsize; 
 shard._h = ysize;
 shard.sprite_index = sprite_index;
 shard.image_single = image_index; 
 } 
}
