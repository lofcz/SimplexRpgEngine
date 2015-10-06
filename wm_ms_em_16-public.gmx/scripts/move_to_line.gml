/*
**  Usage:
**      move_to_line(x1,y1,x2,y2,segment);
**
**  Arguments:
**      x1,y1       first end point of line
**      x2,y2       second end point of line
**      segment     set to true to limit positioning to the line segment
**
**  Notes:
**      Moves current instance to the nearest point on given line or line segment.
**
**  GMLscripts.com
*/
{
    var x1,y1,x2,y2,dx,dy,t,segment;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    segment = argument4;
    dx = x2 - x1;
    dy = y2 - y1;
    if ((dx == 0) && (dy == 0)) {
        x = x1;
        y = y1;
    }else{
        t = ((x - x1) * dx + (y - y1) * dy) / (dx * dx + dy * dy);
        if (segment) t = min(max(0,t),1);
        x = x1 + t * dx;
        y = y1 + t * dy;
    }
}