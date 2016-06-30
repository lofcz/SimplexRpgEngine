/// combatGetCriticalHit(chance)
// Input is in % 
randomize();

var chance;
chance = 0;

if (argument_count > 0) {chance = real(argument[0]);}

if (chance > random_range(0,100))
   {
    return true;
   }
   
return false;
