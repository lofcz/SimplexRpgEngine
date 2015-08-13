#define enemyAPI


#define scrEnemyGetPosition
/// scrEnemyGetPosition()

doo = 1;

while(doo)
          {
            dir = irandom_range(1,4);
            
            if (dir = 1 && place_empty(x+sprite_get_width(sprite_index),y))
               {
                tar_x = x+sprite_get_width(sprite_index);
                tar_y = y;
                doo = 0;
               }
            if (dir = 2 && place_empty(x-sprite_get_width(sprite_index),y))
               {
                tar_x = x-sprite_get_width(sprite_index);
                tar_y = y;
                doo = 0;

               }
            if (dir = 3 && place_empty(x,y+sprite_get_height(sprite_index)))
               {
                tar_x = x;
                tar_y = y+sprite_get_height(sprite_index);
                doo = 0;

               }
            if (dir = 4 && place_empty(x,y-sprite_get_height(sprite_index)))
               {
                tar_x = x;
                tar_y = y-sprite_get_height(sprite_index);
                doo = 0;
               }

          
          }
