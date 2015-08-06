//with(oMessage) instance_destroy()

if instance_exists(oMessage)
{
    oMessage.alarm[0]=45
    oMessage.str+="#"+argument0
   // oMessage.count=argument1;
    
}
else
{
    p=instance_create(room_width/2,room_height/2,oMessage)
    p.str=argument0
   p.count=argument1;

}
