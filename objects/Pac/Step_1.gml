script_execute(beginstep);
script_execute(movement2);
script_execute(beginstep2);

if dead < 2 or finish < 0{
if start = 1{
    if global.game = 0{im = 0;}
    else{im = 1;}
}
else{
if (hspeed = 0 and vspeed = 0) or (chomp = 1) or (hspeed = 0 and vspeed = 0 and chomp = 1){}
else{if global.boost = 0{im = im+1}; else{im = im+2}; if im > 7{im = 0}}
}
}
if dead = 2{
if deadanim < 12{deadanim = deadanim + 0.125}
}
if start = 0 and finish = 0{im2 = im2 + 0.5; if im2 = 4{im2 = 0}}
global.color = global.color + 2; if global.color > 239{global.color = 0};

if global.lvl > 0{
if corner = 0{
tilex = 16*(round(x/16))
tiley = 16*(round(y/16))
}
else{
if tilex = 16*(round(x/16)){}else{
cornercheck = cornercheck + 1;
}
if tiley = 16*(round(y/16)){}else{
cornercheck = cornercheck + 1;
}
}
}

if dead = 0 and start = 0 and finish = 0 and stoppy = 0 and bonked = 0{
if global.lvl > 0{
if corner = 0 and chomp = 0{
///right
    if (y > 48 and y < room_height - 48){
    if keyboard_check(vk_right)=true and keyboard_check(vk_up)=false and keyboard_check(vk_left)=false and keyboard_check(vk_down)=false{
        if !collision_point(16*(round((x)/16))+17,16*(round((y)/16)),Wall,false,true){dir = 0; park = -1
            if direction = 90{//up to right  
                if y > 16*round((y)/16){corner = 1; hspeed = sp; vspeed = -sp; exit} // preturn up
                else{corner = 2; hspeed = sp; vspeed = sp; exit} // postturn up
            }
            else{if direction = 270{//down to right
                if y < 16*round((y)/16){corner = 2; hspeed = sp; vspeed = sp; exit} // preturn down
                else{corner = 1; hspeed = sp; vspeed = -sp; exit} // postturn down
            }
            else{hspeed = sp; vspeed = 0} //left or right to right
        }}
        else{park = 0}
    }
    }
///up
if x>8 and x<(room_width-8) {
    if keyboard_check(vk_up)=true and keyboard_check(vk_right)=false and keyboard_check(vk_left)=false and keyboard_check(vk_down)=false{
        if !collision_point(16*(round((x)/16)),16*(round((y)/16))-1,Wall,false,true){dir = 1; park = -1
            if direction = 0 and !hspeed = 0{ //right to up
                if x < 16*round((x)/16){corner = 3; hspeed = sp; vspeed = -sp; exit} // preturn right
                else{corner = 4; hspeed = -sp; vspeed = -sp; exit} // postturn right
            }
            else{if direction = 180{//left to up
                if x > 16*round((x)/16){corner = 4; hspeed = -sp; vspeed = -sp; exit} // preturn left
                else{corner = 3; hspeed = sp; vspeed = -sp; exit} // postturn left
            }
            else{hspeed = 0; vspeed = -sp} //down or up to up
        }}
        else{park = 1}
        }
}
///left
    if (y > 48 and y < room_height - 48){
    if keyboard_check(vk_left)=true and keyboard_check(vk_up)=false and keyboard_check(vk_right)=false and keyboard_check(vk_down)=false{
        if !collision_point(16*(round((x)/16))-1,16*(round((y)/16)),Wall,false,true){dir = 2; park = -1
            if direction = 90{//up to left
                if y > 16*round((y)/16){corner = 5; hspeed = -sp; vspeed = -sp; exit} // preturn up
                else{corner = 6; hspeed = -sp; vspeed = sp; exit} // postturn up
            }
            else{if direction = 270{//down to left
                if y < 16*round((y)/16){corner = 6; hspeed = -sp; vspeed = sp; exit} // preturn down
                else{corner = 5; hspeed = -sp; vspeed = -sp; exit} // postturn down
            }
            else{hspeed = -sp; vspeed = 0} //left or right to left
        }}
        else{park = 2}
        }
        }
///down
if x>8 and x<(room_width-8){
    if keyboard_check(vk_down)=true and keyboard_check(vk_right)=false and keyboard_check(vk_left)=false and keyboard_check(vk_up)=false{
        if !collision_point(16*(round((x)/16)),16*(round((y)/16))+17,Wall,false,true){dir = 3; park = -1
            if direction = 0 and !hspeed = 0{ //right to down
                if x < 16*round((x)/16){corner = 7; hspeed = sp; vspeed = sp; exit} // preturn right
                else{corner = 8; hspeed = -sp; vspeed = sp; exit} // postturn right
            }
            else{if direction = 180{//left to down
                if x > 16*round((x)/16){corner = 8; hspeed = -sp; vspeed = sp; exit} // preturn left
                else{corner = 7; hspeed = sp; vspeed = sp; exit} // postturn left
            }
            else{hspeed = 0; vspeed = sp} //down or up to down
        }}
        else{park = 3}
        }
}
}
if !corner = 0{if chomp = 0{if cornercheck < 2{
///right
    if keyboard_check(vk_right)=true and keyboard_check(vk_up)=false and keyboard_check(vk_left)=false and keyboard_check(vk_down)=false{
    if !collision_point(16*(round((x)/16))+17,16*(round((y)/16)),Wall,false,true){
    if corner = 8{corner = 1; hspeed = -hspeed; vspeed = -vspeed; dir = 0; exit}
    if corner = 4{corner = 2; hspeed = -hspeed; vspeed = -vspeed; dir = 0; exit}
    if corner = 7{corner = 1; hspeed = hspeed; vspeed = -vspeed; dir = 0; exit}
    if corner = 3{corner = 2; hspeed = hspeed; vspeed = -vspeed; dir = 0; exit}
    if corner = 5{corner = 1; hspeed = -hspeed; vspeed = vspeed; dir = 0; exit}
    if corner = 6{corner = 2; hspeed = -hspeed; vspeed = vspeed; dir = 0; exit}
}}
///up
    if keyboard_check(vk_up)=true and keyboard_check(vk_right)=false and keyboard_check(vk_left)=false and keyboard_check(vk_down)=false{
    if !collision_point(16*(round((x)/16)),16*(round((y)/16))-1,Wall,false,true){
    if corner = 6{corner = 3; hspeed = -hspeed; vspeed = -vspeed; dir = 1; exit}
    if corner = 2{corner = 4; hspeed = -hspeed; vspeed = -vspeed; dir = 1; exit}
    if corner = 5{corner = 3; hspeed = -hspeed; vspeed = vspeed; dir = 1; exit}
    if corner = 1{corner = 4; hspeed = -hspeed; vspeed = vspeed; dir = 1; exit}
    if corner = 7{corner = 3; hspeed = hspeed; vspeed = -vspeed; dir = 1; exit}
    if corner = 8{corner = 4; hspeed = hspeed; vspeed = -vspeed; dir = 1; exit}
}}
///left
    if keyboard_check(vk_left)=true and keyboard_check(vk_up)=false and keyboard_check(vk_right)=false and keyboard_check(vk_down)=false{
    if !collision_point(16*(round((x)/16))-1,16*(round((y)/16)),Wall,false,true){
    if corner = 7{corner = 5; hspeed = -hspeed; vspeed = -vspeed; dir = 2; exit}
    if corner = 3{corner = 6; hspeed = -hspeed; vspeed = -vspeed; dir = 2; exit}
    if corner = 8{corner = 5; hspeed = hspeed; vspeed = -vspeed; dir = 2; exit}
    if corner = 4{corner = 6; hspeed = hspeed; vspeed = -vspeed; dir = 2; exit}
    if corner = 1{corner = 5; hspeed = -hspeed; vspeed = vspeed; dir = 2; exit}
    if corner = 2{corner = 6; hspeed = -hspeed; vspeed = vspeed; dir = 2; exit}
}}
///down
    if keyboard_check(vk_down)=true and keyboard_check(vk_right)=false and keyboard_check(vk_left)=false and keyboard_check(vk_up)=false{
    if !collision_point(16*(round((x)/16)),16*(round((y)/16))+17,Wall,false,true){
    if corner = 5{corner = 7; hspeed = -hspeed; vspeed = -vspeed; dir = 3; exit}
    if corner = 1{corner = 8; hspeed = -hspeed; vspeed = -vspeed; dir = 3; exit}
    if corner = 6{corner = 7; hspeed = -hspeed; vspeed = vspeed; dir = 3; exit}
    if corner = 2{corner = 8; hspeed = -hspeed; vspeed = vspeed; dir = 3; exit}
    if corner = 3{corner = 7; hspeed = hspeed; vspeed = -vspeed; dir = 3; exit}
    if corner = 4{corner = 8; hspeed = hspeed; vspeed = -vspeed; dir = 3; exit}
}}
}}}
}
}

