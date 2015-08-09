/// scrChestIni(open_direction,open_key)

alarm[0]   = 1;
open       = 0;
text_alpha = 0;
dir        = "w";
open_char  = "E";
text       = 0;
animate    = 0;

image_speed = 0;

if (argument_count > 0) {dir       = argument[0];}
if (argument_count > 1) {open_char = argument[1];}

for (a = 0; a < slots; a++)
    {
     loot[a,ext_name]   = -1;
     loot[a,ext_number] =  1;      
     
     fill[a] = 0;  
    } 

coll = instance_create(x-16,y+16,oCollisionMask);

coll.dir       = dir_up;
coll.idd       = (id);
coll.type      = "chest";
coll.dir       = dir;
coll.open_char = open_char;

idd       = (coll.id);
