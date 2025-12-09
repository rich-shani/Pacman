/// @description /animation
function beginstep() {
	if dead < 2 or Pac.finish < 0{
	deadani2m = 0;
	if global.start = 1{
	    if global.game = 0{i2m = 0;}
	    else{i2m = 1;}
	}
	else{
	if (hspeed2 = 0 and vspeed2 = 0) or (chomp = 1) or (hspeed2 = 0 and vspeed2 = 0 and chomp = 1){}
	else{if global.boost = 0{i2m = i2m+1}; else{i2m = i2m+2}; if i2m > 7{i2m = 0}}
	}
	}
	if dead = 2{
	if deadani2m < 12{deadani2m = deadani2m + 0.125}
	}
	if global.start = 0 and Pac.finish = 0{i2m2 = i2m2 + 0.5; if i2m2 = 4{i2m2 = 0}}



}
