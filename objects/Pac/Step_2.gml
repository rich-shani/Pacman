script_execute(endstep);


if fright = 1{

if corner = 1{if y < 16*(round(y/16)){y = 16*(round(y/16)); hspeed = spfright; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 2{if y > 16*(round(y/16)){y = 16*(round(y/16)); hspeed = spfright; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 3{if x > 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = -spfright; corner = 0; cornercheck = 0; exit}}

if corner = 4{if x < 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = -spfright; corner = 0; cornercheck = 0; exit}}

if corner = 5{if y < 16*(round(y/16)){y = 16*(round(y/16)); hspeed = -spfright; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 6{if y > 16*(round(y/16)){y = 16*(round(y/16)); hspeed = -spfright; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 7{if x > 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = spfright; corner = 0; cornercheck = 0; exit}}

if corner = 8{if x < 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = spfright; corner = 0; cornercheck = 0; exit}}

}

else{

if corner = 1{if y < 16*(round(y/16)){y = 16*(round(y/16)); hspeed = sp; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 2{if y > 16*(round(y/16)){y = 16*(round(y/16)); hspeed = sp; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 3{if x > 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = -sp; corner = 0; cornercheck = 0; exit}}

if corner = 4{if x < 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = -sp; corner = 0; cornercheck = 0; exit}}

if corner = 5{if y < 16*(round(y/16)){y = 16*(round(y/16)); hspeed = -sp; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 6{if y > 16*(round(y/16)){y = 16*(round(y/16)); hspeed = -sp; vspeed = 0; corner = 0; cornercheck = 0; exit}}

if corner = 7{if x > 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = sp; corner = 0; cornercheck = 0; exit}}

if corner = 8{if x < 16*(round(x/16)){x = 16*(round(x/16)); hspeed = 0; vspeed = sp; corner = 0; cornercheck = 0; exit}}

}


if chomp = 0{

    if fright = true{

        if pause = 0{

            if eatdir = 0{hspeed = spfright; vspeed = 0; eatdir = -1}

            if eatdir = 1{hspeed = spfright; vspeed = -spfright; eatdir = -1}

            if eatdir = 2{hspeed = 0; vspeed = -spfright; eatdir = -1}

            if eatdir = 3{hspeed = -spfright; vspeed = -spfright; eatdir = -1}

            if eatdir = 4{hspeed = -spfright; vspeed = 0; eatdir = -1}

            if eatdir = 5{hspeed = -spfright; vspeed = spfright; eatdir = -1}

            if eatdir = 6{hspeed = 0; vspeed = spfright; eatdir = -1}

            if eatdir = 7{hspeed = spfright; vspeed = spfright; eatdir = -1}

            stoppy = 0;

        }

    else{pause = pause - 1;}

    }

    else{

        if pause = 0{

            if eatdir = 0{hspeed = sp; vspeed = 0; eatdir = -1}

            if eatdir = 1{hspeed = sp; vspeed = -sp; eatdir = -1}

            if eatdir = 2{hspeed = 0; vspeed = -sp; eatdir = -1}

            if eatdir = 3{hspeed = -sp; vspeed = -sp; eatdir = -1}

            if eatdir = 4{hspeed = -sp; vspeed = 0; eatdir = -1}

            if eatdir = 5{hspeed = -sp; vspeed = sp; eatdir = -1}

            if eatdir = 6{hspeed = 0; vspeed = sp; eatdir = -1}

            if eatdir = 7{hspeed = sp; vspeed = sp; eatdir = -1}

            stoppy = 0;

        }

    else{pause = pause - 1;}

    }

}


if Pauser.pause = 0 and Pac.finish < 1{

instance_deactivate_all(true); instance_activate_region(Pac.tilex-32,Pac.tiley-32,80,80,true);

instance_activate_region(Pac.tilex2-32,Pac.tiley2-32,80,80,true);

///instance_deactivate_region(view_xview[0]-16,view_yview[0]+16,480,544,false,true);

///instance_activate_region(view_xview[0]-16,view_yview[0]+16,480,544,true);

instance_activate_object(Power); instance_activate_object(Pauser); instance_activate_object(Scroller); instance_activate_object(Drawless);

{instance_activate_object(Blinky); instance_activate_region(Blinky.tilex-32,Blinky.tiley-32,80,80,true);}

{instance_activate_object(Pinky); instance_activate_region(Pinky.tilex-32,Pinky.tiley-32,80,80,true);}

{instance_activate_object(Inky); instance_activate_region(Inky.tilex-32,Inky.tiley-32,80,80,true);}

{instance_activate_object(Clyde); instance_activate_region(Clyde.tilex-32,Clyde.tiley-32,80,80,true);}

instance_activate_object(Fruit); instance_activate_region(16*(round(Fruit.x/16))-32,16*(round(Fruit.y/16))-32,80,80,true);

}

else{instance_activate_all();}


if dead = 0{

if global.lvl = 0{if Pac.chomp = 0{

//speed

if speed > 0{

if fright = 0{speed = sp;}

else{speed = spfright;}

}

//turning

if pause = 0 and speed > 0{

if newtile = 1{

if dir = 0{

    if direction = 0 and x > tilex{direction = 0; newtile = 0; exit}

    if direction = 90 and y < tiley{direction = 0; x=tilex+(tiley-y); y=tiley; newtile = 0; exit}

    if direction = 180 and x < tilex{x = tilex; direction = 0; newtile = 0; exit}

    if direction = 270 and y > tiley{direction = 0; x=tilex+(y-tiley); y=tiley; newtile = 0; exit}

}

if dir = 1{

    if direction = 0 and x > tilex{direction = 90; y=tiley-(x-tilex); x=tilex; newtile = 0; exit}

    if direction = 90 and y < tiley{direction = 90; newtile = 0; exit}

    if direction = 180 and x < tilex{direction = 90; y=tiley-(tilex-x); x=tilex; newtile = 0; exit}

    if direction = 270 and y > tiley{y = tiley; direction = 90; newtile = 0; exit}

}

if dir = 2{

    if direction = 0 and x > tilex{x = tilex; direction = 180; newtile = 0; exit}

    if direction = 90 and y < tiley{direction = 180; x=tilex-(tiley-y); y=tiley; newtile = 0; exit}

    if direction = 180 and x < tilex{direction = 180; newtile = 0; exit}

    if direction = 270 and y > tiley{direction = 180; x=tilex-(y-tiley); y=tiley; newtile = 0; exit}

}

if dir = 3{

    if direction = 0 and x > tilex{direction = 270; y=tiley+(x-tilex); x=tilex; newtile = 0; exit}

    if direction = 90 and y < tiley{y = tiley; direction = 270; newtile = 0; exit}

    if direction = 180 and x < tilex{direction = 270; y=tiley+(tilex-x); x=tilex; newtile = 0; exit}

    if direction = 270 and y > tiley{direction = 270; newtile = 0; exit}

}

}

}

}}

}


if dead = 3 and room_width > 448 and ((global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0)){

    if room_height = 576{

    __view_set( e__VW.XView, 0, 2*round(__view_get( e__VW.XView, 0 )/2) ); x=(__view_get( e__VW.XView, 0 )+224); if __view_get( e__VW.XView, 0 )<208-(Drawless.c64*144){__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 )+2 )}; if __view_get( e__VW.XView, 0 )>208-(Drawless.c64*144){__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 )-2 )};

    }

}


if finish > 0{hspeed = 0; vspeed = 0; alarm[0] = alarm[0] + 1

plus2 = 0;

with Blinky{{hspeed = 0; vspeed = 0;}}

with Pinky{{hspeed = 0; vspeed = 0;}}

with Inky{{hspeed = 0; vspeed = 0;}}

with Clyde{{hspeed = 0; vspeed = 0;}}

with Fruit{{hspeed = 0; vspeed = 0;}}

}


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

    if siren = 0 and dotcount > 223{siren = 1;}

    if siren = 1 and dotcount > 359{siren = 2;}

    if siren = 2 and dotcount > 423{siren = 3;}

    if siren = 3 and dotcount > 495{siren = 4;}

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


if plus2 = 1 and Drawless.plus2 = 0{

instance_activate_object(Wall); instance_activate_object(Dot);

tile_layer_hide(Wall.depth); tile_layer_hide(Wall.depth-1); tile_layer_hide(Dot.depth); tile_layer_hide(Dot.depth-1); tile_layer_hide(Dot.depth+1); 

Drawless.plus2 = 1;

}

if plus2 = 0 and Drawless.plus2 = 1{

instance_activate_object(Wall); instance_activate_object(Dot);

tile_layer_show(Wall.depth); tile_layer_show(Wall.depth-1); tile_layer_show(Dot.depth); tile_layer_show(Dot.depth-1); tile_layer_show(Dot.depth+1); 

Drawless.plus2 = 0;

}


exit

if scaleup = 1{

    scale = scale + 0.05; if scale = 1.50{scaleup = 0; exit}

}

if scaleup = 0{

    scale = scale - 0.05; if scale = 1.00{scaleup = 1; exit}

}


if global.rand = 0{

if global.game = 0 and global.plus = 0 and global.mode = 0{

    if global.p1score > global.pacscore{global.pacscore = global.p1score}

}

if global.game = 0 and global.plus = 1 and global.mode = 0{

    if global.p1score > global.pacplusscore{global.pacplusscore = global.p1score}

}

if global.game = 1 and global.plus = 0 and global.mode = 0{

    if global.p1score > global.mspacscore{global.mspacscore = global.p1score}

}

if global.game = 1 and global.plus = 1 and global.mode = 0{

    if global.p1score > global.mspacplusscore{global.mspacplusscore = global.p1score}

}

if global.game = 0 and global.plus = 0 and global.mode = 1{

    if global.p1score > global.hanglyscore{global.hanglyscore = global.p1score}

}

if global.game = 0 and global.plus = 1 and global.mode = 1{

    if global.p1score > global.hanglyplusscore{global.hanglyplusscore = global.p1score}

}

if global.game = 0 and global.plus = 0 and global.mode = 2{

    if global.p1score > global.newscore{global.newscore = global.p1score}

}

if global.game = 0 and global.plus = 1 and global.mode = 2{

    if global.p1score > global.newplusscore{global.newplusscore = global.p1score}

}

if global.game = 0 and global.plus = 0 and global.mode = 3{

    if global.p1score > global.ultrascore{global.ultrascore = global.p1score}

}

if global.game = 0 and global.plus = 1 and global.mode = 3{

    if global.p1score > global.ultraplusscore{global.ultraplusscore = global.p1score}

}

if global.game = 1 and global.plus = 0 and global.mode = 1{

    if global.p1score > global.mspmpscore{global.mspmpscore = global.p1score}

}

if global.game = 1 and global.plus = 1 and global.mode = 1{

    if global.p1score > global.mspmpplusscore{global.mspmpplusscore = global.p1score}

}

if global.game = 1 and global.plus = 0 and global.mode = 2{

    if global.p1score > global.pacjrscore{global.pacjrscore = global.p1score}

}

if global.game = 1 and global.plus = 1 and global.mode = 2{

    if global.p1score > global.pacjrplusscore{global.pacjrplusscore = global.p1score}

}

if global.game = 1 and global.plus = 0 and global.mode = 3{

    if global.p1score > global.strangescore{global.strangescore = global.p1score}

}

if global.game = 1 and global.plus = 1 and global.mode = 3{

    if global.p1score > global.strangeplusscore{global.strangeplusscore = global.p1score}

}

if global.game = 2 and global.plus = 0 and global.mode = 0{

    if global.p1score > global.jrpacscore{global.jrpacscore = global.p1score}

}

if global.game = 2 and global.plus = 0 and global.mode = 1{

    if global.p1score > global.extendedscore{global.extendedscore = global.p1score}

}

if global.game = 2 and global.plus = 0 and global.mode = 2{

    if global.p1score > global.c64score{global.c64score = global.p1score}

}

if global.game = 2 and global.plus = 0 and global.mode = 3{

    if global.p1score > global.a2600score{global.a2600score = global.p1score}

}

if global.game = 2 and global.plus = 1 and global.mode = 0{

    if global.p1score > global.jrpacplusscore{global.jrpacplusscore = global.p1score}

}

if global.game = 2 and global.plus = 1 and global.mode = 1{

    if global.p1score > global.extendedplusscore{global.extendedplusscore = global.p1score}

}

if global.game = 2 and global.plus = 1 and global.mode = 2{

    if global.p1score > global.c64plusscore{global.c64plusscore = global.p1score}

}

if global.game = 2 and global.plus = 1 and global.mode = 3{

    if global.p1score > global.a2600plusscore{global.a2600plusscore = global.p1score}

}

if global.game = 1 and global.plus = 0 and global.mode = 4{

    if global.p1score > global.champscore{global.champscore = global.p1score}

}

if global.game = 1 and global.plus = 1 and global.mode = 4{

    if global.p1score > global.champplusscore{global.champplusscore = global.p1score}

}

if global.game = 0 and global.plus = 0 and global.mode = 4{

    if global.p1score > global.arrscore{global.arrscore = global.p1score}

}

if global.game = 0 and global.plus = 1 and global.mode = 4{

    if global.p1score > global.arrplusscore{global.arrplusscore = global.p1score}

}

if global.game = 2 and global.plus = 0 and global.mode = 4{

    if global.p1score > global.bleachscore{global.bleachscore = global.p1score}

}

if global.game = 2 and global.plus = 1 and global.mode = 4{

    if global.p1score > global.bleachplusscore{global.bleachplusscore = global.p1score}

}

}

if global.rand = 1{

if global.game = 0 and global.plus = 0{

    if global.p1score > global.pacrandscore{global.pacrandscore = global.p1score}

}

if global.game = 0 and global.plus = 1{

    if global.p1score > global.pacplusrandscore{global.pacplusrandscore = global.p1score}

}

if global.game = 1 and global.plus = 0{

    if global.p1score > global.mspacrandscore{global.mspacrandscore = global.p1score}

}

if global.game = 1 and global.plus = 1{

    if global.p1score > global.mspacplusrandscore{global.mspacplusrandscore = global.p1score}

}

if global.game = 2 and global.plus = 0{

    if global.p1score > global.jrpacrandscore{global.jrpacrandscore = global.p1score}

}

if global.game = 2 and global.plus = 1{

    if global.p1score > global.jrpacplusrandscore{global.jrpacplusrandscore = global.p1score}

}

}


if global.extralife = 1 and global.p1score > 9999{global.extralife = 0; global.p1lives = global.p1lives + 1; sound_play(Life)}


if direction = 90 and y < 32

{y = 544; tiley = 16*(round(y/16)); bonked = 0;

if fright = 1{

            if dir = 0{hspeed = spfright; vspeed = 0;}

            if dir = 1{hspeed = 0; vspeed = -spfright;}

            if dir = 2{hspeed = -spfright; vspeed = 0;}

            if dir = 3{hspeed = 0; vspeed = spfright;}

            }

            else{ 

            if dir = 0{hspeed = sp; vspeed = 0;}

            if dir = 1{hspeed = 0; vspeed = -sp;}

            if dir = 2{hspeed = -sp; vspeed = 0;}

            if dir = 3{hspeed = 0; vspeed = sp;}

            }

}

if direction = 270 and y > room_height - 32

{y = 32; tiley = 16*(round(y/16)); bonked = 0;

if fright = 1{

            if dir = 0{hspeed = spfright; vspeed = 0;}

            if dir = 1{hspeed = 0; vspeed = -spfright;}

            if dir = 2{hspeed = -spfright; vspeed = 0;}

            if dir = 3{hspeed = 0; vspeed = spfright;}

            }

            else{ 

            if dir = 0{hspeed = sp; vspeed = 0;}

            if dir = 1{hspeed = 0; vspeed = -sp;}

            if dir = 2{hspeed = -sp; vspeed = 0;}

            if dir = 3{hspeed = 0; vspeed = sp;}

            }

}


if room_width = 448 and room_height > 576{

///P1 only

if global.p2gameover = 1 and global.p1gameover = 0{

if start = 1 or dead = 3{__view_set( e__VW.YView, 0, room_height - 576 )}

    else{

    __view_set( e__VW.YView, 0, y - (288) ); if __view_get( e__VW.YView, 0 ) < 0{__view_set( e__VW.YView, 0, 0 )};

    if __view_get( e__VW.YView, 0 ) > room_height - 576{__view_set( e__VW.YView, 0, room_height - 576 )};

    }

}

else{

///P2 only

if global.p2gameover = 0 and global.p1gameover = 1{

if start = 1 or dead = 3{__view_set( e__VW.YView, 0, room_height - 576 )}

    else{

    __view_set( e__VW.YView, 0, y2 - (288) ); if __view_get( e__VW.YView, 0 ) < 0{__view_set( e__VW.YView, 0, 0 )};

    if __view_get( e__VW.YView, 0 ) > room_height - 576{__view_set( e__VW.YView, 0, room_height - 576 )};

    }

}

else{

///both players

if global.p2gameover = 0 and global.p1gameover = 0{

if start = 1 or dead = 3{__view_set( e__VW.YView, 0, room_height - 576 )}

    else{

    __view_set( e__VW.YView, 0, ((y+y2)/2) - (288) ); if __view_get( e__VW.YView, 0 ) < 0{__view_set( e__VW.YView, 0, 0 )};

    if __view_get( e__VW.YView, 0 ) > room_height - 576{__view_set( e__VW.YView, 0, room_height - 576 )};

    }

}

}}}


if dead = 3{}else{

if room_width > 448 and room_height = 576{

///P1 only

if global.p2gameover = 1 and global.p1gameover = 0{

if start = 1{__view_set( e__VW.XView, 0, room_width/2 - 224 )}

    else{

    if x < __view_get( e__VW.XView, 0 ) + 144{__view_set( e__VW.XView, 0, x - 144 ); if __view_get( e__VW.XView, 0 ) < 0{__view_set( e__VW.XView, 0, 0 )}};

    if x > __view_get( e__VW.XView, 0 ) + 304{__view_set( e__VW.XView, 0, x - 304 ); if __view_get( e__VW.XView, 0 ) > room_width - 448{__view_set( e__VW.XView, 0, room_width - 448 )}};

    }

}

else{

///P2 only

if global.p2gameover = 0 and global.p1gameover = 1{

if start = 1{__view_set( e__VW.XView, 0, room_width/2 - 224 )}

    else{

    if x2 < __view_get( e__VW.XView, 0 ) + 144{__view_set( e__VW.XView, 0, x2 - 144 ); if __view_get( e__VW.XView, 0 ) < 0{__view_set( e__VW.XView, 0, 0 )}};

    if x2 > __view_get( e__VW.XView, 0 ) + 304{__view_set( e__VW.XView, 0, x2 - 304 ); if __view_get( e__VW.XView, 0 ) > room_width - 448{__view_set( e__VW.XView, 0, room_width - 448 )}};

    }

}

else{

///both players

if global.p2gameover = 0 and global.p1gameover = 0{

if start = 1{__view_set( e__VW.XView, 0, room_width/2 - 224 )}

    else{

    if ((x+x2)/2) < __view_get( e__VW.XView, 0 ) + (224 - 32){__view_set( e__VW.XView, 0, ((x+x2)/2) - (224 - 32) ); if __view_get( e__VW.XView, 0 ) < 0{__view_set( e__VW.XView, 0, 0 )}};

    if ((x+x2)/2) > __view_get( e__VW.XView, 0 ) + (224 + 32){__view_set( e__VW.XView, 0, ((x+x2)/2) - (224 + 32) ); if __view_get( e__VW.XView, 0 ) > room_width - 448{__view_set( e__VW.XView, 0, room_width - 448 )}};

    }

}

}}}}


if room_height = 960{

if dead = 0{

    if start = 1{

    __view_set( e__VW.XView, 0, 24 ); __view_set( e__VW.YView, 0, 184 );

    }

    else{

///P1 only

if global.p2gameover = 1 and global.p1gameover = 0{

    if x < __view_get( e__VW.XView, 0 ) + 224 - 32{__view_set( e__VW.XView, 0, x - (224 - 32) ); if __view_get( e__VW.XView, 0 ) < 0{__view_set( e__VW.XView, 0, 0 )}};

    if x > __view_get( e__VW.XView, 0 ) + 224 + 32{__view_set( e__VW.XView, 0, x - (224 + 32) ); if __view_get( e__VW.XView, 0 ) > room_width - 448{__view_set( e__VW.XView, 0, room_width - 448 )}};

    if y < __view_get( e__VW.YView, 0 ) + 288 - 32{__view_set( e__VW.YView, 0, y - (288 - 32) ); if __view_get( e__VW.YView, 0 ) < 0{__view_set( e__VW.YView, 0, 0 )}};

    if y > __view_get( e__VW.YView, 0 ) + 288 + 32{__view_set( e__VW.YView, 0, y - (288 + 32) ); if __view_get( e__VW.YView, 0 ) > room_height - 576{__view_set( e__VW.YView, 0, room_height - 576 )}};

}

else{

///P2 only

if global.p2gameover = 0 and global.p1gameover = 1{

    if x2 < __view_get( e__VW.XView, 0 ) + 224 - 32{__view_set( e__VW.XView, 0, x2 - (224 - 32) ); if __view_get( e__VW.XView, 0 ) < 0{__view_set( e__VW.XView, 0, 0 )}};

    if x2 > __view_get( e__VW.XView, 0 ) + 224 + 32{__view_set( e__VW.XView, 0, x2 - (224 + 32) ); if __view_get( e__VW.XView, 0 ) > room_width - 448{__view_set( e__VW.XView, 0, room_width - 448 )}};

    if y2 < __view_get( e__VW.YView, 0 ) + 288 - 32{__view_set( e__VW.YView, 0, y2 - (288 - 32) ); if __view_get( e__VW.YView, 0 ) < 0{__view_set( e__VW.YView, 0, 0 )}};

    if y2 > __view_get( e__VW.YView, 0 ) + 288 + 32{__view_set( e__VW.YView, 0, y2 - (288 + 32) ); if __view_get( e__VW.YView, 0 ) > room_height - 576{__view_set( e__VW.YView, 0, room_height - 576 )}};

}

else{

///both players

if global.p2gameover = 0 and global.p1gameover = 0{

    if ((x+x2)/2) < __view_get( e__VW.XView, 0 ) + 224 - 32{__view_set( e__VW.XView, 0, ((x+x2)/2) - (224 - 32) ); if __view_get( e__VW.XView, 0 ) < 0{__view_set( e__VW.XView, 0, 0 )}};

    if ((x+x2)/2) > __view_get( e__VW.XView, 0 ) + 224 + 32{__view_set( e__VW.XView, 0, ((x+x2)/2) - (224 + 32) ); if __view_get( e__VW.XView, 0 ) > room_width - 448{__view_set( e__VW.XView, 0, room_width - 448 )}};

    if ((y+y2)/2) < __view_get( e__VW.YView, 0 ) + 288 - 32{__view_set( e__VW.YView, 0, ((y+y2)/2) - (288 - 32) ); if __view_get( e__VW.YView, 0 ) < 0{__view_set( e__VW.YView, 0, 0 )}};

    if ((y+y2)/2) > __view_get( e__VW.YView, 0 ) + 288 + 32{__view_set( e__VW.YView, 0, ((y+y2)/2) - (288 + 32) ); if __view_get( e__VW.YView, 0 ) > room_height - 576{__view_set( e__VW.YView, 0, room_height - 576 )}};

}}}

    }

}

if dead = 3{

            __view_set( e__VW.XView, 0, 2*round(__view_get( e__VW.XView, 0 )/2) ); x=(__view_get( e__VW.XView, 0 )+224); 

            if __view_get( e__VW.XView, 0 )<24{__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 )+2 )}; 

            if __view_get( e__VW.XView, 0 )>24{__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 )-2 )};

            __view_set( e__VW.YView, 0, 2*round(__view_get( e__VW.YView, 0 )/2) ); y=(__view_get( e__VW.YView, 0 )+200); 

            if __view_get( e__VW.YView, 0 )<184{__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 )+2 )};

            if __view_get( e__VW.YView, 0 )>184{__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 )-2 )};

}

