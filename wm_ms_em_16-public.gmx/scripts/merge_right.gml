{
    var h,i;
    h = false;
    i = collision_point(bb_r+sprite_get_width(sprite_index)/2,bb_t+sprite_get_height(sprite_index)/2,object_index,false,true);
    if (instance_exists(i)) {
        if (i.image_yscale == image_yscale) {
            if (!global.mergeThenModel || (vis[0]==i.vis[0] && vis[1]==i.vis[1] && vis[2]==i.vis[2] && vis[3]==i.vis[3])) {
                image_xscale += i.image_xscale;
                h = true;
                with (i) instance_destroy();
            }
        }
    }
    return h;
}