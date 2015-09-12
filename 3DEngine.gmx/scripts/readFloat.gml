ne1=file_bin_read_byte(re);
ne2=file_bin_read_byte(re);
ne3=file_bin_read_byte(re);
ne4=file_bin_read_byte(re);
//little-endian: 4321.
//if one way: ne1 is exp followed by 7 bits of the exponent.
//ne2 is 1 bit of the exponent followed by 7 bits of mantissa.
//
csign=(ne4 & 128)>>7;
cexp=(ne4 & 127)<<1;
cexp+=(ne3&128)>>7;
cexp-=127;

n3p2=(ne3&127);
cmant=(((n3p2<<8)+ne2)<<8)+(ne1);
stre=string_length(string(cmant));
cmant2=1;
for(a=0;a<23;a+=1) {
fe=(cmant>>(22-a))&1;
if fe cmant2+=(1/power(2,a+1));
}
if csign=0 {
ne=cmant2*power(2,cexp);
}
else ne=-cmant2*power(2,cexp);


return ne;