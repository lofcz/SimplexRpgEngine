/*
**  Usage:
**      d3d_transform_set_skew_z(x,y)
**
**  Arguments:
**      x, y: coordinates       
**
**  Returns:
**      nothing
**
**  Notes:
**      The z-axis is made skew: points (0,0,t) are draw at (t*x,t*y,t). 
**      The x-axis (points (t,0,0)) and the y-axis (points (0,t,0)) stay 
**      the same.
**      This transformation is not orthogonal and hence does not work
**      properly in combination with lighting.
**
**  brac37
*/
{
    var xo, yo, sk, a2;
    xo = argument0;
    yo = argument1;
    sk = sqrt(sqr(xo)+sqr(yo));
    a2 = point_direction (0,yo,xo,0);
    d3d_transform_set_rotation_z (a2);
    if (sk > 0.1) {
        sk *= 0.5;
        d3d_transform_add_scaling (0.57735026918962576450914878050196,1,sk);
        d3d_transform_add_rotation_y (-60);
        d3d_transform_add_scaling (3,1,1);
        d3d_transform_add_rotation_y (30);
        d3d_transform_add_scaling (1,1,0.57735026918962576450914878050196/sk);
    } else {
        sk *= 2;
        xo = sqrt(1+sk);
        yo = sqrt(1-sk);
        d3d_transform_add_scaling (2,1,1);
        d3d_transform_add_rotation_y (-45);
        d3d_transform_add_scaling (xo,1,yo);
        d3d_transform_add_rotation_y (point_direction(0,yo,xo,0));
        d3d_transform_add_scaling (0.5,1,1/(xo*yo));
    }
    d3d_transform_add_rotation_z (-a2);
}