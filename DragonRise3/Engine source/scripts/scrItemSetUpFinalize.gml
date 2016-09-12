/// scrItemSetUpFinalize(addRarityToName)

var artn;
artn = false;

if (argument_count > 0) {artn = argument[0];}

for (a = 0; a < 10; a++)
    {
     if (itm_options[a] = "")
        {
         itm_options[a]   = oInventory.star_text;
         itm_options[a+1] = oInventory.drop_text;
         itm_options[a+2] = oInventory.close_text;
         
         break;
        }
    
    } 
           
height        = 32+string_height_ext(itm_info_text,16,256);
width         = 256;
vlastnost[vlastnost_maxUpgrade] = vlastnost[vlastnost_upgradeSloty];
vlastnost[vlastnost_originalniCena] = vlastnost[vlastnost_cena];

if (artn) {scrItemRarity();}


