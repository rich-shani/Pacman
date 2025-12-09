if global.credit > 0{
draw_sprite_ext(spr_Wall,3,432,224,1,1,0,c_blue,1)
draw_set_font(font0)
draw_set_halign(fa_left)
{draw_set_color(c_white)};
draw_text(32,560,string_hash_to_newline("CREDIT "))
draw_text(144,560,string_hash_to_newline(global.credit))
draw_text(64,112,string_hash_to_newline("                    "))
draw_set_color(c_yellow)
draw_text(64,112,string_hash_to_newline(" PAC-MAN COLLECTION "))
draw_set_color(c_red)
draw_text(64,144,string_hash_to_newline(" SELECT A GAME/MODE "))
draw_set_color(make_color_rgb(255,184,255))
draw_text(64,176,string_hash_to_newline(" UP/DOWN TO CHOOSE, "))
draw_text(64,192,string_hash_to_newline("LEFT/RIGHT TO TOGGLE"));
draw_set_color(c_white)
draw_text(64,224,string_hash_to_newline("GAME:               "));
if set = 0{
draw_sprite(spr_arrow,floor(im),144,224)
draw_sprite(spr_arrow2,floor(im),368,224)
}
if set = 1{
draw_sprite(spr_arrow,floor(im),144,272-16)
draw_sprite(spr_arrow2,floor(im),368,272-16)
}
if set = 2{
draw_sprite(spr_arrow,floor(im),144+16,272+16)
draw_sprite(spr_arrow2,floor(im),368,272+16)
}
if set = 3{
draw_sprite(spr_arrow,floor(im),144+16,304+32)
draw_sprite(spr_arrow2,floor(im),368,304+32)
}
if set = 4{
draw_sprite(spr_arrow,floor(im),144+16,304+64)
draw_sprite(spr_arrow2,floor(im),368,304+64)
}
if set = 5{
draw_sprite(spr_arrow,floor(im),144+16,304+96)
draw_sprite(spr_arrow2,floor(im),368,304+96)
}
if global.game = 0{
draw_text(64,224,   string_hash_to_newline("         PAC-MAN    "));
}
if global.game = 1{
draw_text(64,224,   string_hash_to_newline("       MS. PAC-MAN  "));
}
if global.game = 2{
draw_text(64,224,   string_hash_to_newline("       JR. PAC-MAN  "));
}
draw_text(64,272-16,string_hash_to_newline("PLUS:               "));
if global.plus = 0{
draw_text(64,272-16,string_hash_to_newline("           OFF      "));
}
if global.plus = 1{
draw_text(64,272-16,string_hash_to_newline("            ON      "));
}
draw_text(64,304-16,string_hash_to_newline("MAZES:              "));
if global.rand = 0{
    if global.game = 0{
    if global.mode = 0{
draw_text(64,304-16,string_hash_to_newline("         ORIGINAL   "));
    }
    if global.mode = 1{
draw_text(64,304-16,string_hash_to_newline("        HANGLY-MAN  "));
    }
    if global.mode = 2{
draw_text(64,304-16,string_hash_to_newline("         BABY       "));
draw_text(64,304,   string_hash_to_newline("         PAC-MAN    "));
    }
    if global.mode = 3{
draw_text(64,304-16,string_hash_to_newline("         ULTRA      "));
draw_text(64,304,   string_hash_to_newline("         PAC-MAN    "));
    }
    if global.mode = 4{
draw_text(64,304-16,string_hash_to_newline("         PAC-MAN    "));
draw_text(64-8,304,   string_hash_to_newline("        ARRANGEMENT "));
    }
}
if global.game = 1{
    if global.mode = 0{
draw_text(64,304-16,string_hash_to_newline("         ORIGINAL   "));
    }
    if global.mode = 1{
draw_text(64,304-16,string_hash_to_newline("         MS. PMP    "));
draw_text(64,304,   string_hash_to_newline("         ARCADE     "));
    }
    if global.mode = 2{
draw_text(64,304-16,string_hash_to_newline("         PAC-JR.    "));
draw_text(64,304,   string_hash_to_newline("         GENESIS    "));
    }
    if global.mode = 3{
draw_text(64,304-16,string_hash_to_newline("         TENGEN     "));
draw_text(64,304,   string_hash_to_newline("         STRANGE    "));
    }
    if global.mode = 4{
draw_text(64,304-16,string_hash_to_newline("          CHAMP     "));
draw_text(64,304,   string_hash_to_newline("        MS. PAC-EM  "));
    }
}
if global.game = 2{
    if global.mode = 0{
draw_text(64,304-16,string_hash_to_newline("         ORIGINAL   "));
    }
    if global.mode = 1{
draw_text(64,304-16,string_hash_to_newline("         VERSUS     "));
draw_text(64,304,   string_hash_to_newline("          HACK      "));
    }
    if global.mode = 2{
draw_text(64,304-16,string_hash_to_newline("        COMMODORE    "));
draw_text(64,304,   string_hash_to_newline("            64       "));
    }
    if global.mode = 3{
draw_text(64,304-16,string_hash_to_newline("        ATARI 2600   "));
    }
    if global.mode = 4{
draw_text(64,304-16,string_hash_to_newline("         TUNNEL      "));
draw_text(64,304,   string_hash_to_newline("          HACK       "));
    }
}
}
if global.rand = 1{
draw_text(64,304-16,string_hash_to_newline("         RANDOM     "));
draw_text(64,304,   string_hash_to_newline("         MAZES      "));
}
draw_text(64,304+32,string_hash_to_newline("START:              "));
if global.plus = 1{
if global.game = 0{
    if global.lvl = 0{ 
draw_text(64,304+32,string_hash_to_newline("           COLA     "));}
    if global.lvl = 1{ 
draw_text(64,304+32,string_hash_to_newline("         COCKTAIL   "));}
    if global.lvl = 2{ 
draw_text(64,304+32,string_hash_to_newline("          PEAPOD    "));}
    if global.lvl = 4{ 
draw_text(64,304+32,string_hash_to_newline("          APPLE     "));}
    if global.lvl = 6{ 
draw_text(64,304+32,string_hash_to_newline("          GRAPES    "));}
    if global.lvl = 8{ 
draw_text(64,304+32,string_hash_to_newline("         GALAXIAN   "));}
    if global.lvl = 10{ 
draw_text(64,304+32,string_hash_to_newline("          BREAD     "));}
    if global.lvl = 12{ 
draw_text(64,304+32,string_hash_to_newline("         PANCAKES   "));}
}
if global.game = 1{
    if global.lvl = 0{ 
draw_text(64,304+32,string_hash_to_newline("           MILK     "));}
    if global.lvl = 1{ 
draw_text(64,304+32,string_hash_to_newline("        ICE CREAM   "));}
    if global.lvl = 2{ 
draw_text(64,304+32,string_hash_to_newline("         SLIPPER    "));}
    if global.lvl = 3{ 
draw_text(64,304+32,string_hash_to_newline("           STAR     "));}
    if global.lvl = 4{ 
draw_text(64,304+32,string_hash_to_newline("           HAND     "));}
    if global.lvl = 5{ 
draw_text(64,304+32,string_hash_to_newline("           RING     "));}
    if global.lvl = 6{ 
draw_text(64,304+32,string_hash_to_newline("          FLOWER    "));}
    if global.lvl = 7{ 
draw_text(64,304+32,string_hash_to_newline("          RANDOM    "));}
}
if global.game = 2{
    if global.lvl = 0{ 
draw_text(64,304+32,string_hash_to_newline("        SKATEBOARD  "));}
    if global.lvl = 1{ 
draw_text(64,304+32,string_hash_to_newline("        COWBOY HAT  "));}
    if global.lvl = 2{ 
draw_text(64,304+32,string_hash_to_newline("        POGO STICK  "));}
    if global.lvl = 3{ 
draw_text(64,304+32,string_hash_to_newline("           CAR      "));}
    if global.lvl = 4{ 
draw_text(64,304+32,string_hash_to_newline("        SPACESHIP   "));}
    if global.lvl = 5{ 
draw_text(64,304+32,string_hash_to_newline("          COOKIE    "));}
    if global.lvl = 6{ 
draw_text(64,304+32,string_hash_to_newline("          GUITAR    "));}
}
}
if global.plus = 0{
if global.game = 0{
    if global.lvl = 0{ 
draw_text(64,304+32,string_hash_to_newline("         CHERRIES   "));}
    if global.lvl = 1{ 
draw_text(64,304+32,string_hash_to_newline("        STRAWBERRY  "));}
    if global.lvl = 2{ 
draw_text(64,304+32,string_hash_to_newline("          ORANGE    "));}
    if global.lvl = 4{ 
draw_text(64,304+32,string_hash_to_newline("          APPLE     "));}
    if global.lvl = 6{ 
draw_text(64,304+32,string_hash_to_newline("          MELON     "));}
    if global.lvl = 8{ 
draw_text(64,304+32,string_hash_to_newline("         GALAXIAN   "));}
    if global.lvl = 10{ 
draw_text(64,304+32,string_hash_to_newline("           BELL     "));}
    if global.lvl = 12{ 
draw_text(64,304+32,string_hash_to_newline("           KEY      "));}
}
if global.game = 1{
    if global.lvl = 0{ 
draw_text(64,304+32,string_hash_to_newline("         CHERRIES   "));}
    if global.lvl = 1{ 
draw_text(64,304+32,string_hash_to_newline("        STRAWBERRY  "));}
    if global.lvl = 2{ 
draw_text(64,304+32,string_hash_to_newline("          ORANGE    "));}
    if global.lvl = 3{ 
draw_text(64,304+32,string_hash_to_newline("         PRETZEL    "));}
    if global.lvl = 4{ 
draw_text(64,304+32,string_hash_to_newline("          APPLE     "));}
    if global.lvl = 5{ 
draw_text(64,304+32,string_hash_to_newline("           PEAR     "));}
    if global.lvl = 6{ 
draw_text(64,304+32,string_hash_to_newline("          BANANA    "));}
    if global.lvl = 7{ 
draw_text(64,304+32,string_hash_to_newline("          RANDOM    "));}
}
if global.game = 2{
    if global.lvl = 0{ 
draw_text(64,304+32,string_hash_to_newline("         TRICYCLE   "));}
    if global.lvl = 1{ 
draw_text(64,304+32,string_hash_to_newline("          KITE      "));}
    if global.lvl = 2{ 
draw_text(64,304+32,string_hash_to_newline("          DRUM      "));}
    if global.lvl = 3{ 
draw_text(64,304+32,string_hash_to_newline("         BALLOON    "));}
    if global.lvl = 4{ 
draw_text(64,304+32,string_hash_to_newline("          TRAIN     "));}
    if global.lvl = 5{ 
draw_text(64,304+32,string_hash_to_newline("           CAT      "));}
    if global.lvl = 6{ 
draw_text(64,304+32,string_hash_to_newline("        ROOT BEER   "));}
}
}
draw_text(64,304+64,   string_hash_to_newline("BOOST:              "));
if global.boost = 0{
draw_text(64,304+64,string_hash_to_newline("           OFF      "));
}
if global.boost = 1{
draw_text(64,304+64,string_hash_to_newline("            ON      "));
}
if global.boost = 2{
draw_text(64,304+64,string_hash_to_newline("          CRAZY     "));
}
if global.credit = 1{
draw_set_color(c_aqua)
draw_text(64,400,string_hash_to_newline("   1 PLAYER ONLY    "));
draw_set_color(make_color_rgb(255,184,82))
draw_text(64,432,string_hash_to_newline(" PUSH START BUTTON  "));
}
else{
if im = 1 or (im > 1 and im < 2) or im = 3 or (im > 3 and im < 4){draw_set_color(c_aqua)}
else{draw_set_color(c_white)}
draw_text(64,400,string_hash_to_newline("PLAY:               "))
if global.players = 0{draw_text(64,400,string_hash_to_newline("         1 PLAYER   "));}
if global.players = 1{draw_text(64,400,string_hash_to_newline("         2P CO-OP   "));}
if global.players = 2{draw_text(64,400,string_hash_to_newline("         2P RIVAL   "));}
if global.players = 3{draw_text(64,400,string_hash_to_newline("         2P TURNS   "));}
draw_set_color(make_color_rgb(255,184,82))
draw_text(64,432,string_hash_to_newline(" PUSH START BUTTON  "));
}
draw_set_color(make_color_rgb(255,183,174))
draw_text(64,464,string_hash_to_newline("BONUS FOR 10000 PTS "));
}

