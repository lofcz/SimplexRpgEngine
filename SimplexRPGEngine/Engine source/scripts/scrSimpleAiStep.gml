/// scrSimpleAiStep(hSpeed, vSpeed, obstacle);

var  hSpeed, vSpeed, obstacle, i, move;
hSpeed   = argument0;
vSpeed   = argument1;
obstacle = argument2;

// Movement
for (i = abs(hSpeed); i > 0; i--)
    {
     move = (sign( hSpeed) * i);
     
     if (!place_meeting(x + move, y,      obstacle)) {x += move; break;}
     if (!place_meeting(x + move, y - i,  obstacle)) {y -= i / 2;}
     if (!place_meeting(x + move, y + i,  obstacle)) {y += i / 2;}
    }
for (i = abs(vSpeed);  i > 0;  i--)
    {
     move = (sign( vSpeed) *  i);
     
     if (!place_meeting(x,     y + move,  obstacle)) {y +=  move; break;}
     if (!place_meeting(x - i, y + move,  obstacle)) {x -=  i / 2;}
     if (!place_meeting(x + i, y + move,  obstacle)) {x +=  i / 2;}
    }

if (abs(x - xprevious) < 1) && (abs(y - yprevious) < 1)
    {
     x = xprevious;
     y = yprevious;
    }
    
// Ai
if (state == "idle")
   {
    idleTimer--;
    if (idleTimer <= 0) {state = "turn";}   
   }   
else if (state == "turn")
   {
    if (irandom(1)) {horiSpeed = choose(-3, 3);}
    else {vertSpeed = choose(-3, 3);}
    
    paces = irandom_range(25, 50);
    state = "move";
   }   
else if (state == "move")
   { 
    paces--;
    if ((x == xprevious) && (y == yprevious) || (paces <= 0)) {state = "stop";}   
   }
else if (state == "stop")
   { 
    horiSpeed = 0;
    vertSpeed = 0;
    state     = "idle";
    idleTimer = (1 * room_speed);        
   }  
else if (state == "stagger")
   { 
    staggerTimer--;
    image_blend = merge_color(c_white, c_red, lengthdir_x(1, staggerTimer*15));
    
    if (staggerTimer <= 0)
       {
        image_blend = c_white;
        state       = "idle";
        beenHit     = false;
       }
       
    switch (face)
           {
            case (0): {vertSpeed = staggerTimer/5; break;}
            case (1): {vertSpeed = staggerTimer/5; break;}
            case (2): {horiSpeed = staggerTimer/5; break;}
            case (3): {horiSpeed = staggerTimer/5; break;}
           }          
   }

// Animation         
if (vertSpeed < 0) {face = 0;}
if (vertSpeed > 0) {face = 1;}
if (horiSpeed > 0) {face = 2;}
if (horiSpeed < 0) {face = 3;}

if (face == 0) {if (image_index < 12 || image_index > 15)   {image_index = 12;}}
if (face == 1) {if (image_index < 0  || image_index > 3.9)  {image_index = 0;}}    
if (face == 2) {if (image_index < 9  || image_index > 11.9) {image_index = 9;}}    
if (face == 3) {if (image_index < 4  || image_index > 7.9)  {image_index = 4;}} 

if (x != xprevious) || (y != yprevious) {image_speed = 0.15;}
else 
  { 
  image_speed = 0;  
                                                         
  if (image_index > 12 && image_index < 15)   {image_index = 12;}
  if (image_index > 0  && image_index < 3.9)  {image_index = 0;}
  if (image_index > 9  && image_index < 11.9) {image_index = 9;}
  if (image_index > 4  && image_index < 7.9)  {image_index = 4;}
  } 

