/// scrLockpickingIni(tumblers, tumblerWidth, tumblerAnimationHeight, tumblerAnimationSpeed)

var instance;
instance    = instance_create(x, y, oLockpickingScreen);
global.temp = (id);

with(instance)
{
close                = false;
actualCombination    = "";
itemNumber           = 4;
currentItem          = 0;
itemWidth            = 32;
itemMoveAnimation    = 64;
itemMoveAnimationSpd = 0.1;
alpha                = 1;
parent               = (global.temp);
backgroundAlpha      = 0;
depth                = -9999;
x                    = view_xview;
y                    = view_yview;

if (argument_count > 0) {itemNumber           = argument[0];}
if (argument_count > 1) {itemWidth            = argument[1];}
if (argument_count > 2) {itemMoveAnimation    = argument[2];}
if (argument_count > 3) {itemMoveAnimationSpd = argument[3];}


drawX = ((800 - (itemNumber * 64)) / 2);
actualLockpickHp = round(max((max(itemNumber-oPlayer.vlastnost[vlastnost_paceni_zanmku], 0) + oPlayer.vlastnost[vlastnost_paceni_zanmku]), 2));

for (i = 0; i < itemNumber; i++)
    {
      itemUp[i] = false;
      itemUpCombination[i, 0] = ""; 
      itemXPos[i] = (i*64);
      itemHeight[i] = irandom_range(64, 96);
      itemUpY[i] = 0;
      itemMultiplicator[i] = 1;
      itemColor[i] = c_white;
      tempColour[i]  = 255;
    }
    
//itemUpCombination[0, 0] = "1";
//itemUpCombination[2, 0] = "1,0";    
//itemUpCombination[3, 0] = "1,0,2";
}
