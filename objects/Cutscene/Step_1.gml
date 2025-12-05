if global.game = 2{
    if global.lvl > 3{
        if jrpacstate = 1{
            if blinkyx < 192{balloony = balloony - 2}
            if blinkyx > 176{blinkyx = blinkyx - 4}
            else{
                if bounce = 0{
                    bounceup = true
                    bouncenumber = bouncenumber + 1
                }
                if bounce = 9{bounceup = false}
                if bouncenumber < 3{
                    if bounceup = true{bounce = bounce + 1.5}
                    else{bounce = bounce - 1.5}
                }
                if blinkyy < 416{blinkyy = blinkyy + 4}
                else{
                    if blinkyx > 144{blinkyx = blinkyx - 4}
                }
            }
        if balloony < 320{jrpacstate = 2}
        }
    if jrpacstate = 2{
        balloony = balloony - 2
        if blinkyx > 96{blinkyx = blinkyx - 2}
        else{
            if blinkyy < 480{blinkyy = blinkyy + 2}
            if blinkyy = 480{
                if bounce = 0{bounceup = true}
                if bounce = 9{bounceup = false}
                if bounceup = true{bounce = bounce + 1.5}
                else{bounce = bounce - 1.5}
                if bounce = 0 and bounceup = false{jrpacstate = 3}
            }
        }
    }
    if jrpacstate = 3{
        balloony = balloony -2
        if chase = false{
            mspacx = mspacx + 3
            if mspacx > 32{
                blinkyx = blinkyx + 3
                scroll = scroll - 2
            }
            if mspacx > 96{chase = true}
        }
        if chase = true{
            if blinkyx > 152{mspacx = mspacx + 3}
            if blinkyx < 153{mspacx = mspacx - 1.5}
            blinkyx = blinkyx - 1.5; 
            scroll = scroll - 2
        }
        if scroll < -24 and scroll > -56{yumyumy = yumyumy + 0.8}
        if scroll < -56 and scroll > -88{jrpacy = jrpacy + 0.8}
        if scroll < -512{jrpacstate = 4}    
    }
    if jrpacstate = 4{
        if jrpacy > 256{
            jrpacy = jrpacy - 2; yumyumy = yumyumy - 2;
        }
        else{jrpacstate = 5}
    }
    if jrpacstate = 5{
        if rep < 4{
            heart1x = heart1x - 2;
            heart2y = heart2y + 2;
            heart3x = heart3x + 2;
            heart4y = heart4y - 2;
            if heart1x = 160{
                heart1x = 320; heart2y = 176;
                heart3x = 160; heart4y = 336;
                rep = rep + 1; hsprspeed = hsprspeed - 4;
                if hsprspeed < 0{hsprspeed = 11+(hsprspeed+1)}
            }
        }
    }
}
if global.lvl = 3{
    if jrpacstate = 0{
        if scroll < 416{scroll = scroll + 2}
        else{jrpacstate = 1}
    }
    if jrpacstate = 1{
        blinkyx = 320;
        if jrpacx = 240{}else{jrpacx = jrpacx + 2}
        if jrpacx > -16 and jrpacx < 48{jrpacy = jrpacy + 0.60}
        if jrpacx = 240{
            jrpacy = jrpacy + 2
            if jrpacy > 479{jrpacy = 480; jrpacstate = 2}
        }
    }
    if jrpacstate = 3{
        if scroll > 0{scroll = scroll - 1.5}
        if scroll > 188 and scroll < 224{
            jrpacx = jrpacx - 0.75
            if bounce = 0{bounceup = true}
            if bounce = 6{bounceup = false}
            if bounceup = true{bounce = bounce + 1}
            else{bounce = bounce - 1}
        }
        else{bounce = 0}
        if scroll > 24 and scroll < 56{jrpacy = jrpacy - 0.60}
    }
    if jrpacstate = 4{
        if balloonx < 256{balloonx = balloonx + 1}
    }
    if jrpacstate = 5{
        if blinkyx > 304{blinkyx = blinkyx - 0.5}
    }     
}
if global.lvl = 1{
    if jrpacstate = 0{
        if jrpacx < 144{
            jrpacx = jrpacx + 1
            if jrpacx > 48 and jrpacx < 112{jrpacy = jrpacy + 0.3}
        }
        else{jrpacstate = 1}
    }
    if jrpacstate = 1{
        if jrpacx > 80{jrpacx = jrpacx - 1; jrpacy = jrpacy + 1}
        if blinkyx = -112{jrpacstate = 2}
    }
    if jrpacstate = 2{
        if jrpacy < 304{jrpacy = jrpacy + 1}
        if blinkyx = 0{jrpacstate = 3}
    }
    if jrpacstate = 3{
        if jrpacx = 208{}else{
            jrpacx = jrpacx + 1
            if jrpacx > 143 and jrpacy > 280{jrpacy = jrpacy - 1}
        }
        if jrpacx = 208{
            jrpacy = jrpacy + 1;
            if jrpacy > 303{jrpacstate = 4}
        }
    }
    if jrpacstate = 4{
        if jrpacx = 128{}else{
            jrpacx = jrpacx - 1; jrpacy = jrpacy + .8
        }
        if jrpacx = 128{jrpacstate = 5}
    }
    if jrpacstate = 5{
        if bounce = 0{
            bounceup = true; bouncenumber = bouncenumber + 1;
        }
        if bounce = 9{bounceup = false}
        if bouncenumber < 3{
            if bounceup = true{bounce = bounce + 1.5}
            else{bounce = bounce - 1.5}
        }
        if blinkyx < 256 and blinkygo = true{jrpacstate = 6}
    }
    if jrpacstate = 6{
        if jrpacy > 312{jrpacy = jrpacy - 2.5}
        else{jrpacx = jrpacx - 2.5}
        if jrpacx < 33{jrpacstate = 7}
    }
    if jrpacstate = 7{
        jrpacx = jrpacx + 2.5
        if jrpacx > 176 and jrpacx < 208{jrpacy = jrpacy - 1.25}
        if jrpacx > 376{jrpacstate = 8}
    }
    if jrpacstate = 8{
        jrpacx = jrpacx - 2.5
        if jrpacy > 163.2{jrpacy = jrpacy - 2.5}
        if jrpacx > 48 and jrpacx < 112{jrpacy = jrpacy - 0.75}
    }
    if mspacstate = 0{
        if blinkyx < 24 {if mspacx < 56{mspacx = mspacx + 1}}
        else{
            if mspacx < 344{
                mspacx = mspacx + 1;
                if mspacy < 158.6{mspacy = mspacy + 0.30}
            }
            else{
                if mspacy < 192{mspacy = mspacy + 1.5}
                else{mspacstate = 1}
            }
        }
    }
    if mspacstate = 1{
        if mspacx < 376{mspacx = mspacx + 1.5; mspacy = mspacy - 2.25;}
        else{blue = true; mspacstate = 2}
    }
    if mspacstate = 2{
        if mspacy < 256{mspacx = mspacx - 2.25; mspacy = mspacy + 1.671426}
        else{
            if blinkyx < 80{mspacstate = 3}
        }
    }
    if mspacstate = 3{
        mspacx = mspacx - 1
        if mspacy > 158.6{mspacy = mspacy - 1.25}
        else{
            if mspacx > 48 and mspacx < 112{mspacy = mspacy -0.30}
        }
    }
    if blue = false{
        if yumyumx < 96{yumyumx = yumyumx + 1}
        else{
            if yumyumy > 400{yumyumy = yumyumy - 1}
        }
        if blinkygo = false{
            blinkyx = blinkyx + 1
            if blinkyx > 304{blinkygo = true}
        }
        if blinkygo = true{blinkyx = blinkyx - 2; blinkyy = blinkyy - 2;}
    }
    else{
        if yumyumy < 480{yumyumy = yumyumy + 0.5}
        else{yumyumx = yumyumx - 0.5}
        if blinkyy > 400{blinkyx = blinkyx - 0.5}
        if blinkyy < 480{blinkyy = blinkyy + 0.5}
    }
}
}
        

im = im + 0.4444444444; if im >= 4{im = 0}
im2 = im2 + 0.1111111111; if im2 >= 2{im2 = 0}

