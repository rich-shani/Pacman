/// @description Player 2's direction
function beginstep2() {
	if dead = 0 and start = 0 and chomp = 0{
	if hspeed2 > 0 and vspeed2 = 0{direction2 = 0}
	if hspeed2 < 0 and vspeed2 = 0{direction2 = 180}
	if vspeed2 < 0 and hspeed2 = 0{direction2 = 90}
	if vspeed2 > 0 and hspeed2 = 0{direction2 = 270}

	if hspeed2 > 0 and vspeed2 < 0{direction2 = 45}
	if hspeed2 < 0 and vspeed2 < 0{direction2 = 135}
	if hspeed2 < 0 and vspeed2 > 0{direction2 = 225}
	if hspeed2 > 0 and vspeed2 > 0{direction2 = 315}
	}
	else{direction2 = direction2; hspeed2 = 0; vspeed2 = 0};
	////eating a dot
	if dead = 0 and start = 0 and prohibit < 2{
	if place_meeting((16*(round(x2/16))),(16*(round(y2/16))),Dot){
	    with Dot{if place_meeting(x,y,Mac){
	    if smashed = true{ global.smashno = global.smashno - 1; if global.boost = 0{Pac.pause2 = 1; Pac.stoppy2 = 1;}; if global.lvl > 0{global.p2score = global.p2score + 40; sound_play(JrDot2);}}
	    else{if global.game = 2 and global.lvl > 0{sound_play(JrDot)}}; instance_destroy();}}
	    if global.boost = 0{Pac.eatdir2 = Pac.direction2/45; direction2 = direction2; hspeed2 = 0; vspeed2 = 0;} if global.lvl > 0{global.p2score = global.p2score + 10;}
	    if global.boost = 0{Pac.timer = Pac.timerstart + 1;}
	    bonked2 = 0;
	if global.lvl > 0{
	    if global.game = 1{
	    sound_play(MsDot);exit
	    }
	    if global.game = 0{
	    if dot = 0{sound_play(Dot0); dot = 1;exit}
	    if dot = 1{sound_play(Dot1); dot = 0;exit}
	    }
	}
	}
	}
	////eating a powerpellet
	if dead = 0{
	if place_meeting((16*(round(x2/16))),(16*(round(y2/16))),Power){
	    with Power{if place_meeting(x,y,Mac){instance_destroy()}}
	    if global.boost = 0{Pac.eatdir2 = Pac.direction2/45; direction2 = direction2; hspeed2 = 0; vspeed2 = 0;}
	    if global.boost = 0{Pac.pause2 = 1; Pac.stoppy2 = 1;} if Pac.frighttime > 0{
	    if global.players = 2{if Pac.prohibit = 2{Pac.prohibit = 0;}else{Pac.prohibit = 1;}} Pac.fright = 1; Pac.alarm[0] = Pac.frighttime; Pac.chompcount = 0;
	    }
	    Blinky.visible = true; Pinky.visible = true; Inky.visible = true; Clyde.visible = true; Pac.pluseat = 0;
	    Pac.plus = -1; Pac.plus2 = 0;
	    Pac.timer = Pac.timerstart + 1; if global.plus = 1{Pac.plus = irandom(7); if Pac.frighttime > 0 and (global.game < 2 and global.lvl > 2) or (global.game = 2 and global.lvl > 1){Pac.plus2 = irandom(1);}}
	    with Blinky{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 0{if state=1{state=0}}else{state = 1}}}
	    with Pinky{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 1{if state=1{state=0}}else{state = 1}}}
	    with Inky{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 2{if state=1{state=0}}else{state = 1}}}
	    with Clyde{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 3{if state=1{state=0}}else{state = 1}}}
	    Pac.plus = -1;
	    bonked2 = 0;
	if global.lvl > 0{
	    global.p2score = global.p2score + 50;
	    if global.game = 2{sound_play(JrDot2)}
	    if global.game = 1{sound_play(MsDot)}
	    if global.game = 0{
	    if dot = 0{sound_play(Dot0); Pac.dot = 1;exit}
	    if dot = 1{sound_play(Dot1); Pac.dot = 0;exit}
	    }
	}
	}
	}
	////finish
	if global.lvl > 0{if start = 0{if dead = 0{
	if (dotcount = global.dottotal or dotcount > global.dottotal) and finish = 0{
	finish = 1; alarm[11] = 60; alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
	Blinky.speed = 0; Pinky.speed = 0; Inky.speed = 0; Clyde.speed = 0; Pac.speed = 0;
	}}}}
	////eating a fruit
	if dead = 0 and prohibit < 2{
	if place_meeting((16*(round(x2/16))),(16*(round(y2/16))),Fruit){if hspeed2 = 0 and vspeed2 = 0{}else{
	    with Fruit{if place_meeting(x,y,Mac){points = true; alarm[1] = 60; if global.lvl > 0{sound_play(snd_Fruit);}
	    if state > -1{xstart = x; ystart = y;} x = -32; y = -32; tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); newtile = 0; alarm[0] = -1; state = -1; direction = 0; speed = 0; dir = -1;
	    if global.lvl > 0{
	    if global.game = 0{
	        if value = 0{global.p2score = global.p2score + 100;}
	        if value = 1{global.p2score = global.p2score + 300;}
	        if value = 2{global.p2score = global.p2score + 500;}
	        if value = 3{global.p2score = global.p2score + 700;}
	        if value = 4{global.p2score = global.p2score + 1000;}
	        if value = 5{global.p2score = global.p2score + 2000;}
	        if value = 6{global.p2score = global.p2score + 3000;}
	        if value = 7{global.p2score = global.p2score + 5000;}
	    }
	    else{
	        if value = 0{global.p2score = global.p2score + 100;}
	        if value = 1{global.p2score = global.p2score + 200;}
	        if value = 2{global.p2score = global.p2score + 500;}
	        if value = 3{global.p2score = global.p2score + 700;}
	        if value = 4{global.p2score = global.p2score + 1000;}
	        if value = 5{global.p2score = global.p2score + 2000;}
	        if value = 6{global.p2score = global.p2score + 5000;}
	    }
	    }
	if global.plus = true{
	    if Pac.bonustime > 0{
	    if global.players = 2{if Pac.prohibit = 2{Pac.prohibit = 0;}else{Pac.prohibit = 1;}}
	    Pac.fright = 1; Pac.alarm[0] = Pac.bonustime; Pac.chompcount = 0; Pac.plus2 = 0; Pac.pluseat = 1;
	    with Blinky{if state < 2{visible = false}}
	    with Pinky{if state < 2{visible = false}}
	    with Inky{if state < 2{visible = false}}
	    with Clyde{if state < 2{visible = false}}
	    }
	    Pac.timer = Pac.timerstart + 1;
	    with Blinky{aboutface = 1; if state<2 and Pac.bonustime > 0{state = 1}}
	    with Pinky{aboutface = 1; if state<2 and Pac.bonustime > 0{state = 1}}
	    with Inky{aboutface = 1; if state<2 and Pac.bonustime > 0{state = 1}}
	    with Clyde{aboutface = 1; if state<2 and Pac.bonustime > 0{state = 1}}
	} 
	    exit}}
	}}
	}
	////ghost interaction
	if finish = 0{
	if chomp = 0{if dead = 0{
	if ((16*(round(x2/16)) = Blinky.tilex and 16*(round(y2/16)) = Blinky.tiley) or (abs(x2 - Blinky.x) < 5 and abs(y2 - Blinky.y) < 5)) and Blinky.house = 0{
	    with Blinky{
	        if state = 1 and Pac.chomp = 0 and Pac.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}};with Fruit{if state>-1{resdir=direction/90;}};
	        if global.lvl > 0{
	            if Pac.chompcount = 1{global.p2score = global.p2score + (200+(200*Pac.pluseat))}
	            if Pac.chompcount = 2{global.p2score = global.p2score + (400+(400*Pac.pluseat))}
	            if Pac.chompcount = 3{global.p2score = global.p2score + (800+(800*Pac.pluseat))}
	            if Pac.chompcount = 4{global.p2score = global.p2score + (1600+(1600*Pac.pluseat))}
	        }
	        }
	        if state = 0 and Pac.dead = 0{Pac.deader = 2; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
	        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
	        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
	        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
	        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
	        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
	        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
	    }
	}}}
	if chomp = 0{if dead = 0{
	if ((16*(round(x2/16)) = Pinky.tilex and 16*(round(y2/16)) = Pinky.tiley) or (abs(x2 - Pinky.x) < 5 and abs(y2 - Pinky.y) < 5)) and Pinky.house = 0{
	    with Pinky{
	        if state = 1 and Pac.chomp = 0 and Pac.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};;
	        if global.lvl > 0{
	            if Pac.chompcount = 1{global.p2score = global.p2score + (200+(200*Pac.pluseat))}
	            if Pac.chompcount = 2{global.p2score = global.p2score + (400+(400*Pac.pluseat))}
	            if Pac.chompcount = 3{global.p2score = global.p2score + (800+(800*Pac.pluseat))}
	            if Pac.chompcount = 4{global.p2score = global.p2score + (1600+(1600*Pac.pluseat))}
	        }
	        }
	        if state = 0 and Pac.dead = 0{Pac.deader = 2; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
	        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
	        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
	        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
	        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
	        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
	        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
	    }
	}}}
	if chomp = 0{if dead = 0{
	if ((16*(round(x2/16)) = Inky.tilex and 16*(round(y2/16)) = Inky.tiley) or (abs(x2 - Inky.x) < 5 and abs(y2 - Inky.y) < 5)) and Inky.house = 0{
	    with Inky{
	        if state = 1 and Pac.chomp = 0 and Pac.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};;
	        if global.lvl > 0{
	            if Pac.chompcount = 1{global.p2score = global.p2score + (200+(200*Pac.pluseat))}
	            if Pac.chompcount = 2{global.p2score = global.p2score + (400+(400*Pac.pluseat))}
	            if Pac.chompcount = 3{global.p2score = global.p2score + (800+(800*Pac.pluseat))}
	            if Pac.chompcount = 4{global.p2score = global.p2score + (1600+(1600*Pac.pluseat))}
	        }
	        }
	        if state = 0 and Pac.dead = 0{Pac.deader = 2; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
	        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
	        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
	        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
	        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
	        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
	        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
	    }
	}}}
	if chomp = 0{if dead = 0{
	if ((16*(round(x2/16)) = Clyde.tilex and 16*(round(y2/16)) = Clyde.tiley) or (abs(x2 - Clyde.x) < 5 and abs(y2 - Clyde.y) < 5)) and Clyde.house = 0{
	    with Clyde{
	        if state = 1 and Pac.chomp = 0 and Pac.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};;
	        if global.lvl > 0{
	            if Pac.chompcount = 1{global.p2score = global.p2score + (200+(200*Pac.pluseat))}
	            if Pac.chompcount = 2{global.p2score = global.p2score + (400+(400*Pac.pluseat))}
	            if Pac.chompcount = 3{global.p2score = global.p2score + (800+(800*Pac.pluseat))}
	            if Pac.chompcount = 4{global.p2score = global.p2score + (1600+(1600*Pac.pluseat))}
	        }
	        }
	        if state = 0 and Pac.dead = 0{Pac.deader = 2; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
	        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
	        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
	        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
	        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
	        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
	        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
	    }
	}}}
	}
	////freeze during chomp, start, death
	if chomp = true{
	if hspeed2 = 0 and vspeed2 = 0{}else{
	direction2 = direction2; hspeed2 = 0; vspeed2 = 0
	}
	}
	if start = true or finish > 0{hspeed2 = 0; vspeed2 = 0;
	}
	if dead > 0{hspeed2 = 0; vspeed2 = 0;
	}



}
