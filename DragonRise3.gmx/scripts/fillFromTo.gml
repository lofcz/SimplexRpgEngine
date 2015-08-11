///fillFromTo(from,to,item,count_min,count_max);

from  = 1;
to    = 2;
item  = oGold;

count_min = 1;
count_max = 1;

if (argument_count > 0) {from = argument[0];}
if (argument_count > 1) {to   = argument[1];}
if (argument_count > 2) {item = argument[2];}

if (argument_count > 3) {count_min = argument[3];}
if (argument_count > 4) {count_max = argument[4];}

if (to > slots) {return 0;}


for(a = from; a < to; a++)
      {
      count = irandom_range(count_min,count_max);
      
      scrLoot(a,item,count);
      }