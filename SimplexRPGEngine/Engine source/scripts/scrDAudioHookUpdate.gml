/// scrDAudioHookUpdate()

var volume = (1 - (distance_to_object(oPlayer) / fadeDistance));
audio_sound_gain(dAudioIndex, volume, 0);
