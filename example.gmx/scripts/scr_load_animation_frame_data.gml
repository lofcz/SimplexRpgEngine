//include normals. include UVs, triangulate triangles!



var triangles,v_listX,v_listY,v_listZ,vt_listX,vt_listY,vn_listX,vn_listY,vn_listZ;

var tri_count = argument[0];

var buffer;
buffer = argument[1];




v_listX = ds_list_create();
v_listY = ds_list_create();
v_listZ = ds_list_create();

vt_listX = ds_list_create();
vt_listY = ds_list_create();


vn_listX = ds_list_create();
vn_listY = ds_list_create();
vn_listZ = ds_list_create();


var model = ds_list_create();



var vert_count = buffer_read(buffer, buffer_u32);
var textureCoord_count = buffer_read(buffer, buffer_u32);
var normalCount = buffer_read(buffer, buffer_u32);


var lines = tri_count+vert_count+textureCoord_count+normalCount;//calculate how many informations were saved for the current frame


var current_triangle = 0;

for(var i=0;i<lines;i++){
    var info_id = buffer_read(buffer,buffer_u8);
    switch(info_id){
        case 0://vertices

            ds_list_add(v_listX,buffer_read(buffer,buffer_f32));
            ds_list_add(v_listY,buffer_read(buffer,buffer_f32));
            ds_list_add(v_listZ,buffer_read(buffer,buffer_f32));
        break;
        
        case 1://uv
            ds_list_add(vt_listX,buffer_read(buffer,buffer_f32));
            ds_list_add(vt_listY,buffer_read(buffer,buffer_f32));
        break;
        
        case 2://normals
            ds_list_add(vn_listX,buffer_read(buffer,buffer_f32));
            ds_list_add(vn_listY,buffer_read(buffer,buffer_f32));
            ds_list_add(vn_listZ,buffer_read(buffer,buffer_f32));
        break;
        

        case 3:
            repeat(3){
                
                var e1 = buffer_read(buffer, buffer_u32);//vertex nr
                var e2 = buffer_read(buffer, buffer_u32);//texture nr
                var e3 = buffer_read(buffer, buffer_u32);//normal nr
                    e1 = real(e1)-1;
                    e3 = real(e3)-1;
                    e2 = real(e2)-1;

                ds_list_add(model,ds_list_find_value(v_listX,e1));//x
                ds_list_add(model,ds_list_find_value(v_listY,e1));//y
                ds_list_add(model,ds_list_find_value(v_listZ,e1));//z
                
                ds_list_add(model,ds_list_find_value(vt_listX,e2));//u
                ds_list_add(model,ds_list_find_value(vt_listY,e2));//v
                
                ds_list_add(model,ds_list_find_value(vn_listX,e3));//xn
                ds_list_add(model,ds_list_find_value(vn_listY,e3));//xn
                ds_list_add(model,ds_list_find_value(vn_listZ,e3));//xn
            }
        break;

        

    }
    
}


//deletes lists
ds_list_destroy(v_listX);
ds_list_destroy(v_listY);
ds_list_destroy(v_listZ);
ds_list_destroy(vt_listX);
ds_list_destroy(vt_listY);
ds_list_destroy(vn_listX);
ds_list_destroy(vn_listY);
ds_list_destroy(vn_listZ);




return model;