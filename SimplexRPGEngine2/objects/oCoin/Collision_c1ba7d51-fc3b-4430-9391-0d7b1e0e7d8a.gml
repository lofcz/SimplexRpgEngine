/// @desc [Simplex description line]

//if (qqa <= 0.5)
{
	cpSplashMessage("+ "+string(5) + " " + __("Coins"),c_yellow,sCoin);
	oHUD.v_gold += 5;
	instance_destroy();
}