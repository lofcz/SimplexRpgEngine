/// scrChestUnload()

if (instance_number((idd)) > 0)
   {
    with ((idd))
         {
          instance_destroy();
         }
   }
   
for (var i = 0; i < slots; i++)
    {
     if (instance_exists(refID[i]))
        {
         with (refID[i]) {instance_destroy();}
        }
    }
