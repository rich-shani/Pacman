if finish = 0{
if global.lvl = 0 or countdown = -1{
if dead = 3{
    if global.lvl = 0{
        global.otto = 0;
        global.p1score = 0; global.game = global.game + 1;
        if global.game = 3{global.game = 0}
        if global.credit > 0{room_goto(rm_Menu)}
        else{room_goto(rm_Title)}
    }
    else{if (global.p1lives = 0 or global.p1gameover = 1) and (global.p2lives = 0 or global.p2gameover = 1){
        global.lvl = 0; global.p1score = 0; global.p2score = 0;
        if global.credit > 0{room_goto(rm_Menu)}; else{room_goto(rm_Title)}}
        else{ if global.p1lives = 0{global.p1gameover = 1;} if global.p2lives = 0{global.p2gameover = 1};
        alarm[11] = 1; countdown = 10;
        blink = 0; alarm[8] = 14; Pauser.ignore = 1;
}
}
}
}
}

if finish = 0{
if dead = 1{
if global.lvl > 0{
if global.game = 0{sound_play(Die)}
if global.game = 1{sound_play(MsDie)}
if global.game = 2{sound_play(JrDie)}
}
dead = 2;
hspeed = 0; vspeed = 0;
Blinky.x = -5000; Blinky.y = -5000
Pinky.x = -5000; Pinky.y = -5000
Inky.x = -5000; Inky.y = -5000
Clyde.x = -5000; Clyde.y = -5000
alarm[11] = 120
exit
}
if dead = 2 or 3{
    if deader = 1{if global.p1lives > 0{global.p1lives = global.p1lives - 1;}}
    else{if global.p2lives > 0{global.p2lives = global.p2lives - 1;}}
    if (global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0){
        dead = 3; if global.game = 2{y = -5000; y2 = -5000;}else{x = -5000; x2 = -5000; y = ystart; y2 = ystart;} Power.alarm[0] = 0; Power.alarm[1] = 0; blink = 0; alarm[8] = -1;
        countdown = countdown - 1; 
        if countdown = -1 or global.lvl = 0{alarm[11] = 120;}
        else{alarm[11] = 60;
        if global.game = 0{sound_play(Dot0)};
        if global.game = 1{sound_play(MsDot)};
        if global.game = 2{sound_play(JrDot)};
        }
    }
    else{
        instance_activate_object(Dot); with Dot{
            if smashed = 1{if global.smashno = (global.dottotal - Pac.dotcount)
                {smashed = 0;
                    tile_add(tile3,0,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.dh,Drawless.ds,Drawless.dv))
                    tile_delete(tile_layer_find(depth-1,x,y))
                    tile_delete(tile_layer_find(depth+1,x,y))
                }; else{instance_destroy()};}}
        with Power{alarm[0] = -1; alarm[1] = -1; visible = true}
        psig = dotcount + 7; isig = dotcount + 17; csig = dotcount + 32; timer = timerstart;
        with Power{tile_layer_delete_at(depth,x,y); vis = 1; tile_add(tile3,16,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.dh,Drawless.ds,Drawless.dv))}
        with Blinky{aboutface = 0; state = 0; house = 0; housestate = 0; dir = 2; resdir = -1; x = xstart; y = ystart; newtile = 0; tilex = 16*(round(x/16)); tiley = 16*(round(y/16));}
        with Pinky{aboutface = 0; state = 0; house = 1; housestate = 1; up = 0; dir = 3; resdir = -1; x = xstart; y = ystart; newtile = 0; tilex = 16*(round(x/16)); tiley = 16*(round(y/16));}
        with Inky{aboutface = 0; state = 0; house = 1; housestate = 2; up = 1; dir = 1; resdir = -1; x = xstart; y = ystart; newtile = 0; tilex = 16*(round(x/16)); tiley = 16*(round(y/16));}
        with Clyde{aboutface = 0; state = 0; house = 1; housestate = 2; up = 1; dir = 1; resdir = -1; x = xstart; y = ystart; newtile = 0; tilex = 16*(round(x/16)); tiley = 16*(round(y/16));}
        with Fruit{alarm[0] = -1; x = -32; y = -32; dir = -1; exopt = -1; state = -1; newtile = 0; tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); resdir = -1;
            if global.game = 2{
                if spawn = 1 and ((Drawless.c64 = 1 and Pac.dotcount > 323) or (Pac.dotcount > 207)){spawn = 2};
                if spawn = 2 and ((Drawless.c64 = 1 and Pac.dotcount > 400) or (Pac.dotcount > 301)){spawn = 3};
                if spawn = 3 and ((Drawless.c64 = 1 and Pac.dotcount > 477) or (Pac.dotcount > 413)){spawn = 4};
            }
        }
        alarm[0] = -1; alarm[1] = -1; cycle = 0; scatter = 1; pause = 0; park = -1; eatdir = -1; corner = 0; dead = 0; dir = 2; deadanim = 0; fright = 0; 
        ////trying to fix that starting bug
        hspeed2 = 0; vspeed2 = 0; dir = 2; dir2 = 0; newtile = 0; newtile2 = 0; corner = 0; corner2 = 0; cornercheck = 0; corner2check = 0; bonked = 0; bonked2 = 0;
        if global.players > 0 and global.players < 3 and global.p1lives > 0 and global.p2lives > 0{
        x = xstart - 16; y = ystart;
        x2 = xstart + 16; y2 = ystart;
        }
        else{
            if global.p1lives > 0{x = xstart; y = ystart; x2 = -5000; y2 = ystart}
            else{x2 = xstart; y2 = ystart; x = -5000; y = ystart}
        }
        tilex = 16*(round(x/16)); tiley = 16*(round(y/16)); tilex2 = 16*(round(x2/16)); tiley2 = 16*(round(y2/16)); 
        eatdir = -1; eatdir2 = -1;
        start = 1; alarm[10] = 90;
        if global.game = 2{if room_height = 980{__view_set( e__VW.XView, 0, 24 ); __view_set( e__VW.YView, 0, 184 );}else{__view_set( e__VW.XView, 0, 208-(Drawless.c64*144) )}}
        Pauser.ignore = 0; global.smashno = 0;
    }
}
}

