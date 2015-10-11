/// inventoryOptionsSetUp(close_text,drop_text,star_text_mark,start_text_unmark)

var cT,dT,sTM,sTU;

cT  = "Zavřít";
dT  = "Zahoď";
sTM = "Označit";
sTU = "Odznačit";

if (argument_count > 0) {cT  = argument[0];}
if (argument_count > 1) {dT  = argument[1];}
if (argument_count > 2) {sTM = argument[2];}
if (argument_count > 3) {sTU = argument[3];}

close_text = cT;
drop_text  = dT;
star_text  = sTM;
star_text2 = sTU;


