/*
This script loads an animation and returns a list with all animation frames
*/


var animation_path = argument[0];//animation path (example: "./animation/running"
var animation_looped = argument[1]


var animation_frame_count = 0;


//---------------------------------------------

//Loading every model frame

var animationFile = buffer_create(1,buffer_grow,1);
buffer_load_ext(animationFile,animation_path,0);//file_text_open_read(animation_path);
buffer_seek(animationFile, buffer_seek_start, 0);

//---- read Header -------

var key = buffer_read_chars(animationFile,9);
if(key != "BinAniObj"){
    show_message_async("Error!#"+string(animation_path)+"#is not a BAO file!");
}
var version = buffer_read(animationFile,buffer_u8);

if(version != 0){
    show_message_async("Error! Trying to load a different version of the bao-file!#"+string(animation_path)+"#> version-number: "+string(version));
}
var triangleCount = buffer_read(animationFile,buffer_u16);


//----------------------------

var model_frame;
var lastByte = 0;
do{
    model_frame[animation_frame_count] = scr_load_animation_frame_data(triangleCount,animationFile);//loads frame
    animation_frame_count+=+1;
    lastByte = buffer_read(animationFile, buffer_u8);
    //additional error check to give feedback if the .bao file is corrupted. (can happen if the original .obj frames weren't exported correctly.)
    if(lastByte != 254 && lastByte != 255){
        show_message_async("Byte alignment error occured. The .bao file is invalid.");
    }
}until(lastByte == 255);//the last byte of a .bao file is always 255.
buffer_delete(animationFile);

//---------------------------------------------

//converting the model frames to the custom vertex format with animation support
var animation = ds_list_create();//final animation is stored in this list
for(var i = 0;i<animation_frame_count-1;i++){
   ds_list_add(animation,scr_create_vb_model(model_frame[i],model_frame[i+1]));


}


if(animation_looped == true or animation_frame_count == 1){//if( for some reason) the animation contains only 1 frame, then add this first frame to this animation a second time in order to bypass an error.
    ds_list_add(animation,scr_create_vb_model(model_frame[animation_frame_count-1],model_frame[0]));//last animation interpolates between last model frame and first model frame
    
}


//---------------------------------------------

//delete now the original model frames which aren't needed anymore
for(var j = 0;j<animation_frame_count;j++){
    ds_list_destroy(model_frame[j]);
}

//---------------------------------------------

return animation;