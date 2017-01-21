/// combatGetCriticalHit(chance%)
 
randomize();

var chance;
chance = apiPlayerGetPropertyValue(vlastnost_kriticka_sance, false, true);

if (argument_count > 0) {chance = real(argument[0]);}

if (chance > random_range(0, 100))
   {
    return true;
   }
   
return false;
