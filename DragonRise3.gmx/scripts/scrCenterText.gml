/// scrCenterTex(true)

statement = 1;

if (argument_count > 0) {statement = argument[0];}

if (statement)
   {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
   }
else
    {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    }
