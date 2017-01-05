/// sfx(sound)

var snd;
snd = -1;

if (argument_count > 0) {snd = argument[0];}

audio_play_sound(snd, 0, false);
