/// position_free(size)

var s, t, qx, qy, z;
s = 32;

if (argument_count > 0) {s = argument[0];}

t  = (s * s);
qx = x;
qy = y;
z  = 0;

do
  {
   x = (qx - random(s) + random(s));
   y = (qy - random(s) + random(s));
   z++;
  }
until (!place_empty(x, y) && (z < t))
