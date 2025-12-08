if room_width = 448{}else{
if place_meeting(x,y,Dot){with Dot{if place_meeting(x,y,Fruit) and smashed = 0{
smashed = 1; global.smashno = global.smashno + 1; tile_layer_delete_at(depth,x,y);
tile_add(tile1,41*16,0,16,16,x,y,depth-1); tile_add(tile2,41*16,0,16,16,x,y,depth+1)
tile_set_blend(tile_layer_find(depth-1,x,y),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv))
tile_set_blend(tile_layer_find(depth+1,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2))
if oGameManager.plus2 = 1{
tile_layer_hide(depth-1)
tile_layer_hide(depth+1)
}
visible = false;
}}}}

if (oGameManager.dotcount > -1 + 70 and global.game = 0) or (oGameManager.dotcount > -1 + 73 and global.game = 1) or (global.game = 2 and ((Drawless.c64 = 1 and oGameManager.dotcount > -1 + 246) or (oGameManager.dotcount > -1 + 96))){
    if global.ex1 = 0{
        if room_width = 448{//Pac-Man's fruit
            if spawn = 0{spawn = 1; x = xstart; y = ystart; alarm[0] = 540 + irandom(60)}
        }
    else{///Jr. Pac-Man's fruit
        if spawn = 0{
            spawn = 1; alarm[0] = irandom(1080)+120; state = 0; if irandom(1) = 0{direction = 0; dir = 0; x = Blinky.xstart; y = Blinky.ystart;} else{direction = 180; dir = 2; x = Blinky.xstart - 1; y = Blinky.ystart;} tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); newtile = 0;
        }
    }
    }
    else{//Ms. Pac-Man's fruit
    if spawn = 0{tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); spawn = 1; alarm[0] = 1080; state = 0; if irandom(1) = 0{y = global.ex1;}else{y = global.ex2;}; if irandom(1) = 0{x = -24; direction = 0; dir = 0;}else{x = 456; direction = 180; dir = 2;};
if global.plus = 0{
    if global.lvl > 7{
    if random(7)<1{image_index=0; value=0}
    else{
        if random(6)<1{image_index=1; value=1}
        else{
            if random(5)<1{image_index=2; value=2}
            else{
                if random(4)<1{image_index=8; value=3}
                else{
                    if random(3)<1{image_index=3; value=4}
                    else{
                        if random(2)<1{image_index=9; value=5}
                        else{
                        {image_index=10; value=6}
    }}}}}}}
}
else{
    if global.lvl > 7{
    if random(7)<1{image_index=24; value=0}
    else{
        if random(6)<1{image_index=25; value=1}
        else{
            if random(5)<1{image_index=26; value=2}
            else{
                if random(4)<1{image_index=27; value=3}
                else{
                    if random(3)<1{image_index=28; value=4}
                    else{
                        if random(2)<1{image_index=29; value=5}
                        else{
                        {image_index=30; value=6}
    }}}}}}}
}
    }
}
}
if (oGameManager.dotcount > -1 + 170 and global.game = 0) or (oGameManager.dotcount > -1 + 176 and global.game = 1) or (global.game = 2 and ((Drawless.c64 = 1 and oGameManager.dotcount > -1 + 323) or (oGameManager.dotcount > -1 + 207))){
    if global.ex1 = 0{
        if room_width = 448{//Pac-Man's fruit
            if spawn = 1{spawn = 2; x = xstart; y = ystart; alarm[0] = 540 + irandom(60)}
        }
    else{///Jr. Pac-Man's fruit
        if spawn = 1{
            spawn = 2; if state = -1{alarm[0] = irandom(1080)+120; state = 0; if irandom(1) = 0{direction = 0; dir = 0; x = Blinky.xstart; y = Blinky.ystart;} else{direction = 180; dir = 2; x = Blinky.xstart - 1; y = Blinky.ystart;} tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); newtile = 0;}
        }
    }
    }
    else{//Ms. Pac-Man's fruit
    if spawn = 1{
        {tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); spawn = 2; if state = -1{state = 0; alarm[0] = 1080; if irandom(1) = 0{y = global.ex1;}else{y = global.ex2;}; if irandom(1) = 0{x = -24; direction = 0; dir = 0;}else{x = 456; direction = 180; dir = 2;};
if global.plus = 0{
    if global.lvl > 7{
    if random(7)<1{image_index=0; value=0}
    else{
        if random(6)<1{image_index=1; value=1}
        else{
            if random(5)<1{image_index=2; value=2}
            else{
                if random(4)<1{image_index=8; value=3}
                else{
                    if random(3)<1{image_index=3; value=4}
                    else{
                        if random(2)<1{image_index=9; value=5}
                        else{
                        {image_index=10; value=6}
    }}}}}}}
}
else{
    if global.lvl > 7{
    if random(7)<1{image_index=24; value=0}
    else{
        if random(6)<1{image_index=25; value=1}
        else{
            if random(5)<1{image_index=26; value=2}
            else{
                if random(4)<1{image_index=27; value=3}
                else{
                    if random(3)<1{image_index=28; value=4}
                    else{
                        if random(2)<1{image_index=29; value=5}
                        else{
                        {image_index=30; value=6}
    }}}}}}}
}
    }}}
    }
}
if global.game = 2{
if global.game = 2 and ((Drawless.c64 = 1 and oGameManager.dotcount > -1 + 400) or (oGameManager.dotcount > -1 + 301)){///Jr. Pac-Man's fruit
        if spawn = 2{
            spawn = 3; if state = -1{alarm[0] = irandom(1080)+120; state = 0; if irandom(1) = 0{direction = 0; dir = 0; x = Blinky.xstart; y = Blinky.ystart;} else{direction = 180; dir = 2; x = Blinky.xstart - 1; y = Blinky.ystart;} tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); newtile = 0;}
        }
}
if global.game = 2 and ((Drawless.c64 = 1 and oGameManager.dotcount > -1 + 477) or (oGameManager.dotcount > -1 + 413)){///Jr. Pac-Man's fruit
        if spawn = 3{
            spawn = 4; if state = -1{alarm[0] = irandom(1080)+120; state = 0; if irandom(1) = 0{direction = 0; dir = 0; x = Blinky.xstart; y = Blinky.ystart;} else{direction = 180; dir = 2; x = Blinky.xstart - 1; y = Blinky.ystart;} tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); newtile = 0;}
        }
}
}
if (global.game = 1 and state = 1) or (global.game = 2 and state > -1){///Ms. Pac-Man Fruit bounces out
        if x<-24 or x>room_width+8{state = -1; speed = 0; x = -32; y = -32; speed = 0; dir = -1; newtile = 0; tilex = 16*(round(x/16)); tiley = 16*(round(y/16));}
}

if global.game > 0 and state = -1{direction = 0; speed = 0; x = -32; y = -32; dir = -1}

