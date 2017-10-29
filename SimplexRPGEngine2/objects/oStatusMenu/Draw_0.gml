/// @description Insert description here
// You can write your code in this editor


x = oCamera.v_nullPosX;
y = oCamera.v_nullPosY + 70;

if (v_selectionDone)
{
	v_layoutW = lerp(v_layoutW, 600, 0.1);
	v_layoutH = lerp(v_layoutH, 400, 0.1);
}
else
{
	v_layoutW = lerp(v_layoutW, 230, 0.1);
	v_layoutH = lerp(v_layoutH, 210, 0.1);
}


u = libUtilityDrawForm(x, y, v_layoutW, v_layoutH, v_formAlpha);
libDrawMenu(x + 8, y + 10, v_menuItems, v_formAlpha, false);

draw_text(mouse_x, mouse_y, "         xxx" + string(v_menuItems[0, 2])); 

if (v_menuReady)
{
	v_menuAlpha = lerp(v_menuAlpha, 1, 0.1);
}
else
{
	v_menuAlpha = lerp(v_menuAlpha, 0, 0.1);
}

v_statusAttributes[0] = e_inventoryProperties.valStrenght;
v_statusAttributes[1] = e_inventoryProperties.valEndurance;
v_statusAttributes[2] = e_inventoryProperties.valFortitude;
v_statusAttributes[3] = e_inventoryProperties.valDexterity;
v_statusAttributes[4] = e_inventoryProperties.valIntellect;
v_statusAttributes[5] = e_inventoryProperties.valCharisma;
v_statusAttributes[6] = e_inventoryProperties.valPsyche;
v_statusAttributes[7] = e_inventoryProperties.valResolve;
v_statusAttributes[8] = e_inventoryProperties.valPerception;
v_statusAttributes[9] = e_inventoryProperties.valFate;

v_statusAbility[0] = "Speech";
v_statusAbility[1] = "Craft";
v_statusAbility[2] = "Craft";

v_statusAbilitySub[0, 0] = e_inventoryProperties.valPersuasion;
v_statusAbilitySub[0, 1] = e_inventoryProperties.valIntimidation;
v_statusAbilitySub[0, 2] = e_inventoryProperties.valTrustfulness;
v_statusAbilitySub[0, 3] = e_inventoryProperties.valBargaining;

v_statusStatictics[0] = e_inventoryProperties.valDamage;
v_statusStatictics[1] = e_inventoryProperties.valDefense;
v_statusStatictics[2] = e_inventoryProperties.valCriticalChance;
v_statusStatictics[3] = e_inventoryProperties.valCriticalDamage;



//v_statusAbilities[0, 0] 

