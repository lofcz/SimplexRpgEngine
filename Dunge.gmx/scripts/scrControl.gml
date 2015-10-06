turn_left=false
turn_right=false
strafe_left=false
strafe_right=false
forward=false
back=false

if keyboard_check_pressed(ord("Q")){
turn_left=true
}
if keyboard_check_pressed(ord("E")){
turn_right=true
}
if keyboard_check_pressed(ord("A")){
strafe_left=true
}
if keyboard_check_pressed(ord("D")){
strafe_right=true
}
if keyboard_check(ord("W")){
forward=true
}
if keyboard_check_pressed(ord("S")){
back=true
}