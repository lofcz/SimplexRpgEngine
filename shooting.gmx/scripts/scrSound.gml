

if mouse_check_button_pressed(mb_left)
{
 if (lives >= 1)// pokud je nabito
 {
   audio_play_sound(firing, true, 0); // rána
 }
}