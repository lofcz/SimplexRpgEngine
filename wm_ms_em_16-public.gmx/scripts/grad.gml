// grad(hash, x, y, z):
{
    var u,v;
    argument0 = argument0 & 15;
    if (argument0 < 8)
        u = argument1;
    else
        u = argument2;
    if (argument0 < 4)
        v = argument2;
    else if (argument0 == 12 or argument0 == 14)
        v = argument1;
    else
        v = argument3;
    if (argument0 & 1 != 0)
        u = -u;
    if (argument0 & 2 != 0)
        v = -v;
    return u + v;
}