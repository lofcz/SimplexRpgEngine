/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Overwriting models can only modify existing data. It can be used for parts
of the model that move (an elevator for example). Not every triangle needs
to be overwritten, you can choose to only overwrite parts of the model. An
elevator on a level for example.

YOU SHOULD NEVER overwrite a model that has been split. You will get undefined
behaviour if you do this.

----
Arg0: The model ID to start overwriting
Arg1: The Model TLID to start overwriting at
*/
return external_call(global.p3dc_obd,argument0,argument1);
