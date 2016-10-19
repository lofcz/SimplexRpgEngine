/// scrNotificationSplash(header, text, imageIndex)

var inst, h, t, i;
h = "Sample";
t = "text";
i = medalEnum.quest;

if (argument_count > 0) {h = argument[0];}
if (argument_count > 1) {t = argument[1];}
if (argument_count > 2) {i = argument[2];}
 

inst = instance_create(view_xview, view_yview, oAchievement);
inst.header    = string(h);
inst.text      = string(t);
inst.index     = real(i);
inst.medalType = 0;  
