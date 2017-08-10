///This script creates a path to the target using A* pathfinding

//libPathfindingAStar(startx, starty, targetx, targety, cell_size, path_curviness_1-8, smooth, obstacle_objects, allow_diagonal)

var a, b, c, d, e, f, sx, sy, tx, ty, x0, y0, x1, y1, px, py, pd, ph, pc;

//sx - starting x.
//sy - starting y.
//tx - target x.
//ty - target y.
//px - point x (we add this x value into the list).
//py - point y (we add this y value into the list).
//pd - point distance (the distance from px, py to the target x and target y).
//ph - place holder (We obtain the distance for the first point in the list).
//pc - point check (We check every sequential value against the place holder to see if it is smaller than the place holder. If so, ph becomes the pc).

//We will use this grid to check to see if the cell has been checked    
grid_cellChecked = ds_grid_create(room_width div argument4, room_height div argument4);

//Set the entire grid with the value of zero. We have not checked any cells yet. 0 = unchecked. 1 = checked.
ds_grid_clear(grid_cellChecked, 0);

//Create a list to be used to to add information of all squares checked.
gridList = ds_list_create();

//We need to trim all the cells that will not be used in the final analysis when we build the path.
cellTrimList = ds_list_create();

//Acquire the starting x and y.
x0 = round(argument0 / argument4) * argument4;
y0 = round(argument1 / argument4) * argument4;
x1 = argument4 * .5 * sign(argument0 - x0);
y1 = argument4 * .5 * sign(argument1 - y0);
if (x1 == 0){
    x1 = argument4 * .5;
}
if (y1 == 0){
    y1 = argument4 * .5;
}
sx = x0 + x1;
sy = y0 + y1;

//Acquire the goal x and y.
x0 = round(argument2 / argument4) * argument4;
y0 = round(argument3 / argument4) * argument4;
x1 = argument4 * .5 * sign(argument2 - x0);
y1 = argument4 * .5 * sign(argument3 - y0);
if (x1 == 0){
    x1 = argument4 * .5;
}
if (y1 == 0){
    y1 = argument4 * .5;
}
tx = x0 + x1;
ty = y0 + y1;

//The first search square will be our starting point.
x0 = sx;
y0 = sy;

//Use this distance as the first place holder.
ph = 0;

//Lets add the first cell into our list for searching. The starting x and starting y locations.
ds_list_add(gridList, x0, y0, -1);
ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 1);  

//Keep searching so long as cells exist.
while(ds_list_size(gridList) > 0){
    //We made it to the target, so break early.
    if (x0 == tx && y0 == ty){
        //Clear the remaining unchecked cells in the gridList to prepare the cellTrimList.
        for(a = 0;a <= ds_list_size(gridList) / 3 - 1;a ++){
            x0 = ds_list_find_value(gridList, a * 3);  
            y0 = ds_list_find_value(gridList, a * 3 + 1); 
            ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 0);
        }  
        //Delete the first two values from the trim list (These values are the startx and y values of the first square).
        repeat(2){
            ds_list_delete(cellTrimList, 0);  
        }      
        //Now delete the last two values from the trim list (These values are the target x and y values of the final square).
        repeat(2){
            ds_list_delete(cellTrimList, ds_list_size(cellTrimList) - 1);
        }
        break;
    }else{
        //We didn't make it to the target, so find the closest square to the targetx and targety.
        b = false;//This flag is important because sometimes the closest square gets choked off, in this event we simply find the next closest square.
        //Cylce thru the distances of each square to the target square and find the smallest one. Mark where we found it in the list.
        for(a = 0;a <= ds_list_size(gridList) / 3 - 1;a ++){
            pc = ds_list_find_value(gridList, a * 3 + 2);                       
            if (pc < ph){ 
                b = true;   
                c = a;     
                ph = pc;
            }
        }
        //We found the smallest distance within our cells that we accumulated, so make him the next search square and delete his 3 values in our list (his px, py and pd).         
        if (b){
            x0 = ds_list_find_value(gridList, c * 3);
            y0 = ds_list_find_value(gridList, c * 3 + 1);   
            ds_list_add(cellTrimList, x0, y0);
            repeat(3){               
                ds_list_delete(gridList, c * 3);
            }
        //We haven't been able to move forward because the closest cell is blocked off, so choose the next smallest distance square in our list and make that the new search target .             
        }else{           
            ph = ds_list_find_value(gridList, 2);    
            c = 0;  
            for(a = 0;a <= ds_list_size(gridList) / 3 - 1;a ++){        
                pc = ds_list_find_value(gridList, a * 3 + 2);  
                if (pc < ph){       
                    ph = pc;
                    c = a;
                }
            }
            x0 = ds_list_find_value(gridList, c * 3);
            y0 = ds_list_find_value(gridList, c * 3 + 1);  
            ds_list_add(cellTrimList, x0, y0);                       
            repeat(3){                    
                ds_list_delete(gridList, c * 3); 
            }
        }        
        //Aquire the x, y and distance values of our neighbor squares.
        for(a = 0;a <= 3;a ++){
            //Obtain coordinates of neighbor squares.
            x1 = x0 + lengthdir_x(argument4, a * 90);
            y1 = y0 + lengthdir_y(argument4, a * 90);
            //Make sure neighbor squares are valid.
            if (!position_meeting(x1, y1, argument7)
            && ds_grid_get(grid_cellChecked, (x1 - argument4 * .5) / argument4, (y1 - argument4 * .5) / argument4) == 0
            && x1 > 0
            && x1 < room_width
            && y1 > 0
            && y1 < room_height){
                px = x1;
                py = y1;
                pd = point_distance(px, py, tx, ty);
                //Make sure to mark this cell as "checked" so that we don't add these values to the list again.
                ds_grid_set(grid_cellChecked, (x1 - argument4 * .5) / argument4, (y1 - argument4 * .5) / argument4, 1);   
                //Add the cells respective values to the gridList.
                ds_list_add(gridList, px, py, pd);
            }
        }  
    }    
}   

