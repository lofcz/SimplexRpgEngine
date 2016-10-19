#define scrSetParamsArray
/// scrSetParamsArray(arg1, arg2...)

for (var i = 0; i < 16; i++)
    {
     if (argument_count > i)
        {
         global.tempArg[i] = argument[i];
        }
     else {break;}
    }

#define scrGetParamsArray
/// scrGetParamsArray(i)

var i;
i = 0;

if (argument_count > 0) {i = argument[0];}

return (global.tempArg[i]);