if dead = 0{
if global.lvl = 0{if speed > 0{if Pac.chomp = 0{
    if newtile = 0{
        if tilex = (16*(round(x/16))) and tiley = (16*(round(y/16))){}
        else{
            newtile = 1; tilex = (16*(round(x/16))); tiley = (16*(round(y/16))); script_execute(random_direction);
        }
    }
}}}
}

if dead = 0 and start = 0 and (prohibit = 0 or prohibit = 2){
if place_meeting((16*(round(x/16))),(16*(round(y/16))),Dot){
    with Dot{if place_meeting(x,y,Pac){
    if smashed = true{global.smashno = global.smashno - 1; if global.boost = 0{Pac.pause = 1; Pac.stoppy = 1;}; if global.lvl > 0{global.p1score = global.p1score + 40; sound_play(JrDot2);}}
    else{if global.game = 2 and global.lvl > 0{sound_play(JrDot)}}; instance_destroy();}}
    if global.boost = 0{eatdir = direction/45; direction = direction; speed = 0;} if global.lvl > 0{global.p1score = global.p1score + 10;}
    if global.boost = 0{timer = timerstart + 1;}
    bonked = 0;
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

if dead = 0{
if place_meeting((16*(round(x/16))),(16*(round(y/16))),Power){
    with Power{if place_meeting(x,y,Pac){instance_destroy()}}
    if global.boost = 0{eatdir = direction/45; direction = direction; speed = 0;}
    if global.boost = 0{pause = 1; stoppy = 1;} if frighttime > 0{
    if global.players = 2{if prohibit = 1{prohibit = 0;}else{prohibit = 2;}} fright = 1; alarm[0] = frighttime; chompcount = 0;
    }
    Blinky.visible = true; Pinky.visible = true; Inky.visible = true; Clyde.visible = true; Pac.pluseat = 0;
    plus = -1; plus2 = 0;
    timer = timerstart + 1; if global.plus = 1{plus = irandom(7); if frighttime > 0 and (global.game < 2 and global.lvl > 2) or (global.game = 2 and global.lvl > 1){plus2 = irandom(1);}}
    with Blinky{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 0{if state=1{state=0}}else{state = 1}}}
    with Pinky{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 1{if state=1{state=0}}else{state = 1}}}
    with Inky{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 2{if state=1{state=0}}else{state = 1}}}
    with Clyde{aboutface = 1; if state<2 and Pac.frighttime > 0{if Pac.plus = 3{if state=1{state=0}}else{state = 1}}}
    plus = -1;
    bonked = 0;
if global.lvl > 0{
    global.p1score = global.p1score + 50;
    if global.game = 2{sound_play(JrDot2)}
    if global.game = 1{sound_play(MsDot)}
    if global.game = 0{
    if dot = 0{sound_play(Dot0); dot = 1;exit}
    if dot = 1{sound_play(Dot1); dot = 0;exit}
    }
}
}
}

