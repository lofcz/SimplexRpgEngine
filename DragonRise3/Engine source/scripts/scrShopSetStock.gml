/// scrShopSetStock(slot, count, relative, addFlag)

var s, c, r, f, t;
s = 0;
c = 1;
r = true;
f = true;

if (argument_count > 0) {s = argument[0];}
if (argument_count > 1) {c = argument[1];}
if (argument_count > 2) {s = argument[2];}
if (argument_count > 3) {f = argument[3];}

t = (item[s]).itm_number;

if (r) {(item[s]).itm_number += c;}
else {(item[s]).itm_number = c;}

if (f)
{
if ((item[s]).itm_number > t) {slotFlag[s] = "+";}
if ((item[s]).itm_number < t) {slotFlag[s] = "-";}
}
