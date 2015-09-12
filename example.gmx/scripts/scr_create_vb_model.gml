/*
This script merges 2 model frames into 1 vertex buffer which can perform a vertex interpolation
*/


var f1 = argument0;//frame 1
var f2 = argument1;//frame 2


var model = vertex_create_buffer();
vertex_begin(model, global.animation_format);

var segment = 8;//equivalent of ds_list_add() calls in "scr_load_model_blender_as_list"
//this needs to be the number of "ds_list_add" function calls per vertex in the "scr_load_model_blender_as_list" script


var size = ds_list_size(f1);

//merging 2 models into 1 vertex buffer
var i = 0;
repeat(size/segment){
    vertex_position_3d(model,ds_list_find_value(f1,i),-1*ds_list_find_value(f1,i+1),ds_list_find_value(f1,i+2));
    vertex_texcoord(model,ds_list_find_value(f1,i+3),-1*ds_list_find_value(f1,i+4));
    vertex_normal(model,ds_list_find_value(f1,i+5),-1*ds_list_find_value(f1,i+6),ds_list_find_value(f1,i+7));
   
    vertex_float3(model,ds_list_find_value(f2,i),-1*ds_list_find_value(f2,i+1),ds_list_find_value(f2,i+2));//position 2
    vertex_float3(model,ds_list_find_value(f2,i+5),-1*ds_list_find_value(f2,i+6),ds_list_find_value(f2,i+7));//normal2
       i+=+segment;
       

       
       
}


vertex_end(model);
vertex_freeze(model);

return model;