if global.lvl > 0{if start = 0{if dead = 0{
if (dotcount = global.dottotal or dotcount > global.dottotal) and finish = 0{
finish = 1; alarm[11] = 60; alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
Blinky.speed = 0; Pinky.speed = 0; Inky.speed = 0; Clyde.speed = 0; Pac.speed = 0;
}}}}

if dead = 0 and (prohibit = 0 or prohibit = 2){
if place_meeting((16*(round(x/16))),(16*(round(y/16))),Fruit) and speed > 0{
    with Fruit{if place_meeting(x,y,Pac){points = true; alarm[1] = 60; if global.lvl > 0{sound_play(snd_Fruit);}
    if state > -1{xstart = x; ystart = y;} x = -32; y = -32; tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); newtile = 0; alarm[0] = -1; state = -1; direction = 0; speed = 0; dir = -1;
    if global.lvl > 0{
    if global.game = 0{
        if value = 0{global.p1score = global.p1score + 100;}
        if value = 1{global.p1score = global.p1score + 300;}
        if value = 2{global.p1score = global.p1score + 500;}
        if value = 3{global.p1score = global.p1score + 700;}
        if value = 4{global.p1score = global.p1score + 1000;}
        if value = 5{global.p1score = global.p1score + 2000;}
        if value = 6{global.p1score = global.p1score + 3000;}
        if value = 7{global.p1score = global.p1score + 5000;}
    }
    else{
        if value = 0{global.p1score = global.p1score + 100;}
        if value = 1{global.p1score = global.p1score + 200;}
        if value = 2{global.p1score = global.p1score + 500;}
        if value = 3{global.p1score = global.p1score + 700;}
        if value = 4{global.p1score = global.p1score + 1000;}
        if value = 5{global.p1score = global.p1score + 2000;}
        if value = 6{global.p1score = global.p1score + 5000;}
    }
    }
if global.plus = true{
    if Pac.bonustime > 0{
    if global.players = 2{if prohibit = 1{prohibit = 0;}else{prohibit = 2;}}
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
}
}

if finish = 0{
if chomp = 0{if dead = 0{
if ((16*(round(x/16)) = Blinky.tilex and 16*(round(y/16)) = Blinky.tiley) or (abs(x - Blinky.x) < 5 and abs(y - Blinky.y) < 5)) and Blinky.house = 0{
    with Blinky{
        if Pac.prohibit = 1{}else{if state = 1 and Pac.chomp = 0{Pac.bonked = 0; Pac.chomper = 1; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; ; if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}}; if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}};with Fruit{if state>-1{resdir=direction/90;}};
        if global.lvl > 0{
            if Pac.chompcount = 1{global.p1score = global.p1score + (200+(200*Pac.pluseat))}
            if Pac.chompcount = 2{global.p1score = global.p1score + (400+(400*Pac.pluseat))}
            if Pac.chompcount = 3{global.p1score = global.p1score + (800+(800*Pac.pluseat))}
            if Pac.chompcount = 4{global.p1score = global.p1score + (1600+(1600*Pac.pluseat))}
        }
        }}
        if state = 0 and Pac.dead = 0{Pac.deader = 1; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
    }
}}}
if chomp = 0{if dead = 0{
if ((16*(round(x/16)) = Pinky.tilex and 16*(round(y/16)) = Pinky.tiley) or (abs(x - Pinky.x) < 5 and abs(y - Pinky.y) < 5)) and Pinky.house = 0{
    with Pinky{
        if Pac.prohibit = 1{}else{if state = 1 and Pac.chomp = 0{Pac.bonked = 0; Pac.chomper = 1; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; ; if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}}; if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};
        if global.lvl > 0{
            if Pac.chompcount = 1{global.p1score = global.p1score + (200+(200*Pac.pluseat))}
            if Pac.chompcount = 2{global.p1score = global.p1score + (400+(400*Pac.pluseat))}
            if Pac.chompcount = 3{global.p1score = global.p1score + (800+(800*Pac.pluseat))}
            if Pac.chompcount = 4{global.p1score = global.p1score + (1600+(1600*Pac.pluseat))}
        }
        }}
        if state = 0 and Pac.dead = 0{Pac.deader = 1; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
    }
}}}
if chomp = 0{if dead = 0{
if ((16*(round(x/16)) = Inky.tilex and 16*(round(y/16)) = Inky.tiley) or (abs(x - Inky.x) < 5 and abs(y - Inky.y) < 5)) and Inky.house = 0{
    with Inky{
        if Pac.prohibit = 1{}else{if state = 1 and Pac.chomp = 0{Pac.bonked = 0; Pac.chomper = 1; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; ; if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}}; if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}}; 
        if global.lvl > 0{
            if Pac.chompcount = 1{global.p1score = global.p1score + (200+(200*Pac.pluseat))}
            if Pac.chompcount = 2{global.p1score = global.p1score + (400+(400*Pac.pluseat))}
            if Pac.chompcount = 3{global.p1score = global.p1score + (800+(800*Pac.pluseat))}
            if Pac.chompcount = 4{global.p1score = global.p1score + (1600+(1600*Pac.pluseat))}
        }
        }}
        if state = 0 and Pac.dead = 0{Pac.deader = 1; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
    }
}}}
if chomp = 0{if dead = 0{
if ((16*(round(x/16)) = Clyde.tilex and 16*(round(y/16)) = Clyde.tiley) or (abs(x - Clyde.x) < 5 and abs(y - Clyde.y) < 5)) and Clyde.house = 0{
    with Clyde{
        if Pac.prohibit = 1{}else{if state = 1 and Pac.chomp = 0{Pac.bonked = 0; Pac.chomper = 1; if global.lvl > 0{if global.game = 0{sound_play(Chomp)};if global.game = 1{sound_play(MsChomp)};if global.game = 2{sound_play(JrChomp)}}; with Pac{script_execute(sickofit)}; Pac.chompcount = Pac.chompcount + 1; Pac.chomp = 1; alarm[0] = 60; chomped = 1; ; if !Pac.speed = 0{if Pac.eatdir = -1{Pac.eatdir = Pac.direction/45}}; if Pac.hspeed2 = 0 and Pac.vspeed2 = 0{}else{if Pac.eatdir2 = -1{Pac.eatdir2 = Pac.direction2/45}};
        with Blinky{if state<2{resdir=direction/90;}};with Pinky{if state<2{resdir=direction/90;}};with Inky{if state<2{resdir=direction/90;}};with Clyde{if state<2{resdir=direction/90;}}with Fruit{if state>-1{resdir=direction/90;}};
        if global.lvl > 0{
            if Pac.chompcount = 1{global.p1score = global.p1score + (200+(200*Pac.pluseat))}
            if Pac.chompcount = 2{global.p1score = global.p1score + (400+(400*Pac.pluseat))}
            if Pac.chompcount = 3{global.p1score = global.p1score + (800+(800*Pac.pluseat))}
            if Pac.chompcount = 4{global.p1score = global.p1score + (1600+(1600*Pac.pluseat))}
        }
        }}
        if state = 0 and Pac.dead = 0{Pac.deader = 1; Pac.dead = 1; Pac.alarm[11] = 60; bounce = -2; uppity = 1; okidoki = 1
        Pac.alarm[1] = -1; Blinky.aboutface = 0; Pinky.aboutface = 0; Inky.aboutface = 0; Clyde.aboutface = 0;
        Blinky.tilex = 16*(round(Blinky.x/16)); Blinky.tiley = 16*(round(Blinky.y/16));
        Pinky.tilex = 16*(round(Pinky.x/16)); Pinky.tiley = 16*(round(Pinky.y/16));
        Inky.tilex = 16*(round(Inky.x/16)); Inky.tiley = 16*(round(Inky.y/16));
        Clyde.tilex = 16*(round(Clyde.x/16)); Clyde.tiley = 16*(round(Clyde.y/16));
        Blinky.newtile = 0; Pinky.newtile = 0; Inky.newtile = 0; Clyde.newtile = 0;}
    }
}}}
}

