/// scrCutsceneSplashMessage(obj, text, time, lerpSpeed)

var obj,text, time, ls;
obj  = self;
text = "Sample text";
time = 50;
ls   = 0.1;

if (argument_count > 0) {obj   = argument[0];}
if (argument_count > 1) {text  = argument[1];}
if (argument_count > 2) {time  = argument[2];}
if (argument_count > 3) {ls    = argument[3];}

obj.mood                    = "cutscene";
obj.splashMessage           = text;
obj.splashMessageTime       = time;
obj.splashMessageAlphaSpeed = ls;
