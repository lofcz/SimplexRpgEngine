/*
**  Usage:
**      normal_detect(x,y,obj [,rad [,res]])
**
**  Arguments:
**      x,y     point on the surface
**      obj     an instance or object
**      rad     radius of test area, positive int, optional (default 4)
**      res     resolution of test, positive int, optional (default 1)
**
**  Returns:
**      a surface normal (in degrees), at the given point (x,y)
**      on or near the given (object) by scanning an area of the
**      given (radius) and (resolution), or (-1) on error
**
**  Notes:
**      Makes approximately pi*radius*radius/(res*res) collision calls.
**
**  GMLscripts.com
*/
{
    var xx,yy,obj,rad,nx,ny,i,j;
    xx  = argument0;
    yy  = argument1;
    obj = argument2;
    rad = argument3;
    res = argument4;
    if (rad <= 0) rad = 4;
    if (res <= 0) res = 1;
    nx = 0;
    ny = 0;
    if (collision_circle(xx,yy,rad,obj,true,true)) {
        for (j=res; j<=rad; j+=res) {
            for (i=0; i<rad; i+=res) {
                if (point_distance(0,0,i,j) <= rad) {
                    if (!collision_point(xx+i,yy+j,obj,true,true)) { nx += i; ny += j; }
                    if (!collision_point(xx+j,yy-i,obj,true,true)) { nx += j; ny -= i; }
                    if (!collision_point(xx-i,yy-j,obj,true,true)) { nx -= i; ny -= j; }
                    if (!collision_point(xx-j,yy+i,obj,true,true)) { nx -= j; ny += i; }
                }
            }
        }
        if (nx == 0 && ny == 0) return (-1);
        return point_direction(0,0,nx,ny);
    }else{
        return (-1);
    }
}