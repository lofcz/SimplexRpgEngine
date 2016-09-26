#define roomAPI
/// roomAPI()
/*

- roomCreation(camera,controller)
 
  Initialise the room

#define roomCreation
/// roomCreation(mapType)

randomize();
var mt;
mt = mapEnum.mapExterier;

if (argument_count > 0) {mt= argument[0];}

global.mapType = mt;

if (instance_number(oCamera) == 0)
   {
     instance_create(0,0,oCamera);
   }
if (instance_number(oController) == 0)
   {
     instance_create(0,0,oController);
   }
if (instance_number(oBestiar) == 0)
   {
     instance_create(0,0,oBestiar);
   }
if (instance_number(oScreenShader) == 0)
   {
     instance_create(0,0,oScreenShader);
   }
if (instance_number(oState) == 0)
   {
     instance_create(0,0,oState);
   }
if (instance_number(oInventory) == 0)
   {
     instance_create(0,0,oInventory);
   }
if (instance_number(oQuest) == 0)
   {
     instance_create(0,0,oQuest);
   }
if (instance_number(oTalentMenu) == 0)
   {
     instance_create(0,0,oTalentMenu);
   }
if (instance_number(oSpellMenu) == 0)
   {
     instance_create(0,0,oSpellMenu);
   }
if (instance_number(oStatusMenu) == 0)
   {
     instance_create(0,0,oStatusMenu);
   }
   
global.shaders_enabled = true;

#define roomNpcAdd
/// roomNpcAdd(room, x, y, instance)

var xx, yy, i, r, I;
xx = 0;
yy = 0;
i  = -1;
r  = -1;

if (argument_count > 0) {r  = argument[0];}
if (argument_count > 1) {xx = argument[1];}
if (argument_count > 2) {yy = argument[2];}
if (argument_count > 3) {i  = argument[3];}

I = room_instance_add(r, xx, yy, i);
ds_queue_enqueue(oController.persistenceQueue, I);
ds_queue_enqueue(oController.persistenceQueue, i.status);
ds_queue_enqueue(oController.persistenceQueue, i.substatus);