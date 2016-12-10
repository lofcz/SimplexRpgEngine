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