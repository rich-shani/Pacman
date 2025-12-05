draw_set_font(font0)

draw_set_halign(fa_center)


var __b__;
__b__ = action_if_variable(show, 0, 0);
if __b__
{
{
if global.game = 0{

if press = 0{

    draw_set_halign(fa_left)

    draw_set_color(c_white)

    draw_text(128+x,y+80,string_hash_to_newline("CHARACTER / NICKNAME"))

    if line > 1{

        draw_sprite_ext(spr_Ghost,0,88-8+x,y+112,1,1,0,make_color_rgb(255,0,0),1);

        draw_sprite(spr_Eyes,0,88-8+x,y+112);

    }

    if line > 3{

        draw_set_color(make_color_rgb(255,0,0))

        draw_text(128+x,y+112,string_hash_to_newline("-SHADOW"))

        if line > 4{draw_text(128+x,y+112,string_hash_to_newline("           \"BLINKY\""))}

    }

    if line > 5{

        draw_sprite_ext(spr_Ghost,0,88-8+x,y+160,1,1,0,make_color_rgb(255,184,255),1);

        draw_sprite(spr_Eyes,0,88-8+x,y+160);

    }

    if line > 7{

        draw_set_color(make_color_rgb(255,184,255))

        draw_text(128+x,y+160,string_hash_to_newline("-SPEEDY"))

        if line > 8{draw_text(128+x,y+160,string_hash_to_newline("           \"PINKY\""))}

    }

    if line > 9{

        draw_sprite_ext(spr_Ghost,0,88-8+x,y+208,1,1,0,make_color_rgb(0,255,255),1);

        draw_sprite(spr_Eyes,0,88-8+x,y+208);

    }

    if line > 11{

        draw_set_color(make_color_rgb(0,255,255))

        draw_text(128+x,y+208,string_hash_to_newline("-BASHFUL"))

        if line > 12{draw_text(128+x,y+208,string_hash_to_newline("           \"INKY\""))}

    }

    if line > 13{

        draw_sprite_ext(spr_Ghost,0,88-8+x,y+256,1,1,0,make_color_rgb(255,184,82),1);

        draw_sprite(spr_Eyes,0,88-8+x,y+256);

    }

    if line > 15{

        draw_set_color(make_color_rgb(255,184,82))

        draw_text(128+x,y+256,string_hash_to_newline("-POKEY"))

        if line > 16{draw_text(128+x,y+256,string_hash_to_newline("           \"CLYDE\""))}

    }

    if line > 18{

        draw_sprite_ext(spr_dot,0,176+x,y+384,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)

        if line > 22{if floor(im2) = 0{draw_sprite_ext(spr_powerpellet,0,176+x,y+416,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}}

        else{draw_sprite_ext(spr_powerpellet,0,176+x,y+416,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}

        draw_set_color(c_white)

        draw_text(208+x,y+384,string_hash_to_newline("10 PTS"))

        draw_text(208+x,y+416,string_hash_to_newline("50 PTS"))

    }

    if line > 20{

        draw_set_halign(fa_center)

        draw_set_color(make_color_rgb(255,184,255))

        draw_text(224 + 16+x,y+416 + 32,string_hash_to_newline("© 1980-2024 BANDAI"))

        draw_text(224 + 16+x,y+448 + 32,string_hash_to_newline("  NAMCO ENTERTAINMENT, INC. "))

        draw_set_color(make_color_rgb(255,0,0))

        draw_text(224 + 16+x,y+480 + 32,string_hash_to_newline("2024 SUPER BRETT SMITH"))

        if line > 22{

            if left < 72{}else{

                if floor(im2) = 0{draw_sprite_ext(spr_powerpellet,0,72-8+x,y+322,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}

            }

        }

        else{draw_sprite_ext(spr_powerpellet,0,72-8+x,y+322,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}

    }

    if line > 22{

        if left < 72{}else{

            draw_sprite(spr_Man,8+floor(im),left+x-8,y-8+328)

            draw_sprite_ext(spr_Ghost,floor(im2),((1.102564103*left)+24.61538462)-8+x,y-8+328,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+x-8,y-8+328)

            draw_sprite_ext(spr_Ghost,floor(im2),((1.102564103*left)+24.61538462)+32-8+x,y-8+328,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+32+x-8,y-8+328)

            draw_sprite_ext(spr_Ghost,floor(im2),((1.102564103*left)+24.61538462)+64-8+x,y-8+328,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+64+x-8,y-8+328)

            draw_sprite_ext(spr_Ghost,floor(im2),((1.102564103*left)+24.61538462)+96-8+x,y-8+328,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+96+x-8,y-8+328)

        }

        if left < 72{

            if right < right2{

            draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),right2-8+x,y-8+328,1,1,0,make_color_rgb(0,0,255),1);draw_sprite(spr_Eyes,4,right2+x-8,y-8+328+(global.plus*3));if global.plus = true{draw_sprite(spr_Ghost,floor(im2)+4,right2-8+x,y-8+328)};

            }

            if right < right2 + 32{

            draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),right2+32-8+x,y-8+328,1,1,0,make_color_rgb(0,0,255),1);draw_sprite(spr_Eyes,4,right2+32+x-8,y-8+328+(global.plus*3));if global.plus = true{draw_sprite(spr_Ghost,floor(im2)+4,right2+32-8+x,y-8+328)};

            }

            if right < right2 + 64{

            draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),right2+64-8+x,y-8+328,1,1,0,make_color_rgb(0,0,255),1);draw_sprite(spr_Eyes,4,right2+64+x-8,y-8+328+(global.plus*3));if global.plus = true{draw_sprite(spr_Ghost,floor(im2)+4,right2+64-8+x,y-8+328)};

            }

            if right < right2 + 96{

            draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),right2+96-8+x,y-8+328,1,1,0,make_color_rgb(0,0,255),1);draw_sprite(spr_Eyes,4,right2+96+x-8,y-8+328+(global.plus*3));if global.plus = true{draw_sprite(spr_Ghost,floor(im2)+4,right2+96-8+x,y-8+328)};

            }

            draw_sprite_ext(spr_Man,floor(im),right+x-8,y-8+328,1,1,0,c_white,op)

            if global.plus = 0{

            if right = right2{draw_sprite_ext(spr_Chomp,0,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            if right = right2+32{draw_sprite_ext(spr_Chomp,1,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            if right = right2+64{draw_sprite_ext(spr_Chomp,2,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            if right = right2+96{draw_sprite_ext(spr_Chomp,3,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            }

            else{

            if right = right2{draw_sprite_ext(spr_Chomp,0,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            if right = right2+32{draw_sprite_ext(spr_Chomp,1,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            if right = right2+64{draw_sprite_ext(spr_Chomp,2,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            if right = right2+96{draw_sprite_ext(spr_Chomp,3,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            }

            }

        }

    }

}




if global.game = 1 and global.otto = 0{

draw_set_color(c_red)

draw_text(224 + 16+x,y+416 + 56,string_hash_to_newline(" © 1980, 1981-2024 BANDAI "))

draw_text(224 + 16+x,y+448 + 56,string_hash_to_newline(" NAMCO ENTERTAINMENT, INC."))

draw_text(224 + 16+x,y+480 + 56,string_hash_to_newline("  2024 SUPER BRETT SMITH  "))

if press = 0{

draw_set_halign(fa_left)

draw_set_color(make_color_rgb(255,184,82))

draw_text(144+x,y+112,string_hash_to_newline(" \"MS PAC-MAN\"  "))

draw_sprite_ext(spr_board,15-image_index,136-8+x,y+168,1,1,0,c_white,1);

draw_sprite_ext(spr_board,15-image_index,264-8+x,y+168,1,1,0,c_white,1);

draw_sprite_ext(spr_board2,image_index,392+x-8,y+168,1,1,0,c_white,1);

draw_sprite_ext(spr_board,image_index,136-8+x,y+8+280,1,1,0,c_white,1);

draw_sprite_ext(spr_board,image_index,264-8+x,y+8+280,1,1,0,c_white,1);

draw_sprite_ext(spr_board2,15-image_index,120+x,y+168,1,1,0,c_white,1);

if global.plus = 1{draw_text(144+x,y+128,string_hash_to_newline("     PLUS      "))}

if intro=1{

    draw_set_font(font0); draw_set_color(make_color_rgb(255,255,255)); draw_text(160+x,y+200,string_hash_to_newline("WITH"));

    draw_set_font(font0); draw_set_color(make_color_rgb(255,0,0)); draw_text(208+x,y+248,string_hash_to_newline("BLINKY"));

    if left>104{draw_sprite_ext(spr_Ghost,(floor(im2)),left-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,left-8+x,y-8+up)}

    else{draw_sprite_ext(spr_Ghost,(floor(im2)),104-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+up)}

}

if intro=2{

    draw_set_font(font0); draw_set_color(make_color_rgb(255,184,255)); draw_text(208+x,y+248,string_hash_to_newline("PINKY"));

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+184,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+184)

    if left>104{draw_sprite_ext(spr_Ghost,(floor(im2)),left-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,2,left-8+x,y-8+up)}

    else{draw_sprite_ext(spr_Ghost,(floor(im2)),104-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+up)}

}

if intro=3{

    draw_set_font(font0); draw_set_color(make_color_rgb(0,255,255)); draw_text(208+x,y+248,string_hash_to_newline("INKY"));

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+184,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+184)

    draw_sprite_ext(spr_Ghost,1,104-8+x,y-8+216,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+216)

    if left>104{draw_sprite_ext(spr_Ghost,(floor(im2)),left-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,2,left-8+x,y-8+up)}

    else{draw_sprite_ext(spr_Ghost,(floor(im2)),104-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+up)}

}

if intro=4{

    draw_set_font(font0); draw_set_color(make_color_rgb(255,184,82)); draw_text(208+x,y+248,string_hash_to_newline(" SUE"));

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+184,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+184)

    draw_sprite_ext(spr_Ghost,1,104-8+x,y-8+216,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+216)

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+248,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+248)

    if left>104{draw_sprite_ext(spr_Ghost,(floor(im2)),left-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,left-8+x,y-8+up)}

    else{draw_sprite_ext(spr_Ghost,(floor(im2)),104-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+up)}

}

if intro=5{

    draw_set_font(font0); draw_set_color(make_color_rgb(255,255,255)); draw_text(160+x,y+200,string_hash_to_newline("STARRING"));

    draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(160+x,y+248,string_hash_to_newline("MS PAC-MAN"));

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+184,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+184)

    draw_sprite_ext(spr_Ghost,1,104-8+x,y-8+216,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+216)

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+248,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+248)

    draw_sprite_ext(spr_Ghost,0,104-8+x,y-8+280,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,1,104-8+x,y-8+280)

    if left>256{draw_sprite(spr_MsMan,floor(im)+8,left-8+x,y-8+up)}

    else{draw_sprite(spr_MsMan,8+1,left-8+x,y-8+up)}

}

}

}


if global.otto = 1{

if press = 0{

    draw_set_halign(fa_left)

    draw_set_color(c_white)

    draw_text(128+x,y+80,string_hash_to_newline("CHARACTER / NICKNAME"))

    if line > 1{

        draw_sprite_ext(spr_OttoMon,0,88-8+x,y+112,1,1,0,make_color_rgb(255,0,0),1);

        draw_sprite_ext(spr_OttoMon,8,88-8+x,y+112,1,1,0,c_white,1);

        draw_sprite(spr_Eyes,0,88-8+x,y+112);

    }

    if line > 3{

        draw_set_color(make_color_rgb(255,0,0))

        draw_text(128+x,y+112,string_hash_to_newline("-MAD DOG"))

        if line > 4{draw_text(128+x,y+112,string_hash_to_newline("           \"PLATO\""))}

    }

    if line > 5{

        draw_sprite_ext(spr_OttoMon,0,88-8+x,y+160,1,1,0,make_color_rgb(255,184,255),1);

        draw_sprite_ext(spr_OttoMon,8,88-8+x,y+160,1,1,0,c_white,1);

        draw_sprite(spr_Eyes,0,88-8+x,y+160);

    }

    if line > 7{

        draw_set_color(make_color_rgb(255,184,255))

        draw_text(128+x,y+160,string_hash_to_newline("-KILLER"))

        if line > 8{draw_text(128+x,y+160,string_hash_to_newline("           \"DARWIN\""))}

    }

    if line > 9{

        draw_sprite_ext(spr_OttoMon,0,88-8+x,y+208,1,1,0,make_color_rgb(0,255,255),1);

        draw_sprite_ext(spr_OttoMon,8,88-8+x,y+208,1,1,0,c_white,1);

        draw_sprite(spr_Eyes,0,88-8+x,y+208);

    }

    if line > 11{

        draw_set_color(make_color_rgb(0,255,255))

        draw_text(128+x,y+208,string_hash_to_newline("-BRUTE"))

        if line > 12{draw_text(128+x,y+208,string_hash_to_newline("           \"FREUD\""))}

    }

    if line > 13{

        draw_sprite_ext(spr_OttoMon,0,88-8+x,y+256,1,1,0,make_color_rgb(255,184,82),1);

        draw_sprite_ext(spr_OttoMon,8,88-8+x,y+256,1,1,0,c_white,1);

        draw_sprite(spr_Eyes,0,88-8+x,y+256);

    }

    if line > 15{

        draw_set_color(make_color_rgb(255,184,82))

        draw_text(128+x,y+256,string_hash_to_newline("-SAM"))

        if line > 16{draw_text(128+x,y+256,string_hash_to_newline("           \"NEWTON\""))}

    }

    if line > 18{

        draw_sprite_ext(spr_dot,0,176+x,y+384,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)

        if line > 22{if floor(im2) = 0{draw_sprite_ext(spr_powerpellet,0,176+x,y+416,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}}

        else{draw_sprite_ext(spr_powerpellet,0,176+x,y+416,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}

        draw_set_color(c_white)

        draw_text(208+x,y+384,string_hash_to_newline("10 PTS"))

        draw_text(208+x,y+416,string_hash_to_newline("50 PTS"))

    }

    if line > 20{

        draw_set_halign(fa_center)

        draw_set_color(make_color_rgb(255,184,255))

        ///draw_text(224 + 16+x,y+416 + 32,"© 1980-2022 BANDAI")

        ///draw_text(224 + 16+x,y+448 + 32,"  NAMCO ENTERTAINMENT, INC. ")

        draw_set_color(make_color_rgb(255,0,0))

        draw_text(224 + 16+x,y+480 + 32,string_hash_to_newline("2024 SUPER BRETT SMITH"))

        if line > 22{

            if left < 72{}else{

                if floor(im2) = 0{draw_sprite_ext(spr_powerpellet,0,72-8+x,y+322,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}

            }

        }

        else{draw_sprite_ext(spr_powerpellet,0,72-8+x,y+322,1,1,0,make_color_rgb(255,183-(global.plus*9),174+(global.plus*73)),1)}

    }

    if line > 22{

        if left < 72{}else{

            draw_sprite(spr_OttoMan,8+floor(im),left+x-8,y-8+328)

            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,((1.102564103*left)+24.61538462)-8+x,y-8+328,1,1,0,c_white,1);

            draw_sprite_ext(spr_OttoMon,floor(im2)+4,((1.102564103*left)+24.61538462)-8+x,y-8+328,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+x-8,y-8+328)

            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,((1.102564103*left)+24.61538462)+32-8+x,y-8+328,1,1,0,c_white,1);

            draw_sprite_ext(spr_OttoMon,floor(im2)+4,((1.102564103*left)+24.61538462)+32-8+x,y-8+328,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+32+x-8,y-8+328)

            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,((1.102564103*left)+24.61538462)+64-8+x,y-8+328,1,1,0,c_white,1);

            draw_sprite_ext(spr_OttoMon,floor(im2)+4,((1.102564103*left)+24.61538462)+64-8+x,y-8+328,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+64+x-8,y-8+328)

            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,((1.102564103*left)+24.61538462)+96-8+x,y-8+328,1,1,0,c_white,1);

            draw_sprite_ext(spr_OttoMon,floor(im2)+4,((1.102564103*left)+24.61538462)+96-8+x,y-8+328,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,((1.102564103*left)+24.61538462)+96+x-8,y-8+328)

        }

        if left < 72{

            if right < right2{

            draw_sprite_ext(spr_OttoMon,floor(im2)+(global.plus*2)+16,right2-8+x,y-8+328,1,1,0,c_white,1);

            }

            if right < right2 + 32{

            draw_sprite_ext(spr_OttoMon,floor(im2)+(global.plus*2)+16,right2+32-8+x,y-8+328,1,1,0,c_white,1);

            }

            if right < right2 + 64{

            draw_sprite_ext(spr_OttoMon,floor(im2)+(global.plus*2)+16,right2+64-8+x,y-8+328,1,1,0,c_white,1);

            }

            if right < right2 + 96{

            draw_sprite_ext(spr_OttoMon,floor(im2)+(global.plus*2)+16,right2+96-8+x,y-8+328,1,1,0,c_white,1);

            }

            draw_sprite_ext(spr_OttoMan,floor(im),right+x-8,y-8+328,1,1,0,c_white,op)

            if global.plus = 0{

            if right = right2{draw_sprite_ext(spr_Chomp,0,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            if right = right2+32{draw_sprite_ext(spr_Chomp,1,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            if right = right2+64{draw_sprite_ext(spr_Chomp,2,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            if right = right2+96{draw_sprite_ext(spr_Chomp,3,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1);}

            }

            else{

            if right = right2{draw_sprite_ext(spr_Chomp,0,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            if right = right2+32{draw_sprite_ext(spr_Chomp,1,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            if right = right2+64{draw_sprite_ext(spr_Chomp,2,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            if right = right2+96{draw_sprite_ext(spr_Chomp,3,right-8+x-(8*(scale-1)),y-8+328-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1);}

            }

            }

        }

    }

}




if global.game = 2{

if global.plus = 0{

///copyright

draw_set_color(c_yellow);

draw_text(224 + 16+x,y+416 + 56,string_hash_to_newline(" © 1980, 1983-2024 BANDAI "))

draw_text(224 + 16+x,y+448 + 56,string_hash_to_newline(" NAMCO ENTERTAINMENT, INC."))

draw_text(224 + 16+x,y+480 + 56,string_hash_to_newline(" 2024 SUPER BRETT SMITH "))

draw_set_font(font0)

draw_set_halign(fa_left)

///Blinky

if intro = 1{

    if lefty = true{

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,posit-8+x,y-8+up)}

        else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(128+x,y+224,string_hash_to_newline("WITH BLINKY")); if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

    else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(128+x,y+224,string_hash_to_newline("WITH BLINKY")); 

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,0,posit-8+x,y-8+up)}

        else{if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

}

///Pinky

if intro = 2{

    if lefty = true{

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,2,posit-8+x,y-8+up)}

        else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(208+x,y+224,string_hash_to_newline("PINKY")); if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

    else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(208+x,y+224,string_hash_to_newline("PINKY"));

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,0,posit-8+x,y-8+up)}

        else{if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,255),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

}

///Inky

if intro = 3{

    if lefty = true{

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,2,posit-8+x,y-8+up)}

        else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(208+x,y+224,string_hash_to_newline(" INKY")); if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

    else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(208+x,y+224,string_hash_to_newline(" INKY"));

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,0,posit-8+x,y-8+up)}

        else{if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(0,255,255),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

}

///Tim

if intro = 4{

    if lefty = true{

        if posit>288{draw_sprite_ext(spr_Ghost,(floor(im2)),posit-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,posit-8+x,y-8+up)}

        else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(208+x,y+224,string_hash_to_newline(" TIM ")); if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

    else{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(208+x,y+224,string_hash_to_newline(" TIM "));

    if posit>288{draw_sprite_ext(spr_Ghost,0,288+scroll-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1); draw_sprite(spr_Eyes,1,288+scroll-8+x,y-8+up)}

        else{if posit>250.666666666666666666666667{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,288-8+x,y-8+up)}

            else{draw_sprite_ext(spr_Ghost,0,288-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,0,288-8+x,y-8+up)}

        }

    }

}

///background

draw_sprite(spr_bkgd,0,0+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,64+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,128+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,192+scroll-8+x,y-8+240);

draw_sprite(spr_bkgd,0,256+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,320+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,384+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,448+scroll-8+x,y-8+240);

draw_sprite(spr_bkgd,0,-64+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,-128+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,-192+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,-256+scroll-8+x,y-8+240);

draw_sprite(spr_bkgd,0,-320+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,-384+scroll-8+x,y-8+240);draw_sprite(spr_bkgd,0,-448+scroll-8+x,y-8+240);

if intro > 4{draw_sprite_ext(spr_Ghost,0,288+scroll-8+x,y-8+up,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,1,288+scroll-8+x,y-8+up)}

///stork; 64, 72, 80, 88, 96,

draw_sprite(spr_clouds,1,-112+scroll-8+x,y-8+64); 

if left>239{draw_sprite(spr_jr,0,left-8+x,y-8+falling-bounce)}; 

    else{if left>112{draw_sprite(spr_jr,0,240-8+x,y-8+336)};

        else{if left>96{draw_sprite(spr_jr,0,240+(bounce-4)-8+x,y-8+336-abs(bounce-4))}

            else{if left>88{draw_sprite(spr_jrintro,0,240-8+x,y-8+340)};

                else{if left>80{draw_sprite(spr_jrintro,1,240-8+x,y-8+340)};

                    else{if left>72{draw_sprite(spr_jrintro,2,240-8+x,y-8+340)};

                        else{draw_sprite(spr_jrintro,3,240-8+x,y-8+340)}; 

}}}}}

draw_sprite(spr_stork,floor(im2),left-8+x,y-8+128);

///house

draw_sprite(spr_house,0,16+scroll-392-8+x,y-8+328)

///family

if left>0{

draw_sprite(spr_Man,1,16+scroll-336-8+x,y-8+336);draw_sprite(spr_MsMan,1,16+scroll-280-8+x,y-8+336);}

else{

if left>-200{draw_sprite(spr_Man,floor(im4),16+scroll-336-8+x,y-8+336);draw_sprite(spr_MsMan,floor(im),16+scroll-280-8+x,y-8+336);}

else{draw_sprite(spr_Man,1,16+scroll-336-8+x,y-8+336);draw_sprite(spr_MsMan,1,16+scroll-280-8+x,y-8+336);}

}

///bushes

draw_sprite(spr_bush,1,300+scroll-8+x,y-8+320); draw_sprite(spr_bush,0,288+scroll-8+x,y-8+320);

draw_sprite(spr_bush,1,192+scroll-8+x,y-8+352);

draw_sprite(spr_bush,1,100+scroll-8+x,y-8+336); draw_sprite(spr_bush,0,128+scroll-8+x,y-8+336);

///river

draw_sprite(spr_river,image_index,448+scroll-8+x,y-8+400);

///clouds

draw_sprite(spr_clouds,0,160+scroll-8+x,y-8+64);draw_sprite(spr_clouds,2,432-16+scroll-8+x,y-8+96);draw_sprite(spr_clouds,3,-432+scroll-8+x,y-8+52);

}

}


}
}
draw_set_font(font0)

draw_set_halign(fa_left)

if global.credit = 0{

if global.game = 2{draw_set_color(c_yellow)};else{draw_set_color(c_white)}

draw_text(32,560,string_hash_to_newline("CREDIT 0"))

if global.rand = 1{draw_set_halign(fa_right); draw_set_color(c_aqua); draw_text(room_width-32,560,string_hash_to_newline("RANDOM MAZES"))}

}


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


exit

draw_set_font(font0)

draw_set_halign(fa_right)

draw_set_color(c_white)

if global.rand = 0{

if global.game = 0{

 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

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

}

if global.game = 1{

 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

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

}

if global.game = 2{

draw_set_color(c_yellow)

 {draw_text(80+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("1UP"))}

draw_text(96+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.p1score))

draw_text(288+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("HIGH SCORE"))

if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacscore))}

else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacplusscore))}

}

}

else{

if global.game = 0{

 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))

if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacrandscore))}

