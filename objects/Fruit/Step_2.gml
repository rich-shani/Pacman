if state > -1 and nomove = 0 and Pac.dead = 0{
//speed
if Pac.finish > 0{speed = 0;}
else{
if global.game = 1{speed = 1.00001}
if global.game = 2{speed = 0.75001}
}
//turning
if Pac.chomp = 0{
if newtile = 1{
    if tilex = c1x and tiley = c1y and c1dir = -1{c1dir = dir};
    if tilex = c2x and tiley = c2y and c2dir = -1{c2dir = dir};
    if tilex = c3x and tiley = c3y and c3dir = -1{c3dir = dir};
    if tilex = c4x and tiley = c4y and c4dir = -1{c4dir = dir};
    if tilex = c5x and tiley = c5y and c5dir = -1{c5dir = dir};
    if tilex = c6x and tiley = c6y and c6dir = -1{c6dir = dir};
    if tilex = c7x and tiley = c7y and c7dir = -1{c7dir = dir};
    if tilex = c8x and tiley = c8y and c8dir = -1{c8dir = dir};
if dir = 0{
    if direction = 0 and x > tilex{direction = 0; newtile = 0; exit}
    if direction = 90 and y < tiley{direction = 0; x=tilex+(tiley-y); y=tiley; newtile = 0; exit}
    if direction = 180 and x < tilex{x = tilex; direction = 0; newtile = 0; exit}
    if direction = 270 and y > tiley{direction = 0; x=tilex+(y-tiley); y=tiley; newtile = 0; exit}
}
if dir = 1{
    if direction = 0 and x > tilex{direction = 90; y=tiley-(x-tilex); x=tilex; newtile = 0; exit}
    if direction = 90 and y < tiley{direction = 90; newtile = 0; exit}
    if direction = 180 and x < tilex{direction = 90; y=tiley-(tilex-x); x=tilex; newtile = 0; exit}
    if direction = 270 and y > tiley{y = tiley; direction = 90; newtile = 0; exit}
}
if dir = 2{
    if direction = 0 and x > tilex{x = tilex; direction = 180; newtile = 0; exit}
    if direction = 90 and y < tiley{direction = 180; x=tilex-(tiley-y); y=tiley; newtile = 0; exit}
    if direction = 180 and x < tilex{direction = 180; newtile = 0; exit}
    if direction = 270 and y > tiley{direction = 180; x=tilex-(y-tiley); y=tiley; newtile = 0; exit}
}
if dir = 3{
    if direction = 0 and x > tilex{direction = 270; y=tiley+(x-tilex); x=tilex; newtile = 0; exit}
    if direction = 90 and y < tiley{y = tiley; direction = 270; newtile = 0; exit}
    if direction = 180 and x < tilex{direction = 270; y=tiley+(tilex-x); x=tilex; newtile = 0; exit}
    if direction = 270 and y > tiley{direction = 270; newtile = 0; exit}
}
}
}
}

if Pac.dead = 0{
if room_width = 448{}else{
if instance_number(Power) = 0{}else{
if x > chasex - 1 and x < chasex + 1 and y > chasey - 1 and y < chasey + 1 and state = 1{
x = chasex; y = chasey; bounce = 0;
if x > __view_get( e__VW.XView, 0 ) + 8 and x < __view_get( e__VW.XView, 0 ) + 440 - 16 and y > __view_get( e__VW.YView, 0 ) + 8 + 32 and y < __view_get( e__VW.YView, 0 ) + 568 - 48{
    explosion = 1; if global.lvl > 0{sound_loop(Credit);} alarm[2] = 90; newtile = 0;
    if state > -1{xstart = x; ystart = y;} state = -1; x = -32; y = -32; speed = 0; dir = -1; 
    tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); expx = chasex; expy = chasey;
    with Power{if x = Fruit.chasex and y = Fruit.chasey{instance_destroy()}}
}
}
}
}
}

exit
if scaleup = 1{
    scale = scale + 0.05; if scale = 1.50{scaleup = 0; exit}
}
if scaleup = 0{
    scale = scale - 0.05; if scale = 1.00{scaleup = 1; exit}
}

if state > -1{
if direction = 90 and y < 32
{y = 544; tiley = 16*(round(y/16));}
if direction = 270 and y > room_height - 32
{y = 32; tiley = 16*(round(y/16));}
}

