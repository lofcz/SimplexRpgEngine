///Saver()

var fname='mujsave.dat';
var Q=ds_queue_create();

//store data
{
//ds_queue_enqueue(Q,muj_text);
//ds_queue_enqueue(Q,string(moje_cislo));
//...
}

//file handling


F=file_text_open_write(fname);
while(!ds_queue_empty(Q))
{
  file_text_write_string(F,ds_queue_dequeue(Q));
  file_text_writeln(F);
}
file_text_close(F);





ds_queue_destroy(Q);