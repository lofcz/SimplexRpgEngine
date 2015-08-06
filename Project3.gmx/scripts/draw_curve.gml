/// draw_curve(x1,y1,x2,y2,direction,quality,color)
 
   var x1, y1, x2, y2, angle, quality, distance, distance_ang, step, draw_x, draw_y;
   
    x1          = argument[0];
    y1          = argument[1];
    x2          = argument[2];
    y2          = argument[3];
    angle       = argument[4];
    quality     = argument[5];
    color       = argument[6];

    
    distance     = point_distance(x1,y1,x2,y2);
    distance_ang = angle_difference(point_direction(x1,y1,x2,y2),angle);
    step         = (1/quality);

    draw_set_colour(color);
    draw_primitive_begin(pr_linestrip);
    
    for (a = 0; a < 1+step; a+=step) 
    {
        xx = x1 + (lengthdir_x(a * distance, a * -distance_ang + angle));
        yy = y1 + (lengthdir_y(a * distance, a * -distance_ang + angle));   
        
        draw_vertex(xx,yy);
    }
    
    draw_primitive_end();
