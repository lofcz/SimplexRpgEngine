///f(x,y,xb,yb,rb)

var _x,_y,_xb,_yb,_rb;
_x=argument0;
_y=argument1;
_xb=argument2;
_yb=argument3;
_rb=argument4;
_d=point_distance(_x,_y,_xb,_yb);

if _d>_rb return(0)
else return(sqr(1-(sqr(_d/_rb))));                   //sqr(1-(sqr(_d/_rb)))


