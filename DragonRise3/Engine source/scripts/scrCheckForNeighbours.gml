/// scrCheckForNeighbours(object)

var q;
q = id;

enum neighbourEnum
{
right, left, down, up
}

if (place_meeting(x + 32, y, oFence))
    {
     q = instance_place(x + 32, y, oFence);
     if (q.built) {neighbour[@ 0] = true;}
    }

if (place_meeting(x - 32, y, oFence))
    {
     q = instance_place(x - 32, y, oFence);
     if (q.built) {neighbour[@ 1] = true;}
    }

if (place_meeting(x, y + 32, oFence))
    {
     q = instance_place(x, y + 32, oFence);
     if (q.built) {neighbour[@ 2] = true;}
    }

if (place_meeting(x, y - 32, oFence))
    {
     q = instance_place(x, y - 32, oFence);
     if (q.built) {neighbour[@ 3] = true;}
    }
