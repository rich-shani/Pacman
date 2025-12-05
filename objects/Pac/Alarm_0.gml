fright = 0; prohibit = 0; plus2 = 0;
if bonked = 0{
if hspeed > 0{hspeed = sp}
if hspeed < 0{hspeed = -sp}
if vspeed > 0{vspeed = sp}
if vspeed < 0{vspeed = -sp}
}
if bonked2 = 0{
if hspeed2 > 0{hspeed2 = sp}
if hspeed2 < 0{hspeed2 = -sp}
if vspeed2 > 0{vspeed2 = sp}
if vspeed2 < 0{vspeed2 = -sp}
}
chompcount = 0; Pac.pluseat = 0;
with Blinky{if state=1{state = 0}}
with Pinky{if state=1{state = 0}}
with Inky{if state=1{state = 0}}
with Clyde{if state=1{state = 0}}

