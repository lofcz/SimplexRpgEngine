/// scrDAudioHook(sound, fadeDistance)

var snd, fd;
snd = musicTest1;
fd  = -1;

if (argument_count > 0) {snd = argument[0];}
if (argument_count > 1) {fd  = argument[1];}

dAudioIndex  = audio_play_sound(snd, 0, false);
usesDAudio   = true;
fadeDistance = fd;
ds_list_add(oOptimize.DAudioList, id);
