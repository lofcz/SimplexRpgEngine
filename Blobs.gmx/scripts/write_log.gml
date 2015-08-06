///write_log(anything);

F=file_text_open_append('debug.log');
file_text_write_string(F,string_computer_time()+': '+string(argument0));
file_text_writeln(F);
file_text_close(F);

return(true);