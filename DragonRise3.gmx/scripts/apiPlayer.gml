#define apiPlayer


#define apiPlayerMove
/// apiPlayermove()

if (can_move = 1 && can_move2 = 1) 
    {   
    if (keyboard_check(ord("W"))) 
        {
        a1 = 0
        dir = "w";
        last_dir = dir;
        image_speed = (0.25+(rychlost/100));
        direction = 90;
        speed = rychlost;
        } 
    
    if (keyboard_check(ord("S"))) 
        {
        a1 = 0
        dir = "s";
        last_dir = dir;
        image_speed = (0.25+(rychlost/100));
        direction = 270;
        speed = rychlost;
        } 
        
    if (keyboard_check(ord("A"))) 
        {
        a1 = 0
        dir = "a";        
        last_dir = dir;
        image_speed = (0.25+(rychlost/100));
        direction = 180;
        speed = rychlost;
        }  
        
    if (keyboard_check(ord("D")))
        {
        a1 = 0
        dir = "d";
        last_dir = dir;
        image_speed = (0.25+(rychlost/100));
        direction = 360;
        speed = rychlost;
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