/// move_outside(obj, dir, maxdist)
repeat(argument2)
{
  if (place_meeting(x, y, argument0))
  {
  x = x+lengthdir_x(1, argument1);
  y = y+lengthdir_y(1, argument1); 
  }
  else
  {
  return true;
  }
}