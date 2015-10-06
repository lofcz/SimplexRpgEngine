{
    var vx,vy,vw,vh;
    vw = view_wview[0];
    vh = view_hview[0];
    vx = view_xview[0]+vw;
    vy = view_yview[0]+vh;
    d3d_set_projection_perspective(vx,vy,-vw,-vh,180);
    draw_clear(c_black);
    draw_floor();
    draw_models();
}