if global.credit > 0{
draw_set_font(font0)
draw_set_halign(fa_right)
draw_set_color(c_white)
if global.rand = 0{
if global.game = 0{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.mode = 0{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusscore))}
}
if global.mode = 1{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.hanglyscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.hanglyplusscore))}
}
if global.mode = 2{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.newscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.newplusscore))}
}
if global.mode = 3{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.ultrascore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.ultraplusscore))}
}
if global.mode = 4{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.arrscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.arrplusscore))}
}
}
if global.game = 1{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.mode = 0{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusscore))}
}
if global.mode = 1{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspmpscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspmpplusscore))}
}
if global.mode = 2{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacjrscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacjrplusscore))}
}
if global.mode = 3{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.strangescore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.strangeplusscore))}
}
if global.mode = 4{
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.champscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.champplusscore))}
}
}
if global.game = 2{
draw_set_color(c_white)
 {draw_text(80+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("1UP"))}
draw_text(96+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("HIGH SCORE"))
if global.mode = 0{
    if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacscore))}
    else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacplusscore))}
}
if global.mode = 1{
    if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.extendedscore))}
    else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.extendedplusscore))}
}
if global.mode = 2{
    if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.c64score))}
    else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.c64plusscore))}
}
if global.mode = 3{
    if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.a2600score))}
    else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.a2600plusscore))}
}
if global.mode = 4{
    if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.bleachscore))}
    else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.bleachplusscore))}
}
}
}
else{
if global.game = 0{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacrandscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusrandscore))}
}
if global.game = 1{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacrandscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusrandscore))}
}
if global.game = 2{
draw_set_color(c_white)
 {draw_text(80+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("1UP"))}
draw_text(96+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacrandscore))}
else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacplusrandscore))}
}
}
}

