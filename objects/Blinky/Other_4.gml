tilex = (16*(round(x/16)))
tiley = (16*(round(y/16)))
newtile = 0
if global.game < 2{
{sp = 1.875; spslow = 1; spfright = 1.25; spelroy = 2; spelroy2 = 2.125;}
if global.lvl > 1{sp = 2.125; spslow = 1.125; spfright = 1.375; spelroy = 2.25; spelroy2 = 2.375;}
if global.lvl > 4 or global.plus = 1{sp = 2.375; spslow = 1.25; spfright = 1.5; spelroy = 2.5; spelroy2 = 2.625;}
}
else{
{sp = 2.125; spslow = 1.125; spfright = 1.375; spelroy = 2.25; spelroy2 = 2.375;}
if global.lvl > 2 or global.plus = 1{sp = 2.375; spslow = 1.25; spfright = 1.5; spelroy = 2.5; spelroy2 = 2.625;}
}
speyes = 4;
if global.boost = 2{sp = 4; spelroy = 4.125; spelroy2 = 4.25};
elroydots = 224; elroydots2 = 234
if global.lvl = 2{elroydots = 214; elroydots2 = 229}
if global.lvl > 2{elroydots = 204; elroydots2 = 224}
if global.lvl > 5{elroydots = 194; elroydots2 = 219}
if global.lvl > 8{elroydots = 184; elroydots2 = 214}
if global.lvl > 11{elroydots = 164; elroydots2 = 204}
if global.lvl > 14{elroydots = 144; elroydots2 = 194}
if global.lvl > 18{elroydots = 124; elroydots2 = 184}
if global.game = 2{elroydots = elroydots * 2; elroydots2 = elroydots2 * 2;}
if global.plus = 1{elroydots = elroydots - (global.dottotal - elroydots); elroydots2 = elroydots2 - (global.dottotal - elroydots2);}
dir = 2;
im = 0;
aboutface = 0
hspeed = -sp; vspeed = 0;
state = 0;
flash = 0;
house = 0;
housestate = 0;
resdir = -1;
chomped = 0;
cornerx = 400;
cornery = -16;
elroy = 0;
uppity = 1;

