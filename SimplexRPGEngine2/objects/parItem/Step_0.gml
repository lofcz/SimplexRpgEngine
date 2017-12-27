/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (!v_staticDepth)
{
	//depth = -y;
}
v_collisionMain = [x + sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index), y + sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index), x + (sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index)) * image_xscale, y + (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index)) * image_yscale];
