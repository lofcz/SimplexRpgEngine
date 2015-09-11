/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

This allows surfaces to have masks, or represent objects. You can give
triangles values (integers) and those integers represent different surfaces.
This can be used to make ponds of water/lava, or in a racing game to detect
when the player runs off the track and onto grass, or when he runs into spikes,
or where you shoot an enemy (head, torso, arm, leg, hand, foot) etc.

Every triangle/shape that you add AFTER this is called will have this ID until
it is changed again. Look at the example below.

Set this to "-1" to represent no surface

To be used with p3dc_get_lastmask

----
RETURNS:

Nothing
*/
return external_call(global.p3dc_stm,argument0);