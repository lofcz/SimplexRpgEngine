/// scrScreenShakeUpdate()

if (screenShake > 0) 
    {
     x += random_range(-screenShake, screenShake);
     y += random_range(-screenShake, screenShake);
     
     screenShake -= screenShakeFade;
    }
    
