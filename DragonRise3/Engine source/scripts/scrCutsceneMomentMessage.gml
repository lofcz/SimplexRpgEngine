/// scrCutsceneMomentMessage(thread, text, time)

with(global.cutsceneOwner[argument[0]])
    {
     splashMessage     = argument[1];
     splashMessageTime = argument[2];    
     mood = "cutscene";
     tempSpd = spd;
     spd = 0;
    }
