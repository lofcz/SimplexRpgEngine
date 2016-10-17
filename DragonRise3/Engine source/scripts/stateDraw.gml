/// stateDraw(x, y, entries)

var e;
e  = 5;

x  = view_xview;
y  = (view_yview + 500 + oHUD.yoffset);

if (argument_count > 0) {x = argument[0];}
if (argument_count > 1) {y = argument[1];}
if (argument_count > 2) {e = argument[2];}

xx       = x;
yy       = y;
tempDraw = false;

draw_set_font(fntPixelTiny);

for (a = 0; a < min(ds_list_size(list), e); a++)
    {
    draw_set_alpha(ds_list_find_value(list_alpha,a))
    clr(c_black, max(ds_list_find_value(list_alpha,a), 0));
    draw_text_colored(xx, yy, list[| a]);
    clr();

    
     if (list_alpha[| a] < 1) {yy += (16 * list_alpha[| a]);}
     else {yy += 16;} 
     
     if (a = 0) 
        {
        value = list_alpha[| a];
        list_alpha[| a] = (value - 0.01); // Fade
        if (value <= 0) 
            {
            ds_list_delete(list,a); 
            ds_list_delete(list_alpha,a); 
            tempDraw = true;
            break;
            }
        }     
    }

if (tempDraw)
    {
for (a = 0; a < min(ds_list_size(list), e); a++)
    {
    draw_set_alpha(ds_list_find_value(list_alpha,a))
    clr(c_black, max(ds_list_find_value(list_alpha,a), 0));
    draw_text_colored(xx, yy, list[| a]);
    clr();

    
     if (list_alpha[| a] < 1) {yy += (16 * list_alpha[| a]);}
     else {yy += 16;}  
    }     
       
    }


