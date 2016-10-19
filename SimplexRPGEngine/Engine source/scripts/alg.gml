/// alg(halign / mode, valign / font)

var h,v;
h = fa_left;
v = fa_top;

if (argument_count > 0) {h = argument[0];}
if (argument_count > 1) {v = argument[1];}

if (is_string(h))
    {
     if (argument_count > 1) {draw_set_font(argument[1]);}
     
     if (h == "center")
        {
         h = fa_center;
         v = fa_middle;
        }  
          
     if (h == "default")
        {
         h = fa_left;
         v = fa_top;
        }  
    }
    
draw_set_halign(h);
draw_set_valign(v);

