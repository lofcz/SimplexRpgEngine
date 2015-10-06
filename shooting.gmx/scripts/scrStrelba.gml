
 image_index = 0; // zaměřovač bez černého okolí
 global.reloads = 0; // počet přebití

// měření času
global.timer+=1;

if (global.timer = 60)
{
 global.sec+=1;
 global.timer = 0;
}


// časování hry
if (room = room0)
{
 if (global.sec = 20)
 {
  room_goto(finishRoom);
 }
}
if (room = room2)
{
 if (global.sec = 15)
 {
  room_goto(finishRoom);
 }
}
if (room = room3)
{
 if (global.sec = 15)
 {
  room_goto(finishRoom);
 }
}

//pohyb zaměřovače
x = mouse_x;
y = mouse_y;

// střelba na terč
if mouse_check_button_pressed(mb_left) && (lives > 0)
{
 lives-=1;
 with(oTerc)
 {
 if (distance_to_point(mouse_x,mouse_y) < 50) 
 {
  effect_create_above(ef_firework,mouse_x,mouse_y,0,c_red); // efekt po střelení do talíře
  instance_destroy(); // zničení talíře
  score+=10; // přičtení skore
  global.destroyed+=1; 
 }
}
}

// přebití

if mouse_check_button_pressed(mb_right)
{
 audio_play_sound(load, true, 0);
 global.reloads += 1;
 lives=5;
 score-=5;
}