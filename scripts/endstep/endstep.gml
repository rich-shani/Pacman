/// @description /snapping back to grid after cornering 
function endstep() {
	if fright = 1{
	if corner2 = 1{if y2  < 16*(round(y2/16)) {y2 = 16*(round(y2/16)); hspeed2 = spfright; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 2{if y2  > 16*(round(y2/16)) {y2 = 16*(round(y2/16)); hspeed2 = spfright; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 3{if x2  > 16*(round(x2/16)) {x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = -spfright; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 4{if x2  < 16*(round(x2/16)) {x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = -spfright; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 5{if y2  < 16*(round(y2/16)) {y2 = 16*(round(y2/16)); hspeed2 = -spfright; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 6{if y2  > 16*(round(y2/16)) {y2 = 16*(round(y2/16)); hspeed2 = -spfright; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 7{if x2  > 16*(round(x2/16)) {x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = spfright; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 8{if x2  < 16*(round(x2/16)) {x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = spfright; corner2 = 0; corner2check = 0; exit}}
	}
	else{
	if corner2 = 1{if y2  < 16*(round(y2/16)){y2 = 16*(round(y2/16)); hspeed2 = sp; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 2{if y2  > 16*(round(y2/16)){y2 = 16*(round(y2/16)); hspeed2 = sp; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 3{if x2  > 16*(round(x2/16)){x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = -sp; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 4{if x2  < 16*(round(x2/16)){x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = -sp; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 5{if y2  < 16*(round(y2/16)){y2 = 16*(round(y2/16)); hspeed2 = -sp; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 6{if y2  > 16*(round(y2/16)){y2 = 16*(round(y2/16)); hspeed2 = -sp; vspeed2 = 0; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 7{if x2  > 16*(round(x2/16)){x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = sp; corner2 = 0; corner2check = 0; exit}}
	if corner2 = 8{if x2  < 16*(round(x2/16)){x2 = 16*(round(x2/16)); hspeed2 = 0; vspeed2 = sp; corner2 = 0; corner2check = 0; exit}}
	}
	////resetting speed after dot/powerpellet
	if chomp = 0{
	    if fright = true{
	        if pause2 = 0{
	            if eatdir2 = 0{hspeed2 = spfright; vspeed2 = 0; eatdir2 = -1}
	            if eatdir2 = 1{hspeed2 = spfright; vspeed2 = -spfright; eatdir2 = -1}
	            if eatdir2 = 2{hspeed2 = 0; vspeed2 = -spfright; eatdir2 = -1}
	            if eatdir2 = 3{hspeed2 = -spfright; vspeed2 = -spfright; eatdir2 = -1}
	            if eatdir2 = 4{hspeed2 = -spfright; vspeed2 = 0; eatdir2 = -1}
	            if eatdir2 = 5{hspeed2 = -spfright; vspeed2 = spfright; eatdir2 = -1}
	            if eatdir2 = 6{hspeed2 = 0; vspeed2 = spfright; eatdir2 = -1}
	            if eatdir2 = 7{hspeed2 = spfright; vspeed2 = spfright; eatdir2 = -1}
	            stoppy2 = 0;
	        }
	    else{pause2 = pause2 -1;}
	    }
	    else{
	        if pause2 = 0{
	            if eatdir2 = 0{hspeed2 = sp; vspeed2 = 0; eatdir2 = -1}
	            if eatdir2 = 1{hspeed2 = sp; vspeed2 = -sp; eatdir2 = -1}
	            if eatdir2 = 2{hspeed2 = 0; vspeed2 = -sp; eatdir2 = -1}
	            if eatdir2 = 3{hspeed2 = -sp; vspeed2 = -sp; eatdir2 = -1}
	            if eatdir2 = 4{hspeed2 = -sp; vspeed2 = 0; eatdir2 = -1}
	            if eatdir2 = 5{hspeed2 = -sp; vspeed2 = sp; eatdir2 = -1}
	            if eatdir2 = 6{hspeed2 = 0; vspeed2 = sp; eatdir2 = -1}
	            if eatdir2 = 7{hspeed2 = sp; vspeed2 = sp; eatdir2 = -1}
	            stoppy2 = 0;
	        }
	    else{pause2 = pause2 -1;}
	    }
	}
	////target
	if dir2 = 0{xdir2 = 32; ydir2 = 0}
	if dir2 = 1{xdir2 = -32; ydir2 = -32}
	if dir2 = 2{xdir2 = -32; ydir2 = 0}
	if dir2 = 3{xdir2 = 0; ydir2 = 32}
	////acheiving the high score
	if global.rand = 0{
	if global.game = 0 and global.plus = 0 and global.mode = 0{
	    if global.p2score > global.pacscore{global.pacscore = global.p2score}
	}
	if global.game = 0 and global.plus = 1 and global.mode = 0{
	    if global.p2score > global.pacplusscore{global.pacplusscore = global.p2score}
	}
	if global.game = 1 and global.plus = 0 and global.mode = 0{
	    if global.p2score > global.mspacscore{global.mspacscore = global.p2score}
	}
	if global.game = 1 and global.plus = 1 and global.mode = 0{
	    if global.p2score > global.mspacplusscore{global.mspacplusscore = global.p2score}
	}
	if global.game = 0 and global.plus = 0 and global.mode = 1{
	    if global.p2score > global.hanglyscore{global.hanglyscore = global.p2score}
	}
	if global.game = 0 and global.plus = 1 and global.mode = 1{
	    if global.p2score > global.hanglyplusscore{global.hanglyplusscore = global.p2score}
	}
	if global.game = 0 and global.plus = 0 and global.mode = 2{
	    if global.p2score > global.newscore{global.newscore = global.p2score}
	}
	if global.game = 0 and global.plus = 1 and global.mode = 2{
	    if global.p2score > global.newplusscore{global.newplusscore = global.p2score}
	}
	if global.game = 0 and global.plus = 0 and global.mode = 3{
	    if global.p2score > global.ultrascore{global.ultrascore = global.p2score}
	}
	if global.game = 0 and global.plus = 1 and global.mode = 3{
	    if global.p2score > global.ultraplusscore{global.ultraplusscore = global.p2score}
	}
	if global.game = 1 and global.plus = 0 and global.mode = 1{
	    if global.p2score > global.mspmpscore{global.mspmpscore = global.p2score}
	}
	if global.game = 1 and global.plus = 1 and global.mode = 1{
	    if global.p2score > global.mspmpplusscore{global.mspmpplusscore = global.p2score}
	}
	if global.game = 1 and global.plus = 0 and global.mode = 2{
	    if global.p2score > global.pacjrscore{global.pacjrscore = global.p2score}
	}
	if global.game = 1 and global.plus = 1 and global.mode = 2{
	    if global.p2score > global.pacjrplusscore{global.pacjrplusscore = global.p2score}
	}
	if global.game = 1 and global.plus = 0 and global.mode = 3{
	    if global.p2score > global.strangescore{global.strangescore = global.p2score}
	}
	if global.game = 1 and global.plus = 1 and global.mode = 3{
	    if global.p2score > global.strangeplusscore{global.strangeplusscore = global.p2score}
	}
	if global.game = 2 and global.plus = 0 and global.mode = 0{
	    if global.p2score > global.jrpacscore{global.jrpacscore = global.p2score}
	}
	if global.game = 2 and global.plus = 0 and global.mode = 1{
	    if global.p2score > global.extendedscore{global.extendedscore = global.p2score}
	}
	if global.game = 2 and global.plus = 0 and global.mode = 2{
	    if global.p2score > global.c64score{global.c64score = global.p2score}
	}
	if global.game = 2 and global.plus = 0 and global.mode = 3{
	    if global.p2score > global.a2600score{global.a2600score = global.p2score}
	}
	if global.game = 2 and global.plus = 1 and global.mode = 0{
	    if global.p2score > global.jrpacplusscore{global.jrpacplusscore = global.p2score}
	}
	if global.game = 2 and global.plus = 1 and global.mode = 1{
	    if global.p2score > global.extendedplusscore{global.extendedplusscore = global.p2score}
	}
	if global.game = 2 and global.plus = 1 and global.mode = 2{
	    if global.p2score > global.c64plusscore{global.c64plusscore = global.p2score}
	}
	if global.game = 2 and global.plus = 1 and global.mode = 3{
	    if global.p2score > global.a2600plusscore{global.a2600plusscore = global.p2score}
	}
	if global.game = 1 and global.plus = 0 and global.mode = 4{
	    if global.p2score > global.champscore{global.champscore = global.p2score}
	}
	if global.game = 1 and global.plus = 1 and global.mode = 4{
	    if global.p2score > global.champplusscore{global.champplusscore = global.p2score}
	}
	if global.game = 0 and global.plus = 0 and global.mode = 4{
	    if global.p2score > global.arrscore{global.arrscore = global.p2score}
	}
	if global.game = 0 and global.plus = 1 and global.mode = 4{
	    if global.p2score > global.arrplusscore{global.arrplusscore = global.p2score}
	}
	if global.game = 2 and global.plus = 0 and global.mode = 4{
	    if global.p2score > global.bleachscore{global.bleachscore = global.p2score}
	}
	if global.game = 2 and global.plus = 1 and global.mode = 4{
	    if global.p2score > global.bleachplusscore{global.bleachplusscore = global.p2score}
	}
	}
	if global.rand = 1{
	if global.game = 0 and global.plus = 0{
	    if global.p2score > global.pacrandscore{global.pacrandscore = global.p2score}
	}
	if global.game = 0 and global.plus = 1{
	    if global.p2score > global.pacplusrandscore{global.pacplusrandscore = global.p2score}
	}
	if global.game = 1 and global.plus = 0{
	    if global.p2score > global.mspacrandscore{global.mspacrandscore = global.p2score}
	}
	if global.game = 1 and global.plus = 1{
	    if global.p2score > global.mspacplusrandscore{global.mspacplusrandscore = global.p2score}
	}
	if global.game = 2 and global.plus = 0{
	    if global.p2score > global.jrpacrandscore{global.jrpacrandscore = global.p2score}
	}
	if global.game = 2 and global.plus = 1{
	    if global.p2score > global.jrpacplusrandscore{global.jrpacplusrandscore = global.p2score}
	}
	}
	////extra life
	if global.extralife2 = 1 and global.p2score > 9999{global.extralife2 = 0; global.p2lives = global.p2lives +1; sound_play(Life)}



}
