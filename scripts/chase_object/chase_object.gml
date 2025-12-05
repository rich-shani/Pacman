function chase_object(argument0, argument1, argument2, argument3) {
	if x>8 and x<(room_width-8){
	objx = argument0
	objy = argument1
	chasex = argument2
	chasey = argument3
	if collision_point(objx,objy,NoUp,false,true) and state<2{
	    if direction = 0{dir = 0; return 0}
	    if direction = 180{dir = 2; return 0}
	    if direction = 270{
	        if (chasex - objx) > 0{dir = 0; return 0}
	        if (chasex - objx) <= 0{dir = 2; return 0}
	    }
	}
	else{
	if fruity = 0 and collision_point(objx,objy,Up,false,true) and state=2 and direction < 270{dir = 1; return 0}
	else{
	if fruity = 0 and collision_point(objx,objy,Left,false,true) and state=2 and direction > 0{dir = 2; return 0}
	else{
	if fruity = 0 and collision_point(objx,objy,Down,false,true) and state=2 and (direction > 90 or direction < 90){dir = 3; return 0}
	else{
	if fruity = 0 and collision_point(objx,objy,Right,false,true) and state=2 and (direction > 180 or direction < 180){dir = 0; return 0}
	else{
	if (direction = 0){///Moving Right
	    if (chasex > objx) and (chasey > objy){///Target to the Right and Down
	        if ((chasey-objy)>(chasex-objx)){///Target farther Down than Right
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        if ((chasey-objy)<(chasex-objx)){///Target farther Right than Down
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	    }
	    if (chasex > objx) and (chasey <= objy){///Target to the Right and Up
	        if ((objy-chasey)>(chasex-objx)){///Target farther Up than Right
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        if ((objy-chasey)<(chasex-objx)){///Target farther Right than Up
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	    }
	    if (chasex <= objx) and (chasey > objy){///Target to the Left and Down
	        if ((chasey-objy)>(objx-chasex)){///Target farther Down than Left
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        if ((chasey-objy)<(objx-chasex)){///Target farther Left than Down
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	    }
	    if (chasex <= objx) and (chasey <= objy){///Target to the Left and Up
	        if ((objy-chasey)>(objx-chasex)){///Target farther Up than Left
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        if ((objy-chasey)<(objx-chasex)){///Target farther Left than Up
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	    }
	}
	if (direction = 90){///Moving Up
	    if (chasex > objx) and (chasey > objy){///Target to the Right and Down
	        if ((chasey-objy)>(chasex-objx)){///Target farther Down than Right
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        if ((chasey-objy)<(chasex-objx)){///Target farther Right than Down
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        else{
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	    }
	    if (chasex > objx) and (chasey <= objy){///Target to the Right and Up
	        if ((objy-chasey)>(chasex-objx)){///Target farther Up than Right
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        if ((objy-chasey)<(chasex-objx)){///Target farther Right than Up
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	    }
	    if (chasex <= objx) and (chasey > objy){///Target to the Left and Down
	        if ((chasey-objy)>(objx-chasex)){///Target farther Down than Left
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        if ((chasey-objy)<(objx-chasex)){///Target farther Left than Down
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        else{
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	    }
	    if (chasex <= objx) and (chasey <= objy){///Target to the Left and Up
	        if ((objy-chasey)>(objx-chasex)){///Target farther Up than Left
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        if ((objy-chasey)<(objx-chasex)){///Target farther Left than Up
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	    }
	}
	if (direction = 180){///Moving Left
	    if (chasex > objx) and (chasey > objy){///Target to the Right and Down
	        if ((chasey-objy)>(chasex-objx)){///Target farther Down than Right
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        if ((chasey-objy)<(chasex-objx)){///Target farther Right than Down
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	    }
	    if (chasex > objx) and (chasey <= objy){///Target to the Right and Up
	        if ((objy-chasey)>(chasex-objx)){///Target farther Up than Right
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        if ((objy-chasey)<(chasex-objx)){///Target farther Right than Up
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	    }
	    if (chasex <= objx) and (chasey > objy){///Target to the Left and Down
	        if ((chasey-objy)>(objx-chasex)){///Target farther Down than Left
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        if ((chasey-objy)<(objx-chasex)){///Target farther Left than Down
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	        else{
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	        }
	    }
	    if (chasex <= objx) and (chasey <= objy){///Target to the Left and Up
	        if ((objy-chasey)>(objx-chasex)){///Target farther Up than Left
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        if ((objy-chasey)<(objx-chasex)){///Target farther Left than Up
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy-16,Wall,false,true)) and (!collision_point(objx,objy-16,HanglyWall,false,true)){dir = 1; return 0}///Move Up
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	    }
	}
	if (direction = 270){///Moving Down
	    if (chasex > objx) and (chasey > objy){///Target to the Right and Down
	        if ((chasey-objy)>(chasex-objx)){///Target farther Down than Right
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        if ((chasey-objy)<(chasex-objx)){///Target farther Right than Down
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        else{
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	    }
	    if (chasex > objx) and (chasey <= objy){///Target to the Right and Up
	        if ((objy-chasey)>(chasex-objx)){///Target farther Up than Right
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        if ((objy-chasey)<(chasex-objx)){///Target farther Right than Up
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	        }
	        else{
	            if codir = 0 and (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	    }
	    if (chasex <= objx) and (chasey > objy){///Target to the Left and Down
	        if ((chasey-objy)>(objx-chasex)){///Target farther Down than Left
	            if codir = 0 and (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        if ((chasey-objy)<(objx-chasex)){///Target farther Left than Down
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        else{
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	    }
	    if (chasex <= objx) and (chasey <= objy){///Target to the Left and Up
	        if ((objy-chasey)>(objx-chasex)){///Target farther Up than Left
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	        }
	        if ((objy-chasey)<(objx-chasex)){///Target farther Left than Up
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	        else{
	            if codir = 0 and (!collision_point(objx-16,objy,Wall,false,true)) and (!collision_point(objx-16,objy,HanglyWall,false,true)){dir = 2; return 0}///Move Left
	            else
	            if (!collision_point(objx,objy+16,Wall,false,true)) and (!collision_point(objx,objy+16,HanglyWall,false,true)){dir = 3; return 0}///Move Down
	            else
	            if (!collision_point(objx+16,objy,Wall,false,true)) and (!collision_point(objx+16,objy,HanglyWall,false,true)){dir = 0; return 0}///Move Right
	        }
	    }
	}
	}}}}}
	}



}
