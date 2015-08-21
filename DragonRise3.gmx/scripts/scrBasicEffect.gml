///scrBasicEffect(number,sprite)

randomize();

var sprite,number,ef;
sprite = sHealthEffect2;
number = irandom_range(3,4);

repeat(number)
              {
               ef = instance_create(x-random(30)+random(30),y-random(20),oBasicEffect);
               ef.sprite_index = sprite;
               ef.image_speed = random_range(0.3,0.5);
              }