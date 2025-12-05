im = im+1; if im = 16{im = 0}
if Pac.alarm[0] > 120{flash = 0}
if Pac.alarm[0] = 120{flash = 1}
if Pac.alarm[0] = 106{flash = 0}
if Pac.alarm[0] = 92{flash = 1}
if Pac.alarm[0] = 78{flash = 0}
if Pac.alarm[0] = 64{flash = 1}
if Pac.alarm[0] = 60{flash = 1}
if Pac.alarm[0] = 50{flash = 0}
if Pac.alarm[0] = 36{flash = 1}
if Pac.alarm[0] = 22{flash = 0}
if Pac.alarm[0] = 8{flash = 1}
if Pac.alarm[0] = 0{flash = 0}


if (abs(16*(round(Pac.x2/16)) - tilex) + abs(16*(round(Pac.y2/16)) - tiley)) = (abs(16*(round(Pac.x/16)) - tilex) + abs(16*(round(Pac.y/16)) - tiley)) {
if irandom(1) = 1{pursuex = 16*(round(Pac.x2/16)); pursuey = 16*(round(Pac.y2/16)); }
else{pursuex = 16*(round(Pac.x/16)); pursuey = 16*(round(Pac.y/16)); }
}
else{
if (abs(16*(round(Pac.x2/16)) - tilex) + abs(16*(round(Pac.y2/16)) - tiley)) < (abs(16*(round(Pac.x/16)) - tilex) + abs(16*(round(Pac.y/16)) - tiley)) {
pursuex = 16*(round(Pac.x2/16)); pursuey = 16*(round(Pac.y2/16)); 
}
else{
pursuex = 16*(round(Pac.x/16)); pursuey = 16*(round(Pac.y/16)); 
}
}

if (y > 48 and y < room_height - 48) or room = VS7 or room = Piranha{
if house = 0{
if Pac.chomp = 0 or state = 2{
    if newtile = 0{
        if tilex = (16*(round(x/16))) and tiley = (16*(round(y/16))){}
        else{
            newtile = 1; tilex = (16*(round(x/16))); tiley = (16*(round(y/16)));
            if aboutface = 0{
                if state = 0{
                if Pac.scatter = 1{
                    if Pac.dotcount >= elroydots and (Pac.dotcount >= Pac.csig or Clyde.house = 0){script_execute(chase_object,tilex,tiley,pursuex,pursuey);}
                    else{
                        if global.ex1 = 0 and room_width = 448{script_execute(chase_object,tilex,tiley,cornerx,cornery);}
                        else{script_execute(random_direction);}
                    }   
                }
                else{script_execute(chase_object,tilex,tiley,pursuex,pursuey);}
                }
                if state = 1{script_execute(random_direction);}
                if state = 2{
                    script_execute(chase_object,tilex,tiley,(xstart-216)+208,(ystart-224)+224);
                }
            }
            else{
                dir = (direction/90)+2; if dir>3{dir = dir-4}; aboutface = 0;
            }
        }
    }
}
}
}

