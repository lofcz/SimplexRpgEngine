/// scrGameLoad(filename, dataFilename)

var f, df;
f  = "gameData1.dat";
df = "gameData2.dat";

if (argument_count > 0) {f  = argument[0];}
if (argument_count > 1) {df = argument[1];}

// Load game state
game_load(f);

// Load generic structures
with(oHUD)
    {
     // Open file
     file = file_text_open_read(df);
     
     // Read entire text
     var tempStr, i;
     i = 0;
     
     while (!file_text_eof(file))
        {
         tempStr[i] = file_text_readln(file);
         i++;        
        }
        
     // Assign loaded data
     ds_list_read(craftingKnownItems,     tempStr[0]);
     ds_list_read(craftingKnownMaterials, tempStr[1]);
     ds_list_read(craftingKnownAlchemy,   tempStr[2]);     
     ds_list_read(oState.list,            tempStr[3]);  
     ds_list_read(oState.list_alpha,      tempStr[4]);  
     
     // Close file
     file_text_close(file);
    }
