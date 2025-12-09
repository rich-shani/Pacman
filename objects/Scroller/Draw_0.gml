draw_set_color(c_black);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+448,__view_get( e__VW.YView, 0 )+32,false);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+544,__view_get( e__VW.XView, 0 )+448,__view_get( e__VW.YView, 0 )+576,false);

if Pac.test = 0{
if (Pac.test = 0 and Pac.dead = 3) or (global.p1lives = 0 and global.p2lives = 0){
draw_set_font(font0)
draw_set_halign(fa_left)
if room_width = 448{draw_set_color(c_white);}
else{draw_set_color(c_yellow);}
draw_text(__view_get( e__VW.XView, 0 )+32,__view_get( e__VW.YView, 0 )+560,string_hash_to_newline("CREDIT "))
draw_text(__view_get( e__VW.XView, 0 )+144,__view_get( e__VW.YView, 0 )+560,string_hash_to_newline(global.credit))
}
}

if global.lvl > 0{
if Pauser.pause = 0{
if Pac.test = 0{
draw_set_font(font0)
draw_set_halign(fa_right)
draw_set_color(c_white)
if global.rand = 0{
if global.game = 0{
if Pac.blink = 0 or global.p1lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
if Pac.blink = 0 or global.p2lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.hanglyscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.newscore))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.ultrascore))}
if global.mode = 4{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.arrscore))}
}
else{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.hanglyplusscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.newplusscore))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.ultraplusscore))}
if global.mode = 4{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.arrplusscore))}
}
}
if global.game = 1{
if Pac.blink = 0 or global.p1lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
if Pac.blink = 0 or global.p2lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspmpscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacjrscore))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.strangescore))}
if global.mode = 4{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.champscore))}
}
else{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspmpplusscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacjrplusscore))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.strangeplusscore))}
if global.mode = 4{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.champplusscore))}
}
}
if global.game = 2{
draw_set_color(c_yellow)
if Pac.blink = 0 or global.p1lives = 0{draw_text(80+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
if Pac.blink = 0 or global.p2lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.extendedscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.c64score))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.a2600score))}
if global.mode = 4{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.bleachscore))}
}
else{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacplusscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.extendedplusscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.c64plusscore))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.a2600plusscore))}
if global.mode = 4{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.bleachplusscore))}
}
}
}
else{
if global.game = 0{
if Pac.blink = 0 or global.p1lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
if Pac.blink = 0 or global.p2lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacrandscore))}
else{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusrandscore))}
}
if global.game = 1{
if Pac.blink = 0 or global.p1lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
if Pac.blink = 0 or global.p2lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacrandscore))}
else{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusrandscore))}
}
if global.game = 2{
draw_set_color(c_yellow)
if Pac.blink = 0 or global.p1lives = 0{draw_text(80+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{
if Pac.blink = 0 or global.p2lives = 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))}
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))
}
draw_text(288+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacrandscore))}
else{draw_text(256+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacplusrandscore))}
}
}
}
}
}

