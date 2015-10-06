var uhel
uhel=dir-90*strafe_right+90*strafe_left


if !walking and (strafe_right xor strafe_left){
    
        var xx,yy
        xx=32*cos(degtorad(uhel))
        yy=-32*sin(degtorad(uhel))
    
        if !place_meeting(x+xx,y+yy,oWall){
            
            motion_set(uhel,3)
            alarm[0]=11
            alarm[1]=alarm[0]+2
            walking=true
            
            /*
            p=path_add()
            mp_grid_path(grid,p,x,y,x+xx,y+yy,false)
            path_start(p,1,0,true)*/
        
    }
}