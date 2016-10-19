/// inventoryAction(id, option_numer)

var idd, number;
idd    = 0;
number = 0;

if (argument_count > 0) {idd    = argument[0];}
if (argument_count > 0) {number = argument[1];}

// DB - Entries
// ********************************************************************
switch (idd)
     {
      case (itemEnum.itemPearlRed):
        {
         if (number == 0)
            {
             show_message("optionbox is working!");
            }
            
          if (number == 1)
            {
             show_message("fucking option 1!");
            }
         break;
        }
     case (itemEnum.itemSwordWooden):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = 3;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }        
     case (itemEnum.itemElixirHP):
        {
         if (number == 0)
            {
             scrAffecstAdd("regenerationHP", secToSteps(10), 3, c_lime, 1, false); 
             inventoryDelete(itemEnum.itemElixirHP, 1);
            }
         break;
        }   
    case (itemEnum.itemElixirMP):
        {
         if (number == 0)
            {
             scrAffecstAdd("regenerationMP", secToSteps(10), 4, c_lime, 1, false); 
             inventoryDelete(itemEnum.itemElixirMP, 1);
            }
        break;
        }       
    case (itemEnum.itemGiftLof):
        {
         if (number == 0)
            {
             scrHintShow("Lof", "Obsah dárku pro vývojáře:##- 10x " + scrColorflag(c_red) + "Lektvar zdraví" + scrEndColorflag() + "#- 10x " + scrColorflag(c_aqua) + "Lektvar many" + scrEndColorflag() + "#- 10x " + scrColorflag(c_yellow) + "Esence" + scrEndColorflag() + "#- 80x " + scrColorflag(c_yellow) + "Zlatky" + scrEndColorflag() + " ");
             inventoryDelete(itemEnum.itemGiftLof, 1);
             inventoryAdd(oElixirHP, 10);
             inventoryAdd(oElixirMP, 10);
             inventoryAdd(oAlchemyDust, 10);
             inventoryAdd(oGold, 150);
            }
         break;
        } 
    case (itemEnum.itemLetter):
        {
         if (number == 0)
            {
             scrHintShow(slot_vlastnosti[hover_idd, vlastnost_dataSocket1], slot_vlastnosti[hover_idd, vlastnost_dataSocket2]);
            }
         break;
        } 
    case (itemEnum.itemGem1):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na " + scrColorflag(c_yellow) + "2 esence" + scrEndColorflag() + "?", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem1, 1);
                     inventoryAdd(oAlchemyDust, 2);
                    }
            }
         break;
        } 
    case (itemEnum.itemShuriken):
        {
         if (number == 0)
            {
             scrThrowItem(itemEnum.itemShuriken - 1, 8, 20, 10);
             inventoryDelete(itemEnum.itemShuriken, 1);
            }
         break;
        } 
    case (itemEnum.itemRelicRightPart):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemRelicLeftPart;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }  
    case (itemEnum.itemRelicLeftPart):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemRelicRightPart;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }
    default:
        {
         show_message("Something in scrAction, switch statement went wrong :/#(probably unassigned action, check inventoryActions)");
         break;
        }
    }
    
proceed               = 0;
global.QuestionResult = -1;
