/// @description /programming for stopping at a wall for Player 2
with Pac{if global.lvl > 0{
if corner2 = 0{hspeed2 = 0; vspeed2 = 0; x2 = 16*(round(x2/16)); y2 = 16*(round(y2/16)); Mac.x = x2; Mac.y = y2;}
if park2 > -1{dir2 = park2}
bonked2 = 0;
}}

