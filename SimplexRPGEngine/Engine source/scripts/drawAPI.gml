#define drawAPI
/// drawAPI()
/*

- draw_hover_block(x1,x2,y1,y2,color,alpha)
  
  Used to easily draw rectangle over target area, default is
  yellow rectangle with 0.6 alpha. 
  
- motion_blur(length,direction)

  Creates blur effect after sprite.

-




















#define draw_hover_block
/// draw_hover_block(x1,x2,y1,y2,color,alpha)

x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;

color = c_yellow;
alpha = 0.6;

if (argument_count > 0) {x1 = argument[0];}
if (argument_count > 1) {x2 = argument[1];}
if (argument_count > 2) {y1 = argument[2];}
if (argument_count > 3) {y2 = argument[3];}

if (argument_count > 4) {color = argument[4];}
if (argument_count > 5) {alpha = argument[5];}



clr(color,alpha);
draw_rectangle(x1,y1,x2-1,y2-1,0);
clr();
#define motion_blur
/// motion_blur(length,direction)
 
var length, step, dir, px, py, a;

   length = argument0;

    if (length > 0) {
        step = 3;
        dir = degtorad(argument1);
        px = cos(dir);
        py = -sin(dir);

        a = image_alpha/(length/step);
        if (a >= 1) {
            draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,
                image_yscale,image_angle,image_blend,image_alpha);
            a /= 2;
        }

        for(i=length;i>=0;i-=step) {
            draw_sprite_ext(sprite_index,image_index,x+(px*i),y+(py*i),
                image_xscale,image_yscale,image_angle,image_blend,a);
        }
    } else {    
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,
            image_yscale,image_angle,image_blend,image_alpha);
    }
    return 0;

#define draw_rectangle_cd
/// draw_rectangle_cd(x1, y1, x2, y2, value)

draw_set_colour(c_red);

var v, x1, y1, x2, y2, xm, ym, vd, vx, vy, vl;
v = (argument4 / 360);
if (v <= 0) return 0 
x1 = argument0; y1 = argument1; 
x2 = argument2; y2 = argument3; 
if (v >= 1) return 0;
draw_rectangle(x1, y1, x2, y2, false) 
xm = (x1 + x2) / 2; ym = (y1 + y2) / 2;
draw_primitive_begin(pr_trianglefan)
draw_vertex(xm, ym); draw_vertex(xm, y1)


if (v >= 0.125) draw_vertex(x2, y1)
if (v >= 0.375) draw_vertex(x2, y2)
if (v >= 0.625) draw_vertex(x1, y2)
if (v >= 0.875) draw_vertex(x1, y1)

vd = pi * (v * 2 - 0.5)
vx = cos(vd)
vy = sin(vd)

vl = max(abs(vx), abs(vy))
if (vl < 1) {
    vx /= vl
    vy /= vl
}

draw_vertex(xm + vx * (x2 - x1) / 2, ym + vy * (y2 - y1) / 2)
draw_primitive_end()
draw_set_colour(c_black);

#define draw_ring_part
/// draw_ring_part(x, y, radius, thickness, maxsegments, segments, startangle, totalangle, direction, colour, outline, alpha)

var anglechange, i, ax, ay, bx, by, l, cx, cy, dx, dy;
anglechange = (argument7/argument4)*(pi/180)
i = argument6*(pi/180)

ax = argument0+(cos(i)*argument2)
ay = argument1-(sin(i)*argument2)

bx = argument0+(cos(i)*(argument2+argument3))
by = argument1-(sin(i)*(argument2+argument3))

l = argument10
  
draw_set_alpha(argument11);
repeat(argument5) 
{
i += argument8 * anglechange

cx = argument0+(cos(i)*argument2)
cy = argument1-(sin(i)*argument2)

dx = argument0+(cos(i)*(argument2+argument3))
dy = argument1-(sin(i)*(argument2+argument3))

draw_triangle_colour(ax,ay,bx,by,dx,dy,argument9,argument9,argument9,0)
draw_triangle_colour(ax,ay,cx,cy,dx,dy,argument9,argument9,argument9,0)

ax = cx
ay = cy

bx = dx
by = dy
}
draw_set_alpha(1);

#define draw_circle_part
/// draw_circle_part(x, y, radius, maxsegments, segments, startangle, totalangle, direction, colour)

anglechange = (argument6/argument3)*(pi/180)
i           = argument5*(pi/180)

ax = argument0+(cos(i)*argument2)
ay = argument1-(sin(i)*argument2)

repeat(argument4) 
{
    i += argument7 * anglechange
    
    bx = argument0+(cos(i)*argument2)
    by = argument1-(sin(i)*argument2)
    
    draw_triangle_colour(ax,ay,bx,by,argument0,argument1,argument8,argument8,argument8,0)
    
    ax = bx
    ay = by
}
#define draw_rectangle_dashed
/// draw_rectangle_dashed(x1, y1, x2, y2, col1, col2, col3, col4, size)

var x1, y1, x2, y2, c1, c2, c3, c4, size;

x1   = view_xview + 40;
y1   = view_yview + 40;
x2   = view_xview + 200;
y2   = view_yview + 100;
c1   = c_white;
size = 4;

c2 = c1; c3 = c1; c4 = c1;

if (argument_count > 0) {x1 = argument[0];}
if (argument_count > 1) {y1 = argument[1];}
if (argument_count > 2) {x2 = argument[2];}
if (argument_count > 3) {y2 = argument[3];}

draw_primitive_begin(pr_linelist);

// Up 
for (i = 0; i < ceil((x2 - x1) / size); i++)
    {
     draw_vertex_colour(x1 + (i * size), y1, c1, 1);
    }
    
// Down
for (i = 0; i < ceil((x2 - x1) / size); i++)
    {
     draw_vertex_colour(x1 + (i * size), y2, c1, 1);
    } 
       
// Left
for (i = 0; i < ceil((y2 - y1) / size) + 1; i++)
    {
     draw_vertex_colour(x1, y1 + (i * size), c1, 1);
    }
    
// Right
for (i = 0; i < ceil((y2 - y1) / size) + 1; i++)
    {
     draw_vertex_colour(x2, y1 + (i * size), c1, 1);
    }

draw_primitive_end();

#define draw_line_dashed
/// draw_line_dashed(x1, y2, x2, y2)
#define draw_symbol
/// draw_symbol(x, y, sprite, index, text, symbolSize, alpha, font, color)

var xx, yy, s, i, t, ss, xs, ys, a, tt, c;

xx = x;
yy = y;
s  = sprite_index;
i  = -1;
t  = "Sample text [draw_symbol]";
ss = 24;
a  = 1;
f  = fntPixel;
c  = c_white;

if (argument_count > 0) {xx = argument[0];}
if (argument_count > 1) {yy = argument[1];}
if (argument_count > 2) {s  = argument[2];}
if (argument_count > 3) {i  = argument[3];}
if (argument_count > 4) {t  = argument[4];}
if (argument_count > 5) {ss = argument[5];}
if (argument_count > 6) {a  = argument[6];}
if (argument_count > 7) {f  = argument[7];}
if (argument_count > 8) {c  = argument[8];}

xs = (ss / sprite_get_width(s));
ys = (ss / sprite_get_height(s));


fnt(f);
clr(c_black, 0.5);
draw_roundrect(xx + (ss * max(xs, ys)), yy, xx + (string_width(t) * 2) - (ss * max(xs, ys) + 16), yy + string_height(t), false);

clr(c_black, 0.6);
draw_circle(xx + (ss / 2), yy + (ss / 2), ss * max(xs, ys) - 4, false);

clr(c_black, 1);
draw_circle(xx + (ss / 2), yy + (ss / 2), ss * max(xs, ys) - 4, true);
clr();


draw_sprite_ext(s, max(i - 1, 0), xx + 12, yy + 12, xs, ys, 0, c_white, a);

clr(c);
draw_text(xx + ss + 8, yy, t);
fnt();

#define draw_shadow
/// draw_shadow(x, y, r, alpha)

var _x = argument0;
var _y = argument1;
var rx = argument2;
var a  = argument3;
var ry = rx / 2;

clr(c_black, a);
draw_ellipse(_x - rx, _y - ry, _x + rx, _y + ry, false);
clr();
#define draw_lightning
/// draw_lightning(x1, y1, x2, y2, xmin, xmax, ymin, ymax, alpha)

clr();
var i, r, c, l, dx, dy, sx, sy, px, py, cx, cy, alpha;
if (max(argument0, argument2) < view_xview[view_current] - 10) return 0
if (max(argument1, argument3) < view_yview[view_current] - 10) return 0
if (min(argument0, argument2) > view_xview[view_current] + view_wview[view_current] + 10) return 0
if (min(argument1, argument3) > view_yview[view_current] + view_hview[view_current] + 10) return 0

l = point_distance(argument0, argument1, argument2, argument3)
maxAlpha = argument8
if (l == 0) return 0
i = point_direction(argument0, argument1, argument2, argument3)
dx = lengthdir_x(1, i); dy = lengthdir_y(1, i)
i += 90
sx = lengthdir_x(1, i); sy = lengthdir_y(1, i)
px = argument0; py = argument1
c = 0
i = random_range(argument4, argument5)
alpha = draw_get_alpha()
repeat (5000) { 
clr(c_white);
    r = choose(-1, +1) * (argument6 + (argument7 - argument6)
        * lengthdir_y(random(1), i / l * 180)) 

    if (i < l) {
        cx = argument0 + dx * i + sx * r
        cy = argument1 + dy * i + sy * r
    } else { cx = argument2; cy = argument3 } 

    draw_set_alpha(min(alpha * 0.3, maxAlpha))
    draw_line_width(px, py, cx, cy, 3.7)
    draw_set_alpha(min(alpha * 0.7, maxAlpha))
    draw_line_width(px, py, cx, cy, 1.3)
    if (i >= l) break
    px = cx; py = cy
    c += 1
    i += random_range(argument4, argument5)
}
draw_set_alpha(alpha)
return c
#define draw_text_colored
/// draw_text_colored(x, y, str)

    var xx, yy, str, st, et, ct, l, h, stl, pc, dx, dy, dp, p, c, ds, i;
    xx = argument0;
    yy = argument1;
    str = argument2;
    st = '[c=';
    et = ']';
    ct = '[/c]';
    
    l = string_length(str);
    h = string_height(' ');
    stl = string_length(st);
    pc = draw_get_color();
    dx = xx;
    dy = yy;
    dp = 1;
    for (p = 1; p <= l; p += 1) {
        c = string_char_at(str, p);
        if (c == chr(10) || p == l || (c == '#' && string_char_at(str, p - 1) != '\')) {
            draw_text(dx, dy, string_copy(str, dp, p - dp + 1));
            dp = p + 1;
            dx = xx;
            dy += h;
        } else if (c == string_char_at(st, 1) || c == string_char_at(ct, 1)) {
            if (p + string_length(st) <= l && string_copy(str, p, string_length(st)) == st) {
                ds = string_copy(str, dp, p - dp);
                draw_text(dx, dy, ds);
                dx += string_width(ds);
                i = string_copy(str, p + stl, string_pos(et, string_delete(str, 1, p + stl)));
                p += string_length(i + et + st) - 1;
                if (i == '') i = pc;
                draw_set_color(real(i));
                dp = p + 1;
            } else if (p + string_length(st) <= l && string_copy(str, p, string_length(ct)) == ct) {
                ds  = string_copy(str, dp, p - dp);
                draw_text(dx, dy, ds);
                draw_set_color(pc);
                p += string_length(ct) - 1;
                dp = p + 1;
                dx += string_width(ds);
            }
        }
    }
    draw_set_color(pc);
#define draw_item_loot
/// draw_item_loot()

image_speed = 0;

if (z > 0) 
{
    z += zspeed;
    zspeed += zgravity;
}
if (z < 0) 
{
    z = -z;
    zspeed = abs(zspeed) * 0.6 - 0.7;
    if (zspeed < 1) 
    {
        z      = 0;
        zspeed = 0;
    }
}

if (z == 0)
{
if (shadowAlpha > 0) {shadowAlpha = lerp(shadowAlpha, -0.01, 0.1); if (mode && shadowAlpha > 0.1) {image_angle++;} else {image_angle--;}}
}

var vz = z + lengthdir_x(1, 360);
draw_shadow(x ,y + 16, 6 / (1 + vz / 20), shadowAlpha);
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (speed > 0)
   {
    speed -= spd_down;  
   }
if (speed < 0) {speed = 0;}

image_angle = direction;
if (secure_pickup > 0) {secure_pickup--;}