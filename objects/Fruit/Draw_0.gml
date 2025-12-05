dh = color_get_hue(make_color_rgb(global.dr,global.dg,global.db))
ds = color_get_saturation(make_color_rgb(global.dr,global.dg,global.db))
if global.rand = 0{dv = color_get_value(make_color_rgb(global.dr,global.dg,global.db))}else{dv = 255}
//
mh2 = color_get_hue(make_color_rgb(global.mr2,global.mg2,global.mb2))
ms2 = color_get_saturation(make_color_rgb(global.mr2,global.mg2,global.mb2))
mv2 = color_get_value(make_color_rgb(global.mr2,global.mg2,global.mb2))

///Blinky.xstart-72, ///Blinky.ystart+96
///"GAME OVER" and "READY"
if Pauser.pause = 0{
draw_set_font(font0);draw_set_halign(fa_left);
if (((global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0)) and Pac.countdown = -1) or global.lvl = 0{
    if room_width = 448{
        if global.players > 0{draw_set_color(c_aqua); if global.p2lives > 0 or global.p2gameover = 1{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline("PLAYER ONE"))}else{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline("PLAYER TWO"))};}
        draw_set_color(c_red)
        draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+320,string_hash_to_newline("GAME  OVER"))
    }
    else{
        if room_height = 960{
        if global.players > 0{
        if global.p2lives > 0 or global.p2gameover = 1{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline("PLAYER ONE"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline("PLAYER ONE"))
        }
        else{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline("PLAYER TWO"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline("PLAYER TWO"))
        }
        }
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+98,string_hash_to_newline("GAME  OVER"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart+96,string_hash_to_newline("GAME  OVER"))
        }
        else{
        if global.players > 0{
        if global.p2lives > 0 or global.p2gameover = 1{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+210,string_hash_to_newline("PLAYER ONE"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+208,string_hash_to_newline("PLAYER ONE"))
        }
        else{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+210,string_hash_to_newline("PLAYER TWO"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+208,string_hash_to_newline("PLAYER TWO"))
        }
        }
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+306,string_hash_to_newline("GAME  OVER"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+304,string_hash_to_newline("GAME  OVER"))
        }
    }
}
else{if Pac.start = 1{
    if room_width = 448{
        if Pac.alarm[9] = -1{}else{
        draw_set_color(c_aqua)
        if global.players > 0 and global.players < 3 and global.p1lives > 0 and global.p2lives > 0{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline(" PLAYERS  "))}
        else{
        if global.p1lives > 0{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline("PLAYER ONE"))}else{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline("PLAYER TWO"))}
        }
        }
        draw_set_color(c_yellow)
        draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+320,string_hash_to_newline("  READY   "))
        draw_sprite_ext(spr_Exc,0,(Blinky.xstart - 216)+256,(Blinky.ystart - 224)+320,1,1,0,c_yellow,1)
    }
    else{
        if room_height = 960{
        if Pac.alarm[9] = -1{}else{
        if global.players > 0 and global.players < 3 and global.p1lives > 0 and global.p2lives > 0{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline(" PLAYERS  "))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline(" PLAYERS  "))
        }
        else{
        if global.p1lives > 0{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline("PLAYER ONE"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline("PLAYER ONE"))
        }
        else{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline("PLAYER TWO"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline("PLAYER TWO"))
        }
        }
        }
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(Blinky.xstart-74,Blinky.ystart+98,string_hash_to_newline("  READY   "))
        draw_sprite_ext(spr_Exc,0,Blinky.xstart+38,Blinky.ystart+98,1,1,0,make_color_hsv(mh2-(global.plus*40),ms2,mv2),1)
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(Blinky.xstart-72,Blinky.ystart+96,string_hash_to_newline("  READY   "))
        draw_sprite_ext(spr_Exc,0,Blinky.xstart+40,Blinky.ystart+96,1,1,0,make_color_hsv(dh-(global.plus*40),ds,dv),1)
        }
        else{
        if Pac.alarm[9] = -1{}else{
        if global.players > 0 and global.players < 3 and global.p1lives > 0 and global.p2lives > 0{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+210,string_hash_to_newline(" PLAYERS  "))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+208,string_hash_to_newline(" PLAYERS  "))
        }
        else{
        if global.p1lives > 0{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+210,string_hash_to_newline("PLAYER ONE"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+208,string_hash_to_newline("PLAYER ONE"))
        }
        else{
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+210,string_hash_to_newline("PLAYER TWO"))
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+208,string_hash_to_newline("PLAYER TWO"))
        }
        }
        }
        draw_set_color(make_color_hsv(mh2-(global.plus*40),ms2,mv2))
        draw_text(350-(c64*144),(extend*16)+306,string_hash_to_newline("  READY   "))
        draw_sprite_ext(spr_Exc,0,462-(c64*144),(extend*16)+306,1,1,0,make_color_hsv(mh2-(global.plus*40),ms2,mv2),1)
        draw_set_color(make_color_hsv(dh-(global.plus*40),ds,dv))
        draw_text(352-(c64*144),(extend*16)+304,string_hash_to_newline("  READY   "))
        draw_sprite_ext(spr_Exc,0,464-(c64*144),(extend*16)+304,1,1,0,make_color_hsv(dh-(global.plus*40),ds,dv),1)
        }
    }
}}}
if Pac.start = 0{
if global.doki = 1{
draw_sprite(spr_DokiFruit,image_index,x,y+bounce)
if room_height = 576{
draw_sprite(spr_DokiFruit,image_index,x,y+bounce+512)
draw_sprite(spr_DokiFruit,image_index,x,y+bounce-512)
}
}
else{
draw_sprite(spr_Fruit,image_index,x,y+bounce)
if room_height = 576{
draw_sprite(spr_Fruit,image_index,x,y+bounce+512)
draw_sprite(spr_Fruit,image_index,x,y+bounce-512)
}
}
if points = 1{
    if global.ex1 = 0 and room_width = 448{draw_sprite_ext(spr_FruitPoints,value,xstart-(8*(scale-1)),ystart-(8*(scale-1)),scale,scale,0,make_color_rgb(255,183,255),1)}
    else{draw_sprite_ext(spr_MsPoints,value,xstart-(8*(scale-1)),ystart-(8*(scale-1)),scale,scale,0,c_white,1)}
}
if explosion = 1{draw_sprite(spr_explosion,floor(im/4),expx,expy)}
}

if Pac.test = 1 and Pauser.pause = 0{
draw_set_font(font0);draw_set_halign(fa_left);draw_set_color(c_green);
draw_text(closex,closey,string_hash_to_newline("1"));
draw_text(close2x,close2y,string_hash_to_newline("2"));
draw_text(close3x,close3y,string_hash_to_newline("3"));
draw_text(close4x,close4y,string_hash_to_newline("4"));
draw_set_color(c_white);
draw_text(c1x,c1y,string_hash_to_newline(c1dir));
draw_text(c2x,c2y,string_hash_to_newline(c2dir));
draw_text(c3x,c3y,string_hash_to_newline(c3dir));
draw_text(c4x,c4y,string_hash_to_newline(c4dir));
draw_text(c5x,c5y,string_hash_to_newline(c5dir));
draw_text(c6x,c6y,string_hash_to_newline(c6dir));
draw_text(c7x,c7y,string_hash_to_newline(c7dir));
draw_text(c8x,c8y,string_hash_to_newline(c8dir));
}


