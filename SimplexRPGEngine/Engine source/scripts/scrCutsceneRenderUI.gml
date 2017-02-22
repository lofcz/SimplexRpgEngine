/// scrCutsceneRenderUI(doRender, doLerp)

var r, l;
r = false;
l = false;

if (argument_count > 0) {r = argument[0];}
if (argument_count > 1) {l = argument[1];}

if (l) {oHUD.draw = r;}
else {if (r) {oHUD.hudAlpha = 1; oHUD.draw = true;} else {oHUD.hudAlpha = 0; oHUD.draw = false;}}
