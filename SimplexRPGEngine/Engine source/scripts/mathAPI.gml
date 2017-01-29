#define mathAPI
/// mathAPI()

#define scrMathWrap
/// scrMathWrap(value, min, max)

var _val = argument[0];
var _max = argument[2];
var _min = argument[1];

if(_val mod 1 == 0)
{
    while(_val > _max || _val < _min)
    {
        if(_val > _max)
        {
            _val=_min + _val - _max - 1
        }
        else if (_val < _min)
        {
            _val=_max + _val - _min + 1;
        }
        else
            _val=_val;
    }
    return(_val);
}
else
{
    var _old = argument[0]+1;
    while(_val != _old)
    {
        _old=_val;
        if(_val<_min)
            _val=_max-(_min-_val);
        else if(_val >_max)
            _val=_min+(_val-_max);
        else
            _val=_val;
    }
    return(_val)
}
#define lin
/// lin(min, max, amount)

var v, mi, ma, r;
v  = 0;
ma = 1;
mi = 0;

if (argument_count > 0) {mi = argument[0];}
if (argument_count > 1) {ma = argument[1];}
if (argument_count > 2) {v  = argument[2];}

r = mi;
if (v > 0) {if (mi < ma) {r += v;}}
else {if (mi > ma) {r += v;}}

return(r);
#define stp
/// stp(min, max, amount)

var v, mi, ma, r, p, r, q;
v  = 0;
ma = 1;
mi = 0;

if (argument_count > 0) {mi = argument[0];}
if (argument_count > 1) {ma = argument[1];}
if (argument_count > 2) {v  = argument[2];}

r = (mi / ma);


p = clamp((v - 1) / (1 - r), 0.0, 1.0);
q = (p * p * (3 - 2 * p));

return (q * ma);
#define scrMathDirectionEase
/// scrMathDirectionEase(target, rate, easing)

direction += median(-argument1, argument1, (1-argument2) * angle_difference(argument0, direction));

#define scrMathBresLine
/// scrMathBresLine(x1, y1, x2, y2)

var q, x1, x2, y1, y2, dx, dy, dr, e, yy, i;
q    = ds_queue_create();
x1   = 0;
x2   = 1;
y1   = 0;
y2   = 1;

if (argument_count > 0) {x1 = argument[0];}
if (argument_count > 1) {y1 = argument[1];}
if (argument_count > 2) {x2 = argument[2];}
if (argument_count > 3) {y2 = argument[3];}


dx = x2 - x1;
dy = y2 - y1;
dr = abs(dy / dx);
e  = dr - 0.5;
yy = y1;

for (i = x1; i < x2; i++)
    {
     ds_queue_enqueue(q, i);
     ds_queue_enqueue(q, yy);
      
     e += dr;
     
     if (e  > 0.5) {yy++; e--;}
    }
    
return q;




#define scrMathBresLineDerived
/// scrMathBresLineDerived(x1, y1, x2, y2)

var q, x1, x2, y1, y2, dx, dy, dr, yy, i;
q    = ds_queue_create();
x1   = 0;
x2   = 1;
y1   = 0;
y2   = 1;

if (argument_count > 0) {x1 = argument[0];}
if (argument_count > 1) {y1 = argument[1];}
if (argument_count > 2) {x2 = argument[2];}
if (argument_count > 3) {y2 = argument[3];}

dx = x2 - x1;
dy = y2 - y1;
dr = 2 * (dy - dx);
yy = y1;

for (i = x1; i < x2; i++)
    {
     ds_queue_enqueue(q, i);
     ds_queue_enqueue(q, yy);

     if (dr > 0)
        {
         yy++;
         dr -= dx;
        }    
     dr += dy;
    }
    
return q;
#define vec2
/// vec2(x, y)

var array, xval, yval;
xval = -1;
yval = -1;

if (argument_count == 0)
   {
    array[0] = xval;
    array[1] = yval;
   
    return array;
   }

if (argument_count > 1)
   {
    xval = argument[0];
    yval = argument[1];

    array[0] = xval;
    array[1] = yval;

    return array;
   }



#define vec2GetX
/// vec2GetX(vec2)

var array;
array = argument[0];

return array[0];


#define vec2GetY
/// vec2GetY(vec2)

var array;
array = argument[0];

return array[1];



#define vec2SetX
/// vec2SetX(vec2, value)

var v;
v = argument1;

argument0[@ 0] = v;



#define vec2SetY
/// vec2SetY(vec2, value)

var v;
v = argument1;

argument0[@ 1] = v;


#define vec2SetXY
/// vec2SetXY(vec2, valueX, valueY)

var v, w;
v = argument1;
w = argument2;

argument0[@ 0] = v;
argument0[@ 1] = w;