/// scrHintShow(title, text, buttonText)

var title, text, i, bt;
title = "Title";
text  = "Sample text";
bt    = "Ok";

if (argument_count > 0) {title = argument[0];}
if (argument_count > 1) {text  = argument[1];}
if (argument_count > 2) {bt    = argument[2];}

global.arg[0] = title;
global.arg[1] = text;
global.arg[2] = bt;

if (instance_number(oHintBox) == 0)
    {
     i = instance_create(x, y, oHintBox);
     with(i) 
        {
        ds_queue_enqueue(titleQueue, global.arg[0]);
        ds_queue_enqueue(textQueue,  global.arg[1]);    
        ds_queue_enqueue(btQueue,  global.arg[2]);         
        }
    }
else 
    {
     with(oHintBox) 
        {
        ds_queue_enqueue(titleQueue, global.arg[0]);
        ds_queue_enqueue(textQueue,  global.arg[1]);  
        ds_queue_enqueue(btQueue,  global.arg[2]);               
        }    
    }
