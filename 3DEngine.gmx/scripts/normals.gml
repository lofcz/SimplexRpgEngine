s=file_text_open_read("normals.txt");
b=0;
while !file_text_eof(s) {
str=file_text_read_string(s);
if string_char_at(str,2)!=" "
global.n[b,0]=real(string_copy(str,2,9));
else global.n[b,0]=real(string_copy(str,3,8));
if string_char_at(str,14)!=" "
global.n[b,1]=real(string_copy(str,14,9));
else global.n[b,1]=real(string_copy(str,15,8));
if string_char_at(str,26)!=" "
global.n[b,2]=real(string_copy(str,26,9));
else global.n[b,2]=real(string_copy(str,27,8));
b+=1;
file_text_readln(s);
}
file_text_close(s)