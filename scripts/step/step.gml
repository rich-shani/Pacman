/// @description /programming speed for Player 2
function step() {
	if dead = 0 and pause2 = 0 and chomp = 0{x2 = x2 + hspeed2; y2 = y2 + vspeed2;};
	////wrapping
	if direction2 = 180 and x2 < -24
	{x2 = (room_width + 24) - (x2 + 24); tilex2 = 16*(round(x2/16)); bonked2 = 0;
	if fright = 1{
	            if dir2 = 0{hspeed2 = spfright; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -spfright;}
	            if dir2 = 2{hspeed2 = -spfright; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = spfright;}
	            }
	            else{ 
	            if dir2 = 0{hspeed2 = sp; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -sp;}
	            if dir2 = 2{hspeed2 = -sp; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = sp;}
	            }
	}
	if direction2 = 0 and x2 > (room_width + 24)
	{x2 = -24 + (x2 - (room_width + 24)); tilex2 = 16*(round(x2/16)); bonked2 = 0;
	if fright = 1{
	            if dir2 = 0{hspeed2 = spfright; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -spfright;}
	            if dir2 = 2{hspeed2 = -spfright; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = spfright;}
	            }
	            else{ 
	            if dir2 = 0{hspeed2 = sp; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -sp;}
	            if dir2 = 2{hspeed2 = -sp; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = sp;}
	            }
	}
	if direction2 = 90 and y2 < 32
	{y2 = 544; tiley2 = 16*(round(y2/16)); bonked2 = 0;
	if fright = 1{
	            if dir2 = 0{hspeed2 = spfright; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -spfright;}
	            if dir2 = 2{hspeed2 = -spfright; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = spfright;}
	            }
	            else{ 
	            if dir2 = 0{hspeed2 = sp; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -sp;}
	            if dir2 = 2{hspeed2 = -sp; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = sp;}
	            }
	}
	if direction2 = 270 and y2 > room_height - 32
	{y2 = 32; tiley2 = 16*(round(y2/16)); bonked2 = 0;
	if fright = 1{
	            if dir2 = 0{hspeed2 = spfright; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -spfright;}
	            if dir2 = 2{hspeed2 = -spfright; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = spfright;}
	            }
	            else{ 
	            if dir2 = 0{hspeed2 = sp; vspeed2 = 0;}
	            if dir2 = 1{hspeed2 = 0; vspeed2 = -sp;}
	            if dir2 = 2{hspeed2 = -sp; vspeed2 = 0;}
	            if dir2 = 3{hspeed2 = 0; vspeed2 = sp;}
	            }
	}
	if corner2 = 0 and eatdir2 = -1 and Pac.finish = 0 and dead = 0 and chomp = 0{
	    if !hspeed2 = 0{if vspeed2 = 0{y2 = 16*(round(y2/16))}}; ///left or right
	    if !vspeed2 = 0{if hspeed2 = 0{x2 = 16*(round(x2/16))}}; ///up or down
	}
	////Moving Mac
	if instance_exists(Mac){Mac.x = x2; Mac.y = y2;}



}
