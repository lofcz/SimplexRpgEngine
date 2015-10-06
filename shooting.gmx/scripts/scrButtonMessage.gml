// tlačítko info

if (distance_to_point(mouse_x,mouse_y) = 0)
{ 
 image_index = 1;
 if mouse_check_button_pressed(mb_left)
 {
  show_message(" LEFT BUTTON -- FIRING # 
  RIGHT BUTTON -- RELOAD # 
  ESCAPE - LEAVE THE GAME #
  #ABOUT A GAME: in game you need to get the biggest score # by shooting at targets. ##
  SCORING: #
  ---------#
  RELOAD: -5 #
  DESTROYED TARGET: +5 #
  LOSTED TARGET: -20#
  ----------------------#
  TIME LIMIT:#
  EASY: 20 seconds#
  MEDIUM: 15 seconds#
  HARD: 15 seconds");
 }
 }
 else
 {
  image_index = 0;
 }