var pressed=false;

// Check all controllers...
var down=false;
for(var i=0;i<4;i++){
    if( gamepad_button_check_pressed(i, gp_face1) ) {
        pressed=true;
    }
}

if (mouse_check_button_released(mb_left)) pressed = true;

if( keyboard_check_pressed(vk_space) ) pressed=true;
if( keyboard_check_pressed(vk_backspace) ) game_end();
if( keyboard_check_pressed(vk_escape) ) game_end();

    
if( pressed ) {
    if( room_last==room ){
        room_goto(room_first);
    }else{
        room_goto_next();
    }
}
