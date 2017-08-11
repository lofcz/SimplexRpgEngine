/// @description Insert description here
// You can write your code in this editor

v_collisionMain = [x + sprite_get_bbox_left(sprite_index), y + sprite_get_bbox_top(sprite_index), x + sprite_get_bbox_right(sprite_index), y + sprite_get_bbox_bottom(sprite_index)];
v_collisionLegs = [-1, -1, -1, -1];
v_canCollide    = true;
v_staticDepth   = false;
v_canBeDamaged  = false;