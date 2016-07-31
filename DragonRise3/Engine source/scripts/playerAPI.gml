#define playerAPI
/// playerAPI
/*

- apiPlayermove()

  Used to control player movement
  
- apiPlayerMoveStand()

  Stops the player animation when needed

#define apiPlayerMove
/// apiPlayerMove()

math_set_epsilon(0.0000001);
apiPlayerRegenerate()

if (can_move && can_move2 && can_move3 && can_move4 && can_move5) 
    {   
    if (keyboard_check(ord("W"))) 
        {
        a1 = 0
        dir = "w";
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 90;
        speed = temp_rychlost;
        apiPlayerSprint();
        
        } 
    
    if (keyboard_check(ord("S"))) 
        {
        a1 = 0
        dir = "s";
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 270;
        speed = temp_rychlost;
        apiPlayerSprint();

        
          oPlayerCombat.dir_rot = -20;
        
        if (m1 = 0)
           {
            if (oPlayerCombat.xxx > -1) { oPlayerCombat.xxx -= 0.5  oPlayerCombat.move_rot -= 10;} else {m1 = 1;}
           }
         if (m1 = 1)
           {
            if (oPlayerCombat.xxx < 1) { oPlayerCombat.xxx += 0.5 oPlayerCombat.move_rot += 20;} else {m1 = 0; oPlayerCombat.move_rot = 0;}
           }

        } 
        
    if (keyboard_check(ord("A"))) 
        {
        //if (dir != "a") {oPlayerCombat.xxx = 0; oPlayerCombat.yyy = 0; oPlayerCombat.move_rot = 0;} 
        a1 = 0
        dir = "a";        
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 180;
        speed = temp_rychlost;
        apiPlayerSprint();

       
       oPlayerCombat.dir_rot = +25;
        
        if (m2 = 0)
           {
            if (oPlayerCombat.xxx < 1) { oPlayerCombat.xxx += 0.5  oPlayerCombat.move_rot -= 15;} else {m2 = 1;}
           }
      
            if (m2 = 1)
           {
            if (oPlayerCombat.xxx > -1) { oPlayerCombat.xxx -= 0.5 oPlayerCombat.move_rot += 10;} else {m2 = 0; oPlayerCombat.move_rot = 0;}
           }

      
        
        }  
        
    if (keyboard_check(ord("D")))
        {
        a1 = 0
        dir = "d";
        last_dir = dir;
        image_speed = (0.25+(temp_rychlost/100));
        direction = 360;
        speed = temp_rychlost;
        apiPlayerSprint();
        tempN += 15;
        z = lerp(z, 30, 0.3);

        
       oPlayerCombat.dir_rot = -20;
        
        if (m1 = 0)
           {
            if (oPlayerCombat.xxx > -1) { oPlayerCombat.xxx -= 0.5  oPlayerCombat.move_rot -= 10;} else {m1 = 1;}
           }
         if (m1 = 1)
           {
            if (oPlayerCombat.xxx < 1) { oPlayerCombat.xxx += 0.5 oPlayerCombat.move_rot += 20;} else {m1 = 0; oPlayerCombat.move_rot = 0;}
           }
        text = string(sin(degtorad(tempN)));
        if (image_index > 8 && image_index < 9) {oPlayerCombat.xxx = 1; oPlayerCombat.move_rot += z; }
        else if (image_index > 10 && image_index < 11) {oPlayerCombat.xxx = -1; oPlayerCombat.move_rot -= 10;}
        else {oPlayerCombat.xxx = 0; oPlayerCombat.move_rot = 0; tempN = 0; z = 0; }                
        }  
        
        if (keyboard_check_pressed(ord("N")))
            {
             if (oPlayerCombat.attack = 0 &&  oPlayerCombat.attackMode == "attack" && oPlayer.vlastnost[vlastnost_stamina] >= oPlayer.vlastnost[vlastnost_parry_cost])
                {
                 oPlayerCombat.attackMode = "parry";
                 oPlayerCombat.parryTimer = oPlayerCombat.parryTimerMax;
                 oPlayer.vlastnost[vlastnost_stamina] -= oPlayer.vlastnost[vlastnost_parry_cost];
                 oPlayer.parrySlowdown = oPlayerCombat.parryTimerSlowdown;
                 oPlayerCombat.parryAngle = 0;
                }
            }
            
        if (oPlayerCombat.parryTimer > 0)
            {
             oPlayerCombat.parryTimer--;
             if (oPlayerCombat.parryTimer <= 0) {oPlayerCombat.attackMode = "attack"; oPlayer.parrySlowdown = 100;}
            }
        
        
        
    if ((!keyboard_check(ord("W")) && !keyboard_check(ord("S"))  && !keyboard_check(ord("A"))  && !keyboard_check(ord("D"))) && a1 = 0)
        {
        a1 = 1;
        alarm[0] = 3;
        dir = "";
        image_speed = 0;
        speed = 0;
       
        }
    }  
if (can_move = 0)
    {
    dir = "s" 
    image_index = 12;
    }    
if (dir = "w")
    {
     if (image_index < 12 || image_index > 15.9)
            {
            image_index = 12;
            } 
    }
if (dir = "s")
    {
     if (image_index < 0 || image_index > 3.9)
            {
            image_index = 0;
            } 
    }    
if (dir = "a")
    {
     if (image_index < 4 || image_index > 7.9)
            {
            image_index = 4;
            } 
    }    
if (dir = "d")
    {
     if (image_index < 8 || image_index > 11.9)
            {
            image_index = 8;
            } 
    }            
    


#define apiPlayerMoveStand
/// apiPlayerMoveStand()

math_set_epsilon(0.0000001);

     if (image_index > 12 && image_index < 15.99)
            {
            image_index = 12;
            } 


     if (image_index > 0 && image_index < 3.99)
            {
            image_index = 0;
            } 
   

     if (image_index > 4 && image_index < 7.99)
            {
            image_index = 4;
            } 
    

     if (image_index > 8 && image_index < 11.99)
            {
            image_index = 8;
            } 
#define apiPlayerSprint
/// apiPlayerSprint()
  if (keyboard_check(vk_shift))       
           {
            if (vlastnost[vlastnost_stamina] > 0) {vlastnost[vlastnost_stamina] -= 0.1; speed += 1; sprinting = 1; effectSprint();}
             else {sprinting = 0;} 
           }
           else {sprinting = 0;}


#define apiPlayerRegenerate
/// apiPlayerRegenerate()

if (stamina_tick > 0 && !sprinting) {stamina_tick --;}
   else
       {
        if (!sprinting)
        {
        stamina_tick = vlastnost[vlastnost_tick_stamina];
        vlastnost[vlastnost_stamina] += vlastnost[vlastnost_tick_stamina_add];
        }
       }
#define apiPlayerDraw
/// apiPlayerDraw()

draw_self();

stamina_dif = abs(last_stamina - vlastnost[vlastnost_stamina]);
health_dif  = abs(last_hp - vlastnost[vlastnost_zivot]);

if (stamina_dif <= 5) {stamina_bar = 0.1;}
if (health_dif <= 5)  {health_bar = 0.1;}
else {health_bar = 1;} 

      
if (last_hp < vlastnost[vlastnost_zivot]) {last_hp += health_bar;}
if (last_hp > vlastnost[vlastnost_zivot]) {last_hp -= health_bar;}

if (last_stit < vlastnost[vlastnost_stit]) {last_stit++;}
if (last_stit > vlastnost[vlastnost_stit]) {last_stit--;}

if (last_mana < vlastnost[vlastnost_mana]) {last_mana++;}
if (last_mana > vlastnost[vlastnost_mana]) {last_mana--;}

if (last_stamina < vlastnost[vlastnost_stamina]) {last_stamina += stamina_bar;}
if (last_stamina > vlastnost[vlastnost_stamina]) {last_stamina -= stamina_bar;}

if (last_xp < vlastnost[vlastnost_zkusenosti]) {last_xp++;}
if (last_xp > vlastnost[vlastnost_zkusenosti]) {last_xp--;}

if (last_hp <= 0 && last_hp != 0) {last_hp = 0; scrGoreExplode(10,10);}
#define apiPlayerUnstuck
/// apiPlayerUnstuck()

with(oPlayer)
{
if (!place_empty(x, y))
{
tX = x;
tY = y;

// Get distances
while(!place_empty(tX, tY)) {tX--;}
dis[0] = abs(x - tX);

tX = x;
tY = y;    

while(!place_empty(tX, tY)) {tX++;}
dis[1] = abs(x - tX);

tX = x;
tY = y;    

while(!place_empty(tX, tY)) {tY++;}
dis[2] = abs(y - tY);

tX = x;
tY = y;    

while(!place_empty(tX, tY)) {tY--;}
dis[3] = abs(y - tY);

// Get min distance and prioritize last direction
minDistance   = min(dis[0], dis[1], dis[2], dis[3]);
deltaDistance = 0;

if (last_dir == "s") {deltaDistance = dis[2];}
if (last_dir == "w") {deltaDistance = dis[3];}
if (last_dir == "d") {deltaDistance = dis[1];}
if (last_dir == "a") {deltaDistance = dis[0];}

difDistance = abs(deltaDistance - minDistance);

if (difDistance < 3) 
    {
     if (last_dir == "s") {y += dis[2];}
     if (last_dir == "w") {y -= dis[3];}
     if (last_dir == "d") {x += dis[1];}
     if (last_dir == "a") {x -= dis[0];}     
    }
else
    {
     for (i = 0; i < 3; i++)
        {
         if (minDistance == dis[i])
            {
             if (i == 0) {x -= dis[i];}
             if (i == 1) {x += dis[i];}
             if (i == 2) {y += dis[i];}
             if (i == 3) {y -= dis[i];}             
            }
        }
    }
}
}
