function codir_script() {
	if x > 15 and x < room_width - 15{
	targx = 0; targy = 0; codir = 0;
	if room_width = 448{targx = (floor(exopt/2)*432); if exopt = 0 or exopt = 2{targy = global.ex1}if exopt = 1 or exopt = 3{targy = global.ex2}}
	else{targx = chasex; targy = chasey}
	///
	if tilex = closex and tiley = closey{codir = 1;
	if c1x = 0{c1x = closex; c1y = closey;}
	else{if c2x = 0{c2x = closex; c2y = closey;}
	else{if c3x = 0{c3x = closex; c3y = closey;}
	else{if c4x = 0{c4x = closex; c4y = closey;}
	else{if c5x = 0{c5x = closex; c5y = closey;}
	else{if c6x = 0{c6x = closex; c6y = closey;}
	else{if c7x = 0{c7x = closex; c7y = closey;}
	else{if c8x = 0{c8x = closex; c8y = closey;}
	}}}}}}}
	closex = close2x; closey = close2y;
	close2x = close3x; close2y = close3y;
	close3x = close4x; close3y = close4y; 
	close4x = 1000; close4y = 1000;
	}
	else{
	    check = 0
	    if collision_point(tilex+16,tiley,Wall,false,true){check=check+1}///right
	    if collision_point(tilex,tiley-16,Wall,false,true){check=check+3}///up
	    if collision_point(tilex-16,tiley,Wall,false,true){check=check+5}///left
	    if collision_point(tilex,tiley+16,Wall,false,true){check=check+11}///down
	    if check = 0 or check = 1 or check = 3 or check = 5 or check = 11{
	        if (abs(targx - tilex) + abs(targy - tiley)) < (abs(targx - closex) + abs(targy - closey)){
	        if tilex = closex and tiley = closey{}else{
	        if tilex = close2x and tiley = close2y{}else{
	        if tilex = close3x and tiley = close3y{}else{
	        if tilex = close4x and tiley = close4y{}else{
	            close4x = close3x; close4y = close3y;
	            close3x = close2x; close3y = close2y;
	            close2x = closex; close2y = closey;
	            closex = tilex; closey = tiley;
	        }}}}
	        }
	        else{
	            if (abs(targx - tilex) + abs(targy - tiley)) < (abs(targx - close2x) + abs(targy - close2y)){
	            if tilex = closex and tiley = closey{}else{
	            if tilex = close2x and tiley = close2y{}else{
	            if tilex = close3x and tiley = close3y{}else{
	            if tilex = close4x and tiley = close4y{}else{
	            if tilex = c1x and tiley = c1y{}else{
	            if tilex = c2x and tiley = c2y{}else{
	            if tilex = c3x and tiley = c3y{}else{
	            if tilex = c4x and tiley = c4y{}else{
	            if tilex = c5x and tiley = c5y{}else{
	            if tilex = c6x and tiley = c6y{}else{
	            if tilex = c7x and tiley = c7y{}else{
	            if tilex = c8x and tiley = c8y{}else{
	                close4x = close3x; close4y = close3y;
	                close3x = close2x; close3y = close2y;
	                close2x = tilex; close2y = tiley;
	            }}}}}}}}}}}}
	            }
	            else{
	                if (abs(targx - tilex) + abs(targy - tiley)) < (abs(targx - close3x) + abs(targy - close3y)){
	                if tilex = closex and tiley = closey{}else{
	                if tilex = close2x and tiley = close2y{}else{
	                if tilex = close3x and tiley = close3y{}else{
	                if tilex = close4x and tiley = close4y{}else{
	                if tilex = c1x and tiley = c1y{}else{
	                if tilex = c2x and tiley = c2y{}else{
	                if tilex = c3x and tiley = c3y{}else{
	                if tilex = c4x and tiley = c4y{}else{
	                if tilex = c5x and tiley = c5y{}else{
	                if tilex = c6x and tiley = c6y{}else{
	                if tilex = c7x and tiley = c7y{}else{
	                if tilex = c8x and tiley = c8y{}else{
	                    close4x = close3x; close4y = close3y;
	                    close3x = tilex; close3y = tiley;
	                }}}}}}}}}}}}
	                }
	                else{
	                    if (abs(targx - tilex) + abs(targy - tiley)) < (abs(targx - close4x) + abs(targy - close4y)){
	                    if tilex = closex and tiley = closey{}else{
	                    if tilex = close2x and tiley = close2y{}else{
	                    if tilex = close3x and tiley = close3y{}else{
	                    if tilex = close4x and tiley = close4y{}else{
	                    if tilex = c1x and tiley = c1y{}else{
	                    if tilex = c2x and tiley = c2y{}else{
	                    if tilex = c3x and tiley = c3y{}else{
	                    if tilex = c4x and tiley = c4y{}else{
	                    if tilex = c5x and tiley = c5y{}else{
	                    if tilex = c6x and tiley = c6y{}else{
	                    if tilex = c7x and tiley = c7y{}else{
	                    if tilex = c8x and tiley = c8y{}else{
	                        close4x = tilex; close4y = tiley;
	                }}}}}}}}}}}}
	                }
	        }}}
	    }
	}
	}



}
