/// scrSimpleAiStep(hSpeed, vSpeed, obstacle);

var _hSpeed, _vSpeed, _obstacle;
_hSpeed   = argument0;
_vSpeed   = argument1;
_obstacle = argument2;

x = floor(x);
y = floor(y);

// Movement
var _i, _move;
for (_i=abs(_hSpeed); _i>0; _i--)
    {
    _move = sign(_hSpeed) * _i;
    if !place_meeting(x+_move, y,    _obstacle) {x += _move; break;}
    if !place_meeting(x+_move, y-_i, _obstacle) {y -= _i/2;}
    if !place_meeting(x+_move, y+_i, _obstacle) {y += _i/2;}
    }
for (_i=abs(_vSpeed); _i>0; _i--)
    {
    _move = sign(_vSpeed) * _i;
    if !place_meeting(x,    y+_move, _obstacle) {y += _move; break;}
    if !place_meeting(x-_i, y+_move, _obstacle) {x -= _i/2;}
    if !place_meeting(x+_i, y+_move, _obstacle) {x += _i/2;}
    }

if (abs(x-xprevious) < 1) && (abs(y-yprevious) < 1)
    {
     x = xprevious;
     y = yprevious;
    }
    
// Ai
switch (state)
    {
    case ("idle"):
       {
        idleTimer--;
        if (idleTimer <= 0) {state = "turn";}
        break;
       }
        
    case ("turn"):
       {
        if (irandom(1)) {horiSpeed = choose(-3, 3);}
        else {vertSpeed = choose(-3, 3);}
        paces = irandom_range(25, 50);
        state = "move"; 
        break;
       }
        
    case ("move"):
       {
        paces--;
        if (x == xprevious)
        && (y == yprevious)
        || (paces <= 0)
            state = "stop";
        break;
       }
        
    case ("stop"):
        {
         horiSpeed = 0;
         vertSpeed = 0;
         state = "idle";
         idleTimer = 1*room_speed;
         break;
        }
        
    case ("stagger"):
       {
        staggerTimer--;
        image_blend = merge_color(c_white, c_red, lengthdir_x(1, staggerTimer*15));
        if (staggerTimer <= 0)
            {
            image_blend = c_white;
            state = "idle";
            beenHit = false;
            }
            
        switch (face)
            {
            case (0): {vertSpeed = staggerTimer/5; break;}
            case (1): {vertSpeed = staggerTimer/5; break;}
            case (2): {horiSpeed = staggerTimer/5; break;}
            case (3): {horiSpeed = staggerTimer/5; break;}
            }
        break;
        }
    }


if (vertSpeed < 0) {face = 0;}
if (vertSpeed > 0) {face = 1;}
if (horiSpeed > 0) {face = 2;}
if (horiSpeed < 0) {face = 3;}

if (face == 0) {if (image_index < 12 || image_index > 15)   {image_index = 12;}}
if (face == 1) {if (image_index < 0  || image_index > 3.9)  {image_index = 0;}}    
if (face == 2) {if (image_index < 9  || image_index > 11.9) {image_index = 9;}}    
if (face == 3) {if (image_index < 4  || image_index > 7.9)  {image_index = 4;}} 

if (x != xprevious) || (y != yprevious) {image_speed = 0.15; }
else 
  { 
  image_speed = 0;  
                                                         
  if (image_index > 12 && image_index < 15)   {image_index = 12;}
  if (image_index > 0  && image_index < 3.9)  {image_index = 0;}
  if (image_index > 9  && image_index < 11.9) {image_index = 9;}
  if (image_index > 4  && image_index < 7.9)  {image_index = 4;}
  } 

