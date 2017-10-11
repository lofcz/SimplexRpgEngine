/// @description Insert description here
// You can write your code in this editor

/*
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

libUtilityDrawForm(x, y, v_layoutW, v_layoutH, v_formAlpha);
libDrawMenu(x + 8, y + 10, v_menuItems, v_formAlpha, false);

if (v_menuReady)
{
	v_menuAlpha = lerp(v_menuAlpha, 1, 0.1);
}
else
{
	v_menuAlpha = lerp(v_menuAlpha, 0, 0.1);
}

if (v_menuAlpha > 0.05)
{
	// Status
	if (v_selectedIndex == 0)
	{
		
	}
}