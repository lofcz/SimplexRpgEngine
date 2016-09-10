#define scrSpellDraw
/// scrSpellDraw(spell, x, y);

var spell, xx, yy;
spell = SpellEnum.spellFlash;
xx    = x;
yy    = y; 

if (argument_count > 0) {spell = argument[0];}
if (argument_count > 1) {xx    = argument[1];}
if (argument_count > 1) {yy    = argument[2];}

fnt();
clr(c_white, draw_get_alpha());
draw_text(view_xview + xx, view_yview + yy - 24, spellDetails[spell, 10]); // Spell name
//draw_sprite_ext(sSpells, spellDetails[spell,1], view_xview + xx + 32, view_yview + yy + 32, choosenSpellScale, choosenSpellScale, 0, c_white, draw_get_alpha()); // Spell sprite
//draw_sprite_ext(sSpellsFrame, 0, view_xview + xx + 32, view_yview + yy + 32, choosenSpellScale, choosenSpellScale, 0, c_white, draw_get_alpha());

if(surface_exists(front_surface) && surface_exists(back_surface)) //Again, ALWAYS check for this!
{
  var _tex;
  if(flip_angle>270 || flip_angle<90)
    _tex=surface_get_texture(front_surface); //This pulls the texture coordinates from the texture pages so that it
  else                                       //can be used when drawing textured primitives.  Depending on the angle
    _tex=surface_get_texture(back_surface);  //we draw the card with the front or the back. 
  
  ///Now comes the complicated part.  

  var _x=0; //Gonna draw the card in the middle of the screen.
  var _y=0;
  var _w=card_width;
  var _h=card_height;
  
  draw_set_color(c_white); ///You can change the color of the cards using draw_set_color.
  
  d3d_set_projection_perspective(0,view_hview,view_wview,-view_hview,0); //This makes the card look "3D" when it's rotated.  
                                                                          //Oddly, projection_perspective flips the y coordinate system for some reason.
                                                                          //To correct for that, we position the projection at the bottom of the screen (2nd argument)
                                                                          //And then set the height to be the negative height of the room (4th argument).  Strange,
                                                                          //I know... but necessary.
                                                                          
                                                                          //Remember to set back to "Ortho" when you are done. (See Line 66)
                         
  d3d_transform_set_rotation_y(flip_angle);   //Angle in degrees
  //d3d_transform_add_rotation_x(flip_angle); //You can uncomment these if you want the flip to be crazier.  Notice how it is "transform_ADD" rather than "SET"
  //d3d_transform_set_rotation_z(flip_angle); //You should only use "SET" once, and then add additional transforms afterwards.
                                              //Try uncommenting these additional rotations one at time to see which each does.
                                              //If you comment out the "Y" transform, make sure to change the top transform to a SET from an ADD
  
  /**************************************
  Okay, something that needs to be explained about the next block of code.  When you are using d3d functions, it's sort of like drawing to a 
  surface.  0,0 is essentially the "origin" that you are drawing around.  So you draw it like it was on a boundless surface (so drawing to negative
  coordinates is okay as you can see in the draw_vertex calls below), and then you use d3d_transform_add_TRANSLATION to move it where you want it
  in the ROOM.  What's strange about this, is you do the translation BEFORE you draw, or -at the very least- before calling d3d_transform_set_identity()
  I know these sounds complicated, but just sort of "get used to it" and you can copy and paste this any time you need this functionality.  
  **************************************/
  
  //d3d_transform_add_translation(_x,_y,0); //This is where I actually want to draw the card; centered on _x,_y which is the center of the room.
  d3d_transform_add_translation(xx + 20,yy + 80,0); //Or I can have it follow the mouse!
  
  
  //So now we draw the card itself using a primitive.  However, you can draw ANYTHING you want here!  Sprites, Shapes (lines, circles, rectangles).  Give it a shot!
  
  //Draw Textured Card
  draw_primitive_begin_texture(pr_trianglefan,_tex)
  {
    //Gonna draw the vertices clockwise starting in the top left corner.
    draw_vertex_texture_colour(-_w,-_h,0,0,c_white,bacAlpha);
    draw_vertex_texture_colour(_w ,-_h,1,0,c_white,bacAlpha);
    draw_vertex_texture_colour(_w , _h,1,1,c_white,bacAlpha);
    draw_vertex_texture_colour(-_w, _h,0,1,c_white,bacAlpha);
  }
  draw_primitive_end();
  
  
  //Uncomment this block and comment out the primitive begin/end to see a shape example..
  /*draw_set_color(c_red)
  draw_rectangle(-_w,-_h,_w,_h,true);
  draw_circle(0,0,_w,false);
  draw_set_color(c_teal)
  draw_line(-_w,-_h,_w,_h);*/
  
  //Uncomment this block and comment out the other blocks to see a sprite example.
 // draw_sprite(spr_card_front,0,-_w,-_h);
  
  
  d3d_transform_set_identity(); //This "ends" the d3d translation.  It's a little strange, but basically when you are done using d3d_transform stuff and drawing, call this.
  d3d_set_projection_ortho(0, 0, view_wview, view_hview, 0); //If you are changing the projection up above to get the cool "perspective" look, you need to set it back here.

  //And that's it!
  
}

