///sprite_divide(sprite,x1,y1,x2,y2)
/*
Splits one sprite into two sprites quickly by drawing the sprite to two surfaces
then erasing half of each determined by the input line
coordinates start at the top left of the sprite 0,0 
and end at the bottom right of the sprite sprite_width,sprite_height
*/

var script_sprite_one = sprite_duplicate(argument0);
var script_sprite_two = sprite_duplicate(argument0);

if argument3<argument1 ///flip x's to help distinguish between top and bottom pieces
{
     var split_x1 = argument3;
     var split_y1 = argument4;
     var split_x2 = argument1;
     var split_y2 = argument2;
}
else
{
     var split_x1 = argument1;
     var split_y1 = argument2;
     var split_x2 = argument3;
     var split_y2 = argument4;
}

var image_height = sprite_get_height(script_sprite_one)
var image_width = sprite_get_width(script_sprite_one)

var script_surface_one = surface_create(image_width,image_height)
var script_surface_two = surface_create(image_width,image_height)

var script_xoffset = sprite_get_xoffset(script_sprite_one);
var script_yoffset = sprite_get_yoffset(script_sprite_one);

///////////////////////////////First Half
if surface_exists(script_surface_one)
{
     surface_set_target(script_surface_one)
	 gpu_set_blendmode_ext(bm_zero,bm_inv_src_alpha);

               draw_rectangle_colour(0,0,surface_get_width(script_surface_one),surface_get_height(script_surface_one),c_black,c_black,c_black,c_black,0)///clear surface of artifacts if they exist
          gpu_set_blendmode(bm_normal)
    
          draw_sprite(script_sprite_one,0,script_xoffset,script_yoffset)///draw sprite on surface

          gpu_set_blendmode_ext(bm_zero,bm_inv_src_alpha)///causes black drawn lines to erase color
               for (var yy=0; yy<image_height; yy+=1)
               {
                    if split_x1-split_x2 !=0//meaning vertical //would cause divide by zero
                    {
                         slope=((split_y1-split_y2)/(split_x1-split_x2));//find the slope of the line
          
                         if slope!=0//meaning horizontal //would cause divide by zero
                         {
                              if split_y1<split_y2//helps distinguish between top and bottom sprite pieces
                              {
                                   draw_line_colour(-1,yy,((yy-split_y1)/slope)+split_x1,yy,c_black,c_black)//normal cut lines
                              }
                              else
                              {
                                   draw_line_colour(((yy-split_y1)/slope)+split_x1,yy,image_width,yy,c_black,c_black)//normal cut lines
                              }
                         }
                         else
                         {
                              if yy>=split_y1 
                              {
                                   draw_line_colour(-1,yy,image_width,yy,c_black,c_black)///horizontal cut lines
                              }
                         }    
                    }
                    else
                    {
                         draw_line_colour(split_x1,yy,image_width,yy,c_black,c_black)///vertical cut lines
                    }
               }
          gpu_set_blendmode(bm_normal)
     surface_reset_target()
}

///////////////////////////////////////////Second Half
if surface_exists(script_surface_two)
{
     surface_set_target(script_surface_two)
          gpu_set_blendmode_ext(bm_zero,bm_inv_src_alpha)
               draw_rectangle_colour(0,0,surface_get_width(script_surface_two),surface_get_height(script_surface_two),c_black,c_black,c_black,c_black,0)///clear surface of artifacts if they exist
          gpu_set_blendmode(bm_normal)
    
          draw_sprite(script_sprite_two,0,script_xoffset,script_yoffset)///draw sprite on surface

          gpu_set_blendmode_ext(bm_zero,bm_inv_src_alpha)///causes black drawn lines to erase color
               for (var yy=0; yy<image_height; yy+=1)
               {
                    if split_x1-split_x2 !=0//meaning vertical //would cause divide by zero
                    {
                         slope=((split_y1-split_y2)/(split_x1-split_x2));//find the slope of the line
          
                         if slope!=0//meaning horizontal //would cause divide by zero
                         {
                              if split_y1<split_y2//helps distinguish between top and bottom sprite pieces
                              {
                                   draw_line_colour(((yy-split_y1)/slope)+split_x1,yy,image_width,yy,c_black,c_black)//normal cut lines
                              }
                              else
                              {
                                   draw_line_colour(-1,yy,((yy-split_y1)/slope)+split_x1,yy,c_black,c_black)//normal cut lines
                              }
                         }
                         else
                         {
                              if yy<split_y1 
                              {
                                   draw_line_colour(-1,yy,image_width,yy,c_black,c_black)//Horizontal cut lines
                              }
                         }
                    }
                    else
                    {
                         draw_line_colour(-1,yy,split_x1,yy,c_black,c_black)//vertical cut lines
                    }
               }
          gpu_set_blendmode(bm_normal)
     surface_reset_target()
}

/////////////////////create sprites and remove surfaces
script_sprite_one = sprite_create_from_surface(script_surface_one,0,0,image_width,image_height,0,0,script_xoffset,script_yoffset)
script_sprite_two = sprite_create_from_surface(script_surface_two,0,0,image_width,image_height,0,0,script_xoffset,script_yoffset)
surface_free(script_surface_one)
surface_free(script_surface_two)

///////////////////assign collision masks
sprite_collision_mask(script_sprite_one,1,0,0,0,0,0,0,0)
sprite_collision_mask(script_sprite_two,1,0,0,0,0,0,0,0)

/////////////////collect the sprites together and return them
var both_sprites = ds_list_create()
ds_list_add(both_sprites,script_sprite_one)
ds_list_add(both_sprites,script_sprite_two)
return both_sprites;
