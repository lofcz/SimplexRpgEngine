if !walking{
    if back{
        var xx,yy
        xx=-32*cos(degtorad(dir))
        yy=32*sin(degtorad(dir))
    
        if !place_meeting(x+xx,y+yy,oWall){
            
            motion_set(dir,-3)
            alarm[0]=11
            alarm[1]=alarm[0]+2
            walking=true
            
            /*
            p=path_add()
            mp_grid_path(grid,p,x,y,x+xx,y+yy,false)
            path_start(p,1,0,true)*/
        }
    }
}