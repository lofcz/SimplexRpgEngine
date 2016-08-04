/// scrItemInstantiate(item, numberMin, numberMax, animateDrop, dropTimes, dropForce)

var item, numberMin, numberMax, aD, dT, numberActual, dF;
item      = oGold;
numberMin = 1;
numberMax = 1;
aD        = true;
dT        = 1;
dF        = 1;

if (argument_count > 0) {item      = argument[0];}
if (argument_count > 1) {numberMin = argument[1];}
if (argument_count > 2) {numberMax = argument[2];}
if (argument_count > 3) {aD        = argument[3];}
if (argument_count > 4) {dT        = argument[4];}
if (argument_count > 5) {dF        = argument[5];}

repeat(dT)
{
numberActual = irandom_range(numberMin, numberMax);

      b                  = instance_create(x, y, item)
      b.itm_number       = numberActual;
      b.on_click         = 0;
      b.hover_info       = 0;
      b.xx               = x;
      b.yy               = y;
      b.loot             = 0;
      b.drop_id          = id;
      b.slot             = i;
      b.show_number      = 0;
      
if (aD)
{
      b.animateDrop      = true;
      b.animateDropDir   = random(360);
      b.animateDropForce = random_range(dF - 0.5 , dF + 0.5);
      with(b) {position_free();}
}
else
{
      b.animateDrop      = false;
      b.animateDropDir   = random(360);
      b.animateDropForce = random_range(0.5,1.5);
}
}
