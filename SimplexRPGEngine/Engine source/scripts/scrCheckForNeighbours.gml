/// scrCheckForNeighbours(object)

var q, obj;
q   = id;
obj = oFence;

if (argument_count > 0) {obj = argument[0];}

if (place_meeting(x + 32, y, obj))
    {
     q = instance_place(x + 32, y, obj);
     if (q.built) {neighbour[@ 0] = true;}
    }

if (place_meeting(x - 32, y, obj))
    {
     q = instance_place(x - 32, y, obj);
     if (q.built) {neighbour[@ 1] = true;}
    }

if (place_meeting(x, y + 32, obj))
    {
     q = instance_place(x, y + 32, obj);
     if (q.built) {neighbour[@ 2] = true;}
    }

if (place_meeting(x, y - 32, obj))
    {
     q = instance_place(x, y - 32, obj);
     if (q.built) {neighbour[@ 3] = true;}
    }
