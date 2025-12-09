dh = color_get_hue(make_color_rgb(global.dr,global.dg,global.db))
ds = color_get_saturation(make_color_rgb(global.dr,global.dg,global.db))
dv = color_get_value(make_color_rgb(global.dr,global.dg,global.db))
//
mh2 = color_get_hue(make_color_rgb(global.mr2,global.mg2,global.mb2))
ms2 = color_get_saturation(make_color_rgb(global.mr2,global.mg2,global.mb2))
mv2 = color_get_value(make_color_rgb(global.mr2,global.mg2,global.mb2))

///"PAUSE"
if pause = 1 and pressed = 0{
draw_set_font(font0);draw_set_halign(fa_left);
        draw_set_color(c_yellow)
        draw_text(144+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+320-32,string_hash_to_newline("  PAUSED  "))
        if quit = 0{draw_set_color(c_white)};else{draw_set_color(c_red)}
        draw_text(144-48+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+320+32,string_hash_to_newline("  RESUME  "))
        if quit = 1{draw_set_color(c_white)};else{draw_set_color(c_red)}
        draw_text(144+64+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+320+32,string_hash_to_newline("   QUIT   "))
        draw_set_color(c_aqua)
        if global.plus = false{
            if global.mode = 0{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("  PAC-MAN  "))}
                if global.game = 1{draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("MS. PAC-MAN"))}
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("JR. PAC-MAN"))}
            }
            if global.mode = 1{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline(" HANGLY-MAN"))}
                if global.game = 1{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline(" MS. PMP ARCADE "))}
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("  JR. PAC-MAN   "))
                                draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,string_hash_to_newline("  VERSUS HACK   "))}
            }
            if global.mode = 2{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("BABY PAC-MAN "))}
                if global.game = 1{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("PAC-JR. GENESIS "))}
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("  JR. PAC-MAN   "))
                                draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,string_hash_to_newline("  COMMODORE 64  "))}
            }
            if global.mode = 3{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline(" ULTRA PAC-MAN  "))}
                if global.game = 1{
                draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("MS. PAC-MAN"))
                draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,string_hash_to_newline(" TENGEN STRANGE "))
                }
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,string_hash_to_newline("  JR. PAC-MAN   "))
                                draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,string_hash_to_newline("   ATARI 2600   "))}
            }
            if global.mode = 4{
                if global.game = 0{
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,                string_hash_to_newline("    PAC-MAN    "))
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,             string_hash_to_newline("  ARRANGEMENT  "))
                }
                if global.game = 1{
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,                string_hash_to_newline("     CHAMP     "))
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,             string_hash_to_newline("   MS. PAC-EM  "))
                }
                if global.game = 2{
                    draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,                  string_hash_to_newline("JR. PAC-MAN"))
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,             string_hash_to_newline("  TUNNEL HACK   "))
                }
            }
        }
        else{
            if global.mode = 0{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("  PAC-MAN PLUS  "))}
                if global.game = 1{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("MS. PAC-MAN PLUS"))}
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("JR. PAC-MAN PLUS"))}
            }
            if global.mode = 1{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("HANGLY-MAN PLUS "))}
                if global.game = 1{draw_text(144+__view_get( e__VW.XView, 0 )-48-16,__view_get( e__VW.YView, 0 )+320-96, string_hash_to_newline("MS. PMP ARCADE PLUS"))}
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("JR. PAC-MAN PLUS"))
                                draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,   string_hash_to_newline("  VERSUS HACK   "))}
            }
            if global.mode = 2{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("BABY PAC-MAN PLUS   "))}
                if global.game = 1{draw_text(144+__view_get( e__VW.XView, 0 )-48-16,__view_get( e__VW.YView, 0 )+320-96, string_hash_to_newline("PAC-JR. GENESIS PLUS"))}
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("JR. PAC-MAN PLUS"))
                                   draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,string_hash_to_newline("  COMMODORE 64  "))}
                
            }
            if global.mode = 3{
                if global.game = 0{draw_text(144+__view_get( e__VW.XView, 0 )-48-16,__view_get( e__VW.YView, 0 )+320-96,  string_hash_to_newline("ULTRA PAC-MAN PLUS"))}
                if global.game = 1{
                draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-96,                      string_hash_to_newline("MS. PAC-MAN"))
                draw_text(144+__view_get( e__VW.XView, 0 )-48-16,__view_get( e__VW.YView, 0 )+320-96+16,                string_hash_to_newline("TENGEN STRANGE PLUS"))
                }
                if global.game = 2{draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,   string_hash_to_newline("JR. PAC-MAN PLUS"))
                                   draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,string_hash_to_newline("   ATARI 2600   "))}
            }
            if global.mode = 4{
            if global.game = 0{
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,                string_hash_to_newline("    PAC-MAN    "))
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,             string_hash_to_newline("ARRANGEMENT PLUS"))
                }
                if global.game = 1{
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,                string_hash_to_newline("     CHAMP     "))
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,             string_hash_to_newline("MS. PAC-EM PLUS"))
                }
                if global.game = 2{
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96,                string_hash_to_newline("JR. PAC-MAN PLUS"))
                    draw_text(144+__view_get( e__VW.XView, 0 )-48,__view_get( e__VW.YView, 0 )+320-96+16,             string_hash_to_newline("  TUNNEL HACK   "))
                }
            }
        }
        if global.rand = 1{draw_text(144+__view_get( e__VW.XView, 0 )-16,__view_get( e__VW.YView, 0 )+320-80,string_hash_to_newline("RANDOM MAZES"))}
}

