/// @function sprite_divide(sprite, x1, y1, x2, y2)
/// @desc Divides sprite into two and returns them in a list
/// @arg {sprite} sprite Sprite to use
/// @arg {int} x1 First point X
/// @arg {int} y1 First point Y
/// @arg {int} x2 Second point X
/// @arg {int} y2 Second point Y

var tmp_sprite1, tmp_sprite2, tmp_inSprite, tmp_inX1, tmp_inX2, tmp_inY1, tmp_inY2, tmp_splitX1, tmp_splitX2, tmp_splitY1, tmp_splitY2, tmp_imageHeight, tmp_imageWidth, tmp_surfaceOne, tmp_surfaceTwo, tmp_XO, tmp_YO, tmp_slope, tmp_xx, tmp_yy, tmp_x1, tmp_x2, tmp_y1, tmp_y2, tmp_r1, tmp_r2, tmp_rList;

if (argument_count > 0) {tmp_inSprite = argument[0];}
if (argument_count > 1) {tmp_x1 = argument[1];}
if (argument_count > 2) {tmp_y1 = argument[2];}
if (argument_count > 3) {tmp_x2 = argument[3];}
if (argument_count > 4) {tmp_y2 = argument[4];}

tmp_sprite1 = tmp_inSprite;
tmp_sprite2 = tmp_inSprite;

if (tmp_x2 < tmp_x1)
{
     tmp_splitX1 = tmp_x2;
     tmp_splitY1 = tmp_y2;
     tmp_splitX2 = tmp_x1;
     tmp_splitY2 = tmp_y1;
}
else
{
     tmp_splitX1 = tmp_x1;
     tmp_splitY1 = tmp_y1;
     tmp_splitX2 = tmp_x2;
     tmp_splitY2 = tmp_y2;
}

tmp_imageHeight = sprite_get_height(tmp_sprite1);
tmp_imageWidth  = sprite_get_width(tmp_sprite1);
tmp_surfaceOne  = surface_create(tmp_imageWidth, tmp_imageHeight);
tmp_surfaceTwo  = surface_create(tmp_imageWidth, tmp_imageHeight);
tmp_XO			= sprite_get_xoffset(tmp_sprite1);
tmp_YO			= sprite_get_yoffset(tmp_sprite1);

if (surface_exists(tmp_surfaceOne))
{
	surface_set_target(tmp_surfaceOne);
	gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
	draw_rectangle_colour(0, 0, surface_get_width(tmp_surfaceOne), surface_get_height(tmp_surfaceOne), c_black, c_black, c_black, c_black, 0);
	gpu_set_blendmode(bm_normal);    
	draw_sprite(tmp_sprite1, 0, tmp_XO, tmp_YO);
	gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
	 
	for (tmp_yy = 0; tmp_yy < tmp_imageHeight; tmp_yy++)
	{
		if ((tmp_splitX1 - tmp_splitX2) !=0)
		{
			tmp_slope = ((tmp_splitY1-tmp_splitY2)/(tmp_splitX1-tmp_splitX2));
          
			if (tmp_slope != 0)
			{
				if (tmp_splitY1 < tmp_splitY2)
				{
					draw_line_colour(-1, tmp_yy, ((tmp_yy - tmp_splitY1) / tmp_slope) + tmp_splitX1, tmp_yy, c_black, c_black);
				}
				else
				{
					draw_line_colour(((tmp_yy - tmp_splitY1) / tmp_slope) + tmp_splitX1, tmp_yy, tmp_imageWidth, tmp_yy, c_black, c_black);
				}
			}
			else
			{
				if (tmp_yy >= tmp_splitY1) 
				{
					draw_line_colour(-1, tmp_yy, tmp_imageWidth, tmp_yy, c_black, c_black);
				}
			}    
		}
		else
		{
			draw_line_colour(tmp_splitX1, tmp_yy, tmp_imageWidth, tmp_yy, c_black, c_black);
		}
	}
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}

if (surface_exists(tmp_surfaceTwo))
{
	surface_set_target(tmp_surfaceTwo);
	gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
	draw_rectangle_colour(0, 0, surface_get_width(tmp_surfaceTwo), surface_get_height(tmp_surfaceTwo), c_black, c_black, c_black, c_black, 0);
	gpu_set_blendmode(bm_normal);    
	draw_sprite(tmp_sprite2, 0, tmp_XO, tmp_YO);
	gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
	
	for (tmp_yy = 0; tmp_yy < tmp_imageHeight; tmp_yy++)
	{
		if (tmp_splitX1 - tmp_splitX2 !=0)
		{
			tmp_slope = ((tmp_splitY1 - tmp_splitY2) / (tmp_splitX1 - tmp_splitX2));
          
			if (tmp_slope != 0)
			{
				if (tmp_splitY1 < tmp_splitY2)
				{
					draw_line_colour(((tmp_yy - tmp_splitY1) / tmp_slope) + tmp_splitX1, tmp_yy, tmp_imageWidth, tmp_yy, c_black, c_black);
				}
				else
				{
					draw_line_colour(-1, tmp_yy, ((tmp_yy - tmp_splitY1) / tmp_slope) + tmp_splitX1, tmp_yy, c_black, c_black);
				}
			}
			else
			{
				if (tmp_yy < tmp_splitY1)
				{
					draw_line_colour(-1, tmp_yy, tmp_imageWidth, tmp_yy, c_black, c_black);
				}
			}
		}
		else
		{
			draw_line_colour(-1, tmp_yy, tmp_splitX1, tmp_yy, c_black, c_black);
		}
	}
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}

tmp_r1 = sprite_create_from_surface(tmp_surfaceOne, 0, 0, tmp_imageWidth, tmp_imageHeight, 0, 0, tmp_XO, tmp_YO);
tmp_r2 = sprite_create_from_surface(tmp_surfaceTwo, 0, 0, tmp_imageWidth, tmp_imageHeight, 0, 0, tmp_XO, tmp_YO);

surface_free(tmp_surfaceOne);
surface_free(tmp_surfaceTwo);

tmp_rList = ds_list_create();
ds_list_add(tmp_rList, tmp_r1);
ds_list_add(tmp_rList, tmp_r2);

return tmp_rList;


