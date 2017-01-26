/// scrBCAddLoot(item, numberMin, numberMax, times)

var item, numberMin, numberMax, times, actualNumber, number;
item      = oGold;
numberMin = 1;
numberMax = 1;
times     = 1;
number    = 1;

if (argument_count > 0) {item      = argument[0];}
if (argument_count > 1) {numberMin = argument[1];}
if (argument_count > 2) {numberMax = argument[2];}
if (argument_count > 3) {times     = argument[3];}

if (times != 1)
    {
     repeat(times)
        {
         actualNumber = irandom_range(numberMin, numberMax);
         ds_list_add(contentList, item);
         ds_list_add(contentListN, actualNumber);     
        }
    }
else
    {
     ds_list_add(contentList, item);
     ds_list_add(contentListN, number);
    }


