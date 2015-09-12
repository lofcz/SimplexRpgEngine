/*
    This script draws the animation and calculates the interpolation variable
*/

var animation_list = argument0;//animation list which contains preprocessed vertex-buffers with all animation frames
var animation_step = argument1; //current animation step (must be between 0 and "animation_length");
// --> [0 <= animation_step < animation_length]   >>> animation_step must be below animation_length!!!
var animation_length = argument2;//maximum animation step 
var tex = argument3;      

     
    var pc = clamp((animation_step/animation_length),0,1);//calculate (in percent from 0 to 1) the animation progress (from 0 to 1)
    var frame_count = ds_list_size(animation_list); 
    var curr_frame = pc*frame_count;
    
    var intpl = curr_frame-floor(curr_frame);
    if(curr_frame >=frame_count){
        curr_frame = frame_count-1;
        intpl = 1;
        
    }
    
    shader_set_uniform_f(global.shader_interpol, intpl);//calculate the interpolation value from the current frame to the next frame
    
    var current_frame = floor(curr_frame); //calculate the current frame
    vertex_submit(ds_list_find_value(animation_list,current_frame),pr_trianglelist,tex);//submit the model