///quicksortDivide(list, left, right, pivotIndex, swaplist)

var list, left, right, pivotIndex, swaplist, pivotValue, storeIndex, a;

list       = argument0;
left       = argument1;
right      = argument2;
pivotIndex = argument3;
swaplist   = argument4;
pivotValue = ds_list_find_value(list, pivotIndex); 
storeIndex = left; 

quicksortSwap(list, pivotIndex, right);

if (swaplist >= 0) {quicksortSwap(swaplist, pivotIndex, right);}


for(a = left; a < right; a++)                                                         
   {
   if (ds_list_find_value(list, a) <= pivotValue)
      {
      quicksortSwap(list, a, storeIndex)
      
         if (swaplist >= 0) {quicksortSwap(swaplist, a, storeIndex);}
      
      storeIndex += 1;
     }
   }

quicksortSwap(list, storeIndex, right);

if (swaplist >= 0) {quicksortSwap(swaplist, storeIndex, right);}


return storeIndex;