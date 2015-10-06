/*
**  Usage:
**      bias(b,t)
**
**  Arguments:
**      b       bais, real
**      t       value, real
**
**  Returns:
**      If (t) varies over the [0,1] interval, then
**      the result also varies over that interval.
**      The zero and one endpoints of the interval
**      are mapped onto themselves. Other values
**      are shifted upward toward one if (b) is
**      greater than 0.5, and shifted downward
**      toward zero if (b) is between 0.0 and 0.5.
**
**  GMLscripts.com
*/
{
    return argument1/((1/argument0-2)*(1-argument1)+1);
}