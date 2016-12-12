#define scrSpellDraw
/// scrSpellDraw(spell, x, y);

var spell, xx, yy;
spell = SpellEnum.spellFlash;
xx    = x;
yy    = y; 

if (argument_count > 0) {spell = argument[0];}
if (argument_count > 1) {xx    = argument[1];}
if (argument_count > 1) {yy    = argument[2];}

scrSpellDrawSurface();
fnt();
clr(c_white, -1);
//draw_text(view_xview + xx, view_yview + yy - 24, spellDetails[spell, 0]); // Spell name

if (surface_exists(front_surface) && surface_exists(back_surface)) 
{
  // Get texture
  if(flip_angle > 270 || flip_angle < 90) {tex=surface_get_texture(front_surface);}
  else {tex=surface_get_texture(back_surface);}                               

  // Temp vars
  _x = 0;
  _y = 0;
  _w = (card_width * choosenSpellScale);
  _h = (card_height * choosenSpellScale);
  
  // Draw surface transformed
  draw_set_color(c_white);  
  d3d_set_projection_perspective(0,view_hview,view_wview,-view_hview,0); 
  d3d_transform_set_rotation_y(flip_angle);   
  d3d_transform_add_translation(xx + 20,yy + 80,0);
  draw_primitive_begin_texture(pr_trianglefan,tex)
    draw_vertex_texture_colour(-_w,-_h,0,0,c_white,bacAlpha);
    draw_vertex_texture_colour(_w ,-_h,1,0,c_white,bacAlpha);
    draw_vertex_texture_colour(_w , _h,1,1,c_white,bacAlpha);
    draw_vertex_texture_colour(-_w, _h,0,1,c_white,bacAlpha);
  draw_primitive_end();
  d3d_transform_set_identity(); 
  d3d_set_projection_ortho(0, 0, view_wview, view_hview, 0);
}

// Draw details form
clr(c_black, choosenSpellAlpha);
draw_roundrect(200, 400, 790, 590, false);
clr(c_black, choosenSpellAlpha * 3);
draw_roundrect(200, 400, 790, 590, true);
clr(c_white, choosenSpellAlpha * 3);
fnt();
draw_text_colored(210, 410, spellDetails[spell, 0]);
index = spellDetails[spell,  9 + (spellLevel[spell, 1])];
fnt(fntPixelSmall);
draw_text_colored(210, 380 + 64, index);
indexH = string_height(index);
fnt(fntPixelTiny);
draw_text_colored(210, 390 + indexH + 64, spellProperties[9 + spellLevel[spell, 0] + (spellLevel[spell, 1] * 5) + (spellLevel[spell, 1])]); 
fnt();

     maxVerticles = 360;
     choosenSpellScale = lerp(choosenSpellScale, 1.2, 0.1);
     verticles = ((maxVerticles / 5) * (spellLevel[spell, 0]));
     realVerticles = min(lerp(realVerticles, verticles + 1, 0.1), verticles);
     color = make_colour_rgb(255 - ((realVerticles / maxVerticles) * 255), (realVerticles / maxVerticles) * 255, 0);
      
     draw_ring_part(xx + 20, yy + 80, 128 * choosenSpellScale, 4, maxVerticles, realVerticles, 90, 360, -1, color, false, draw_get_alpha());
      draw_ring_part(xx + 20, yy + 80, 132 * choosenSpellScale, 2, maxVerticles, realVerticles, 90, 360, -1, c_black, false, draw_get_alpha());
  
     // level UP
     if (realVerticles >= maxVerticles)
        {
         spellLevel[spell, 0] = 0;
         spellLevel[spell, 1]++;
         audio_play_sound(sndSpellLevelUp, 0, false);
         flip_angle = 0;
         effectSpellLevelUp(xx, yy + 80 + 64, 20);
         levelUpSpell = spell;
         level = spellLevel[spell, 1];
         event_user(1);
         
         if (spellLevel[spell, 1] == 1)
         {
         spellDetails[spell, 0] = spellDetails[spell, 3];
         spellDetails[spell, 1] =  spellDetails[spell, 4];
         spellDetails[spell, 2] =  spellDetails[spell, 5];
         }
         else
         {
          spellDetails[spell, 0] = spellDetails[spell, 6];
          spellDetails[spell, 1] = spellDetails[spell, 7];
          spellDetails[spell, 2] = spellDetails[spell, 8];
         }
        }