else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusrandscore))}

}

if global.game = 1{

 {draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))

if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacrandscore))}

else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusrandscore))}

}

if global.game = 2{

draw_set_color(c_yellow)

 {draw_text(80+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("1UP"))}

draw_text(96+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.p1score))

draw_text(288+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("HIGH SCORE"))

if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacrandscore))}

else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacplusrandscore))}

}

}


draw_set_font(font0)

if show = 1{   ///224,48

    if global.game = 0{

    draw_set_halign(fa_left)

    draw_set_color(c_white)

    draw_text(0,64,string_hash_to_newline("           PAC-MAN          "))

    draw_text(0,80,string_hash_to_newline("         HIGH SCORES        "))

    draw_set_color(c_yellow)

    draw_text(48,32+80+32,            string_hash_to_newline(" ORIGINAL "))

    draw_text(48,32+80+64,            string_hash_to_newline("HANGLY-MAN"))

    draw_text(48,32+80+96,            string_hash_to_newline("   BABY   "))

    draw_text(48,32+80+96+32,         string_hash_to_newline("  ULTRA   "))

    draw_text(48,32+80+96+64,         string_hash_to_newline("  ARRANGE "))

    draw_text(48,32+80+96+64+32,         string_hash_to_newline("  RANDOM  "))

    draw_text(224+32,32+80,              string_hash_to_newline("  NORMAL  "))

    draw_set_color(c_aqua)

    draw_text(48,32+80+32+48+96+64+16,   string_hash_to_newline(" ORIGINAL "))

    draw_text(48,32+80+64+48+96+64+16,   string_hash_to_newline("HANGLY-MAN"))

    draw_text(48,32+80+96+48+96+64+16,   string_hash_to_newline("   BABY   "))

    draw_text(48,32+80+96+32+48+96+64+16,string_hash_to_newline("  ULTRA   "))

    draw_text(48,32+80+96+64+48+96+64+16,string_hash_to_newline("  ARRANGE "))

    draw_text(48,32+80+96+64+48+96+64+32+16,string_hash_to_newline("  RANDOM  "))

    draw_text(224+32,32+80+96+96+16+16,     string_hash_to_newline("   PLUS   "))

    

    draw_set_halign(fa_right)

    draw_set_color(c_yellow)

    draw_text(224+96+32+32,32+80+32,string_hash_to_newline(global.pacscore))

    draw_text(224+96+32+32,32+80+64,string_hash_to_newline(global.hanglyscore))

    draw_text(224+96+32+32,32+80+96,string_hash_to_newline(global.newscore))

    draw_text(224+96+32+32,32+80+96+32,string_hash_to_newline(global.ultrascore))

    draw_text(224+96+32+32,32+80+96+64,string_hash_to_newline(global.arrscore))

    draw_text(224+96+32+32,32+80+96+64+32,string_hash_to_newline(global.pacrandscore))

    draw_set_color(c_aqua)

    draw_text(224+96+32+32,32+80+32+48+96+64+16,string_hash_to_newline(global.pacplusscore))

    draw_text(224+96+32+32,32+80+64+48+96+64+16,string_hash_to_newline(global.hanglyplusscore))

    draw_text(224+96+32+32,32+80+96+48+96+64+16,string_hash_to_newline(global.newplusscore))

    draw_text(224+96+32+32,32+80+96+32+48+96+64+16,string_hash_to_newline(global.ultraplusscore))

    draw_text(224+96+32+32,32+80+96+64+48+96+64+16,string_hash_to_newline(global.arrplusscore))

    draw_text(224+96+32+32,32+80+96+64+48+96+64+32+16,string_hash_to_newline(global.pacplusrandscore))

    }

    if global.game = 1{

    draw_set_halign(fa_left)

    draw_set_color(c_white)

    draw_text(0,64,string_hash_to_newline("         MS. PAC-MAN        "))

    draw_text(0,80,string_hash_to_newline("         HIGH SCORES        "))

    draw_set_color(c_yellow)

    draw_text(48,32+80+32,            string_hash_to_newline(" ORIGINAL "))

    draw_text(48,32+80+64,            string_hash_to_newline(" MS. PMP  "))

    draw_text(48,32+80+96,            string_hash_to_newline(" PAC-JR.  "))

    draw_text(48,32+80+96+32,         string_hash_to_newline(" STRANGE  "))

    draw_text(48,32+80+96+64,         string_hash_to_newline("  CHAMP   "))

    draw_text(48,32+80+96+64+32,         string_hash_to_newline("  RANDOM  "))

    draw_text(224+32,32+80,              string_hash_to_newline("  NORMAL  "))

    draw_set_color(c_aqua)

    draw_text(48,32+80+32+48+96+64+16,   string_hash_to_newline(" ORIGINAL "))

    draw_text(48,32+80+64+48+96+64+16,   string_hash_to_newline(" MS. PMP  "))

    draw_text(48,32+80+96+48+96+64+16,   string_hash_to_newline(" PAC-JR.  "))

    draw_text(48,32+80+96+32+48+96+64+16,string_hash_to_newline(" STRANGE  "))

    draw_text(48,32+80+96+64+48+96+64+16,string_hash_to_newline("  CHAMP   "))

    draw_text(48,32+80+96+64+48+96+64+32+16,string_hash_to_newline("  RANDOM  "))

    draw_text(224+32,32+80+96+96+16+16,     string_hash_to_newline("   PLUS   "))

    

    draw_set_halign(fa_right)

    draw_set_color(c_yellow)

    draw_text(224+96+32+32,32+80+32,string_hash_to_newline(global.mspacscore))

    draw_text(224+96+32+32,32+80+64,string_hash_to_newline(global.mspmpscore))

    draw_text(224+96+32+32,32+80+96,string_hash_to_newline(global.pacjrscore))

    draw_text(224+96+32+32,32+80+96+32,string_hash_to_newline(global.strangescore))

    draw_text(224+96+32+32,32+80+96+64,string_hash_to_newline(global.champscore))

    draw_text(224+96+32+32,32+80+96+64+32,string_hash_to_newline(global.mspacrandscore))

    draw_set_color(c_aqua)

    draw_text(224+96+32+32,32+80+32+48+96+64+16,string_hash_to_newline(global.mspacplusscore))

    draw_text(224+96+32+32,32+80+64+48+96+64+16,string_hash_to_newline(global.mspmpplusscore))

    draw_text(224+96+32+32,32+80+96+48+96+64+16,string_hash_to_newline(global.pacjrplusscore))

    draw_text(224+96+32+32,32+80+96+32+48+96+64+16,string_hash_to_newline(global.strangeplusscore))

    draw_text(224+96+32+32,32+80+96+64+48+96+64+16,string_hash_to_newline(global.champplusscore))

    draw_text(224+96+32+32,32+80+96+64+48+96+64+32+16,string_hash_to_newline(global.mspacplusrandscore))

    }

    if global.game = 2{

    draw_set_halign(fa_left)

    draw_set_color(c_white)

    draw_text(0,64,string_hash_to_newline("         JR. PAC-MAN        "))

    draw_text(0,80,string_hash_to_newline("         HIGH SCORES        "))

    draw_set_color(c_yellow)

    draw_text(48,32+80+32,            string_hash_to_newline(" ORIGINAL "))

    draw_text(48,32+80+64,            string_hash_to_newline("  VERSUS  "))

    draw_text(48,32+80+96,            string_hash_to_newline("   C64    "))

    draw_text(48,32+80+96+32,         string_hash_to_newline("  A2600   "))

    draw_text(48,32+80+96+64,         string_hash_to_newline("  TUNNEL  "))

    draw_text(48,32+80+96+64+32,         string_hash_to_newline("  RANDOM  "))

    draw_text(224+32,32+80,              string_hash_to_newline("  NORMAL  "))

    draw_set_color(c_aqua)

    draw_text(48,32+80+32+48+96+64+16,   string_hash_to_newline(" ORIGINAL "))

    draw_text(48,32+80+64+48+96+64+16,   string_hash_to_newline("  VERSUS  "))

    draw_text(48,32+80+96+48+96+64+16,   string_hash_to_newline("   C64 "))

    draw_text(48,32+80+96+32+48+96+64+16,string_hash_to_newline("  A2600   "))

    draw_text(48,32+80+96+64+48+96+64+16,string_hash_to_newline("  TUNNEL  "))

    draw_text(48,32+80+96+64+48+96+64+32+16,string_hash_to_newline("  RANDOM  "))

    draw_text(224+32,32+80+96+96+16+16,     string_hash_to_newline("   PLUS   "))

    

    draw_set_halign(fa_right)

    draw_set_color(c_yellow)

    draw_text(224+96+32+32,32+80+32,string_hash_to_newline(global.jrpacscore))

    draw_text(224+96+32+32,32+80+64,string_hash_to_newline(global.extendedscore))

    draw_text(224+96+32+32,32+80+96,string_hash_to_newline(global.c64score))

    draw_text(224+96+32+32,32+80+96+32,string_hash_to_newline(global.a2600score))

    draw_text(224+96+32+32,32+80+96+64,string_hash_to_newline(global.bleachscore))

    draw_text(224+96+32+32,32+80+96+64+32,string_hash_to_newline(global.jrpacrandscore))

    draw_set_color(c_aqua)

    draw_text(224+96+32+32,32+80+32+48+96+64+16,string_hash_to_newline(global.jrpacplusscore))

    draw_text(224+96+32+32,32+80+64+48+96+64+16,string_hash_to_newline(global.extendedplusscore))

    draw_text(224+96+32+32,32+80+96+48+96+64+16,string_hash_to_newline(global.c64plusscore))

    draw_text(224+96+32+32,32+80+96+32+48+96+64+16,string_hash_to_newline(global.a2600plusscore))

    draw_text(224+96+32+32,32+80+96+64+48+96+64+16,string_hash_to_newline(global.bleachplusscore))

    draw_text(224+96+32+32,32+80+96+64+48+96+64+32+16,string_hash_to_newline(global.jrpacplusrandscore))

    }

}


