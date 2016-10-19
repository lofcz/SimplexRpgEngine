/// scrChooseFromArray(array)
randomize();

var ti, a;
a = -1;

if (argument_count > 0) {a = argument[0];}

do 
{
 ti    = clamp(irandom(array_length_1d(a)), 0, array_length_1d(a)-1) ;
 value = a[ti];
}
until(value > 0)

return ti;
