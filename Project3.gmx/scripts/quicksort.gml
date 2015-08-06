///quicksort(list, left, right, swaplist);
//list - ds_list - list to sort
//left - int - index to start sort at
//right - int - index to end sort at (-1 is end of list)
//swaplist - var - -2 = create swaplist, -1 = don't process swaplist, ds_list = process this list
//
//return - ds_list - swaplist (-1 if no list)



var list, left, right, swaplist, size, pivotIndex, pivotNewIndex, a;

list     = argument0;
left     = argument1;
right    = argument2;
swaplist = argument3;
size     = ds_list_size(list)


if(right < 0) { right = size-1; }      
if(swaplist == 1)
   {
   swaplist = ds_list_create();

       for(a = 0; a < size; a++)
         {
         ds_list_add(swaplist, a);
         }
}


if(right > left)
   {
   pivotIndex    = floor((left+right)/2);
   pivotNewIndex = quicksortDivide(list, left, right, pivotIndex, swaplist);

   quicksort(list, left, pivotNewIndex - 1, swaplist);
   quicksort(list, pivotNewIndex + 1, right, swaplist);
   }


return swaplist;
