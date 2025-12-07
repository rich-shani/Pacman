if global.p1lives > 0 or global.p2lives > 0{global.lvl = global.lvl + 1}
if (global.game < 2 and room_height < 672 and collision_point(208,528,Wall,false,true)) or (global.game = 2 and ((room_width = 864 or room_width = 496) and room_height = 576)){
global.dottotal = (instance_number(Dot) + instance_number(Power))
}
else{
if global.game < 2{
global.dottotal = 244;
dotcount = 244-(instance_number(Dot) + instance_number(Power))
}
else{
global.dottotal = 554;
dotcount = 554-(instance_number(Dot) + instance_number(Power))
}
}
if (global.players > 0 and global.players < 3 and global.p1lives > 0 and global.p2lives > 0){
    x = xstart - 16; y = ystart;
    x2 = xstart + 16; y2 = ystart;
}
else{
    if global.p1lives > 0 or global.lvl = 0{x = xstart; y = ystart; x2 = -5000; y2 = ystart}
    else{x2 = xstart; y2 = ystart; x = -5000; y = ystart}
}

countdown = 10; global.last = 0;
instance_create(0,0,Pauser);
cornercheck = 0;
blink = 0; alarm[8] = 14;
scale = 1;
scaleup = 1;
dir = 2;
park = -1;
eatdir = -1;
corner = 0;
started = 0;
finish = 0; 
siren = 0;
ambience = 0;
pluseat = 0;
stoppy = 0;
if global.plus = true{
    {sp = 2.5; spfright = 2.5;}
    if global.game < 2 and global.lvl > 15{sp = 2.25; spfright = 2.375;}
    if global.game = 2 and global.lvl > 12{sp = 2.25; spfright = 2.375;}
}
else{
if global.game < 2{
    {sp = 2.00001; spfright = 2.25;}
    if global.lvl > 1{sp = 2.25; spfright = 2.375;}
    if global.lvl > 4{sp = 2.5; spfright = 2.5;}
    if global.lvl > 20{sp = 2.25; spfright = 2.375;}
}
else{
    {sp = 2.25; spfright = 2.375;}
    if global.lvl > 2{sp = 2.5; spfright = 2.5;}
    if global.lvl > 15{sp = 2.25; spfright = 2.375;}
}
}
if global.boost > 0{sp = 4; spfright = 4;}
fright = 0;
if global.plus = 0{
if global.game < 2{
    {frighttime = 360;}
    if global.lvl = 2{frighttime = 300}
    if global.lvl = 3{frighttime = 240}
    if global.lvl = 4{frighttime = 180}
    if global.lvl = 5{frighttime = 120}
    if global.lvl = 6{frighttime = 300}
    if global.lvl = 7{frighttime = 120}
    if global.lvl = 8{frighttime = 120}
    if global.lvl = 9{frighttime = 60}
    if global.lvl = 10{frighttime = 300}
    if global.lvl = 11{frighttime = 120}
    if global.lvl = 12{frighttime = 60}
    if global.lvl = 13{frighttime = 60}
    if global.lvl = 14{frighttime = 180}
    if global.lvl = 15{frighttime = 60}
    if global.lvl = 16{frighttime = 60}
    if global.lvl = 17{frighttime = 0}
    if global.lvl = 18{frighttime = 60}
    if global.lvl > 18{frighttime = 0}
}
else{
    {frighttime = 360;}
    if global.lvl = 2{frighttime = 180}
    if global.lvl = 3{frighttime = 120}
    if global.lvl = 4{frighttime = 120}
    if global.lvl = 5{frighttime = 120}
    if global.lvl = 6{frighttime = 60}
    if global.lvl = 7{frighttime = 60}
    if global.lvl = 8{frighttime = 120}
    if global.lvl = 9{frighttime = 60}
    if global.lvl = 10{frighttime = 60}
    if global.lvl = 11{frighttime = 60}
    if global.lvl = 12{frighttime = 60}
    if global.lvl = 13{frighttime = 60}
    if global.lvl = 14{frighttime = 0}
    if global.lvl = 15{frighttime = 60}
    if global.lvl > 15{frighttime = 0}
}
}
if global.plus = 1{
if global.game < 2{
    {frighttime = 240; bonustime = 360;}
    if global.lvl = 2{frighttime = 180; bonustime = 360;}
    if global.lvl = 3{frighttime = 120; bonustime = 300;}
    if global.lvl = 4{frighttime = 120; bonustime = 240;}
    if global.lvl = 5{frighttime = 120; bonustime = 180;}
    if global.lvl = 6{frighttime = 240; bonustime = 300;}
    if global.lvl = 7{frighttime = 120; bonustime = 180;}
    if global.lvl = 8{frighttime = 60; bonustime = 180;}
    if global.lvl = 9{frighttime = 60; bonustime = 120;}
    if global.lvl = 10{frighttime = 120; bonustime = 240;}
    if global.lvl = 11{frighttime = 60; bonustime = 120;}
    if global.lvl = 12{frighttime = 0; bonustime = 120;}
    if global.lvl = 13{frighttime = 0; bonustime = 120;}
    if global.lvl = 14{frighttime = 120; bonustime = 240;}
    if global.lvl = 15{frighttime = 0; bonustime = 120;}
    if global.lvl = 16{frighttime = 60; bonustime = 120;}
    if global.lvl = 17{frighttime = 0; bonustime = 120;}
    if global.lvl = 18{frighttime = 120; bonustime = 120;}
    if global.lvl = 19{frighttime = 0; bonustime = 60;}
    if global.lvl > 19{frighttime = 0; bonustime = 0;}
}
else{
    {frighttime = 240; bonustime = 360;}
    if global.lvl = 2{frighttime = 120; bonustime = 240;}
    if global.lvl = 3{frighttime = 120; bonustime = 180;}
    if global.lvl = 4{frighttime = 120; bonustime = 180;}
    if global.lvl = 5{frighttime = 60; bonustime = 120;}
    if global.lvl = 6{frighttime = 60; bonustime = 120;}
    if global.lvl = 7{frighttime = 60; bonustime = 120;}
    if global.lvl = 8{frighttime = 0; bonustime = 60;}
    if global.lvl = 9{frighttime = 0; bonustime = 60;}
    if global.lvl = 10{frighttime = 60; bonustime = 120;}
    if global.lvl = 11{frighttime = 60; bonustime = 60;}
    if global.lvl = 12{frighttime = 0; bonustime = 60;}
    if global.lvl > 12{frighttime = 0; bonustime = 0;}
}
}
im = 0;
im2 = 0;
dot = 0;
offset = 0;
pause = 0;
chomp = 0;
start = 1;
alarm[10] = 90; 
if global.start = true{
    alarm[9] = 120;
    if global.game = 0{sound_play(Start); alarm[10] = 250;}
    if global.game = 1{sound_play(MsStart); alarm[10] = 250;}
    if global.game = 2{sound_play(JrStart); alarm[10] = 275;}
global.start = false;
}
chompcount = 0;
xdir = -32
ydir = 0;
psig = 244;
isig = 244;
csig = 244;
timerstart = 240; timer = timerstart;
hspeed = -sp; vspeed = 0;
cycle = 0;
scatter = 1;
if global.game < 2{
scatter1 = 7;
chase1 = 20;
scatter2 = 7;
chase2 = 20;
scatter3 = 5;
chase3 = 20;
scatter4 = 5;
if global.lvl > 1{
    scatter1 = 7;
    chase1 = 20;
    scatter2 = 7;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 1033;
    scatter4 = 1/60;
}
if global.lvl > 4 or global.plus = 1{
    scatter1 = 5;
    chase1 = 20;
    scatter2 = 5;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 1037;
    scatter4 = 1/60;
}
}
else{
scatter1 = 7;
chase1 = 20;
scatter2 = 7;
chase2 = 20;
scatter3 = 5;
chase3 = 1033;
scatter4 = 1/60;
if global.lvl > 2 or global.plus = 1{
    scatter1 = 5;
    chase1 = 20;
    scatter2 = 5;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 1037;
    scatter4 = 1/60;
}
}
test = 0;
///if global.lvl = 0{
newtile = 0;
tilex = 16*(round(x/16))
tiley = 16*(round(y/16))
///}
dead = 0;
deadanim = 0;
plus = -1;
plus2 = 0;
if room_height = 960{if global.lvl > 0{if start = 1{visible = false}else{visible = true}}}
if global.lvl > 0{if Drawless.c64 = 1{if start = 1{visible = false}else{visible = true}}}

