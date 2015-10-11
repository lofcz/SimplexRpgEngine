/// stateDraw(x,y)

x  = view_xview;
y  = view_yview+512;

if (argument_count > 0) {x = argument[0];}
if (argument_count > 1) {y = argument[1];}
xx = x;
yy = y;

draw_set_font(fntPixel);
//draw_text(x,y-32,ds_list_size(list));

for (a = 0; a < ds_list_size(list); a++)
    {
    
    draw_set_alpha(ds_list_find_value(list_alpha,a))
     draw_text_colour(xx,yy,list[| a],c_black,c_black,c_black,c_black,ds_list_find_value(list_alpha,a));
     
     if (ds_list_find_value(list_alpha,a) < 1) {yy += 16*ds_list_find_value(list_alpha,a)}
      else {yy += 16;} 
     if (a = 0) {value = ds_list_find_value(list_alpha,a); ds_list_replace(list_alpha,a,value-0.01); if (value <= 0) {ds_list_delete(list,a); ds_list_delete(list_alpha,a);}}
    }
    
    if (keyboard_check_pressed(vk_key))
       {
        ds_list_add(list,"AAA");
         ds_list_add(list_alpha,2);

       }
