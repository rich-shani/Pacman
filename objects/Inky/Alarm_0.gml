with Blinky{if house = 0 and state<2{
direction = resdir*90;
}resdir = -1}
with Pinky{if house = 0 and state<2{
direction = resdir*90;
}resdir = -1}
with Inky{if house = 0 and state<2{
direction = resdir*90;
}resdir = -1}
with Clyde{if house = 0 and state<2{
direction = resdir*90;
}resdir = -1}
with Fruit{if state>-1{
direction = resdir*90;
}resdir = -1}
Pac.chomp = 0; state = 2; chomped = 0;
with Pac{
if oGameManager.fright = true{
if pause = 0{
if eatdir = 0{hspeed = oGameManager.spfright; vspeed = 0; eatdir = -1}
if eatdir = 1{hspeed = oGameManager.spfright; vspeed = -oGameManager.spfright; eatdir = -1}
if eatdir = 2{hspeed = 0; vspeed = -oGameManager.spfright; eatdir = -1}
if eatdir = 3{hspeed = -oGameManager.spfright; vspeed = -oGameManager.spfright; eatdir = -1}
if eatdir = 4{hspeed = -oGameManager.spfright; vspeed = 0; eatdir = -1}
if eatdir = 5{hspeed = -oGameManager.spfright; vspeed = oGameManager.spfright; eatdir = -1}
if eatdir = 6{hspeed = 0; vspeed = oGameManager.spfright; eatdir = -1}
if eatdir = 7{hspeed = oGameManager.spfright; vspeed = oGameManager.spfright; eatdir = -1}
if bonked = 1{speed = speed*4};
}
else{pause = pause - 1}
if pause2 = 0{
if eatdir2 = 0{hspeed2 = oGameManager.spfright; vspeed2 = 0; eatdir2 = -1}
if eatdir2 = 1{hspeed2 = oGameManager.spfright; vspeed2 = -oGameManager.spfright; eatdir2 = -1}
if eatdir2 = 2{hspeed2 = 0; vspeed2 = -oGameManager.spfright; eatdir2 = -1}
if eatdir2 = 3{hspeed2 = -oGameManager.spfright; vspeed2 = -oGameManager.spfright; eatdir2 = -1}
if eatdir2 = 4{hspeed2 = -oGameManager.spfright; vspeed2 = 0; eatdir2 = -1}
if eatdir2 = 5{hspeed2 = -oGameManager.spfright; vspeed2 = oGameManager.spfright; eatdir2 = -1}
if eatdir2 = 6{hspeed2 = 0; vspeed2 = oGameManager.spfright; eatdir2 = -1}
if eatdir2 = 7{hspeed2 = oGameManager.spfright; vspeed2 = oGameManager.spfright; eatdir2 = -1}
if bonked2 = 1{if abs(hspeed2) > 0{hspeed2 = 4*(abs(hspeed2)/hspeed2)}; if abs(vspeed2) > 0{vspeed2 = 4*(abs(vspeed2)/vspeed2)};}
}
else{pause2 = pause2 - 1}
}
else{
if pause = 0{
if eatdir = 0{hspeed = oGameManager.sp; vspeed = 0; eatdir = -1}
if eatdir = 1{hspeed = oGameManager.sp; vspeed = -oGameManager.sp; eatdir = -1}
if eatdir = 2{hspeed = 0; vspeed = -oGameManager.sp; eatdir = -1}
if eatdir = 3{hspeed = -oGameManager.sp; vspeed = -oGameManager.sp; eatdir = -1}
if eatdir = 4{hspeed = -oGameManager.sp; vspeed = 0; eatdir = -1}
if eatdir = 5{hspeed = -oGameManager.sp; vspeed = oGameManager.sp; eatdir = -1}
if eatdir = 6{hspeed = 0; vspeed = oGameManager.sp; eatdir = -1}
if eatdir = 7{hspeed = oGameManager.sp; vspeed = oGameManager.sp; eatdir = -1}
if bonked = 1{speed = speed*4};
}
else{pause = pause - 1}
if pause2 = 0{
if eatdir2 = 0{hspeed2 = oGameManager.sp; vspeed2 = 0; eatdir2 = -1}
if eatdir2 = 1{hspeed2 = oGameManager.sp; vspeed2 = -oGameManager.sp; eatdir2 = -1}
if eatdir2 = 2{hspeed2 = 0; vspeed2 = -oGameManager.sp; eatdir2 = -1}
if eatdir2 = 3{hspeed2 = -oGameManager.sp; vspeed2 = -oGameManager.sp; eatdir2 = -1}
if eatdir2 = 4{hspeed2 = -oGameManager.sp; vspeed2 = 0; eatdir2 = -1}
if eatdir2 = 5{hspeed2 = -oGameManager.sp; vspeed2 = oGameManager.sp; eatdir2 = -1}
if eatdir2 = 6{hspeed2 = 0; vspeed2 = oGameManager.sp; eatdir2 = -1}
if eatdir2 = 7{hspeed2 = oGameManager.sp; vspeed2 = oGameManager.sp; eatdir2 = -1}
if bonked2 = 1{if abs(hspeed2) > 0{hspeed2 = 4*(abs(hspeed2)/hspeed2)}; if abs(vspeed2) > 0{vspeed2 = 4*(abs(vspeed2)/vspeed2)};}
}
else{pause = pause - 1; pause2 = pause2 - 1}
}
}

