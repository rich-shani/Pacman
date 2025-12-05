if global.p2score > global.p1score{scorey = 2}
else{if global.p1score > global.p2score{scorey = 1}
else{scorey = irandom(1) + 1}}
x = -16
y = -8
room_speed = 67.5
indexy = 0
clapperboard = 1
clap = 0
sprspeed = 0
hsprspeed = 0
sprite_index = spr_Bpeg; image_index = 0; 
im = 0;
im2 = 0;
if global.game = 0{
    left = 496
    if global.lvl = 2{
        alarm[1] = 715
        left2 = 560
        right = -500
        right2 = -1200
    }
    if global.lvl = 5{
        alarm[1] = 580
        left2 = 640
    }
    if global.lvl > 5{
        alarm[1] = 592
        left2 = 640
        right2 = -900
    }
}
else{
    if global.game = 1{
        alarm[2] = 67.5
        if global.lvl = 2{
            alarm[1] = 650
            alarm[10] = 2
            left = 480 + 216
            left2 = 480 + 312
            right = -216
            right2 = -312
            left3 = 480+900
            left4 = 480+1050
            right3 = -900
            right4 = -1050
            up = 280
            bump = 224
            bump2 = 256
            bounce = 0
            bounceup = true
        }
        if global.lvl = 5{
            alarm[1] = 1455
            alarm[10] = 2
            right = -900
            right2 = -1098
            left = 480+1750
            left2 = 480+2036
            right3 = -2600
            right4 = -2970
            left3 = 480+14000
            left4 = 480+15550
            right5 = -14750
            right6 = -16392
        }
        if global.lvl > 5{
            alarm[1] = 540
            alarm[10] = 2
            left = 480+135
            left2 = 312
            falling = 200
            bounce = 0
            bounceup = true
        }
    }
    if global.game = 2{
        if global.lvl = 1{
            alarm[1] = 1340
            alarm[3] = 580
            yumyumsprite = 0
            yumyumx = -64
            yumyumy = 480
            blinkyx = -408
            blinkyy = 480
            blinkygo = false
            blue = false
            mspacx = 0
            mspacy = 140
            mspacstate = 0
            jrpacx = -64
            jrpacy = 144
            jrpacstate = 0
            bouncenumber = 0
            bounceup = 0
            bounce = 0
        }
        if global.lvl = 3{
            alarm[1] = 1070
            alarm[3] = 430
            alarm[10] = 2
            sprite_index = spr_river; image_index = 0; image_speed = 0.125
            scroll = 0
            blinkyx = -1000
            jrpacx = -32
            jrpacy = 416
            balloonx = -32
            jrpacstate = 0
            bounceup = false
            bounce = 0
        }
        if global.lvl > 3{
            alarm[10] = 2
            alarm[11] = 2
            sprite_index = spr_river; image_index = 0; image_speed = 0.125
            scroll = 0
            vis = false
            blinkygo = false
            yumyumy = 464
            blinkyx = 320
            blinkyy = 400
            mspacx = -32
            jrpacx = 224
            jrpacy = 467
            jrpacstate = 0
            bouncenumber = 0
            bounceup = false
            bounce = 0
            balloony = 464
            chase = false
            heart1x = 320
            heart2y = 176
            heart3x = 160
            heart4y = 336
            rep = 0
            alarm[1] = 1510
            alarm[3] = 166
        }
    }
}
alarm[0] = 1