if (mouse_in(xx + view_xview - 128, xx + 128 + view_xview, yy + view_yview - 64, yy + 256 + view_yview))
    { 
     // Adjust hover scale  
     // Draw details form
     clr(c_black, min(hoverAlpha, 0.3));
     draw_roundrect(view_xview + 10, view_yview + 400, view_xview + view_wview - 10, view_yview + 600 - 10, false);
     clr(c_white, draw_get_alpha());
    
     if (mouse_check_button_pressed(mb_left) && mode == "in")
        {
         if (oPlayer.spellPoints > 0 && spellLevel[spell, 1] < 2 && spellLevel[spell, 0] < 5)
            {
             spellLevel[spell, 0]++;
             oPlayer.spellPoints--;
             audio_play_sound(sndSpellUpgrade, 0, false);
             levelUpSpell = spell;
             level  = spellLevel[spell, 1];
             points = spellLevel[spell, 0];
             event_user(2);
            }
        }
     if (mouse_check_button_pressed(mb_right) && mode == "in")
        {
         if (oPlayer.spellPoints > 0 && spellLevel[spell, 1] < 2 && spellLevel[spell, 0] < 5)
            {
             spellLevel[spell, 0]++;
             oPlayer.spellPoints--;
             audio_play_sound(sndSpellUpgrade, 0, false);
             levelUpSpell = spell;
             level  = spellLevel[spell, 1];
             points = spellLevel[spell, 0];
             event_user(2);
            }      
        } 
    }
else
    {
     hoverAlpha = lerp(hoverAlpha, 0, 0.1);
     choosenSpellScale = lerp(choosenSpellScale, 1, 0.1);
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
if (spell == SpellEnum.spellFireball) 
    {
     returnArray[0] = "fireball";
     returnArray[1] = sSpellFireball;
    }
if (spell == SpellEnum.spellVines) 
    {
     returnArray[0] = "vines";
     returnArray[1] = sSpellVines;
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

clr(c_black, draw_get_alpha() * 2);
//draw_circle(xx + 196, yy + 196, 16, false);

clr(c_white, draw_get_alpha() * 2);
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
             if (choosenSpell != i)
             {
             choosenSpell = i;             
             flip_angle = 0;
             }
             choosenSpellScale = 1;
            }   
         // On-click LMB
         if (mouse_check_button_pressed(mb_left))
            {
             if (choosenSpell != i)
             {
             choosenSpell = i;             
             flip_angle = 0;
             }
             choosenSpellScale = 1;
             verticles = 0;
             realVerticles = 0;
            }
        }
      else {spellListAlpha[| i] = lerp(spellListAlpha[| i], 0, 0.1);}
      color = c_white;
      if (spellLevel[i, 1] == 2) {color = c_yellow;}
        
      clr(color, bacAlpha * 2);
      draw_text(xx, yy, spellDetails[i,0]);
      yy += 32;
    }

clr();

#define scrSpellDrawSurface
/// scrSpellDrawSurface()

if (draw)
{

if(!surface_exists(front_surface))
{
front_surface=surface_create(card_width,card_height);
}
  surface_set_target(front_surface)
  {
    if (choosenSpell != -1)
    {
    draw_clear_alpha(0,0);
    draw_sprite_ext(sSpells,spellDetails[max(choosenSpell,0), 2],0,0, 1, 1, 0, c_white, 1);
    }
  }
  surface_reset_target();
  

if(!surface_exists(back_surface))
{
  back_surface=surface_create(card_width,card_height);
  surface_set_target(back_surface)
  {
    draw_clear_alpha(0,0);
   draw_sprite_ext(sSpellsBackFrame,0,0,0, 1, 1, 0, c_white, 1)
  }
  surface_reset_target();
}

if (choosenSpell != -1)
{
flip_angle = lerp(flip_angle, 360, 0.05);
}
}