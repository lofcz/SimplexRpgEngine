/// number_format(num,places,dec,sep)
//
//  Returns a string representing the given number rounded to
//  a number of decimal places and using the given characters
//  for decimal mark and thousands separator.
//
//      num         number, real
//      places      places to round to, real
//      dec         decimal mark, string
//      sep         thousands separator, string
//

    var n,places,dec,sep,out,pos,i;
    n = argument0;
    places = argument1;
    dec = argument2;
    sep = argument3;
    if (!is_string(dec)) dec = ".";
    if (!is_string(sep)) sep = ",";
    out = string_format(abs(n),0,places);
    pos = string_pos(".",out);
    if (pos == 0) pos = string_length(out)+1;
    else out = string_replace(out,".",dec);
    for (i=pos-3; i>1; i-=3) out = string_insert(sep,out,i);
    if (n < 0) out = "-" + out;
    return out;