if finish > 0{
finish = finish + 1;
with Dot{instance_destroy()}; with Power{instance_destroy()};
Drawless.blink = Drawless.blink + 1; if Drawless.blink = 2{Drawless.blink = 0}; alarm[11] = 10;
with Drawless{
///
if blink = 0{
with Wall{
if id = 314469{
tile_set_blend(tile_layer_find(depth-1,x,y-8),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));
tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2));
}
else{
if image_index = 18 and ((room_height < 960 and y = room_height - 48) or (room_height = 960 and y = room_height - 64)){
tile_set_blend(tile_layer_find(depth-1,x,y+8),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));
tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2));
}
else{
if global.game = 2 and y = Blinky.ystart + 16 and x > Blinky.xstart - 17 and x < Blinky.xstart + 17{}else{
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{}else{
tile_set_blend(tile_layer_find(depth-1,x+(extra*8),y),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));
}}
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{tile_set_blend(tile_layer_find(depth,x,y),c_black)}
else{tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2))}}
}
}
}
else{
with Wall{
if id = 314469{
tile_set_blend(tile_layer_find(depth-1,x,y-8),c_white);
tile_set_blend(tile_layer_find(depth,x,y),c_black);
}
else{
if image_index = 18 and ((room_height < 960 and y = room_height - 48) or (room_height = 960 and y = room_height - 64)){
tile_set_blend(tile_layer_find(depth-1,x,y+8),c_white);
tile_set_blend(tile_layer_find(depth,x,y),c_black);
}
else{
if global.game = 2 and y = Blinky.ystart + 16 and x > Blinky.xstart - 17 and x < Blinky.xstart + 17{}else{
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{}else{
tile_set_blend(tile_layer_find(depth-1,x+(extra*8),y),c_white);
}}
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{tile_set_blend(tile_layer_find(depth,x,y),c_black)}
else{tile_set_blend(tile_layer_find(depth,x,y),c_black)}}
}
}
}
///
}
hspeed = 0; vspeed = 0;
Blinky.housestate = 0; Blinky.house = 0; Blinky.x = -5000; Blinky.y = -5000;
Pinky.housestate = 0; Pinky.house = 0; Pinky.x = -5000; Pinky.y = -5000;
Inky.housestate = 0; Inky.house = 0; Inky.x = -5000; Inky.y = -5000;
Clyde.housestate = 0; Clyde.house = 0; Clyde.x = -5000; Clyde.y = -5000;
}
if finish = 10{
if global.rand = 0{
    if global.game = 0{
        if global.lvl = 2{room_goto(rm_Cutscene)}else{
        if global.lvl = 5{room_goto(rm_Cutscene)}else{
        if global.lvl = 9{room_goto(rm_Cutscene)}else{
        if global.lvl = 13{room_goto(rm_Cutscene)}else{
        if global.lvl = 17{room_goto(rm_Cutscene)}else{
        script_execute(mazer)}
        }}}}
    }
    if global.game = 1{
        if global.lvl = 2{room_goto(rm_Cutscene)}else{
        if global.lvl = 5{room_goto(rm_Cutscene)}else{
        if global.lvl = 9{room_goto(rm_Cutscene)}else{
        if global.lvl = 13{room_goto(rm_Cutscene);global.loop = 1;}else{
        if global.lvl = 17{room_goto(rm_Cutscene);}else{
        script_execute(mazer)}
        }}}}
    }
    if global.game = 2{
        if global.lvl = 1{room_goto(rm_Cutscene)}else{
        if global.lvl = 3{room_goto(rm_Cutscene)}else{
        if global.lvl = 5{room_goto(rm_Cutscene)}else{
        if global.lvl = 7{room_goto(rm_Cutscene)}else{
        if global.lvl = 9{room_goto(rm_Cutscene)}else{
        if global.last = 0{room_goto_next()}else{
        if global.mode = 0{room_goto(JrPacMan4)}
        if global.mode = 1{room_goto(VS4)}
        if global.mode = 2{room_goto(C64_03)}
        if global.mode = 3{room_goto(A2600_4)}
        if global.mode = 4{room_goto(Bleach4)}
        }
    }}}}}}
}
else{
    if global.game = 0{
        if global.lvl = 2{room_goto(rm_Cutscene)}else{
        if global.lvl = 5{room_goto(rm_Cutscene)}else{
        if global.lvl = 9{room_goto(rm_Cutscene)}else{
        if global.lvl = 13{room_goto(rm_Cutscene)}else{
        if global.lvl = 17{room_goto(rm_Cutscene)}else{
script_execute(maze_picker);
}
        }}}}
    }
    if global.game = 1{
        if global.lvl = 2{room_goto(rm_Cutscene)}else{
        if global.lvl = 5{room_goto(rm_Cutscene)}else{
        if global.lvl = 9{room_goto(rm_Cutscene)}else{
        if global.lvl = 13{room_goto(rm_Cutscene);global.loop = 1;}else{
        if global.lvl = 17{room_goto(rm_Cutscene);}else{
        if global.lvl = 21{room_goto(MsPacMan3);global.loop = 0;}else{
script_execute(maze_picker);
        }}}}}}
    }
    if global.game = 2{
        if global.lvl = 1{room_goto(rm_Cutscene)}else{
        if global.lvl = 3{room_goto(rm_Cutscene)}else{
        if global.lvl = 5{room_goto(rm_Cutscene)}else{
        if global.lvl = 7{room_goto(rm_Cutscene)}else{
        if global.lvl = 9{room_goto(rm_Cutscene)}else{
        script_execute(maze_picker);
    }}}}}}
    }
}

