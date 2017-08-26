/// @desc [Simplex description line]

g_queue = ds_queue_create();
g_list = ds_list_create();
v_surf = surface_create(600, 400);
v_timer = 100;

ds_queue_enqueue(g_queue, "Tohle je");
ds_queue_enqueue(g_queue, "Tohle je 1");
ds_queue_enqueue(g_queue, "Tohle je 2");
ds_queue_enqueue(g_queue, "Tohle je 3");
