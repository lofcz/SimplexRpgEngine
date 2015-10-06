// zobrazení loga po spuštění

global.showTime+=1;

if (global.showTime = fps * 5) // po uplinutí času
{
 room_goto(menu); // přechod do menu
 audio_play_sound(hlSound, true, true);
 instance_destroy();
}
else
{
 draw_set_color(c_white); // bíle pozadí
 draw_rectangle(0,0,room_width, room_height, 0);
 draw_sprite(sLogo,0,room_width / 2, room_height / 2); // vykreslení loga
 draw_set_font(font1);
 draw_set_color(c_gray);
 draw_text(380,64,"Pro svobodné fórum vytvořil");
 draw_text(480,660, "Tomáš Brůna");
}