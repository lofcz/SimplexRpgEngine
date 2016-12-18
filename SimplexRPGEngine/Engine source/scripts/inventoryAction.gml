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
     case (itemEnum.itemWhetstone):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }
     case (itemEnum.itemArcaneUpgrade1):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }
     case (itemEnum.itemArcaneUpgrade2):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        } 
     case (itemEnum.itemArcaneUpgrade3):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }
     case (itemEnum.itemArcaneUpgrade4):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
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
    case (itemEnum.itemElixirStamina):
        {
         if (number == 0)
            {
             scrAffecstAdd("regenerationST", secToSteps(10), 6, c_lime, 1, false); 
             inventoryDelete(itemEnum.itemElixirStamina, 1);
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
             inventoryAdd(oGold, 80);
            }
         break;
        }
    case (itemEnum.itemGift2):
        {
         if (number == 0)
            {
             scrHintShow("Lof", "Ultimátní, megapekelný dárek pro backery Simplexu:##- 10x " + scrColorflag(c_red) + "Lektvar zdraví" + scrEndColorflag() + "#- 10x " + scrColorflag(c_aqua) + "Lektvar many" + scrEndColorflag() + "#- 60x " + scrColorflag(c_yellow) + "Esence" + scrEndColorflag() + "#- 160x " + scrColorflag(c_yellow) + "Zlatky" + scrEndColorflag() + " ");
             inventoryDelete(itemEnum.itemGift2, 1);
             inventoryAdd(oElixirHP, 10);
             inventoryAdd(oElixirMP, 10);
             inventoryAdd(oAlchemyDust, 60);
             inventoryAdd(oGold, 160);
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
    case (itemEnum.itemPouch):
        {
         if (number == 0)
            {
             var v = scrDiceGetValue(5, 30, 30, 3);
             scrLog("+ " + string(v) + " " + scrInflect("zlatka", v), c_yellow, sCoin);
             inventoryDelete(itemEnum.itemPouch, 1);
             apiPlayerSetGold(v);
             audio_play_sound(sndPouch1, 0, false);
            }
         break;
        }
    case (itemEnum.itemFoodMilk):
        {
         if (number == 0)
            {
             if (scrAffectsGetStacks("vivid") == -1)
             {
             inventoryDelete(itemEnum.itemFoodMilk, 1);
             stateAddEntry("Vypil jsem mléko.");
             apiPlayerGetHealth(slot_vlastnosti[hover_idd, vlastnost_healHp]);
             scrAffecstAdd("vivid", secToSteps(2), 5, c_yellow, 1, false);
             }
            }
         break;
        }    
    case (itemEnum.itemInventoryExtension):
        {
         if (number == 0)
            {
             inventoryDelete(itemEnum.itemInventoryExtension, 1);
             inventoryExtend(oInventory.slotsPerPage);

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
