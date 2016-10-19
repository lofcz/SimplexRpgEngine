/// scrGameSave(filename, dataFilename)

var f, df;
f  = "gameData1.dat";
df = "gameData2.dat";

if (argument_count > 0) {f  = argument[0];}
if (argument_count > 1) {df = argument[1];}

// Save game state
game_save(f);

// Save generic structures
with(oHUD)
    {
     // Erase / create file
     file = file_text_open_write(df);
     file_text_write_string(file, "");
     file_text_close(file);
     
     // Write actual data
     var tempStr;
     tempStr[0] = ds_list_write(craftingKnownItems);
     tempStr[1] = ds_list_write(craftingKnownMaterials);
     tempStr[2] = ds_list_write(craftingKnownAlchemy);
     tempStr[3] = ds_list_write(oState.list); 
     tempStr[4] = ds_list_write(oState.list_alpha);     
     file       = file_text_open_append(df);
     
     for (i = 0; i < array_length_1d(tempStr); i++)
        {
         file_text_write_string(file, tempStr[i]);
         file_text_writeln(file);
        }
     
     file_text_close(file);
    }
