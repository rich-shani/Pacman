function draw2(argument0, argument1) {
	if alarm[9] = -1{
	if dead > 1{
	    if deader = 2{
	    if room_width = 448{
	        if global.ex1 = 0{draw_sprite(spr_Dead2,floor(deadani2m),argument0,argument1)}
	        else{if global.otto = 0{draw_sprite(spr_MsDead2,floor(deadani2m),argument0,argument1)}else{draw_sprite(spr_OttoDead2,floor(deadani2m),argument0,argument1)}}
	    }
	    else{if dead < 3{draw_sprite(spr_JrDead2,floor(deadani2m),round(argument0),round(argument1))}}
	}}
	else{
	if prohibit = 2{
	    if room_width = 448{
	        if global.ex1=0{draw_sprite_ext(spr_Man2,16,argument0,argument1,1,1,0,c_white,1)}
	        else{if global.otto = 0{draw_sprite_ext(spr_MsMan2,16,argument0,argument1,1,1,0,c_white,1)}
	        else{draw_sprite_ext(spr_OttoMan2,16,argument0,argument1,1,1,0,c_white,1)}}
	        }
	        else{draw_sprite_ext(spr_JrMan2,16,round(argument0),round(argument1),1,1,0,c_white,1)}
	    }
	else{
	if chomp = 0 or chomper = 1{
	    if start = false{
	    if global.boost > 0{
	    if global.otto = 1{if dir2 = 1{draw_sprite_ext(spr_boostlines,5,argument0,argument1,1,1,0,c_lime,1)};else{if dir2 = 3{draw_sprite_ext(spr_boostlines,6,argument0,argument1,1,1,0,c_lime,1)};else{draw_sprite_ext(spr_boostlines,dir2,argument0,argument1,1,1,0,c_lime,1)}}}
	    else{
	    if global.game = 2 and dir2 = 1{draw_sprite_ext(spr_boostlines,4,argument0,argument1,1,1,0,c_lime,1)}else{draw_sprite_ext(spr_boostlines,dir2,argument0,argument1,1,1,0,c_lime,1)}
	    }}
	    if room_width = 448{
	        if global.ex1=0{draw_sprite_ext(spr_Man2,(floor(i2m/2))+(4*dir2),argument0,argument1,1,1,0,c_white,1)}
	        else{if global.otto = 0{draw_sprite_ext(spr_MsMan2,(floor(i2m/2))+(4*dir2),argument0,argument1,1,1,0,c_white,1)}
	        else{draw_sprite_ext(spr_OttoMan2,(floor(i2m/2))+(4*dir2),argument0,argument1,1,1,0,c_white,1)}}
	    }
	    else{draw_sprite_ext(spr_JrMan2,(floor(i2m/2))+(4*dir2),round(argument0),round(argument1),1,1,0,c_white,1)}
	    }
	    else{
	    if room_width = 448{
	        if global.ex1=0{draw_sprite_ext(spr_Man2,0,argument0,argument1,1,1,0,c_white,1)}
	        else{if global.otto = 0{draw_sprite_ext(spr_MsMan2,1,argument0,argument1,1,1,0,c_white,1)}
	        else{draw_sprite_ext(spr_OttoMan2,0,argument0,argument1,1,1,0,c_white,1)}}
	    }
	    else{draw_sprite_ext(spr_JrMan2,1,round(argument0),round(argument1),1,1,0,c_white,1)}
	    }
	}
	else{
	    if global.plus = 0{draw_sprite_ext(spr_Chomp,chompcount-1+pluseat,round(argument0)-(8*(scale-1)),round(argument1)-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1)}
	    else{draw_sprite_ext(spr_Chomp,chompcount-1+pluseat,round(argument0)-(8*(scale-1)),round(argument1)-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1)}
	}
	}
	}
	}



}
