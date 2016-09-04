/// scrPathfindingFindPath(x1, y1, x2, y2)

queue = ds_queue_create();
list  = ds_list_create();

scrPathfindingCheckNeighbours(oPlayer.x, oPlayer.y);
stop      = false;
z         = 0;
stopTimer = 2;

while(!ds_queue_empty(queue) && stopTimer > 0)
    {
     for (k = 0; k < ds_queue_size(queue); k++)
        {
         decodedStr = ds_queue_dequeue(queue);
         xx = "";
         yy = "";
         separated = false;
         
         for (i = 0; i < string_length(decodedStr); i++)
            {
             if (string_char_at(decodedStr, i+1) == ',') {separated = true; continue;}
             
             if (!separated) {xx += string_char_at(decodedStr, i+1)}
            }
         
        }
    }
