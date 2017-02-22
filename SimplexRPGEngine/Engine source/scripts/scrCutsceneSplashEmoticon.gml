/// scrCutsceneSplashEmoticon(obj, index, animationSpeed)

var i, I, a, o;
I = 0;
a = 0.1;
o = id;

if (argument_count > 0) {o = argument[0];}
if (argument_count > 1) {I = argument[1];}
if (argument_count > 2) {a = argument[2];}

with(o)
{
i = instance_create(x, y - 16, oEmoticon);
i.spd         = a;
i.image_index = i;
}

