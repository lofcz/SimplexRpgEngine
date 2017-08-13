/// @desc [Simplex description line]

if (mode != "combat") {image_alpha -= spd;}
else {image_alpha -= max(spd-(spd/5),0.01);}

if (image_alpha <= 0) {instance_destroy();}
p += 0.02;

if (p < 0.9) {y -= (1-p);}
else {y -= 0.1;}
