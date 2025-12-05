if direction = 180 and x < -24
{x = (room_width + 24) - (x + 24); tilex = 16*(round(x/16)); bonked = 0;
if fright = 1{
            if dir = 0{hspeed = spfright; vspeed = 0;}
            if dir = 1{hspeed = 0; vspeed = -spfright;}
            if dir = 2{hspeed = -spfright; vspeed = 0;}
            if dir = 3{hspeed = 0; vspeed = spfright;}
            }
            else{ 
            if dir = 0{hspeed = sp; vspeed = 0;}
            if dir = 1{hspeed = 0; vspeed = -sp;}
            if dir = 2{hspeed = -sp; vspeed = 0;}
            if dir = 3{hspeed = 0; vspeed = sp;}
            }
}
if direction = 0 and x > (room_width + 24)
{x = -24 + (x - (room_width + 24)); tilex = 16*(round(x/16)); bonked = 0;
if fright = 1{
            if dir = 0{hspeed = spfright; vspeed = 0;}
            if dir = 1{hspeed = 0; vspeed = -spfright;}
            if dir = 2{hspeed = -spfright; vspeed = 0;}
            if dir = 3{hspeed = 0; vspeed = spfright;}
            }
            else{ 
            if dir = 0{hspeed = sp; vspeed = 0;}
            if dir = 1{hspeed = 0; vspeed = -sp;}
            if dir = 2{hspeed = -sp; vspeed = 0;}
            if dir = 3{hspeed = 0; vspeed = sp;}
            }
}