if Pac.test = 0{
if global.lvl = 0{
draw_set_font(font0)
draw_set_halign(fa_left)
draw_set_color(make_color_hsv(global.color-40,240,120))
draw_text(0-2+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+2+8,string_hash_to_newline("     PAC-MAN COLLECTION     "))//224
draw_set_color(make_color_hsv(global.color,240,180))
draw_text(0+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0+8, string_hash_to_newline("     PAC-MAN COLLECTION     "))//224
draw_text(0,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(""))
if global.game = 0{
draw_sprite_ext(spr_Man,2,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
draw_sprite_ext(spr_Man2,10,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
}
if global.game = 1{
if global.otto = false{
draw_sprite_ext(spr_MsMan,2,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
draw_sprite_ext(spr_MsMan2,10,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
}
else{
draw_sprite_ext(spr_OttoMan,0,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
draw_sprite_ext(spr_OttoMan2,8,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
}
}
if global.game = 2{
draw_sprite_ext(spr_JrMan,2,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
draw_sprite_ext(spr_JrMan2,10,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)
}
}
}

if Pauser.pause = 0{
if Pac.test = 0{
if global.lvl > 0{
    draw_sprite(spr_levelbox,0,__view_get( e__VW.XView, 0 ) + 408+16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_levelbox,0,__view_get( e__VW.XView, 0 ) + 72-8-48-8,__view_get( e__VW.YView, 0 )+552)
    draw_set_font(font0); draw_set_color(c_white); draw_set_halign(fa_right);
    if global.lvl < 99{
    draw_text(__view_get( e__VW.XView, 0 ) + 408+24+16,__view_get( e__VW.YView, 0 )+552-8+2,string_hash_to_newline(global.lvl))
    draw_text(__view_get( e__VW.XView, 0 ) + 72-8+24-48-8,__view_get( e__VW.YView, 0 )+552-8+2,string_hash_to_newline(global.lvl))
    }
    else{
    draw_text(__view_get( e__VW.XView, 0 ) + 408+24+16,__view_get( e__VW.YView, 0 )+552-8+2,string_hash_to_newline(global.lvl-(global.lvl-99)))
    draw_text(__view_get( e__VW.XView, 0 ) + 72-8+24-48-8,__view_get( e__VW.YView, 0 )+552-8+2,string_hash_to_newline(global.lvl-(global.lvl-99)))
    }
if global.game = 0{
if (Pac.test = 0 and Pac.dead = 3) or (global.p1lives = 0 and global.p2lives = 0){}else{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_Man,1,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_Man,1,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_Man,1,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_Man2,9,__view_get( e__VW.XView, 0 )-24+448-96-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>2{draw_sprite(spr_Man2,9,__view_get( e__VW.XView, 0 )-24+448-64-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>1{draw_sprite(spr_Man2,9,__view_get( e__VW.XView, 0 )-24+448-32-4,__view_get( e__VW.YView, 0 )+552)}
}
}
if global.players = 0{
if global.plus = 0{
if global.lvl < 8{
    draw_sprite(spr_Fruit,0,408-16,__view_get( e__VW.YView, 0 )+552)
    if global.lvl > 1{draw_sprite(spr_Fruit,1,376-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 2{draw_sprite(spr_Fruit,2,344-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 3{draw_sprite(spr_Fruit,2,312-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 5{draw_sprite(spr_Fruit,3,248-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl = 7{draw_sprite(spr_Fruit,4,216-16,__view_get( e__VW.YView, 0 )+552)}
}
if global.lvl = 8{
    draw_sprite(spr_Fruit,1,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,2,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,2,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 9{
    draw_sprite(spr_Fruit,2,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,2,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 10{
    draw_sprite(spr_Fruit,2,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 11{
    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 12{
    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 13{
    draw_sprite(spr_Fruit,4,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,4,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 14{
    draw_sprite(spr_Fruit,4,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 15{
    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 16{
    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 17{
    draw_sprite(spr_Fruit,6,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,6,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 18{
    draw_sprite(spr_Fruit,6,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl > 18{
    draw_sprite(spr_Fruit,7,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)
}
}
else{
if global.lvl < 8{
    draw_sprite(spr_Fruit,11,408-16,__view_get( e__VW.YView, 0 )+552)
    if global.lvl > 1{draw_sprite(spr_Fruit,12,376-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 2{draw_sprite(spr_Fruit,13,344-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 3{draw_sprite(spr_Fruit,13,312-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl > 5{draw_sprite(spr_Fruit,3,248-16,__view_get( e__VW.YView, 0 )+552)}
    if global.lvl = 7{draw_sprite(spr_Fruit,14,216-16,__view_get( e__VW.YView, 0 )+552)}
}
if global.lvl = 8{
    draw_sprite(spr_Fruit,12,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,13,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,13,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 9{
    draw_sprite(spr_Fruit,13,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,13,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 10{
    draw_sprite(spr_Fruit,13,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 11{
    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 12{
    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 13{
    draw_sprite(spr_Fruit,14,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,14,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 14{
    draw_sprite(spr_Fruit,14,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 15{
    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 16{
    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 17{
    draw_sprite(spr_Fruit,15,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,15,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl = 18{
    draw_sprite(spr_Fruit,15,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
if global.lvl > 18{
    draw_sprite(spr_Fruit,16,408-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,376-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,344-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)
    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)
}
}
}
}
if global.game = 1{
if (Pac.test = 0 and Pac.dead = 3) or (global.p1lives = 0 and global.p2lives = 0){}else{
if global.otto = 0{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_MsMan,1,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_MsMan,1,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_MsMan,1,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_MsMan2,9,__view_get( e__VW.XView, 0 )-24+448-96-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>2{draw_sprite(spr_MsMan2,9,__view_get( e__VW.XView, 0 )-24+448-64-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>1{draw_sprite(spr_MsMan2,9,__view_get( e__VW.XView, 0 )-24+448-32-4,__view_get( e__VW.YView, 0 )+552)}
}
}
else{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_OttoMan,0,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_OttoMan,0,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_OttoMan,0,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_OttoMan2,8,__view_get( e__VW.XView, 0 )-24+448-96-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>2{draw_sprite(spr_OttoMan2,8,__view_get( e__VW.XView, 0 )-24+448-64-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>1{draw_sprite(spr_OttoMan2,8,__view_get( e__VW.XView, 0 )-24+448-32-4,__view_get( e__VW.YView, 0 )+552)}
}
}
}
if global.players = 0{
if global.plus = 0{
draw_sprite(spr_Fruit,0,408-16,__view_get( e__VW.YView, 0 )+552)
if global.lvl > 1{draw_sprite(spr_Fruit,1,376-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 2{draw_sprite(spr_Fruit,2,344-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 3{draw_sprite(spr_Fruit,8,312-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 5{draw_sprite(spr_Fruit,9,248-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 6{draw_sprite(spr_Fruit,10,216-16,__view_get( e__VW.YView, 0 )+552)}
}
else{
draw_sprite(spr_Fruit,24,408-16,__view_get( e__VW.YView, 0 )+552)
if global.lvl > 1{draw_sprite(spr_Fruit,25,376-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 2{draw_sprite(spr_Fruit,26,344-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 3{draw_sprite(spr_Fruit,27,312-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 4{draw_sprite(spr_Fruit,28,280-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 5{draw_sprite(spr_Fruit,29,248-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 6{draw_sprite(spr_Fruit,30,216-16,__view_get( e__VW.YView, 0 )+552)}
}
}
}
if global.game = 2{
if (Pac.test = 0 and Pac.dead = 3) or (global.p1lives = 0 and global.p2lives = 0){}else{
if global.start = 1{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 136-24-12,__view_get( e__VW.YView, 0 ) + -24+568)}
if global.p1lives>2{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 104-24-12,__view_get( e__VW.YView, 0 ) + -24+568)}
if global.p1lives>1{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 72-24-12,__view_get( e__VW.YView, 0 ) + -24+568)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_Jrlife2,0,__view_get( e__VW.XView, 0 )-24+448-96-4-8,__view_get( e__VW.YView, 0 )+552-8)}
if global.p2lives>2{draw_sprite(spr_Jrlife2,0,__view_get( e__VW.XView, 0 )-24+448-64-4-8,__view_get( e__VW.YView, 0 )+552-8)}
if global.p2lives>1{draw_sprite(spr_Jrlife2,0,__view_get( e__VW.XView, 0 )-24+448-32-4-8,__view_get( e__VW.YView, 0 )+552-8)}
}
}
else{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_Jrlife,floor(Pac.im2)+2,__view_get( e__VW.XView, 0 ) + 136-24-12, __view_get( e__VW.YView, 0 ) + -24+568)}
if global.p1lives>2{draw_sprite(spr_Jrlife,floor(Pac.im2)+1,__view_get( e__VW.XView, 0 ) + 104-24-12, __view_get( e__VW.YView, 0 ) + -24+568)}
if global.p1lives>1{draw_sprite(spr_Jrlife,floor(Pac.im2),__view_get( e__VW.XView, 0 ) + 72-24-12, __view_get( e__VW.YView, 0 ) + -24+568)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_Jrlife2,floor(Pac.im2)+2,__view_get( e__VW.XView, 0 )-24+448-96-4-8,__view_get( e__VW.YView, 0 )+552-8)}
if global.p2lives>2{draw_sprite(spr_Jrlife2,floor(Pac.im2)+1,__view_get( e__VW.XView, 0 )-24+448-64-4-8,__view_get( e__VW.YView, 0 )+552-8)}
if global.p2lives>1{draw_sprite(spr_Jrlife2,floor(Pac.im2),__view_get( e__VW.XView, 0 )-24+448-32-4-8,__view_get( e__VW.YView, 0 )+552-8)}
}
}
}
if global.players = 0{
if global.plus = 0{
draw_sprite(spr_Fruit,17,__view_get( e__VW.XView, 0 ) + 408-16,__view_get( e__VW.YView, 0 )+552)
if global.lvl > 1{draw_sprite(spr_Fruit,18,__view_get( e__VW.XView, 0 ) + 376-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 2{draw_sprite(spr_Fruit,19,__view_get( e__VW.XView, 0 ) + 344-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 3{draw_sprite(spr_Fruit,20,__view_get( e__VW.XView, 0 ) + 312-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 4{draw_sprite(spr_Fruit,21,__view_get( e__VW.XView, 0 ) + 280-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 5{draw_sprite(spr_Fruit,22,__view_get( e__VW.XView, 0 ) + 248-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 6{draw_sprite(spr_Fruit,23,__view_get( e__VW.XView, 0 ) + 216-16,__view_get( e__VW.YView, 0 )+552)}
}
else{
draw_sprite(spr_Fruit,31,__view_get( e__VW.XView, 0 ) + 408-16,__view_get( e__VW.YView, 0 )+552)
if global.lvl > 1{draw_sprite(spr_Fruit,32,__view_get( e__VW.XView, 0 ) + 376-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 2{draw_sprite(spr_Fruit,33,__view_get( e__VW.XView, 0 ) + 344-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 3{draw_sprite(spr_Fruit,34,__view_get( e__VW.XView, 0 ) + 312-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 4{draw_sprite(spr_Fruit,35,__view_get( e__VW.XView, 0 ) + 280-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 5{draw_sprite(spr_Fruit,36,__view_get( e__VW.XView, 0 ) + 248-16,__view_get( e__VW.YView, 0 )+552)}
if global.lvl > 6{draw_sprite(spr_Fruit,37,__view_get( e__VW.XView, 0 ) + 216-16,__view_get( e__VW.YView, 0 )+552)}
}
}
}
}
}
}

var __b__;
__b__ = action_if_variable(Pauser.pause, 0, 0);
if __b__
{
{
__b__ = action_if_variable(Pac.test, 1, 0);
if __b__
{
{
action_draw_sprite(spr_Red, Blinky.pursuex, Blinky.pursuey, -1);
action_draw_sprite(spr_Pink, Pinky.pursuex, Pinky.pursuey, -1);
action_draw_sprite(spr_Cyan, Inky.pursuex, Inky.pursuey, -1);
if collision_circle(16*(round(Pac.x/16)),16*(round(Pac.y/16)),128,Clyde,false,false)
or collision_circle(16*(round(Pac.x2/16)),16*(round(Pac.y2/16)),128,Clyde,false,false)
or (
collision_circle(16*(round(Pac.x/16)),16*(round(Pac.y/16)),128,Clyde,false,false) and
collision_circle(16*(round(Pac.x2/16)),16*(round(Pac.y2/16)),128,Clyde,false,false)
)
{draw_sprite(spr_Orange,0,Clyde.cornerx,Clyde.cornery);}

action_font(font0, 0);
action_color(65535);
action_draw_variable(global.dottotal, Blinky.xstart - 16, Blinky.ystart + 32);
action_draw_variable(Pac.dotcount, Blinky.xstart - 16, Blinky.ystart + 48);
__b__ = action_if_variable(global.start, 0, 0);
if __b__
{
{
__b__ = action_if_variable(Pac.dotcount, Pac.psig, 1);
if __b__
{
{
action_color(16759039);
action_draw_variable(Pac.psig, Blinky.xstart - 16, Blinky.ystart + 64);
}
}
else
{
{
__b__ = action_if_variable(Pac.dotcount, Pac.isig, 1);
if __b__
{
{
action_color(16776960);
action_draw_variable(Pac.isig, Blinky.xstart - 16, Blinky.ystart + 64);
}
}
else
{
{
__b__ = action_if_variable(Pac.dotcount, Pac.csig, 1);
if __b__
{
{
action_color(5421311);
action_draw_variable(Pac.csig, Blinky.xstart - 16, Blinky.ystart + 64);
}
}
else
{
{
__b__ = action_if_variable(Pac.dotcount, Blinky.elroydots, 1);
if __b__
{
{
action_color(255);
action_draw_variable(Blinky.elroydots, Blinky.xstart - 16, Blinky.ystart + 64);
}
}
else
{
{
__b__ = action_if_variable(Pac.dotcount, Blinky.elroydots2, 1);
if __b__
{
{
action_color(255);
action_draw_variable(Blinky.elroydots2, Blinky.xstart - 16, Blinky.ystart + 64);
}
}
}
}
}
}
}
}
}
}
}
}
action_color(65535);
action_draw_variable(Pac.dir*2, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Pac.eatdir, __view_get( e__VW.XView, 0 ) + 16, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Pac.corner, __view_get( e__VW.XView, 0 ) + 48, __view_get( e__VW.YView, 0 ) + 544);
__b__ = action_if_variable(global.p1gameover, 0, 0);
if __b__
{
__b__ = action_if_variable(Pac.dead, 2, 1);
if __b__
{
{
action_draw_variable(Pac.tilex, __view_get( e__VW.XView, 0 ) + 80, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Pac.tiley, __view_get( e__VW.XView, 0 ) + 80, __view_get( e__VW.YView, 0 ) + 560);
}
}
}
action_draw_variable(Pac.park, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Pac.pause, __view_get( e__VW.XView, 0 ) + 32, __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Pac.stoppy, __view_get( e__VW.XView, 0 ) + 48, __view_get( e__VW.YView, 0 ) + 560);
action_color(65280);
action_draw_variable(Pac.dir2*2, __view_get( e__VW.XView, 0 ) + 128 + 16, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Pac.eatdir2, __view_get( e__VW.XView, 0 ) + 16 + 128 + 16, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Pac.corner2, __view_get( e__VW.XView, 0 ) + 48 + 128 + 16, __view_get( e__VW.YView, 0 ) + 544);
__b__ = action_if_variable(global.p2gameover, 0, 0);
if __b__
{
__b__ = action_if_variable(Pac.dead, 2, 1);
if __b__
{
{
action_draw_variable(Pac.tilex2, __view_get( e__VW.XView, 0 ) + 80 + 128 + 16, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Pac.tiley2, __view_get( e__VW.XView, 0 ) + 80 + 128 + 16, __view_get( e__VW.YView, 0 ) + 560);
}
}
}
action_draw_variable(Pac.park2, __view_get( e__VW.XView, 0 ) + 128 + 16, __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Pac.pause2, __view_get( e__VW.XView, 0 ) + 32 + 128 + 16, __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Pac.stoppy, __view_get( e__VW.XView, 0 ) + 48 + 128 + 16, __view_get( e__VW.YView, 0 ) + 560);
action_color(32768);
action_draw_variable(Fruit.alarm[0], __view_get( e__VW.XView, 0 ) + 224 + 64, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Fruit.spawn, __view_get( e__VW.XView, 0 ) + 256 + 64, __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Fruit.tilex, __view_get( e__VW.XView, 0 ) + 288 + 64, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Fruit.tiley, __view_get( e__VW.XView, 0 ) + 288 + 64, __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Fruit.newtile, __view_get( e__VW.XView, 0 ) + 352 + 64, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Fruit.state, __view_get( e__VW.XView, 0 ) + 352 + 64, __view_get( e__VW.YView, 0 ) + 560);
action_draw_variable(Fruit.dir, __view_get( e__VW.XView, 0 ) + 224 + 64, __view_get( e__VW.YView, 0 ) + 560);
__b__ = action_if_variable(room_width, 448, 0);
if !__b__
{
__b__ = action_if_variable(Fruit.state, 1, 0);
if __b__
{
__b__ = action_if_number(Power, 0, 2);
if __b__
{
{
action_draw_variable(Fruit.chasex, __view_get( e__VW.XView, 0 ) + 400 + 64, __view_get( e__VW.YView, 0 ) + 544);
action_draw_variable(Fruit.chasey, __view_get( e__VW.XView, 0 ) + 400 + 64, __view_get( e__VW.YView, 0 ) + 560);
}
}
}
}
action_color(16777215);
action_draw_variable(Pac.alarm[0], __view_get( e__VW.XView, 0 ) + 384, __view_get( e__VW.YView, 0 ) + 16);
action_draw_variable(Pac.alarm[1], __view_get( e__VW.XView, 0 ) + 384, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(cycle, __view_get( e__VW.XView, 0 ) + 384, __view_get( e__VW.YView, 0 ) + 32);
action_draw_variable(scatter, __view_get( e__VW.XView, 0 ) + 384 + 16, __view_get( e__VW.YView, 0 ) + 32);
action_color(255);
action_draw_variable(Blinky.dir, __view_get( e__VW.XView, 0 ) + 0, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Blinky.resdir, __view_get( e__VW.XView, 0 ) + 0 + 16, __view_get( e__VW.YView, 0 ) + 0);
__b__ = action_if_variable(Blinky.tilex, -100, 2);
if __b__
{
{
action_draw_variable(Blinky.tilex, __view_get( e__VW.XView, 0 ) + 0, __view_get( e__VW.YView, 0 ) + 16);
action_draw_variable(Blinky.tiley, __view_get( e__VW.XView, 0 ) + 0, __view_get( e__VW.YView, 0 ) + 32);
}
}
action_draw_variable(Blinky.newtile, __view_get( e__VW.XView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Blinky.aboutface, __view_get( e__VW.XView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + 16);
action_draw_variable(Blinky.elroy, __view_get( e__VW.XView, 0 ) + 64, __view_get( e__VW.YView, 0 ) + 32);
action_color(16759039);
action_draw_variable(Pinky.dir, __view_get( e__VW.XView, 0 ) + 0 + 96, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Pinky.resdir, __view_get( e__VW.XView, 0 ) + 0 + 96 + 16, __view_get( e__VW.YView, 0 ) + 0);
__b__ = action_if_variable(Blinky.tilex, -100, 2);
if __b__
{
{
action_draw_variable(Pinky.tilex, __view_get( e__VW.XView, 0 ) + 0+ 96, __view_get( e__VW.YView, 0 ) + 16);
action_draw_variable(Pinky.tiley, __view_get( e__VW.XView, 0 ) + 0+ 96, __view_get( e__VW.YView, 0 ) + 32);
}
}
action_draw_variable(Pinky.newtile, __view_get( e__VW.XView, 0 ) + 64+ 96, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Pinky.aboutface, __view_get( e__VW.XView, 0 ) + 64+ 96, __view_get( e__VW.YView, 0 ) + 16);
action_color(16776960);
action_draw_variable(Inky.dir, __view_get( e__VW.XView, 0 ) + 0 + 192, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Inky.resdir, __view_get( e__VW.XView, 0 ) + 0 + 16 + 192, __view_get( e__VW.YView, 0 ) + 0);
__b__ = action_if_variable(Blinky.tilex, -100, 2);
if __b__
{
{
action_draw_variable(Inky.tilex, __view_get( e__VW.XView, 0 ) + 0 + 192, __view_get( e__VW.YView, 0 ) + 16);
action_draw_variable(Inky.tiley, __view_get( e__VW.XView, 0 ) + 0 + 192, __view_get( e__VW.YView, 0 ) + 32);
}
}
action_draw_variable(Inky.newtile, __view_get( e__VW.XView, 0 ) + 64 + 192, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Inky.aboutface, __view_get( e__VW.XView, 0 ) + 64 + 192, __view_get( e__VW.YView, 0 ) + 16);
action_color(5421311);
action_draw_variable(Clyde.dir, __view_get( e__VW.XView, 0 ) + 0 + 288, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Clyde.resdir, __view_get( e__VW.XView, 0 ) + 0 + 16 + 288, __view_get( e__VW.YView, 0 ) + 0);
__b__ = action_if_variable(Blinky.tilex, -100, 2);
if __b__
{
{
action_draw_variable(Clyde.tilex, __view_get( e__VW.XView, 0 ) + 0+ 288, __view_get( e__VW.YView, 0 ) + 16);
action_draw_variable(Clyde.tiley, __view_get( e__VW.XView, 0 ) + 0+ 288, __view_get( e__VW.YView, 0 ) + 32);
}
}
action_draw_variable(Clyde.newtile, __view_get( e__VW.XView, 0 ) + 64+ 288, __view_get( e__VW.YView, 0 ) + 0);
action_draw_variable(Clyde.aboutface, __view_get( e__VW.XView, 0 ) + 64+ 288, __view_get( e__VW.YView, 0 ) + 16);
}
}
}
}
