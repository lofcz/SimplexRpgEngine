/// scrItemSetProperty(index, value, [pointsValue]... [index5, value5, [pointsValue5]])

var i;

for (i = 0; i < argument_count; i+=3)
    {
     if (argument_count > (i + 1))
        {
         vlastnost[argument[i]] = argument[i + 1];
         if (argument_count > (i + 2)) {if (argument[i + 2] != -1) {points += (argument[i + 1] * argument[i + 2]);}}

         if (argument[i] == vlastnost_reinforcementLevel) {scrItemUpdateReinforcementName(); scrItemUpdateReinforcementStats();}        
        }
    }
