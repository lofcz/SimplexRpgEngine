/// @function collision_line_point(x1, y1, x2, y2, obj, prec, notme)
/// @desc Finds nearest collision line object and returns point of hit
/// @arg {int} x1 x-from
/// @arg {int} y1 y-from
/// @arg {int} x2 x-to
/// @arg {int} y2 y-to
/// @arg {object} obj target object or ID
/// @arg {bool} prec wheather to be precise
/// @arg {bool} notme wheather to include calling instance to checks

var r;
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var qi = argument4;
var qp = argument5;
var qn = argument6;
var rr, rx, ry;
rr = collision_line(x1, y1, x2, y2, qi, qp, qn);
rx = x2;
ry = y2;

if (rr != noone) 
{
    var p0 = 0;
    var p1 = 1;
    repeat (ceil(log2(point_distance(x1, y1, x2, y2))) + 1) 
	{
        var np = p0 + (p1 - p0) * 0.5;
        var nx = x1 + (x2 - x1) * np;
        var ny = y1 + (y2 - y1) * np;
        var px = x1 + (x2 - x1) * p0;
        var py = y1 + (y2 - y1) * p0;
        var nr = collision_line(px, py, nx, ny, qi, qp, qn);
		
        if (nr != noone) 
		{
            rr = nr;
            rx = nx;
            ry = ny;
            p1 = np;
        } 
		else {p0 = np;}
    }
}

r[0] = rr;
r[1] = rx;
r[2] = ry;
return r;