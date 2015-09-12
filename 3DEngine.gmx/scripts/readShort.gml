ne1=file_bin_read_byte(re);
ne2=file_bin_read_byte(re);
//ne1=1;
//ne2=1;
//ne3=1;
//ne4=1;
ne=(ne2 << 8) + ne1;
return ne;