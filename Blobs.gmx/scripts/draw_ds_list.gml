///print_ds_list(ds_list_ref,max_printed_items_int, start_at_item_int);


if argument2>=0
{
var i=argument2; //start at ( from 0 to ds_list_size )
}
else
{
var i=max(0,ds_list_size(argument0)-1-argument2); //start at end-position
}

repeat(argument1) //max_printed
{
if i<ds_list_size(argument0) draw_text(x,y+(i*20),string(ds_list_find_value(argument0,i)));
i++;
}