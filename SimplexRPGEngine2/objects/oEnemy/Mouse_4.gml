/// @desc [Simplex description line]

v_splitStartX = 32;
v_splitStartY = 0;

v_splitEndX = 32;
v_splitEndY = 64;

v_restX = x;
v_restY = y;

v_restStartX = v_restX;
v_restStartY = v_restY;


d_spriteList = sprite_divide(v_sprite,v_splitStartX,v_splitStartY,v_splitEndX,v_splitEndY);

sprite_index = d_spriteList[| 1];
v_spriteRest = d_spriteList[| 0];

ds_list_destroy(d_spriteList);
