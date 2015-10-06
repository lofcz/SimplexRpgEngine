{
    // up
    i = collision_point(bb_l+sprite_width/2,bb_t-sprite_height/2,objectWall,false,true);
    if (i) {
        vis[0] = false;
        i.vis[2] = false;
    }
    // right
    i = collision_point(bb_r+sprite_width/2,bb_t+sprite_height/2,objectWall,false,true);
    if (i) {
        vis[1] = false;
        i.vis[3] = false;
    }
    // down
    i = collision_point(bb_l+sprite_width/2,bb_b+sprite_height/2,objectWall,false,true);
    if (i) {
        vis[2] = false;
        i.vis[0] = false;
    }
    // left
    i = collision_point(bb_l-sprite_width/2,bb_t+sprite_height/2,objectWall,false,true);
    if (i) {
        vis[3] = false;
        i.vis[1] = false;
    }
}