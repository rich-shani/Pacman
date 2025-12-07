/// @description /removing one player from board when game overed
function movement2() {
	if global.p1gameover = 1{x = -5000; y = -5000}
	if global.p2gameover = 1{x2 = -5000; y2 = -5000}
	////cornercheck
	if global.lvl > 0{
	if corner2 = 0{
	tilex2 = 16*(round(x2/16))
	tiley2 = 16*(round(y2/16))
	}
	else{
	if tilex2 = 16*(round(x2/16)){}else{
	corner2check = corner2check + 1;
	}
	if tiley2 = 16*(round(y2/16)){}else{
	corner2check = corner2check + 1;
	}
	}
	}
	////control
	if dead = 0 and start = 0 and finish = 0 and stoppy2 = 0 and bonked2 = 0{
	if global.lvl > 0{
	if corner2 = 0 and chomp = 0{
	///right
	    if (y2 > 48 and y2 < room_height - 48) {
	    if keyboard_check(ord("D"))=true and keyboard_check(ord("W"))=false and keyboard_check(ord("A"))=false and keyboard_check(ord("S"))=false{
	        if !collision_point(16*(round((x2)/16))+17,16*(round((y2)/16)),Wall,false,true){dir2= 0; park2 = -1
	            if direction2 = 90{//up to right  
	                if y2 > 16*round((y2)/16){corner2 = 1; hspeed2 = sp; vspeed2 = -sp; exit} // preturn up
	                else{corner2 = 2; hspeed2 = sp; vspeed2 = sp; exit} // postturn up
	            }
	            else{if direction2 = 270{//down to right
	                if y2 < 16*round((y2)/16){corner2 = 2; hspeed2 = sp; vspeed2 = sp; exit} // preturn down
	                else{corner2 = 1; hspeed2 = sp; vspeed2 = -sp; exit} // postturn down
	            }
	            else{hspeed2 = sp; vspeed2 = 0} //left or right to right
	        }}
	        else{if hspeed2 = 0 and vspeed2 = 0{}else{park2 = 0}}
	    }
	    }
	///up
	if x2>8 and x2<(room_width-8){
	    if keyboard_check(ord("W"))=true and keyboard_check(ord("D"))=false and keyboard_check(ord("A"))=false and keyboard_check(ord("S"))=false{
	        if !collision_point(16*(round((x2)/16)),16*(round((y2)/16))-1-0,Wall,false,true){dir2= 1; park2 = -1
	            if direction2 = 0 and !hspeed2 = 0{ //right to up
	                if x2 < 16*round((x2)/16){corner2 = 3; hspeed2 = sp; vspeed2 = -sp; exit} // preturn right
	                else{corner2 = 4; hspeed2 = -sp; vspeed2 = -sp; exit} // postturn right
	            }
	            else{if direction2 = 180{//left to up
	                if x2 > 16*round((x2)/16){corner2 = 4; hspeed2 = -sp; vspeed2 = -sp; exit} // preturn left
	                else{corner2 = 3; hspeed2 = sp; vspeed2 = -sp; exit} // postturn left
	            }
	            else{hspeed2 = 0; vspeed2 = -sp} //down or up to up
	        }}
	        else{if hspeed2 = 0 and vspeed2 = 0{}else{park2 = 1}}
	        }
	}
	///left
	    if (y2 > 48 and y2 < room_height - 48) {
	    if keyboard_check(ord("A"))=true and keyboard_check(ord("W"))=false and keyboard_check(ord("D"))=false and keyboard_check(ord("S"))=false{
	        if !collision_point(16*(round((x2)/16))-1-0,16*(round((y2)/16)),Wall,false,true){dir2= 2; park2 = -1
	            if direction2 = 90{//up to left
	                if y2 > 16*round((y2)/16){corner2 = 5; hspeed2 = -sp; vspeed2 = -sp; exit} // preturn up
	                else{corner2 = 6; hspeed2 = -sp; vspeed2 = sp; exit} // postturn up
	            }
	            else{if direction2 = 270{//down to left
	                if y2 < 16*round((y2)/16){corner2 = 6; hspeed2 = -sp; vspeed2 = sp; exit} // preturn down
	                else{corner2 = 5; hspeed2 = -sp; vspeed2 = -sp; exit} // postturn down
	            }
	            else{hspeed2 = -sp; vspeed2 = 0} //left or right to left
	        }}
	        else{if hspeed2 = 0 and vspeed2 = 0{}else{park2 = 2}}
	        }
	        }
	///down
	if x2>8 and x2<(room_width-8){
	    if keyboard_check(ord("S"))=true and keyboard_check(ord("D"))=false and keyboard_check(ord("A"))=false and keyboard_check(ord("W"))=false{
	        if !collision_point(16*(round((x2)/16)),16*(round((y2)/16))+17,Wall,false,true){dir2= 3; park2 = -1
	            if direction2 = 0 and !hspeed2 = 0{ //right to down
	                if x2 < 16*round((x2)/16){corner2 = 7; hspeed2 = sp; vspeed2 = sp; exit} // preturn right
	                else{corner2 = 8; hspeed2 = -sp; vspeed2 = sp; exit} // postturn right
	            }
	            else{if direction2 = 180{//left to down
	                if x2 > 16*round((x2)/16){corner2 = 8; hspeed2 = -sp; vspeed2 = sp; exit} // preturn left
	                else{corner2 = 7; hspeed2 = sp; vspeed2 = sp; exit} // postturn left
	            }
	            else{hspeed2 = 0; vspeed2 = sp} //down or up to down
	        }}
	        else{if hspeed2 = 0 and vspeed2 = 0{}else{park2 = 3}}
	        }
	}
	}
	if corner2 = 0{}else{if chomp = 0{if corner2check < 2{
	///right
	    if keyboard_check(ord("D"))=true and keyboard_check(ord("W"))=false and keyboard_check(ord("A"))=false and keyboard_check(ord("S"))=false{
	    if !collision_point(16*(round((Mac.x)/16))+17,16*(round((Mac.y)/16)),Wall,false,true){
	    if corner2 = 8{corner2 = 1; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 0; exit}
	    if corner2 = 4{corner2 = 2; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 0; exit}
	    if corner2 = 7{corner2 = 1; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 0; exit}
	    if corner2 = 3{corner2 = 2; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 0; exit}
	    if corner2 = 5{corner2 = 1; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 0; exit}
	    if corner2 = 6{corner2 = 2; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 0; exit}
	}}
	///up
	    if keyboard_check(ord("W"))=true and keyboard_check(ord("D"))=false and keyboard_check(ord("A"))=false and keyboard_check(ord("S"))=false{
	    if !collision_point(16*(round((Mac.x)/16)),16*(round((Mac.y)/16))-1,Wall,false,true){
	    if corner2 = 6{corner2 = 3; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 1; exit}
	    if corner2 = 2{corner2 = 4; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 1; exit}
	    if corner2 = 5{corner2 = 3; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 1; exit}
	    if corner2 = 1{corner2 = 4; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 1; exit}
	    if corner2 = 7{corner2 = 3; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 1; exit}
	    if corner2 = 8{corner2 = 4; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 1; exit}
	}}
	///left
	    if keyboard_check(ord("A"))=true and keyboard_check(ord("W"))=false and keyboard_check(ord("D"))=false and keyboard_check(ord("S"))=false{
	    if !collision_point(16*(round((Mac.x)/16))-1,16*(round((Mac.y)/16)),Wall,false,true){
	    if corner2 = 7{corner2 = 5; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 2; exit}
	    if corner2 = 3{corner2 = 6; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 2; exit}
	    if corner2 = 8{corner2 = 5; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 2; exit}
	    if corner2 = 4{corner2 = 6; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 2; exit}
	    if corner2 = 1{corner2 = 5; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 2; exit}
	    if corner2 = 2{corner2 = 6; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 2; exit}
	}}
	///down
	    if keyboard_check(ord("S"))=true and keyboard_check(ord("D"))=false and keyboard_check(ord("A"))=false and keyboard_check(ord("W"))=false{
	    if !collision_point(16*(round((Mac.x)/16)),16*(round((Mac.y)/16))+17,Wall,false,true){
	    if corner2 = 5{corner2 = 7; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 3; exit}
	    if corner2 = 1{corner2 = 8; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2= 3; exit}
	    if corner2 = 6{corner2 = 7; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 3; exit}
	    if corner2 = 2{corner2 = 8; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2= 3; exit}
	    if corner2 = 3{corner2 = 7; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 3; exit}
	    if corner2 = 4{corner2 = 8; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2= 3; exit}
	}}
	}}}
	}
	}



}
