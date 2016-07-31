#define scrBuildPrefab
/// scrBuildPrefab(x, y, prefab, completedStructure)

var xx, yy, pf, cs
xx = x;
yy = y;
pf = "basicStructure";
cs = false;

pf =  working_directory + "/myPrefab.simplexPrefab";

f = file_text_open_read(pf);

while (!file_text_eof(f))
    {
    line = file_text_readln(f);
    scrBuildPrefabParseLine(xx, yy, line);
    yy += 32;
    }
file_text_close(f);

#define scrBuildPrefabParseLine
/// scrBuildPrefabParseLine(x, y, string)

var line, xx, yy;
line = "";
xx   = x;
yy   = y;

if (argument_count > 0) {line = argument[2];}
if (argument_count > 1) {xx   = argument[0];}
if (argument_count > 2) {yy   = argument[1];}

// Parse comments
if (string_pos("//", line) == 1)
    {
     return -1;
    }
    
if (string_pos("///", line) == 1)
    {
     show_message("Parsing prefab structure:#" + line);
     return -1;
    }
    
for (i = 0; i < string_length(line); i++)
    {
     if (string_char_at(line, i) == '#')
        {
         instance_create(xx, yy, oFence);
        }
     if (string_char_at(line, i) == '.')
        {
         i = instance_create(xx, yy, oFence);
         i.image_angle = 270;
        }
     xx += 32;
    }