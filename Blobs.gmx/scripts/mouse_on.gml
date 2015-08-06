///mouse_on()

//                             //
//      TomBen script pack     //
//      © TomBen 2013          //
//                             //


// version: GML 8.0

//Použití:
//mouse_on()
//
//vrací true pokud je myš nad spritem objektu
//vrací false pokud myš není nad spritem objektu

if sprite_index==-1
{
return(false);
}
else
{
return (collision_point(mouse_x,mouse_y,all,1,0)==id); 
}



//end