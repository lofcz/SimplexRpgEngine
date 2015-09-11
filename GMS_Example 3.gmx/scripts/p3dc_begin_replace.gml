/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Replacing models will delete the existing one, and can vary in size from before
it was cleared. Use the add functions with replacing.
Overwriting models can only modify existing data. It is faster and does not clear
any of the existing data, but may not change the size of the model.

----
ARGUMENTS:

Arg0: P3DC Model ID

----
returns nothing
*/
return external_call(global.p3dc_brm,argument0);