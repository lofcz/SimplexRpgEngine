///quicksortSwap(list, index_old, index_new)

var list, index_old, index_new, size, temp;

list        = argument0;
index_old   = argument1;
index_new   = argument2;
size        = ds_list_size(list);

if(index_old >= size || index_new >= size) {return false;}


temp = ds_list_find_value(list, index_old);
ds_list_replace(list, index_old, ds_list_find_value(list, index_new));
ds_list_replace(list, index_new, temp);



return true;