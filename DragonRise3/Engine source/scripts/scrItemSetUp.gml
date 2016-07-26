/// scrItemSetUp(animationSpeed, show_number, id)

var in;
animate     = 0;
show_number = 0;
points      = 0;
in          = 0;

if (argument_count > 0) {animate     = argument[0];}
if (argument_count > 1) {show_number = argument[1];}
if (argument_count > 2) {in          = argument[2];}



image_speed = animate;
scrItemBasic(in);

