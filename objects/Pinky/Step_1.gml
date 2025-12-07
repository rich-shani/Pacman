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






if (abs(16*(round(Pac.x2/16))+(2*Pac.xdir2) - tilex) + abs(16*(round(Pac.y2/16))+(2*Pac.ydir2) - tiley)) = (abs(16*(round(Pac.x/16))+(2*Pac.xdir) - tilex) + abs(16*(round(Pac.y/16))+(2*Pac.ydir) - tiley)) {

if irandom(1) = 1{pursuex = (16*(round(Pac.x2/16))+(2*Pac.xdir2)); pursuey = (16*(round(Pac.y2/16))+(2*Pac.ydir2)); }

else{pursuex = (16*(round(Pac.x/16))+(2*Pac.xdir)); pursuey = (16*(round(Pac.y/16))+(2*Pac.ydir)); }

}

else{

if (abs(16*(round(Pac.x2/16))+(2*Pac.xdir2) - tilex) + abs(16*(round(Pac.y2/16))+(2*Pac.ydir2) - tiley)) < (abs(16*(round(Pac.x/16))+(2*Pac.xdir) - tilex) + abs(16*(round(Pac.y/16))+(2*Pac.ydir) - tiley)) {

pursuex = (16*(round(Pac.x2/16))+(2*Pac.xdir2)); pursuey = (16*(round(Pac.y2/16))+(2*Pac.ydir2)); 

}

else{

pursuex = (16*(round(Pac.x/16))+(2*Pac.xdir)); pursuey = (16*(round(Pac.y/16))+(2*Pac.ydir)); 

}

}


if (y > 48 and y < room_height - 48) {

if house = 0{

if Pac.chomp = 0 or state = 2{

    if newtile = 0{

        if tilex = (16*(round(x/16))) and tiley = (16*(round(y/16))){}

        else{

            newtile = 1; tilex = (16*(round(x/16))); tiley = (16*(round(y/16)));

            if aboutface = 0{

                if state = 0{

                if Pac.scatter = 1{

                    if global.ex1 = 0 and room_width = 448{script_execute(chase_object,tilex,tiley,cornerx,cornery);}

                    else{script_execute(random_direction);}

                }

                else{script_execute(chase_object,tilex,tiley,pursuex,pursuey);}

                }

                if state = 1{script_execute(random_direction);}

                if state = 2{

                    script_execute(chase_object,tilex,tiley,(xstart-216)+208,(ystart-272)+224);

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