//This is where we start to eliminate (trim) cells we do not need so we can correctly lay down a path. Trim stumps and trees!
do{
    d = false;
    for(a = 0;a <= ds_list_size(cellTrimList) / 2 - 1;a ++){      
        e = 0;
        f = false;
        x0 = ds_list_find_value(cellTrimList, a * 2);
        y0 = ds_list_find_value(cellTrimList, a * 2 + 1);         
        //Identify all of the cells around each cell we are checking.
        if (ds_grid_get(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - (argument4 + argument4 * .5)) / argument4) == 1){//N
            e += 3;
        }
        if (ds_grid_get(grid_cellChecked, (x0 + argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4) == 1){//E
            e += 7;
        }
        if (ds_grid_get(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 + argument4 * .5) / argument4) == 1){//S
            e += 11;
        }
        if (ds_grid_get(grid_cellChecked, (x0 - (argument4 + argument4 * .5)) / argument4, (y0 - argument4 * .5) / argument4) == 1){//W
            e += 13;
        }       
        switch(e){            
            //Stumps
            case 3://N
            case 7://E
            case 11://S
            case 13://W
            f = true;
            break;            
            //Corners
            case 10://N/E
            if (ds_grid_get(grid_cellChecked, (x0 + argument4 * .5) / argument4, (y0 - (argument4 + argument4 * .5)) / argument4) == 1){//NE
                f = true;
            }
            break;
            case 18://S/E
            if (ds_grid_get(grid_cellChecked, (x0 + argument4 * .5) / argument4, (y0 + argument4 * .5) / argument4) == 1){//SE
                f = true;
            }
            break;
            case 24://S/W
            if (ds_grid_get(grid_cellChecked, (x0 - (argument4 + argument4 * .5)) / argument4, (y0 + argument4 * .5) / argument4) == 1){//SW
                f = true;
            }
            break;
            case 16://N/W
            if (ds_grid_get(grid_cellChecked, (x0 - (argument4 + argument4 * .5)) / argument4, (y0 - (argument4 + argument4 * .5)) / argument4) == 1){//NW
                f = true;
            }
            break;            
            //Not any of the above.
            default:
            break;}           
        if (f){        
            d = true;
            repeat(2){
                ds_list_delete(cellTrimList, a * 2);
            }
            a --;
            ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 0);
        }
    }
}               
until(d == false);