if pause = 1 and pressed = 0{
draw_set_font(font0)
draw_set_halign(fa_right)
draw_set_color(c_white)
if global.rand = 0{
if global.game = 0{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))}
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
if global.players > 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))}
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
draw_set_color(c_yellow)
 {draw_text(80+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))}
draw_text(288+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.extendedscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.c64score))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.a2600score))}
}
else{
if global.mode = 0{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacplusscore))}
if global.mode = 1{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.extendedplusscore))}
if global.mode = 2{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.c64plusscore))}
if global.mode = 3{draw_text(256+16+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.a2600plusscore))}
}
}
}
else{
if global.game = 0{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacrandscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusrandscore))}
}
if global.game = 1{
 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))}
draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacrandscore))}
else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusrandscore))}
}
if global.game = 2{
draw_set_color(c_yellow)
 {draw_text(80+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}
draw_text(96+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))
if global.players > 0{draw_text(80+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("2UP"))
draw_text(96+16+__view_get( e__VW.XView, 0 )+(19*16),__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p2score))}
draw_text(288+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))
if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacrandscore))}
else{draw_text(256+__view_get( e__VW.XView, 0 )+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.jrpacplusrandscore))}
}
}
}

if pause = 1 and pressed = 0{
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
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_Man,1,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_Man,1,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_Man,1,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_Man2,9,__view_get( e__VW.XView, 0 )-24+448-96-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>2{draw_sprite(spr_Man2,9,__view_get( e__VW.XView, 0 )-24+448-64-4,__view_get( e__VW.YView, 0 )+552)}
if global.p2lives>1{draw_sprite(spr_Man2,9,__view_get( e__VW.XView, 0 )-24+448-32-4,__view_get( e__VW.YView, 0 )+552)}
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
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 136-24-12,__view_get( e__VW.YView, 0 ) + -24+568)}
if global.p1lives>2{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 104-24-12,__view_get( e__VW.YView, 0 ) + -24+568)}
if global.p1lives>1{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 72-24-12,__view_get( e__VW.YView, 0 ) + -24+568)}
///
if global.players > 0{
if global.p2lives>3 and Pauser.ignore = 0{draw_sprite(spr_Jrlife2,0,__view_get( e__VW.XView, 0 )-24+448-96-4-8,__view_get( e__VW.YView, 0 )+552-8)}
if global.p2lives>2{draw_sprite(spr_Jrlife2,0,__view_get( e__VW.XView, 0 )-24+448-64-4-8,__view_get( e__VW.YView, 0 )+552-8)}
if global.p2lives>1{draw_sprite(spr_Jrlife2,0,__view_get( e__VW.XView, 0 )-24+448-32-4-8,__view_get( e__VW.YView, 0 )+552-8)}
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

exit;
if pause = 1 and pressed = 0{
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
if global.p1lives>3{draw_sprite(spr_Man,9,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_Man,9,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_Man,9,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
///if Pac.alarm[9] = -1{}else{draw_sprite(spr_Man,9,136-16-8,view_yview[0]+552)}
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
if global.game = 1{
if global.otto = 0{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_MsMan,1,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_MsMan,1,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_MsMan,1,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
///if Pac.alarm[9] = -1{}else{draw_sprite(spr_MsMan,1,136-16-8,view_yview[0]+552)}
}
else{
if global.p1lives>3 and Pauser.ignore = 0{draw_sprite(spr_OttoMan,0,136-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>2{draw_sprite(spr_OttoMan,0,104-16-8-4,__view_get( e__VW.YView, 0 )+552)}
if global.p1lives>1{draw_sprite(spr_OttoMan,0,72-16-8-4,__view_get( e__VW.YView, 0 )+552)}
}
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
if global.game = 2{
if global.p1lives>3{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 136-24-12,__view_get( e__VW.YView, 0 )+-24+568)}
if global.p1lives>2{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 104-24-12,__view_get( e__VW.YView, 0 )+-24+568)}
if global.p1lives>1{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 72-24-12,__view_get( e__VW.YView, 0 )+-24+568)}
///if Pac.alarm[9] = -1{}else{draw_sprite(spr_Jrlife,0,view_xview[0]+136-24-16,-24+568)}
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

