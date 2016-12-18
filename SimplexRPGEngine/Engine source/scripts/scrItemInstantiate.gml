/// scrItemInstantiate(item, numberMin, numberMax, animateDrop, dropTimes, dropForce, xx, yy, physics)

var item, numberMin, numberMax, aD, dT, numberActual, dF, xx, yy, p;
item      = oGold;
numberMin = 1;
numberMax = 1;
aD        = true;
dT        = 1;
dF        = 1;
xx        = 0;
yy        = 0;
p         = true;

if (argument_count > 0) {item      = argument[0];}
if (argument_count > 1) {numberMin = argument[1];}
if (argument_count > 2) {numberMax = argument[2];}
if (argument_count > 3) {aD        = argument[3];}
if (argument_count > 4) {dT        = argument[4];}
if (argument_count > 5) {dF        = argument[5];}
if (argument_count > 6) {xx        = argument[6];}
if (argument_count > 7) {yy        = argument[7];}
if (argument_count > 8) {p         = argument[8];}

repeat(dT)
{
numberActual = irandom_range(numberMin, numberMax);

      b                  = instance_create(choose(x+xx,x-xx), choose(y+yy,y-yy), item)
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
}
else
{
      b.animateDrop      = false;
      b.animateDropDir   = random(360);
      b.animateDropForce = random_range(0.5,1.5);
}

if (p)
    {
       b.drawDrop  = true;
       b.direction = random(360);
       b.speed     = random_range(2, 4);
       b.friction  = 0.15;
    }
}
