if mouse_check_button(mb_left){
var m_x,m_y,mausx,mausy;

m_x = window_get_width()/2;
m_y = window_get_height()/2;

mausx = m_x - window_mouse_get_x();
mausy = m_y - window_mouse_get_y();


obj_camera.zview += (window_mouse_get_y()-window_get_height()/2)/20;

if (obj_camera.zview<0){
obj_camera.zview = obj_camera.zview +360;
}
if(obj_camera.zview>360){
obj_camera.zview = obj_camera.zview -360;
}

mouse_direction += +mausx/(obj_camera.sensibility/30);

if (mouse_direction<0){
mouse_direction = mouse_direction +360;
}
if(mouse_direction>360){
mouse_direction = mouse_direction -360;
}



//obj_camera.zview  = min(max(obj_camera.zview ,-80),80);


window_mouse_set(m_x,m_y);






}


/*if (gamepad_is_connected(0)){

    if (abs(point_distance(0,0,gamepad_axis_value(0, gp_axislh),gamepad_axis_value(0, gp_axislv))) > 0.2){   
        mouse_direction+=+gamepad_axis_value(0, gp_axislh) * 3;
        

        obj_camera.zview+=-gamepad_axis_value(0, gp_axislv) * 3;
    }
    dist+=+gamepad_button_value(0, gp_shoulderlb) * 0.5;
    dist+=-gamepad_button_value(0, gp_shoulderrb) * 0.5;
}*/

cc = cos(zview*pi/180);
//cc=1;
cx = cos(mouse_direction*pi/180)*cc;
cy = -sin(mouse_direction*pi/180)*cc;
cz = sin(zview*pi/180);



xup=0;
yup=0;

zup=1//cos(zview*pi/180);