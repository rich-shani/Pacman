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






if ((abs(Blinky.tilex + (((16*(round(Pac.x2/16))+Pac.xdir2) - Blinky.tilex)*2) - tilex)) + (abs(Blinky.tiley + (((16*(round(Pac.y2/16))+Pac.ydir2) - Blinky.tiley)*2) - tiley)))

= ((abs(Blinky.tilex + (((16*(round(Pac.x/16))+Pac.xdir) - Blinky.tilex)*2) - tilex)) + (abs(Blinky.tiley + (((16*(round(Pac.y/16))+Pac.ydir) - Blinky.tiley)*2) - tiley))) {

if irandom(1) = 1{

pursuex = (Blinky.tilex + (((16*(round(Pac.x2/16))+Pac.xdir2) - Blinky.tilex)*2)); pursuey = (Blinky.tiley + (((16*(round(Pac.y2/16))+Pac.ydir2) - Blinky.tiley)*2)); 

}

else{

pursuex = (Blinky.tilex + (((16*(round(Pac.x/16))+Pac.xdir) - Blinky.tilex)*2)); pursuey = (Blinky.tiley + (((16*(round(Pac.y/16))+Pac.ydir) - Blinky.tiley)*2)); 

}

}

else{

if ((abs(Blinky.tilex + (((16*(round(Pac.x2/16))+Pac.xdir2) - Blinky.tilex)*2) - tilex)) + (abs(Blinky.tiley + (((16*(round(Pac.y2/16))+Pac.ydir2) - Blinky.tiley)*2) - tiley)))

< ((abs(Blinky.tilex + (((16*(round(Pac.x/16))+Pac.xdir) - Blinky.tilex)*2) - tilex)) + (abs(Blinky.tiley + (((16*(round(Pac.y/16))+Pac.ydir) - Blinky.tiley)*2) - tiley))) {

pursuex = (Blinky.tilex + (((16*(round(Pac.x2/16))+Pac.xdir2) - Blinky.tilex)*2)); pursuey = (Blinky.tiley + (((16*(round(Pac.y2/16))+Pac.ydir2) - Blinky.tiley)*2)); 

}

else{

pursuex = (Blinky.tilex + (((16*(round(Pac.x/16))+Pac.xdir) - Blinky.tilex)*2)); pursuey = (Blinky.tiley + (((16*(round(Pac.y/16))+Pac.ydir) - Blinky.tiley)*2)); 

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

                if oGameManager.scatter = 1{

                if room_width = 448{script_execute(chase_object,tilex,tiley,cornerx,cornery);}

                else{script_execute(random_direction);}

                }

                else{script_execute(chase_object,tilex,tiley,pursuex,pursuey);}

                }

                if state = 1{script_execute(random_direction);}

                if state = 2{

                    script_execute(chase_object,tilex,tiley,(xstart-184)+208,(ystart-272)+224);

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


