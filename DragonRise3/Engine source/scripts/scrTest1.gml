#define scrTest1


// P1:(x,y)
//ds_queue_enqueue(queue, "0,0");

/*

ds_queue_enqueue(queue, "0, 1");
ds_list_add(list, "0,1,0");
ds_queue_enqueue(queue, "1, 0");
ds_list_add(list, "1,0,0");
ds_queue_enqueue(queue, "0, -1");
ds_list_add(list, "0,-1,0");
ds_queue_enqueue(queue, "-1, 0");
ds_list_add(list, "-1,0,0");

while(!ds_queue_empty(queue) && i < 60)
{
 pos = ds_queue_dequeue(queue);
 // Parse
 parseSymbolPos = string_pos(",", pos);
 posX = real(string_copy(pos, 0, parseSymbolPos-1));
 posY = real(string_copy(pos, parseSymbolPos+1, string_length(pos)));
 
 // Check for neighbours
 
 scrAddToQueue(posX + 1, posY);
 scrAddToQueue(posX - 1, posY);
 scrAddToQueue(posX, posY + 1);
 scrAddToQueue(posX, posY - 1);  
  /*
  ds_queue_enqueue(queue, "1, 0");
  ds_list_add(list, "1,0,0");
  ds_queue_enqueue(queue, "0, -1");
  ds_list_add(list, "0,-1,0");
  ds_queue_enqueue(queue, "-1, 0");
  ds_list_add(list, "-1,0,0"); */
 

 //show_message("X: " + string(posX) + "#Y: " + string(posY)); WORKING
/* 
 i++;
 listI++; 
}


for (i = 0; i < ds_list_size(list); i++)
    {
     array = string_split(list[| i], ",");
     draw_rectangle(relativeX + real(array[0]) * 32,relativeY + real(array[1]) * 32, relativeX + real(array[0]) * 32 + 32, relativeY + real(array[1]) * 32 + 32, true);
     draw_text(relativeX + real(array[0]) * 32,relativeY + real(array[1]) * 32, array[2]);
    }


#define scrAddToQueue
/// scrAddToQueue(x, y)
/*
var xx, yy;
xx = argument[0];
yy = argument[1];

// Search for pos in visited list
isVisited = false;
for (i = 0; i < ds_list_size(list); i++)
    {
     // Parse x,y
     array = string_split(list[| i], ",");

     if (real(array[0]) == xx && real(array[1]) == yy)
        {
         isVisited = true;
         break;
        }
    }

// Enqueue if not in list yet
if (!isVisited)
{    
ds_queue_enqueue(queue, string(xx) + "," + string(yy));
ds_list_add(list, string(xx) + "," + string(yy) + "," + string(listI));
}

#define string_split
/// string_split(string, splitChar)

var msg = argument[0]; //string to split
var splitBy = argument[1]; //string to split the first string by
var slot = 0;
var splits; //array to hold all splits
var str2 = ""; //var to hold the current split we're working on building

var i;
for (i = 1; i < (string_length(msg)+1); i++) {
    var currStr = string_copy(msg, i, 1);
    if (currStr == splitBy) {
        splits[slot] = str2; //add this split to the array of all splits
        slot++;
        str2 = "";
    } else {
        str2 = str2 + currStr;
        splits[slot] = str2;
    }
}

return splits;