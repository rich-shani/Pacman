c64 = 0;
if room = C64_01 or room = C64_02 or room = C64_03 or room = C64_04 or room = C64_05 or room = C64_06{c64 = 1};

//if room = Extended1 or room = Extended2 or room = Extended3 or room = Extended4 or room = Extended5 or room = Extended6 or room = Extended7{extend = 1};
extend = 0;

spawn = 0;

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

dh = 0;

ds = 0;

dv = 0;

mh2 = 0;

ms2 = 0;

mv2 = 0;

scale = 1; ///to change back, change to 1.5

scaleup = 1; ///to change back, change to 0

noturn = 0;

nomove = 0;

fruity = 1;


if global.doki = 1{

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

    if global.lvl = 4{image_index = 3; value = 3;}

    if global.lvl = 5{image_index = 4; value = 4;}

    if global.lvl = 6{image_index = 5; value = 5;}

    if global.lvl = 7{image_index = 6; value = 6;}

}

if global.game = 2{

    if global.lvl = 0{image_index = 0; value = 0;}

    if global.lvl = 1{image_index = 0; value = 0;}

    if global.lvl = 2{image_index = 1; value = 1;}

    if global.lvl = 3{image_index = 2; value = 2;}

    if global.lvl = 4{image_index = 3; value = 3;}

    if global.lvl = 5{image_index = 4; value = 4;}

    if global.lvl = 6{image_index = 5; value = 5;}

    if global.lvl > 6{image_index = 6; value = 6;}

}

}

else{

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

    if global.lvl = 11{image_index = 15; value = 6;}

    if global.lvl = 12{image_index = 15; value = 6;}

    if global.lvl > 12{image_index = 16; value = 7;}

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


