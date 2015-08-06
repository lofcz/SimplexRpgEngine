///quicksortStabilize(list, swaplist)

var list, swaplist, size, left, right, key, newKey, a, newSwap;

list     = argument0;
swaplist = argument1;
size     = ds_list_size(list);
newSwap  = ds_list_create();

for(a = 0; a < size; a++)
  {
  ds_list_add(newSwap, a);
  }


left  = 0;
right = 0;
key   = ds_list_find_value(list, 0);

for(a = 1; a < size; a++)
  {
  newKey = ds_list_find_value(list, a)
  
    if (newKey = key) 
       {
       right = a;
       }
    else 
         {
         
         if (right > left) {f++; quicksortList(swaplist, left, right, newSwap);}

         left  = a;
         right = a;
         key   = newKey;
       }
  }           

if (right > left) {f++; quicksortList(swaplist, left, right, newSwap);}
ds_list_destroy(newSwap);