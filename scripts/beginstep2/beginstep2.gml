/// @description Player 2's direction
function beginstep2() {
	if dead = 0 and oGameManager.start = 0 and chomp = 0{
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
	if dead = 0 and oGameManager.start = 0 and oGameManager.prohibit < 2{
	if place_meeting((16*(round(x2/16))),(16*(round(y2/16))),Dot){
	    with Dot{if place_meeting(x,y,Mac){
	    if smashed = true{ global.smashno = global.smashno - 1; if global.boost = 0{Pac.pause2 = 1; Pac.stoppy2 = 1;}; if global.lvl > 0{global.p2score = global.p2score + 40; sound_play(JrDot2);}}
	    else{if global.game = 2 and global.lvl > 0{sound_play(JrDot)}}; instance_destroy();}}
	    if global.boost = 0{Pac.eatdir2 = Pac.direction2/45; direction2 = direction2; hspeed2 = 0; vspeed2 = 0;} if global.lvl > 0{global.p2score = global.p2score + 10;}
	    if global.boost = 0{oGameManager.timer = oGameManager.timerstart + 1;}
	    bonked2 = 0;
	if global.lvl > 0{
	    if global.game = 1{
	    sound_play(MsDot);exit
	    }
	    if global.game = 0{
	    if oGameManager.dot = 0{sound_play(Dot0); oGameManager.dot = 1;exit}
	    if oGameManager.dot = 1{sound_play(Dot1); oGameManager.dot = 0;exit}
	    }
	}
	}
	}
	////eating a powerpellet
	if dead = 0{
	if place_meeting((16*(round(x2/16))),(16*(round(y2/16))),Power){
	    with Power{if place_meeting(x,y,Mac){instance_destroy()}}
	    if global.boost = 0{Pac.eatdir2 = Pac.direction2/45; direction2 = direction2; hspeed2 = 0; vspeed2 = 0;}
	    if global.boost = 0{Pac.pause2 = 1; Pac.stoppy2 = 1;} if oGameManager.frighttime > 0{
	    if global.players = 2{if oGameManager.prohibit = 2{oGameManager.prohibit = 0;}else{oGameManager.prohibit = 1;}} oGameManager.fright = 1; Pac.alarm[0] = oGameManager.frighttime; oGameManager.chompcount = 0;
	    }
	    Blinky.visible = true; Pinky.visible = true; Inky.visible = true; Clyde.visible = true; oGameManager.pluseat = 0;
	    oGameManager.plus = -1; oGameManager.plus2 = 0;
	    oGameManager.timer = oGameManager.timerstart + 1; if global.plus = 1{oGameManager.plus = irandom(7); if oGameManager.frighttime > 0 and (global.game < 2 and global.lvl > 2) or (global.game = 2 and global.lvl > 1){oGameManager.plus2 = irandom(1);}}
	    with Blinky{aboutface = 1; if state<2 and oGameManager.frighttime > 0{if oGameManager.plus = 0{if state=1{state=0}}else{state = 1}}}
	    with Pinky{aboutface = 1; if state<2 and oGameManager.frighttime > 0{if oGameManager.plus = 1{if state=1{state=0}}else{state = 1}}}
	    with Inky{aboutface = 1; if state<2 and oGameManager.frighttime > 0{if oGameManager.plus = 2{if state=1{state=0}}else{state = 1}}}
	    with Clyde{aboutface = 1; if state<2 and oGameManager.frighttime > 0{if oGameManager.plus = 3{if state=1{state=0}}else{state = 1}}}
	    oGameManager.plus = -1;
	    bonked2 = 0;
	if global.lvl > 0{
	    global.p2score = global.p2score + 50;
	    if global.game = 2{sound_play(JrDot2)}
	    if global.game = 1{sound_play(MsDot)}
	    if global.game = 0{
	    if oGameManager.dot = 0{sound_play(Dot0); oGameManager.dot = 1;exit}
	    if oGameManager.dot = 1{sound_play(Dot1); oGameManager.dot = 0;exit}
	    }
	}
	}
	}
	////finish
	if global.lvl > 0{if oGameManager.start = 0{if dead = 0{
	if (oGameManager.dotcount = global.dottotal or oGameManager.dotcount > global.dottotal) and oGameManager.finish = 0{
	oGameManager.finish = 1; alarm[11] = 60; alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
	Blinky.speed = 0; Pinky.speed = 0; Inky.speed = 0; Clyde.speed = 0; Pac.speed = 0;
	}}}}
	////eating a fruit
	if dead = 0 and oGameManager.prohibit < 2{
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
	    if oGameManager.bonustime > 0{
	    if global.players = 2{if oGameManager.prohibit = 2{oGameManager.prohibit = 0;}else{oGameManager.prohibit = 1;}}
	    oGameManager.fright = 1; Pac.alarm[0] = oGameManager.bonustime; oGameManager.chompcount = 0; oGameManager.plus2 = 0; oGameManager.pluseat = 1;
	    with Blinky{if state < 2{visible = false}}
	    with Pinky{if state < 2{visible = false}}
	    with Inky{if state < 2{visible = false}}
	    with Clyde{if state < 2{visible = false}}
	    }
	    oGameManager.timer = oGameManager.timerstart + 1;
	    with Blinky{aboutface = 1; if state<2 and oGameManager.bonustime > 0{state = 1}}
	    with Pinky{aboutface = 1; if state<2 and oGameManager.bonustime > 0{state = 1}}
	    with Inky{aboutface = 1; if state<2 and oGameManager.bonustime > 0{state = 1}}
	    with Clyde{aboutface = 1; if state<2 and oGameManager.bonustime > 0{state = 1}}
	} 
	    exit}}
	}}
	}
	////ghost interaction
	if oGameManager.finish = 0{
	if chomp = 0{if dead = 0{
	if ((16*(round(x2/16)) = Blinky.tilex and 16*(round(y2/16)) = Blinky.tiley) or (abs(x2 - Blinky.x) < 5 and abs(y2 - Blinky.y) < 5)) and Blinky.house = 0{
	    with Blinky{
	        if state = 1 and Pac.chomp = 0 and oGameManager.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; oGameManager.chompcount = oGameManager.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}};with Fruit{if state>-1{resdir=direction/90;}};
	        if global.lvl > 0{
	            if oGameManager.chompcount = 1{global.p2score = global.p2score + (200+(200*oGameManager.pluseat))}
	            if oGameManager.chompcount = 2{global.p2score = global.p2score + (400+(400*oGameManager.pluseat))}
	            if oGameManager.chompcount = 3{global.p2score = global.p2score + (800+(800*oGameManager.pluseat))}
	            if oGameManager.chompcount = 4{global.p2score = global.p2score + (1600+(1600*oGameManager.pluseat))}
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
	        if state = 1 and Pac.chomp = 0 and oGameManager.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; oGameManager.chompcount = oGameManager.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};;
	        if global.lvl > 0{
	            if oGameManager.chompcount = 1{global.p2score = global.p2score + (200+(200*oGameManager.pluseat))}
	            if oGameManager.chompcount = 2{global.p2score = global.p2score + (400+(400*oGameManager.pluseat))}
	            if oGameManager.chompcount = 3{global.p2score = global.p2score + (800+(800*oGameManager.pluseat))}
	            if oGameManager.chompcount = 4{global.p2score = global.p2score + (1600+(1600*oGameManager.pluseat))}
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
	        if state = 1 and Pac.chomp = 0 and oGameManager.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; oGameManager.chompcount = oGameManager.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};;
	        if global.lvl > 0{
	            if oGameManager.chompcount = 1{global.p2score = global.p2score + (200+(200*oGameManager.pluseat))}
	            if oGameManager.chompcount = 2{global.p2score = global.p2score + (400+(400*oGameManager.pluseat))}
	            if oGameManager.chompcount = 3{global.p2score = global.p2score + (800+(800*oGameManager.pluseat))}
	            if oGameManager.chompcount = 4{global.p2score = global.p2score + (1600+(1600*oGameManager.pluseat))}
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
	        if state = 1 and Pac.chomp = 0 and oGameManager.prohibit < 2{Pac.bonked2 = 0; Pac.chomper = 2; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; oGameManager.chompcount = oGameManager.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; 
	        if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
	        if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}};
	        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};;
	        if global.lvl > 0{
	            if oGameManager.chompcount = 1{global.p2score = global.p2score + (200+(200*oGameManager.pluseat))}
	            if oGameManager.chompcount = 2{global.p2score = global.p2score + (400+(400*oGameManager.pluseat))}
	            if oGameManager.chompcount = 3{global.p2score = global.p2score + (800+(800*oGameManager.pluseat))}
	            if oGameManager.chompcount = 4{global.p2score = global.p2score + (1600+(1600*oGameManager.pluseat))}
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
	if oGameManager.start = true or oGameManager.finish > 0{hspeed2 = 0; vspeed2 = 0;
	}
	if dead > 0{hspeed2 = 0; vspeed2 = 0;
	}



}
