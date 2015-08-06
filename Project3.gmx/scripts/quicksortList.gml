///quicksortList(list, left, right, swaplist)

var list, left, right, swaplist, size, pivotIndex, pivotNewIndex, a;

list     = argument0;
left     = argument1;
right    = argument2;
swaplist = argument3;
size     = ds_list_size(list)


if(right < 0) { right = size-1; }   
   
if(swaplist == 2)
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

    f+=2;
   quicksortList(list, left, pivotNewIndex - 1, swaplist);
   quicksortList(list, pivotNewIndex + 1, right, swaplist);
   }


return swaplist;