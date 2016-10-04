#define scrSetActiveComponent
/// scrSetActiveComponent(active)

var a;
a = true;

if (argument_count > 0) {a = argument[0];}

oHUD.activeComponent = a;

#define scrSetActiveTempComponent
/// scrSetActiveTempComponent(active)

var a;
a = true;

if (argument_count > 0) {a = argument[0];}

oHUD.tempComponent = a;
