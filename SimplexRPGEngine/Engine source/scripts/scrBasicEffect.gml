///scrBasicEffect(number, sprite, x, y)

randomize();

var sprite, number, ef, xx, yy;
sprite = sHealthEffect2;
number = irandom_range(3,4);
xx     = x;
yy     = y;

if (argument_count > 0) {number = argument[0];}
if (argument_count > 1) {sprite = argument[1];}
if (argument_count > 2) {xx     = argument[2];}
if (argument_count > 3) {yy     = argument[3];}

repeat(number)
              {
               ef = instance_create(xx-random(30)+random(30),yy-random(20),oBasicEffect);
               ef.sprite_index = sprite;
               ef.image_speed = random_range(0.3,0.5);
              }
