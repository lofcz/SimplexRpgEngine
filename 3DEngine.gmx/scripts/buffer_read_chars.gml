var anz,buff;
buff = argument0;
anz = argument1;
var ret;
ret = "";
var h;
for(h=1;h<=anz;h+=+1){ 
    ret=ret+chr(buffer_read(buff, buffer_u8));
}
return ret;