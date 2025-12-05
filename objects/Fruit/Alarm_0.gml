if global.ex1 = 0 and room_width = 448{x = -32; y = -32;}
else{state = 1; exopt = irandom(3);
closex = 1000; closey = 1000;
close2x = 1000; close2y = 1000;
close3x = 1000; close3y = 1000;
close4x = 1000; close4y = 1000;
c1x = 0; c2x = 0; c3x = 0; c4x = 0;
c5x = 0; c6x = 0; c7x = 0; c8x = 0;
c1y = 0; c2y = 0; c3y = 0; c4y = 0;
c5y = 0; c6y = 0; c7y = 0; c8y = 0;
c1dir = -1; c2dir = -1; c3dir = -1; c4dir = -1;
c5dir = -1; c6dir = -1; c7dir = -1; c8dir = -1;
if room_width = 448{}else{
    if instance_number(Power) = 0{}else{
            if irandom(2) = 1{chasex = global.p1x; chasey = global.p1y}
            else{
                if irandom(1) = 1{chasex = global.p2x; chasey = global.p2y}
                else{
                    if !collision_point(global.p1x,global.p1y,Power,false,true)
                    and !collision_point(848 - global.p1x,global.p1y,Power,false,true)
                    and !collision_point(global.p2x,global.p2y,Power,false,true)
                    and !collision_point(848 - global.p2x,global.p2y,Power,false,true){chasex = global.p3x; chasey = global.p3y}
                    else{
                        if irandom(1) = 1{chasex = global.p1x; chasey = global.p1y}
                        else{chasex = global.p2x; chasey = global.p2y}
                    }
                }
            }
            if irandom(1) = 1{chasex = 848 - chasex}
    }
}
}

