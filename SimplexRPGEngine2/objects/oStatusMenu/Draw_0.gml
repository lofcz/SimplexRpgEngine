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

//v_statusAbilities[0, 0] 

if (v_menuAlpha > 0.05)
{
	// Status
	if (v_selectedIndex == 0)
	{
		xSet = -160 + 160 * (v_menuItems[0, 2] / 180);
		
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		// Draw status
		fnt(fntPixelBig);
		draw_text(x + 16 + xSet,y + 50, "Attributes");
		draw_line_width(x + 15+ xSet, y + 72, x + 150+ xSet, y + 72, 2);
		fnt(fntPixel);
		
		for (var i = 0; i < array_length_1d(v_statusAttributes); i++) // v_statusAttributes[i] v_statusAttributes[i] oHUD.v_playerPropertyTotal[1]
		{
			clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
			z = libUtilityPropertyToString(v_statusAttributes[i]);
			draw_text_colored(x + 17 + xSet, y + 80 + i * 16, z[0] + ": " + _sc(string(oHUD.v_playerPropertyTotal[v_statusAttributes[i]]), c_white), -1, fntPixelLess, c_black);
		}
		
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		fnt(fntPixelBig);
		draw_text(x + 16+ xSet, y + 50  + 220, "Condition");
		draw_line_width(x + 15+ xSet, y + 72 + 220, x + 150+ xSet, y + 72 + 220, 2);
		fnt(fntPixel);

		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 17 + xSet, y + 80 + 220, "Health" + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valHp]), c_white)  + " / " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxHp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 17 + xSet, y + 80 + 220 + 16, "Mana" + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMp]), c_white)  + " / " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxMp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 17 + xSet, y + 80 + 220 + 32, "Stamina" + ": " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valSp]), c_white)  + " / " + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMaxSp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		
		fnt(fntPixelBig);
		draw_text(x + 16 + 200+ xSet, y + 50, "Abilities");
		draw_line_width(x + 15 + 200+ xSet, y + 72, x + 150 + 200+ xSet, y + 72, 2);
		fnt(fntPixel);	
		
		
		
		fnt(fntPixelBig);
		draw_text(x + 16 + 200+ xSet, y + 50 + 220, "Resiliences");
		draw_line_width(x + 15 + 200+ xSet, y + 72 + 220, x + 150 + 200+ xSet, y + 72 + 220, 2);
		fnt(fntPixel);	

		// <earth, fire, air, water>
		
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220, _sc("Taurus: ", c_orange) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valHp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220 + 16, _sc("Aries: ", c_red) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valMp]), c_white) , -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220 + 32, _sc("Libra: ", make_color_rgb(230,230,250)) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valSp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		draw_text_colored(x + 20 + 17+ 200 + xSet, y + 80 + 220 + 48, _sc("Pisces: ", make_color_rgb(135,206,250)) + _sc(string(oHUD.v_playerPropertyTotal[e_inventoryProperties.valSp]), c_white), -1, fntPixelLess, c_black);
		clr(-1, max(((v_menuItems[0, 2] - 30) / 150), 0));
		
		draw_sprite_ext(sElements, 0, x + 25+ 200 + xSet, y + 88 + 220, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 1, x + 25+ 200 + xSet, y + 88 + 220 + 16, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 3, x + 25+ 200 + xSet, y + 88 + 220 + 32, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
		draw_sprite_ext(sElements, 2, x + 25+ 200 + xSet, y + 88 + 220 + 48, 0.45, 0.45, 0, c_white, max(((v_menuItems[0, 2] - 30) / 150)));
	
		fnt(fntPixelBig);
		draw_text(x + 16 + 400+ xSet, y + 50, "Statistics");
		draw_line_width(x + 15 + 400+ xSet, y + 72, x + 150 + 400+ xSet, y + 72, 2);
		fnt(fntPixel);	
		
		fnt(fntPixelBig);
		draw_text(x + 16 + 400+ xSet, y + 50 + 220, "Edges");
		draw_line_width(x + 15 + 400+ xSet, y + 72 + 220, x + 150 + 400+ xSet, y + 72 + 220, 2);
		fnt(fntPixel);	

	}
}

clr();