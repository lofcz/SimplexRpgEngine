//This script destroys a 3D animation.

var model = argument0;//the pointer to your loaded 3D animation.

for(i=0;i<ds_list_size(model);i++){
    vertex_delete_buffer(ds_list_find_value(model,i));//deletes each frame
}

ds_list_destroy(model);//destroys the list