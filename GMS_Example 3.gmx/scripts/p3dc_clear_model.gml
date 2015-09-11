/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Call this to clear the polygons in a model, freeing the memory it uses.
Note that this doesn't actually DELETE the model, it just clears all the
data contained within it.

----
ARGUMENTS:

Arg0: P3DC Model ID

----
EXAMPLE:

p3dc_clear_model(BOSS_WE_WILL_NEVER_SEE_AGAIN_MODEL);
*/
p3dc_begin_replace(argument0);
p3dc_end_replace();
