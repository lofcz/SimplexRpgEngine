///WASD()

if keyboard_check_direct(ord('W')) motion_add(90,1);
if keyboard_check_direct(ord('A')) motion_add(180,1);
if keyboard_check_direct(ord('S')) motion_add(270,1);
if keyboard_check_direct(ord('D')) motion_add(0,1);

speed=min(1,speed); //limiter