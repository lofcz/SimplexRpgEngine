/// effectFire(x,y,number)
var xx,yy,number;
xx     = x;
yy     = y;
number = 10;

if (argument_count > 0) {xx     = argument[0];}
if (argument_count > 1) {yy     = argument[1];}
if (argument_count > 2) {number = argument[2];}

part_system_depth(Sname, -12);
particle1 = part_type_create()
part_type_shape(particle1,pt_shape_line)
part_type_size(particle1,0.20,0.60,0,0)
part_type_scale(particle1,0.65,2.50)
part_type_color3(particle1,16749459,33023,255)
part_type_alpha3(particle1,0.04,0.06,0.07)
part_type_speed(particle1,0.70,2.60,-0.02,0)
part_type_direction(particle1,85,95,0,9)
part_type_gravity(particle1,0,270)
part_type_orientation(particle1,0,0,10,20,1)
part_type_blend(particle1,1)
part_type_life(particle1,60,80)

emitter1 = part_emitter_create(Sname)
part_emitter_region(Sname,emitter1,xx - 50,xx + 50,yy -20,yy + 14,ps_shape_ellipse,1)
part_emitter_burst(Sname,emitter1,particle1,number)

