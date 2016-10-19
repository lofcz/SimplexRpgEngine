#define npcAPI


#define scrNpcGetImageIndex
/// scrNpcGetImageIndex(dir, stopIndex, animationSpeed)

var dir, iI, aS;
dir = "s";
iI  = 0;
aS  = 0.3;

if (argument_count > 0) {dir = argument[0];}
if (argument_count > 1) {iI  = argument[1];}
if (argument_count > 2) {aS  = argument[2];}


if (xprevious == x && yprevious == y) {image_index = iI; return -1;}

if (dir == "s")
    {
     if (!(image_index >= 0 && image_index <= 3.99)) {image_index = 0;}
     else {image_index += aS;}
    }

if (dir == "a")
    {
     if (!(image_index >= 4 && image_index <= 7.99)) {image_index = 4;}
     else {image_index += aS;}
    }
    
if (dir == "d")
    {
     if (!(image_index >= 8 && image_index <= 11.99)) {image_index = 8;}
     else {image_index += aS;}
    }

if (dir == "w")
    {
     if (!(image_index >= 12 && image_index <= 15)) {image_index = 12;}
     else {image_index += aS;}
    }

idleImage = image_index div 3 * 3;    
return image_index;        
#define apiNpcSay
/// apiNpcSay(text)

var t;
t = "Sample text";

if (argument_count > 0) {t = argument[0];}

ds_queue_enqueue(speechQueue, t);