/// scrDAudioSwitchSong(songChannel, songID)

var sch, sid;
sch = DAudioEnum.channelBackground;
sid = musicTest1;

if (argument_count > 0) {sch = argument[0];}
if (argument_count > 1) {sid = argument[1];}

oHUD.DAudioSongID[sch]     = sid;
oHUD.DAudioSongSwitch[sch] = true;
