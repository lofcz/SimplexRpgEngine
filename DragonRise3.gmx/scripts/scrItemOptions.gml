/// scrItemOptions()

for (a = 0; a < 10; a++)
    {
     if (itm_options[a] = "")
        {
         itm_options[a] = oInventory.drop_text;
         itm_options[a+1] = oInventory.close_text;
         break;
        }
    
    } 
           
height        = 32+string_height_ext(itm_info_text,16,256);
width         = 256;