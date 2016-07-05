/// scrBCAddLoot(item, number)

var item, number;
item   = oGold;
number = 1;

if (argument_count > 0) {item   = argument[0];}
if (argument_count > 1) {number = argument[1];}

ds_list_add(contentList, item);
ds_list_add(contentListN, number);


