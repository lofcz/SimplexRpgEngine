/* 
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Adds an external D3D model to the current model; Current model is returned by the last called p3dc_begin_model();
You usually want to sent The models X,Y,Z to 0, unless they are non moving objects such as trees. The model will
rotate itself around where you place it. So if you place it at 0,0,0 then the model will be rotated around [0,0,0]
The model gets rotated by the direction in a vector declared in p3dc_set_modrot(<...>);
        
----
RETURNS:
Returns the triangle location identifier (Triangle LID).
Only used for overwriting models after they've been created.

UNLESS it is one of the following values...

1: model not found
2: Models version is not correct/incorrect formatting
3: Model contains no DATA
4: Failed opening the model file for reading (it was found)
5: Unsupported data is contained within the model (pointlist etc.)

----
ARGUMENTS:

Arg0: Path to the model
Arg1: Model X
Arg2: Model Y
Arg3: Model Z
For model rotation call p3dc_set_modrot(<...>);
*/
return external_call(global.p3dc_apm,argument0,argument1,argument2,argument3);
