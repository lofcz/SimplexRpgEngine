var xx,yy,a

xx=1100
yy=250

for(a=5;a>-1;a--){
    if view_wall[a,0]{
    draw_sprite(sLeftWall,a,xx,yy)    
    }
    if view_wall[a,1]{
    draw_sprite_ext(sLeftWall,a,xx,yy,-1,1,0,c_white,1)    
    }
    if view_wall[a,2]{
    draw_sprite(sMiddleWall,a,xx,yy)
    }
    scrDrawVeil(a);
    

}

draw_sprite(sFrame,0,xx,yy)