if chomp = true{direction = direction; speed = 0; alarm[0] = alarm[0] + 1
with Blinky{if state<2{hspeed = 0; vspeed = 0;}}
with Pinky{if state<2{hspeed = 0; vspeed = 0;}}
with Inky{if state<2{hspeed = 0; vspeed = 0;}}
with Clyde{if state<2{hspeed = 0; vspeed = 0;}}
with Fruit{if state>-1{hspeed = 0; vspeed = 0;}}
}
if start = true{hspeed = 0; vspeed = 0; alarm[0] = alarm[0] + 1
plus2 = 0;
with Blinky{{hspeed = 0; vspeed = 0;}}
with Pinky{{hspeed = 0; vspeed = 0;}}
with Inky{{hspeed = 0; vspeed = 0;}}
with Clyde{{hspeed = 0; vspeed = 0;}}
with Fruit{{hspeed = 0; vspeed = 0;}}
}
if dead > 0{hspeed = 0; vspeed = 0; alarm[0] = alarm[0] + 1
plus2 = 0;
with Blinky{{hspeed = 0; vspeed = 0;}}
with Pinky{{hspeed = 0; vspeed = 0;}}
with Inky{{hspeed = 0; vspeed = 0;}}
with Clyde{{hspeed = 0; vspeed = 0;}}
with Fruit{{hspeed = 0; vspeed = 0;}}
}

