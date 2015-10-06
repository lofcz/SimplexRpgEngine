if !walking{
    if turn_right{
        dir-=90
        walking=true
        alarm[1]=2
    }
    else if turn_left{
        dir+=90
        walking=true
        alarm[1]=2
    }
}

//scrMapView();