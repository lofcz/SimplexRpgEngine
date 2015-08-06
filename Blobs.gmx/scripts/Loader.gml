///Loader()
var fname='mujsave.dat';
var Q=ds_queue_create();

//file handling

if file_exists(fname)
{
F=file_text_open_read(fname);
while(!file_text_eof(F))
{
ds_queue_enqueue(Q,file_text_read_string(F));
file_text_readln(F);
}
file_text_close(F);
}

show_debug_message(fname+': '+string(ds_queue_size(Q))+' loaded.');

//restore
{
//muj_text=ds_queue_dequeue(Q);
//moje_cislo=real(ds_queue_dequeue(Q));
}


ds_queue_destroy(Q);