if fright = 1{if Blinky.state = 0 and Pinky.state = 0 and Inky.state = 0 and Clyde.state = 0{
alarm[0] = -1; fright = 0; prohibit = 0; plus2 = 0;
if bonked = 0{
if hspeed > 0{hspeed = sp}
if hspeed < 0{hspeed = -sp}
if vspeed > 0{vspeed = sp}
if vspeed < 0{vspeed = -sp}
}
if bonked2 = 0{
if hspeed2 > 0{hspeed2 = sp}
if hspeed2 < 0{hspeed2 = -sp}
if vspeed2 > 0{vspeed2 = sp}
if vspeed2 < 0{vspeed2 = -sp}
}
chompcount = 0; Pac.pluseat = 0;
}}

if global.lvl > 0{
if dead > 0 or finish > 0 or start = 1{
sound_stop(Ghost1); sound_stop(Ghost2); sound_stop(Ghost3); sound_stop(Ghost4); sound_stop(Ghost5); sound_stop(Blue); sound_stop(Flee);
sound_stop(MsGhost1); sound_stop(MsGhost2); sound_stop(MsGhost3); sound_stop(MsGhost4); sound_stop(MsGhost5); sound_stop(MsBlue); sound_stop(MsFlee);
sound_stop(JrGhost1); sound_stop(JrGhost2); sound_stop(JrGhost3); sound_stop(JrGhost4); sound_stop(JrGhost5); sound_stop(JrBlue); sound_stop(JrFlee);
}
if dead = 0 and finish = 0 and start = 0{
if room_width = 448{
    if siren = 0 and dotcount > 111{siren = 1;} 
    if siren = 1 and dotcount > 179{siren = 2;} 
    if siren = 2 and dotcount > 211{siren = 3;} 
    if siren = 3 and dotcount > 227{siren = 4;} 
}
else{
    if siren = 0 and dotcount > 229{siren = 1;}
    if siren = 1 and dotcount > 357{siren = 2;}
    if siren = 2 and dotcount > 421{siren = 3;}
    if siren = 3 and dotcount > 453{siren = 4;}
}
if global.game = 0{
    if (Blinky.state = 2 or Pinky.state = 2 or Inky.state = 2 or Clyde.state = 2){if ambience = 6{}else{sound_loop(Flee); ambience = 6; exit}}
    else{
    if fright = 1{if ambience = 5{}else{sound_loop(Blue); ambience = 5; exit}}
    else{
    if siren = 4{if ambience = 4{}else{sound_loop(Ghost5); ambience = 4; exit}}
    else{
    if siren = 3{if ambience = 3{}else{sound_loop(Ghost4); ambience = 3; exit}}
    else{
    if siren = 2{if ambience = 2{}else{sound_loop(Ghost3); ambience = 2; exit}}
    else{
    if siren = 1{if ambience = 1{}else{sound_loop(Ghost2); ambience = 1; exit}}
    else{
    if siren = 0{if ambience = 0{}else{sound_loop(Ghost1); ambience = 0; exit}}
    }}}}}}
}
if global.game = 1{
    if global.otto = 0 and (Blinky.state = 2 or Pinky.state = 2 or Inky.state = 2 or Clyde.state = 2){if ambience = 6{}else{sound_loop(MsFlee); ambience = 6; exit}}
    else{
    if fright = 1{if ambience = 5{}else{sound_loop(MsBlue); ambience = 5; exit}}
    else{
    if siren = 4{if ambience = 4{}else{sound_loop(MsGhost5); ambience = 4; exit}}
    else{
    if siren = 3{if ambience = 3{}else{sound_loop(MsGhost4); ambience = 3; exit}}
    else{
    if siren = 2{if ambience = 2{}else{sound_loop(MsGhost3); ambience = 2; exit}}
    else{
    if siren = 1{if ambience = 1{}else{sound_loop(MsGhost2); ambience = 1; exit}}
    else{
    if siren = 0{if ambience = 0{}else{sound_loop(MsGhost1); ambience = 0; exit}}
    }}}}}}
}
if global.game = 2{
    if (Blinky.state = 2 or Pinky.state = 2 or Inky.state = 2 or Clyde.state = 2){if ambience = 6{}else{sound_loop(JrFlee); ambience = 6; exit}}
    else{
    if fright = 1{if ambience = 5{}else{sound_loop(JrBlue); ambience = 5; exit}}
    else{
    if siren = 4{if ambience = 4{}else{sound_loop(JrGhost5); ambience = 4; exit}}
    else{
    if siren = 3{if ambience = 3{}else{sound_loop(JrGhost4); ambience = 3; exit}}
    else{
    if siren = 2{if ambience = 2{}else{sound_loop(JrGhost3); ambience = 2; exit}}
    else{
    if siren = 1{if ambience = 1{}else{sound_loop(JrGhost2); ambience = 1; exit}}
    else{
    if siren = 0{if ambience = 0{}else{sound_loop(JrGhost1); ambience = 0; exit}}
    }}}}}}
}
}
}

