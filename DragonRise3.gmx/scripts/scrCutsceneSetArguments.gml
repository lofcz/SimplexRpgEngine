/// scrCutsceneSetArguments(id, arg[0], arg[1], arg[2]...)

for (i = 0; i < 10; i++)
    {
    global.cutsceneArgument[argument[0], i] = 0;
    }
    
for (i = 1; i < argument_count; i++)
    {
global.cutsceneArgument[argument[0], i-1] = argument[i];
    }
