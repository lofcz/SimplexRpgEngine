/*
P3DC (Precise 3D Collisions)
V6.00
----
NOTES:

Call this before adding any polygons to a model, this creates a new collision model.
Call p3dc_end_model() when done adding polygons. You can only be editing one model
at a time

----
Returns the id of a new model
*/
return external_call(global.p3dc_bdm);