if global.p1gameover = 0 and global.p2gameover = 0 and chomp = 0 and start = 0 and dead = 0 and finish = 0{
    if corner = 0 and corner2 = 0{
        if (tilex = tilex2 or (abs(x2 - x)) < 4) and (tiley = tiley2 or (abs(y2 - y)) < 4) and !bonked = 1 and !bonked2 = 1{
            bonked = 1; bonked2 = 1; alarm[4] = 10; sound_play(Bonk);
            ///P1 relative position to P2
            if speed = 0{bonked = 0}else{
            if dir = 0 or dir = 2{
            if x > x2{hspeed = 4};else{hspeed = -4};
            }
            if dir = 1 or dir = 3{
            if y > y2{vspeed = 4};else{vspeed = -4};
            }
            }
            ///P2 relative position to P1
            if hspeed2 = 0 and vspeed2 = 0{bonked2 = 0}else{
            if dir2 = 0 or dir2 = 2{
            if x > x2{hspeed2 = -4};else{hspeed2 = 4};
            }
            if dir2 = 1 or dir2 = 3{
            if y > y2{vspeed2 = -4};else{vspeed2 = 4};
            }
            }
            ///
            x = tilex; y = tiley; x2 = tilex2; y2 = tiley2;
            if hspeed = 4{dir = 0}; if hspeed = -4{dir = 2};
            if vspeed = 4{dir = 3}; if vspeed = -4{dir = 1};
            if hspeed2 = 4{dir2 = 0}; if hspeed2 = -4{dir2 = 2};
            if vspeed2 = 4{dir2 = 3}; if vspeed2 = -4{dir2 = 1};
        }
    }
}

