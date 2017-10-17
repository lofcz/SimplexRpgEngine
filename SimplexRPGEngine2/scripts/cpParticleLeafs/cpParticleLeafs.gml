/// @function cpParticleLeafs(System, emitter, x, y, number)

f = random_range(250, 290);
var particle1, emitter1;
particle1 = part_type_create();
part_type_sprite(particle1,sParticleLeaf,0,0,0);
part_type_size(particle1,0.20,0.40,0,0);
part_type_scale(particle1,1,1);
part_type_color3(particle1,65280,7195965,2143711);
part_type_alpha3(particle1,0,1,0);
part_type_speed(particle1,0.3,0.4,-0.01,0);
part_type_direction(particle1,f - 40,f + 40,0,10);
part_type_gravity(particle1,0.02,f);
part_type_orientation(particle1,f - 40, f + 40,2,1,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,80);
part_system_depth(argument0, -800);

part_emitter_region(argument0,argument1,argument2 + random_range(-20, 20),argument2 + random_range(-20, 20),argument3,argument3,0,0);
part_emitter_burst(argument0,argument1,particle1,argument4);