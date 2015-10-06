{
    var i,h,v;
    h = true;
    v = true;
    if (searching) {
        h = merge_right();
        v = merge_down();
        bb_l = x;
        bb_r = x + sprite_width;
        bb_t = y;
        bb_b = y + sprite_height;
        searching = (h || v);    
    }
}