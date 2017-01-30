/// inventoryAction(id, optionNumber, repeatTimes)

var idd, number, times;
idd    = 0;
number = 0;
times  = 1;

if (argument_count > 0) {idd    = argument[0];}
if (argument_count > 1) {number = argument[1];}
if (argument_count > 2) {times  = argument[2];}

// DB - Entries
// ********************************************************************
repeat(times)
{
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
     case (itemEnum.itemRename):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }        
      case (itemEnum.itemIdentification):
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
     case (itemEnum.itemArcaneUpgrade5):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }  
     case (itemEnum.itemEnchanter):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        } 
     case (itemEnum.itemEmendation1):
        {
         if (number == 0)
            {
             combine              = 1;
             combine_id           = itemEnum.itemSwordWooden;
             combine_default_slot = hover_idd;                  
            }     
         break;
        }  
     case (itemEnum.itemPowerWord1):
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
    case (itemEnum.itemFortuneStatuette):
        {
         if (number == 0)
            {
             instance_create(view_xview, view_yview, oFortunaMenu);
             inventoryDelete(itemEnum.itemFortuneStatuette, 1);
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
    case (itemEnum.itemSoulShard):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 9;
                 global.arg[8] = "duše";
                 global.arg[9] = 9;

                 scrQuestionShow("Upozornění", "", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemSoulShard, 9);
                     oPlayer.spellPoints++;
                     audio_play_sound(sndSoul, 0, false);
                    }
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
                 global.arg[7] = 2;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;

                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem1, 1);
                     inventoryAdd(oAlchemyDust, 2);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        } 
    case (itemEnum.itemGem2):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 5;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem2, 1);
                     inventoryAdd(oAlchemyDust, 5);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }   
    case (itemEnum.itemGem3):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 5;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem3, 1);
                     inventoryAdd(oAlchemyDust, 5);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }  
    case (itemEnum.itemGem4):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 5;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem4, 1);
                     inventoryAdd(oAlchemyDust, 5);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        } 
    case (itemEnum.itemGem5):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 5;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem5, 1);
                     inventoryAdd(oAlchemyDust, 5);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }
    case (itemEnum.itemGem6):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 10;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem6, 1);
                     inventoryAdd(oAlchemyDust, 10);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        } 
    case (itemEnum.itemGem7):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 10;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem7, 1);
                     inventoryAdd(oAlchemyDust, 10);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }
    case (itemEnum.itemGem8):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 10;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem8, 1);
                     inventoryAdd(oAlchemyDust, 10);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }
    case (itemEnum.itemGem9):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 10;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem9, 1);
                     inventoryAdd(oAlchemyDust, 10);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }   
    case (itemEnum.itemGem10):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 20;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem10, 1);
                     inventoryAdd(oAlchemyDust, 20);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }  
    case (itemEnum.itemGem11):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 20;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem11, 1);
                     inventoryAdd(oAlchemyDust, 20);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        } 
    case (itemEnum.itemGem12):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 20;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem12, 1);
                     inventoryAdd(oAlchemyDust, 20);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        } 
    case (itemEnum.itemGem13):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 20;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem13, 1);
                     inventoryAdd(oAlchemyDust, 20);
                     audio_play_sound(sndDisenchant, 0, false);
                    }
            }
         break;
        }   
    case (itemEnum.itemGem14):
        {
         if (number == 0)
            {
             if (global.QuestionResult == -1)
                {
                 global.arg[5] = idd;
                 global.arg[6] = number;
                 global.arg[7] = 50;
                 global.arg[8] = "esence";
                 global.arg[9] = 1;
                 scrQuestionShow("Upozornění", "Opravdu chceš drahokam rozložit na ", "Ano", "Ne");
                }
            else if (global.QuestionResult == 1)
                    {
                     inventoryDelete(itemEnum.itemGem14, 1);
                     inventoryAdd(oAlchemyDust, 50);
                     audio_play_sound(sndDisenchant, 0, false);
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
}    
proceed               = 0;
global.QuestionResult = -1;
