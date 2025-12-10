if global.game = 1{
    if clapperboard = 2{
        if clap < 3{clap = clap + 0.25}
        if clap = 3{clap = 6; alarm[2] = 33.75}
    }
    if global.lvl = 2{
        left = left - 1.75; right = right + 1.75;
        if left2 > 272{left2 = left2 - 1.8; right2 = right2 + 1.8}
        else{left2 = left2 - 2.1; right2 = right2 + 2.1}
        left3 = left3 - 2.1; right3 = right3 + 2.1;
        if right3 >= 224{up = up - 2.1}
        if right4 <= 224{left4 = left4 - 2.3; right4 = right4 + 2.3}
        else{
            if bounce = 0{bounceup = true}
            if bounce = 6{bounceup = false}
            bump = bump - 1; bump2 = bump2 + 1;
            if bounceup = true{bounce = bounce + 1}
            else{bounce = bounce - 1}
        }
    }
    if global.lvl = 5{
        right = right + 3; right2 = right2 + 3.3;
        left = left - 3; left2 = left2 - 3.3;
        right3 = right3 + 3; right4 = right4 + 3.3;
        left3 = left3 - 12; left4 = left4 - 13.2;
        right5 = right5 + 12; right6 = right6 + 13.2;
    }
    if global.lvl > 5{
        if left < 312{left2 = left2 -2; falling = falling + 2;}
        left = left - 1
        if falling >= 424{
            if bounce = 0{bounceup = true}
            if bounce = 9{bounceup = false}
            if bounceup = true{bounce = bounce + 1}
            else{bounce = bounce - 1}
        }
    }
}