//xx += view_xview;
//yy += view_yview;

     maxVerticles = 360;
     choosenSpellScale = lerp(choosenSpellScale, 1.1, 0.1);
     verticles = ((maxVerticles / 5) * (spellLevel[spell, 0]));
     realVerticles = min(lerp(realVerticles, verticles + 1, 0.1), verticles);
     color = make_colour_rgb(255 - ((realVerticles / maxVerticles) * 255), (realVerticles / maxVerticles) * 255, 0);
      
     draw_ring_part(xx + 20, yy + 80, 128, 4, maxVerticles, realVerticles, 90, 360, -1, color, false, draw_get_alpha());
      draw_ring_part(xx + 20, yy + 80, 132, 2, maxVerticles, realVerticles, 90, 360, -1, c_black, false, draw_get_alpha());
  
     // level UP
     if (realVerticles >= maxVerticles)
        {
         spellLevel[spell, 0] = 0;
         spellLevel[spell, 1]++;
         audio_play_sound(sndSpellLevelUp, 0, false);
         flip_angle = 0;
         effectSpellLevelUp(xx, yy + 80 + 64, 20);
         
         if (spellLevel[spell, 1] == 1)
         {
         spellDetails[spell, 1] = spellDetails[spell, 3];
         }
         else
         {
          spellDetails[spell, 1] = spellDetails[spell, 5];
         }
        }

if (mouse_in(xx + view_xview, xx + 64 + view_xview, yy + view_yview, yy + 64 + view_yview))
    { 
     // Adjust hover scale  
     // Draw details form
     clr(c_black, min(hoverAlpha, 0.3));
     draw_roundrect(view_xview + 10, view_yview + 400, view_xview + view_wview - 10, view_yview + 600 - 10, false);
     clr(c_white, draw_get_alpha());
    
     if (mouse_check_button_pressed(mb_left) && mode == "in")
        {
         event_user(0);
        }
     if (mouse_check_button_pressed(mb_right) && mode == "in")
        {
         if (oPlayer.spellPoints > 0)
            {
             spellLevel[spell, 0]++;
             oPlayer.spellPoints--;
             audio_play_sound(sndSpellUpgrade, 0, false);
            }      
        } 
    }
else
    {
     hoverAlpha = lerp(hoverAlpha, 0, 0.1);
     choosenSpellScale = lerp(choosenSpellScale, 1, 0.1);
    }

if (upgradeSpell == spell && upgradeMode != -1)
    {
     upgradeAlpha = lerp(upgradeAlpha, 1, 0.1);
    }        
if (upgradeAlpha > 0 && upgradeSpell == spell)
    {
     fnt(fntPixelSmall);
     
     // First choice
     draw_lightning(xx, yy + 32, xx - upgradeAlpha * 96, yy + 32, 5, 15, 3, 20, 1); 
     draw_sprite_ext(sSpells, spellDetails[spell, 3], xx - upgradeAlpha * 96, yy + 32, 1, 1, 0, c_white, upgradeAlpha); // Draw first upgrade choice
     draw_sprite_ext(sSpellsFrame, 0, xx - upgradeAlpha * 96, yy + 32, 1, 1, 0, c_white, upgradeAlpha);
     draw_text_colour(xx - upgradeAlpha * 96 - 16 - string_width(spellDetails[spell, 11]), yy + 64, spellDetails[spell, 11], c_white, c_white, c_white, c_white, upgradeAlpha); 
    }
if (upgradeSpell == spell && upgradeMode == -1)
    {
     upgradeAlpha = lerp(upgradeAlpha, -0.1, 0.1);
    }
clr(c_black, draw_get_alpha());

#define scrSpellConvertEnumToString
/// scrSpellConvertEnumToString(spell)

var spell;
spell = SpellEnum.spellFlash;

if (argument_count > 0) {spell = argument[0];}

if (spell == SpellEnum.spellFlash) 
    {
     returnArray[0] = "flash";
     returnArray[1] = sSpellFlash;
    }
#define scrSpellsDrawSidebar
/// scrSpellsDrawSidebar()

var xx, yy;
xx = view_xview; 
yy = view_yview;

// Draw bar itself
clr(c_black, draw_get_alpha() / 3);
draw_roundrect(xx, yy + 10, xx + 196, yy + 590, false);
clr(c_black, draw_get_alpha() * 2);
draw_roundrect(xx, yy + 10, xx + 196, yy + 590, true);
clr(c_white, draw_get_alpha() * 2);
fnt();

xx += 8;
yy += 48;

draw_text(xx, yy - 32, "Naučené kouzla:");

for (i = 0; i < ds_list_size(spellList); i++)
    {
     clr(c_white, spellListAlpha[| i]);
     draw_roundrect(xx - 8, yy - 2, xx + 189, yy + 24, false); 
     
      // Hover
      if (mouse_in(xx - 8, xx + 189, yy - 2, yy + 24))
        {
         spellListAlpha[| i] = lerp(spellListAlpha[| i], 0.3, 0.1);     
         
         // On-click RMB
         if (mouse_check_button_pressed(mb_right))
            {
             choosenSpell = i;
             choosenSpellScale = 1;
            }   
         // On-click LMB
         if (mouse_check_button_pressed(mb_left))
            {
             spell = i;
             event_user(0);
            }
        }
      else {spellListAlpha[| i] = lerp(spellListAlpha[| i], 0, 0.1);}
        
      clr(c_white, bacAlpha * 2);
      draw_text(xx, yy, spellDetails[i,10]);
      yy += 32;
    }

clr();