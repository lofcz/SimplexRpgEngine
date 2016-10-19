#define scrPathfindingInit
/// scrPathfindingInit(x, y, width, height, gridSize)

topX   = argument[0];
topY   = argument[1];
width  = argument[2];
height = argument[3];

areaMap[(800 / 32), (600 / 32)] = 0;

#define scrPathfindingCheckNeighbours
/// scrPathfindingCheckNeighbours(x, y)

var xx, yy, p;
xx = argument[0];
yy = argument[1];

if (yy >= 32)
{
p = string(xx) + "," + string(yy - 32);

if (!place_meeting(xx, yy - 32, oAdvancedCollision))
    {
     if (!ds_list_find_index(list, p))
        {         
         ds_queue_enqueue(queue, p);
         ds_list_add(list, p);
        }
    }
}

if (xx >= 32)
{
p = string(xx - 32) + "," + string(yy);

if (!place_meeting(xx - 32, yy, oAdvancedCollision))
    {
     if (!ds_list_find_index(list, p))
        {         
         ds_queue_enqueue(queue, p);
         ds_list_add(list, p);
        }
    }
}

if (xx < room_width)
{
p = string(xx + 32) + "," + string(yy);

if (!place_meeting(xx + 32, yy, oAdvancedCollision))
    {
     if (!ds_list_find_index(list, p))
        {         
         ds_queue_enqueue(queue, p);
         ds_list_add(list, p);
        }
    }
}

if (yy < room_height)
{
p = string(xx) + "," + string(yy + 32);

if (!place_meeting(xx, yy + 32, oAdvancedCollision))
    {
     if (!ds_list_find_index(list, p))
        {         
         ds_queue_enqueue(queue, p);
         ds_list_add(list, p);
        }
    }
}