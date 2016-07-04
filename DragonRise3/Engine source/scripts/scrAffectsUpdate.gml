/// scrAffectsUpdate()

var index, pos, xx, yy, xxx, yyy, offset, lineN, doTick;
xx     = view_xview + 620;
yy     = view_yview + 142;
offset = 46;
lineN  = 4;
doTick = false;

ticks++;
if (ticks >= maxTicks) {ticks = 0; doTick = true;}

for (i = 0; i < ds_list_size(oPlayer.statusList) i++)
    {     
     bC = oPlayer.statusList[| i];
     
     // Spawn tick
     if (doTick)
     {
        // Poison
        if (bC == "poison")
            {
            oPlayer.vlastnost[vlastnost_zivot] -= (0.1 * (oPlayer.statusNList[| i] * oPlayer.statusNList[| i]));  
            effectPoison(oPlayer.x, oPlayer.y, 2 * (round(oPlayer.statusNList[| i] / 2) + 1) + irandom(3));     
            format = string_format((0.1 * (oPlayer.statusNList[| i] * oPlayer.statusNList[| i])), round((0.1 * (oPlayer.statusNList[| i] * oPlayer.statusNList[| i]))), 1);
            scrLog(format,c_red,-1,0,0,oPlayer.x - (string_width(format) / 2),oPlayer.y-48,fntPixel);
            }
     }
                      
      // Actual update     
      oPlayer.statusTimeList[| i] -= 1;     
      if (oPlayer.statusTimeList[| i ] <= 0)
        {
         oPlayer.statusAlphaList[| i] = lerp(oPlayer.statusAlphaList[| i], 0, 0.1);
         oPlayer.statusScaleList[| i] = lerp(oPlayer.statusScaleList[| i], 0, 0.1);
        }
      else if (oPlayer.statusAlphaList[| i ] < 0.25)
      {
       oPlayer.statusAlphaList[| i] = lerp(oPlayer.statusAlphaList[| i], 0.25, 0.1);
      }
        
      if (oPlayer.statusAlphaList[| i ] <= 0.05)
        {
         pos = ds_list_find_index(oPlayer.statusList, oPlayer.statusList[| i]);
         ds_list_delete(oPlayer.statusList, pos);
         ds_list_delete(oPlayer.statusTimeList, pos);
         ds_list_delete(oPlayer.statusSpriteList, pos);
         ds_list_delete(oPlayer.statusScaleList, pos);   
         ds_list_delete(oPlayer.statusAlphaList, pos); 
         ds_list_delete(oPlayer.statusMTimeList, pos); 
         ds_list_delete(oPlayer.statusColorList, pos);
         ds_list_delete(oPlayer.statusNList, pos);  
                        
         if (ds_list_empty(oPlayer.statusList)) {break;}
        }             
          
      // Draw before deleteion to avoid is_undefinied usage
      xxx   = xx + ((i * offset) - ((i div lineN) * (lineN * offset)));
      yyy   = yy + ((i div lineN) * offset);     
      scale =  oPlayer.statusScaleList[| i];
      al    = oPlayer.statusAlphaList[| i ];
      
      if (is_undefined(scale)) {scale = 1;}
      if (is_undefined(al)) {al = 1;}    
      clr(c_white, al / 2);
      draw_circle(xxx, yyy , 20*scale, false);

      
      // back
      clr(c_black, al);
      draw_ring_part(xxx, yyy, 16*scale, 4, 64, 64, 90, 360, true, c_black, false); 

      // bar
      clr(c_black, al * 3);      
      draw_ring_part(xxx, yyy, 16*scale, 4, 64, 64, 90, (oPlayer.statusTimeList[| i] / oPlayer.statusMTimeList[| i]) * 360, true, oPlayer.statusColorList[| i], true); 

      // outline
      draw_ring_part(xxx, yyy, (16+4)*scale, 1, 64, 64, 90, (oPlayer.statusTimeList[| i] / oPlayer.statusMTimeList[| i]) * 360, true, c_black, true); 
      draw_ring_part(xxx, yyy, (16)*scale, 1, 64, 64, 90, (oPlayer.statusTimeList[| i] / oPlayer.statusMTimeList[| i]) * 360, true, c_black, true); 
      
      if (scale > 1) {oPlayer.statusScaleList[| i] = lerp(oPlayer.statusScaleList[| i], 1, 0.1);}
      
      draw_sprite_ext(sAffects, oPlayer.statusSpriteList[| i], xxx, yyy, 1 * scale, 1 * scale, 0, c_white, 1)
      clr(c_black, al * 3);
      alg("center", fntPixel);
      if (oPlayer.statusNList[| i] > 1) {draw_text(xxx + 12, yyy + 16, string(oPlayer.statusNList[| i]) + "x");}
    }