if global.lvl > 0{if start = 1{visible = false}else{visible = true}}

}

if global.lvl > 0{if Drawless.c64 = 1{if start = 1{visible = false}else{visible = true}}}


if dead = 0{

    if room_width > 448 and room_height = 576{

        if global.p1gameover = 0{

        if x < __view_get( e__VW.XView, 0 ) + (4/1) and (dir = 2 or dir = 1 or dir = 3){x = __view_get( e__VW.XView, 0 ) + (4/1); bonked = 0;if corner > 0{corner = 0; hspeed = 0; vspeed = 0;}}

        if x > __view_get( e__VW.XView, 0 ) + 448 - 16 - (4/1) and (dir = 0 or dir = 1 or dir = 3){x = __view_get( e__VW.XView, 0 ) + 448 - 16 - (4/1); bonked = 0;if corner > 0{corner = 0; hspeed = 0; vspeed = 0;}}

        }

        if global.p2gameover = 0{

        if x2 < __view_get( e__VW.XView, 0 ) + (4/1) and (dir2 = 2 or dir2 = 1 or dir2 = 3){x2 = __view_get( e__VW.XView, 0 ) + (4/1); bonked2 = 0;if corner2 > 0{corner2 = 0; hspeed2 = 0; vspeed2 = 0;}}

        if x2 > __view_get( e__VW.XView, 0 ) + 448 - 16 - (4/1) and (dir2 = 0 or dir2 = 1 or dir2 = 3){x2 = __view_get( e__VW.XView, 0 ) + 448 - 16 - (4/1); bonked2 = 0;if corner2 > 0{corner2 = 0; hspeed2 = 0; vspeed2 = 0;}}

        }

    }

    if room_height > 576 and room_width > 448{

        if global.p1gameover = 0{

        if y < __view_get( e__VW.YView, 0 ) + 32 + (4/1) and (dir = 1 or dir = 0 or dir = 2){y = __view_get( e__VW.YView, 0 ) + 32 + (4/1); bonked = 0;if corner > 0{corner = 0; hspeed = 0; vspeed = 0;}}

        if y > __view_get( e__VW.YView, 0 ) + 576 - 48 - (4/1) and (dir = 3 or dir = 0 or dir = 2){y = __view_get( e__VW.YView, 0 ) + 576 - 48 - (4/1); bonked = 0;if corner > 0{corner = 0; hspeed = 0; vspeed = 0;}}

        }

        if global.p2gameover = 0{

        if y2 < __view_get( e__VW.YView, 0 ) + 32 + (4/1) and (dir2 = 1 or dir2 = 0 or dir2 = 2){y2 = __view_get( e__VW.YView, 0 ) + 32 + (4/1); bonked2 = 0;if corner2 > 0{corner2 = 0; hspeed2 = 0; vspeed2 = 0;}}

        if y2 > __view_get( e__VW.YView, 0 ) + 576 - 48 - (4/1) and (dir2 = 3 or dir2 = 0 or dir2 = 2){y2 = __view_get( e__VW.YView, 0 ) + 576 - 48 - (4/1); bonked2 = 0;if corner2 > 0{corner2 = 0; hspeed2 = 0; vspeed2 = 0;}}

        }

    }

}


