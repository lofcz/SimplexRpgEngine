/// @arg object
/// @arg y_offset
/*
var object = argument0.object_index == argument0;

if (!object){
	ds_list_add(global.refl_insts, argument0);
	ds_list_add(global.refl_offsets, argument1);
}
else{
	var inst_num = instance_number(argument0);
	
	for(var i=0; i<inst_num; i++){
		var inst = instance_find(argument0, i);
		ds_list_add(global.refl_insts, inst);
		ds_list_add(global.refl_offsets, argument1);
	}
}
*/
var inst_num = instance_number(argument0);

for(var i = 0; i < inst_num; i++)
{	
	var inst = instance_find(argument0, i);
	
	with(inst) {v_nearest = instance_nearest(x, y, oCollMaskTemp);}
	var z = inst.v_nearest;
	
	if (point_distance(inst.x, inst.y, z.x, z.y) < 64)
	{
		ds_list_add(global.refl_insts, inst);
		ds_list_add(global.refl_offsets, argument1);
	}
	
	inst.v_nearest = -1;
}