//Are we doing a diagonal path?
if (argument8){
    //Now we eliminate corners. But be mindful of walls!
    do{
        d = false;        
        for(a = 0;a <= ds_list_size(cellTrimList) / 2 - 1;a ++){        
            e = 0;
            f = false;
            x0 = ds_list_find_value(cellTrimList, a * 2);
            y0 = ds_list_find_value(cellTrimList, a * 2 + 1);         
            //Identify all of the cells around each cell we are checking.
            if (ds_grid_get(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - (argument4 + argument4 * .5)) / argument4) == 1){//N
                e += 3;
            }
            if (ds_grid_get(grid_cellChecked, (x0 + argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4) == 1){//E
                e += 7;
            }
            if (ds_grid_get(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 + argument4 * .5) / argument4) == 1){//S
                e += 11;
            }
            if (ds_grid_get(grid_cellChecked, (x0 - (argument4 + argument4 * .5)) / argument4, (y0 - argument4 * .5) / argument4) == 1){//W
                e += 13;
            }       
            switch(e){            
                //Corners
                case 10://N/E
                if (!position_meeting(x0 + argument4, y0 - argument4, argument6)){
                    f = true;
                }
                break;
                case 18://S/E
                if (!position_meeting(x0 + argument4, y0 + argument4, argument6)){
                    f = true;
                }
                break;
                case 24://S/W
                if (!position_meeting(x0 - argument4, y0 + argument4, argument6)){
                    f = true;
                }
                break;
                case 16://N/W
                if (!position_meeting(x0 - argument4, y0 - argument4, argument6)){
                    f = true;
                }
                break;            
                //Not any of the above.
                default:
                break;
            }         
            if (f){                    
                d = true;
                repeat(2){
                    ds_list_delete(cellTrimList, a * 2);
                }
                a --;
                ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 0);
            }
        }
    }                
    until(d == false);
}

//Now we construct a path to the target. 
p_path = path_add();
path_set_closed(p_path, false);
path_set_kind(p_path, argument6);
path_set_precision(p_path, argument5);
x0 = sx;
y0 = sy;
path_add_point(p_path, argument0, argument1, 100);
path_add_point(p_path, x0, y0, 100);
ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 0);
repeat(ds_list_size(cellTrimList) / 2 + 4){
    if (x0 == tx && y0 == ty){
        path_add_point(p_path, argument2, argument3, 100);
        break;
    }else{  
        //First check directs
        b = false;
        for(a = 0;a <= 3;a ++){
            x1 = x0 + lengthdir_x(argument4, a * 90);
            y1 = y0 + lengthdir_y(argument4, a * 90);
            if (ds_grid_get(grid_cellChecked, (x1 - argument4 * .5) / argument4, (y1 - argument4 * .5) / argument4) == 1){
                b = true;
                x0 = x1;
                y0 = y1;
                path_add_point(p_path, x0, y0, 100);
                ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 0);
                break;
            }
        }
        //If it fails, check for diagonals.     
        if (!b){            
            for(a = 0;a <= 3;a ++){        
                x1 = round(x0 + lengthdir_x(45, a * 90 + 45));
                y1 = round(y0 + lengthdir_y(45, a * 90 + 45));               
                if (ds_grid_get(grid_cellChecked, (x1 - argument4 * .5) / argument4, (y1 - argument4 * .5) / argument4) == 1){                
                    x0 = x1;
                    y0 = y1;                    
                    path_add_point(p_path, x0, y0, 100);
                    ds_grid_set(grid_cellChecked, (x0 - argument4 * .5) / argument4, (y0 - argument4 * .5) / argument4, 0);
                    break;
                }
            }
        }
    }
}    
pfg = path_add();
path_set_closed(pfg, 0);
for (var i = 0; i <path_get_number(p_path); i++)
{
    tx = (path_get_point_x(p_path, i) div 32) * 32;
     ty = (path_get_point_y(p_path, i) div 32) * 32;
   path_add_point(pfg, tx + 16, ty + 16, 100);
}

//Deleting the second point and second to last point provides a smoother path.
path_delete_point(p_path, 1);
path_delete_point(p_path, path_get_number(p_path) - 2);

//Delete structures.
ds_list_destroy(gridList);
ds_list_destroy(cellTrimList)
ds_grid_destroy(grid_cellChecked);

//Return result.
return pfg;