///depth

if fright = 1{depth = 99}

else{depth = 104}

///target

if dir = 0{xdir = 32; ydir = 0}

if dir = 1{xdir = -32; ydir = -32}

if dir = 2{xdir = -32; ydir = 0}

if dir = 3{xdir = 0; ydir = 32}

///timer

if dead = 0 and start = 0{

if timer > 0{timer = timer - 1}

if timer = 0{

    if Pinky.housestate = 1{

        with Pinky{if y > (ystart - 272) + 270 and y < (ystart - 272) + 274 {y = (ystart - 272) + 272; housestate = 2; Pac.psig = 0; Pac.timer = Pac.timerstart}}

    }

    else{

        if Inky.housestate = 2{

            with Inky{if y > (ystart - 272) + 270 and y < (ystart - 272) + 274 {y = (ystart - 272) + 272; housestate = 3; Pac.isig = 0; Pac.timer = Pac.timerstart}}

        }

        else{

            if Clyde.housestate = 2{

                with Clyde{if y > (ystart - 272) + 270 and y < (ystart - 272) + 274 {y = (ystart - 272) + 272; housestate = 3; Pac.csig = 0; Pac.timer = Pac.timerstart}}

            }

        }

    }

}

}

///cycle clock paused due to fright time

if fright = 1{alarm[1] = alarm[1] + 1}


