#define scrItemSetDataSockets
/// scrItemSetDataSockets(value1, value2...)

for (var i = 0; i < 16; i++)
    {
     if (argument_count > i)
        {
         vlastnost[vlastnost_dataSocket1 + i] = argument[i];
        }
     else {break;}
    }

#define scrItemSetTextSockets
/// scrItemSetTextSockets(value1, value2...)

for (var i = 0; i < 16; i++)
    {
     if (argument_count > i)
        {
         vlastnost[vlastnost_textSocket1 + i] = argument[i];
        }
     else {break;}
    }