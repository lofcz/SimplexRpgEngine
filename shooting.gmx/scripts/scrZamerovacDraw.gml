// zaměřovač



/*
if (room = room2)
{
 draw_set_color(c_black);
draw_rectangle(0,0,x - 150,room_width, 0); // levý
draw_rectangle(1024, 0, x + 150, 736, 0); // pravý
draw_rectangle(x - 150, 0, x + 150, y - 150, 0); // horní
draw_rectangle(x - 150, room_height, x + 150, y + 150, 0); // dolní
}
*/


// munice
xx = 768;
repeat(lives)
{
 draw_sprite(sKulka,0,xx,608);
 xx+=20;
}


draw_set_color(c_yellow);
draw_rectangle(0, 704,1024, room_height, 0);
draw_set_color(c_black);
draw_set_font(score_font);
draw_text(96,714, "score: " + string(score) + "       destroyed: " + string(global.destroyed) + "       time: " + string(global.sec));