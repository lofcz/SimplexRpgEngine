//nastaveni smeru

var xx,yy,sidex,sidey,a;

xx=32*cos(degtorad(dir))
yy=-32*sin(degtorad(dir))

sidex=32*cos(degtorad(dir+90))
sidey=-32*sin(degtorad(dir+90))

//viditeln0 stěny
for (a=0;a<6;a++){
    //right
    view_wall[a,0]=place_meeting(x+xx*a+sidex,y+yy*a+sidey,oWall)
    //left
    view_wall[a,1]=place_meeting(x+xx*a-sidex,y+yy*a-sidey,oWall)
    //center
    view_wall[a,2]=place_meeting(x+xx*a,y+yy*a,oWall)


}

