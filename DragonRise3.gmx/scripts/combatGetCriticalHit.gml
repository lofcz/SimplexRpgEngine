/// combatGetCriticalHit(chance)
// Input is in % 

var chance;
chance = 0;

if (argument_count > 0) {chance = real(argument[0]);}

randomize();

if (chance > random_range(0,100))
   {
    return true;
   }
   
return false;
