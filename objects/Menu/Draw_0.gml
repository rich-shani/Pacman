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
draw_text(64,304-16,string_hash_to_newline("MAZES:              "));
draw_text(64,304-16,string_hash_to_newline("         ORIGINAL   "));
draw_text(64,304+32,string_hash_to_newline("START:              "));
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
{
if global.game = 0{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacscore))
}
if global.game = 1{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacscore))
}
}
}

