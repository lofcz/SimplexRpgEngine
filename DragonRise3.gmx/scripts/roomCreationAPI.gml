#define roomCreationAPI
/// apiRoomCreation()
/*

- roomCreation(camera,controller)
 
  Initialise the room

#define roomCreation
/// roomCreation(camera,controller)
randomize();


camera     = 1;
controller = 1;


if (argument_count > 0) {camera        = argument[0];}
if (argument_count > 1) {controller    = argument[1];}


if (instance_number(oCamera) = 0 && camera = 1)
   {
     instance_create(0,0,oCamera);
   }
if (instance_number(oController) = 0 && controller = 1)
   {
     instance_create(0,0,oController);
   }
if (instance_number(oBestiar) = 0)
   {
     instance_create(0,0,oBestiar);
   }
if (instance_number(oScreenShader) = 0)
   {
     instance_create(0,0,oScreenShader);
   }
if (instance_number(oState) = 0)
   {
     instance_create(0,0,oState);
   }
if (instance_number(oInventory) = 0)
   {
     instance_create(0,0,oInventory);
   }
if (instance_number(oQuest) = 0)
   {
     instance_create(0,0,oQuest);
   }