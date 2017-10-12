/// @function libUtilityReadFile(file)
/// @desc Reads target file and returns array with lines
/// @arg {file} file File to use

var tmp_file, tmp_array, tmp_line;
tmp_file = file_text_open_read(working_directory + argument0);
tmp_line = 0;

while(!file_text_eof(tmp_file))
{
	tmp_array[tmp_line] = file_text_readln(tmp_file);
	tmp_line++;
}

file_text_close(tmp_file);

return tmp_array;