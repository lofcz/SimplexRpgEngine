/// scrSimpleAiStep(hSpeed, vSpeed, obstacle);

var _hSpeed, _vSpeed, _obstacle;
_hSpeed   = argument0;
_vSpeed   = argument1;
_obstacle = argument2;

// Do collision
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

// This is a fix for if the character wasn't able to move at least 1 whole pixel
if (abs(x-xprevious) < 1)
&& (abs(y-yprevious) < 1)
    {
    x = xprevious;
    y = yprevious;
    }
