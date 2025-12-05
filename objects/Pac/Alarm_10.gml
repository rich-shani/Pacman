start = 0;
if global.lvl > 0 and start = 0 and dead = 0 and dotcount = global.dottotal and finish = 0{
finish = 1; alarm[11] = 60; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
Blinky.speed = 0; Pinky.speed = 0; Inky.speed = 0; Clyde.speed = 0; Pac.speed = 0;
}
else{
ambience = -1;
if keyboard_check(vk_right) = true{dir = 0; hspeed = sp}; else{dir = 2; hspeed = -sp}; vspeed = 0;
///PLAYER 2 INITIAL SPEED, FIX LATER
if keyboard_check(ord("A")) = true{dir2 = 2; hspeed2 = -sp}; else{dir2 = 0; hspeed2 = sp}; vspeed2 = 0;
///
with Blinky{hspeed = -sp; vspeed = 0;}
with Power{alarm[0] = 10}
if started = 0{
if global.game < 2{
    if (global.game < 2 and room_height < 672 and collision_point(0,512,Wall,false,true)) or (global.game = 2 and (room_width = 864 or room_width = 496)){
        psig = 0; isig = 30; csig = 90;
        if global.lvl = 2 or (global.plus = 1 and global.lvl = 1){psig = 0; isig = 0; csig = 50;}
        if global.lvl > 2 or (global.plus = 1 and global.lvl > 1){psig = 0; isig = 0; csig = 0;}
    }
    else{
        psig = 0; isig = 30; csig = 90;
        if global.lvl = 2 or (global.plus = 1 and global.lvl = 1){psig = 0; isig = 0; csig = 50;}
        if global.lvl > 2 or (global.plus = 1 and global.lvl > 1){psig = 0; isig = 0; csig = 0;}
        psig = psig + dotcount
        isig = isig + dotcount
        csig = csig + dotcount
    }
}
else{
psig = 0 + dotcount; isig = 0 + dotcount; csig = 50 + dotcount;
if global.lvl > 1 or global.plus = 1{psig = 0 + dotcount; isig = 0 + dotcount; csig = 0 + dotcount;}
}
started = 1
}
alarm[1] = scatter1*60;
if global.game = 1 and global.lvl > 3{with Slow{instance_destroy()}}
with Fruit{
///spawn = 0; (REMOVED TO FIX BUG)
points = 0;
x = -32; y = -32;
dir = 0;
exopt = -1;
state = -1;
newtile = 0
tilex = 16*(round(x/16))
tiley = 16*(round(y/16))
resdir = -1;
up = 1;
bounce = 0;
chasex = 0;
chasey = 0;
explosion = 0;
im = 0;
expx = 0;
expy = 0;
image_speed = 0;
if global.plus = 0{
if global.game = 0{
    if global.lvl = 0{image_index = 0; value = 0;}
    if global.lvl = 1{image_index = 0; value = 0;}
    if global.lvl = 2{image_index = 1; value = 1;}
    if global.lvl = 3{image_index = 2; value = 2;}
    if global.lvl = 4{image_index = 2; value = 2;}
    if global.lvl = 5{image_index = 3; value = 3;} 
    if global.lvl = 6{image_index = 3; value = 3;}
    if global.lvl = 7{image_index = 4; value = 4;}
    if global.lvl = 8{image_index = 4; value = 4;}
    if global.lvl = 9{image_index = 5; value = 5;}
    if global.lvl = 10{image_index = 5; value = 5;}
    if global.lvl = 11{image_index = 6; value = 6;}
    if global.lvl = 12{image_index = 6; value = 6;}
    if global.lvl > 12{image_index = 7; value = 7;}
}
if global.game = 1{
    if global.lvl = 0{image_index = 0; value = 0;}
    if global.lvl = 1{image_index = 0; value = 0;}
    if global.lvl = 2{image_index = 1; value = 1;}
    if global.lvl = 3{image_index = 2; value = 2;}
    if global.lvl = 4{image_index = 8; value = 3;}
    if global.lvl = 5{image_index = 3; value = 4;}
    if global.lvl = 6{image_index = 9; value = 5;}
    if global.lvl = 7{image_index = 10; value = 6;}
}
if global.game = 2{
    if global.lvl = 0{image_index = 17; value = 0;}
    if global.lvl = 1{image_index = 17; value = 0;}
    if global.lvl = 2{image_index = 18; value = 1;}
    if global.lvl = 3{image_index = 19; value = 2;}
    if global.lvl = 4{image_index = 20; value = 3;}
    if global.lvl = 5{image_index = 21; value = 4;}
    if global.lvl = 6{image_index = 22; value = 5;}
    if global.lvl > 6{image_index = 23; value = 6;}
}
}
else{
if global.game = 0{
    if global.lvl = 0{image_index = 11; value = 0;}
    if global.lvl = 1{image_index = 11; value = 0;}
    if global.lvl = 2{image_index = 12; value = 1;}
    if global.lvl = 3{image_index = 13; value = 2;}
    if global.lvl = 4{image_index = 13; value = 2;}
    if global.lvl = 5{image_index = 3; value = 3;} 
    if global.lvl = 6{image_index = 3; value = 3;}
    if global.lvl = 7{image_index = 14; value = 4;}
    if global.lvl = 8{image_index = 14; value = 4;}
    if global.lvl = 9{image_index = 5; value = 5;}
    if global.lvl = 10{image_index = 5; value = 5;}
    if global.lvl = 11{image_index = 16; value = 6;}
    if global.lvl = 12{image_index = 16; value = 6;}
    if global.lvl > 12{image_index = 17; value = 7;}
}
if global.game = 1{
    if global.lvl = 0{image_index = 24; value = 0;}
    if global.lvl = 1{image_index = 24; value = 0;}
    if global.lvl = 2{image_index = 25; value = 1;}
    if global.lvl = 3{image_index = 26; value = 2;}
    if global.lvl = 4{image_index = 27; value = 3;}
    if global.lvl = 5{image_index = 28; value = 4;}
    if global.lvl = 6{image_index = 29; value = 5;}
    if global.lvl = 7{image_index = 30; value = 6;}
}
if global.game = 2{
    if global.lvl = 0{image_index = 31; value = 0;}
    if global.lvl = 1{image_index = 31; value = 0;}
    if global.lvl = 2{image_index = 32; value = 1;}
    if global.lvl = 3{image_index = 33; value = 2;}
    if global.lvl = 4{image_index = 34; value = 3;}
    if global.lvl = 5{image_index = 35; value = 4;}
    if global.lvl = 6{image_index = 36; value = 5;}
    if global.lvl > 6{image_index = 37; value = 6;}
}
}
}
}

