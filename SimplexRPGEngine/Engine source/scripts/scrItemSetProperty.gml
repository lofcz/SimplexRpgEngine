#define scrItemSetProperty
/// scrItemSetProperty(index, value, [pointsValue], ... [index5, value5, [pointsValue5]])

var i;

for (i = 0; i < argument_count; i+=3)
    {
     if (argument_count > (i + 1))
        {
         vlastnost[argument[i]] = argument[i + 1];
         if (argument_count > (i + 2)) {if (argument[i + 2] != -1) {points += (argument[i + 1] * argument[i + 2]);}}

         if (argument[i] == vlastnost_reinforcementLevel) {scrItemUpdateReinforcementName(); scrItemUpdateReinforcementStats();}        
         if (argument[i] == vlastnost_cena) {vlastnost[vlastnost_originalniCena] = vlastnost[argument[i]];}        

         }
    }

#define scrItemGetProperty
/// scrItemGetProperty(index, [returnAsString])

var i, r;
i = 0;
r = false;

if (argument_count > 0) {i = argument[0];}
if (argument_count > 1) {r = argument[1];}

if (!r) {return vlastnost[i];}
return string(vlastnost[i]);

#define scrItemGetPoints
/// scrItemGetPoints()

return points;

#define scrItemAppendName
/// scrItemAppendName(suffix)

var s;
s = "";

if (argument_count > 0) {s = argument[0];}

itm_info_head += " " + s;

#define scrItemIncProperty
/// scrItemIncProperty(index, value, [pointsValue], ... [index5, value5, [pointsValue5]])

var i;

for (i = 0; i < argument_count; i+=3)
    {
     if (argument_count > (i + 1))
        {
         vlastnost[argument[i]] += argument[i + 1];
         if (argument_count > (i + 2)) {if (argument[i + 2] != -1) {points += (argument[i + 1] * argument[i + 2]);}}
         refVal = argument[i + 1];

         if (argument[i] == vlastnost_reinforcementLevel) {scrItemUpdateReinforcementName(); scrItemUpdateReinforcementStats();}        
        }
    }


#define scrItemRandomizeTempValue
/// scrItemRandomizeTempValue(min, max)

var m, M;
m = 0;
M = 2;

if (argument_count > 0) {m = argument[0];}
if (argument_count > 1) {M = argument[1];}


tempValue = irandom_range(m, M);

#define scrItemGetTempValue
/// scrItemGetTempValue()

return tempValue;

#define scrItemGetRefValue
/// scrItemGetRefValue()

return refVal;