if (v_menuAlpha > 0.05)
{
	// Status
	if (v_selectedIndex == 0)
	{
		xSet = -160 + 160 * (v_menuItems[0, 2] / 180);		
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		
		var tmp_stringRest;
		tmp_stringRest = "";
		
		if (oHUD.v_playerSkillPointsAttributes > 0) {tmp_stringRest = " (" + _sc("+" + string(oHUD.v_playerSkillPointsAttributes), c_lime) + ")";}
		
		// Draw status
		draw_text_colored(x + 16 + xSet,y + 50, "Attributes" + tmp_stringRest, -1, fntPixelBig, c_black);
		draw_line_width(x + 15+ xSet, y + 72, x + 150+ xSet, y + 72, 2);
		
		for (var i = 0; i < array_length_1d(v_statusAttributes); i++)
		{			
			if (tmp_stringRest != "")
			{
				var tmp_color;
				tmp_color = c_white;
				
				if (point_in_rectangle(mouse_x, mouse_y, x + 17 + xSet + 20 + 130 , y + 80 + i * 16 + 1, x + 17 + xSet + 20 + 130 + 8, y + 80 + i * 16 + 15))
				{
					tmp_color = c_lime;	
					cpStatusMenuAssignPointAttribute(v_statusAttributes[i], false);
					
					if (mouse_check_button_pressed(mb_left))
					{
						oHUD.v_playerProperty[v_statusAttributes[i]]++;
						oHUD.v_playerSkillPointsAttributes--;
						cpStatusMenuAssignPointAttribute(v_statusAttributes[i], true);
					}
				}
				
				draw_text_colored(x + 17 + xSet + 20 + 130, y + 80 + i * 16, "+", -1, fntPixel, tmp_color);	
			}
			
			clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
			z = libUtilityPropertyToString(v_statusAttributes[i]);
			draw_text_colored(x + 17 + xSet + 20, y + 80 + i * 16, z[0] + ": " + _sc(string(oHUD.v_playerPropertyTotal[v_statusAttributes[i]] + v_propertyTemp[i]), c_white), -1, fntPixelLess, c_black);
			clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
			
			draw_sprite_ext(sElements, 4 + i, x + xSet + 8 + 16, y + 88  + i * 16, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		}
		
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		fnt(fntPixelBig);
		draw_text(x + 16+ xSet, y + 50  + 220, "Condition");
		draw_line_width(x + 15+ xSet, y + 72 + 220, x + 150+ xSet, y + 72 + 220, 2);
		fnt(fntPixel);
		
		var tmp_color, tmp_dif;
		tmp_color = c_white;
		tmp_dif = "";
		
		if (v_propertyTemp[e_inventoryProperties.valHp] != 0) {tmp_color = c_lime; tmp_dif = "  (" + _sc("+" + string(v_propertyTemp[e_inventoryProperties.valMaxHp]), c_lime) + ")";}

		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 17 + xSet + 20, y + 80 + 220, "Health" + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valHp] + v_propertyTemp[e_inventoryProperties.valHp]), tmp_color)  + "/" + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxHp] + v_propertyTemp[e_inventoryProperties.valHp]), tmp_color) + tmp_dif, -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 17 + xSet + 20, y + 80 + 220 + 16, "Mana" + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMp]), c_white)  + "/" + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxMp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 17 + xSet + 20, y + 80 + 220 + 32, "Stamina" + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valSp]), c_white)  + "/" + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxSp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		
		draw_sprite_ext(sElements, 14, x + 17 + xSet + 8, y + 80 + 220 + 8, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 15, x + 17 + xSet + 8, y + 80 + 220 + 8 + 16, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 16, x + 17 + xSet + 8, y + 80 + 220 + 8 + 32, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		
		var tmp_stringRest;
		tmp_stringRest = "";
		
		if (oHUD.v_playerSkillPointsAbilities > 0) {tmp_stringRest = " (" + _sc("+" + string(oHUD.v_playerSkillPointsAbilities), c_lime) + ")";}
		
		draw_text_colored(x + 16 + 200+ xSet, y + 50, "Abilities" + tmp_stringRest, -1, fntPixelBig, c_black);
		draw_line_width(x + 15 + 200+ xSet, y + 72, x + 150 + 200+ xSet, y + 72, 2);
		fnt(fntPixel);	
		
		alg("center");
		var tmp_text1 = "< " + string(v_statusAbility[v_currentAbility]) + " >";
		
		draw_text(x + 15 + 200+ xSet - string_width(tmp_text1) / 2 + 110, y + 72 + 16, tmp_text1);
		alg();
		
		var tmp_addIndex;
		tmp_addIndex = 0;
		
		if (v_currentAbility == 0) {tmp_addIndex = 17;}
		
		for (var i = 0; i < array_length_2d(v_statusAbilitySub, v_currentAbility); i++)
		{
			clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
			z = libUtilityPropertyToString(v_statusAbilitySub[v_currentAbility, i]);
			draw_text_colored(x + 17 + xSet + 20 + 200, y + 80 + 20 + i * 16, z[0] + ": " + _sc(string(oHUD.v_playerPropertyTotal[v_statusAttributes[i]]), c_white), -1, fntPixelLess, c_black);	
			clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
			draw_sprite_ext(sElements, tmp_addIndex + i, x + 25 + 200 + xSet, y + 80 + 28 + i * 16, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		}
	
		
		
		fnt(fntPixelBig);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text(x + 16 + 200+ xSet, y + 50 + 220, "Resiliences");
		draw_line_width(x + 15 + 200+ xSet, y + 72 + 220, x + 150 + 200+ xSet, y + 72 + 220, 2);
		fnt(fntPixel);	

		// <earth, fire, air, water>		
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220, _sc("Taurus: ", c_orange) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valResistEarth]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220 + 16, _sc("Scorpio: ", c_red) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valResistFire]), c_white) , -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220 + 32, _sc("Libra: ", make_color_rgb(230,230,250)) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valResistAir]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220 + 48, _sc("Pisces: ", make_color_rgb(135,206,250)) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valResistWater]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		
		draw_sprite_ext(sElements, 0, x + 25+ 200 + xSet, y + 88 + 220, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 1, x + 25+ 200 + xSet, y + 88 + 220 + 16, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 3, x + 25+ 200 + xSet, y + 88 + 220 + 32, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 2, x + 25+ 200 + xSet, y + 88 + 220 + 48, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
	
		fnt(fntPixelBig);
		draw_text(x + 16 + 400+ xSet, y + 50, "Statistics");
		draw_line_width(x + 15 + 400+ xSet, y + 72, x + 150 + 400+ xSet, y + 72, 2);
		fnt(fntPixel);	
		
		for (var i = 0; i < array_length_1d(v_statusStatictics); i++)
		{
			var tmp_suffix;
			tmp_suffix = "";
			
			if (i == 2) {tmp_suffix = "%";}
			if (i == 3) {tmp_suffix = "x";}
			
			z = libUtilityPropertyToString(v_statusStatictics[i]);
			draw_text_colored(x + 20 + 17+ 400 + xSet, y + 80 + i * 16, z[0] + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valResistEarth]), c_white) + tmp_suffix, -1, fntPixelLess, c_black);			
			clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
			draw_sprite_ext(sElements, 21 + i, x + 25+ 400 + xSet, y + 88 + i * 16, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		}
		
		fnt(fntPixelBig);
		draw_text(x + 16 + 400+ xSet, y + 50 + 220, "Edges");
		draw_line_width(x + 15 + 400+ xSet, y + 72 + 220, x + 150 + 400+ xSet, y + 72 + 220, 2);
		fnt(fntPixel);	

	}
	
	for (var i = 0; i < mcInventoryProperties; i++)
	{
		v_propertyTemp[i] = 0;	
	}
}

clr();