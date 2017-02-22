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

if (!isStanding) {image_speed = 0.2;}
else {image_speed = 0;}

if (xprevious == x && yprevious == y && !isStanding) {image_index = image_index div (framesPerSide) * (framesPerSide); image_speed = 0; return -1;}

if (dir == "s")
    {
     if (!(image_index >= 0 && image_index <= framesPerSide - 0.01)) {image_index = 0;}
    }

if (dir == "a")
    {
     if (!(image_index >= framesPerSide && image_index <= (framesPerSide * 2) - 0.01)) {image_index = framesPerSide;}
    }
    
if (dir == "d")
    {
     if (!(image_index >= framesPerSide * 2 && image_index <= (framesPerSide * 3) - 0.01)) {image_index = framesPerSide * 2;}

    }

if (dir == "w")
    {
     if (!(image_index >= framesPerSide * 3 && image_index <= (framesPerSide * 4) - 0.01)) {image_index = framesPerSide * 3;}
    }

idleImage = image_index div (framesPerSide - 1) * (framesPerSide - 1);    
return image_index;        

#define apiNpcSay
/// apiNpcSay(text)

var t;
t = "Sample text";

if (argument_count > 0) {t = argument[0];}

ds_queue_enqueue(speechQueue, t);