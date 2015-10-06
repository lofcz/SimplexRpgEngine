{
    var v,i;
    v = false;
    i = collision_point(bb_l+sprite_get_width(sprite_index)/2,bb_b+sprite_get_height(sprite_index)/2,object_index,false,true);
    if (instance_exists(i)) {
        if (i.image_xscale == image_xscale) {
            if (!global.mergeThenModel || (vis[0]==i.vis[0] && vis[1]==i.vis[1] && vis[2]==i.vis[2] && vis[3]==i.vis[3])) {
                image_yscale += i.image_yscale;
                with (i) instance_destroy();
                v = true;
            }
        }
    }
    return v;
}