/// scrQuestionShow(title, text, buttonTextYes, buttonTextNo)

var text, bt, bt2, t;
text  = "Sample text";
bt    = "Yes";
bt2   = "No";
t     = "Confirmation";

if (argument_count > 1) {text = argument[1];}
if (argument_count > 2) {bt   = argument[2];}
if (argument_count > 3) {bt2  = argument[3];}
if (argument_count > 0) {t    = argument[0];}

global.arg[0] = text;
global.arg[1] = bt;
global.arg[2] = bt2;
global.arg[3] = t;

if (instance_number(oHintBox) == 0)
    {
     i = instance_create(x, y, oHintBox);
     with(i) 
        {
        mode  = "question";
        text  = global.arg[0];
        btn1  = global.arg[1];
        btn2  = global.arg[2]; 
        title = global.arg[3];
        }
    }

