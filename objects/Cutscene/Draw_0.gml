draw_set_font(font0)
draw_set_halign(fa_right)

var __b__;
__b__ = action_if_variable(scorey, 1, 0);
if __b__
{
{
if global.game = 0{
if global.lvl = 2{
    draw_sprite(spr_Man,8+floor(im),left-8+x,y-8+328)
    draw_sprite_ext(spr_Ghost,floor(im2),left2-8+x,y-8+328,1,1,0,make_color_rgb(255,0,0),1)
    draw_sprite(spr_Eyes,2,left2-8+x,y-8+328)
    draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),right-8+x,y-8+328,1,1,0,make_color_rgb(0,0,255),1)
    if global.plus = true{draw_sprite(spr_Ghost,(floor(im2))+4,right-8+x,y-8+328)}
    draw_sprite(spr_Eyes,4,right-8+x,y-8+328+(global.plus*3))
    draw_sprite_ext(spr_bigpac,floor(im),right2-16-8+x,y-8+328-16,1,1,0,c_yellow,1)
}
if global.lvl = 5{
    if left2 > 272{
    draw_sprite(spr_peg,0,272-8+x,y-8+328)
    draw_sprite_ext(spr_Ghost,floor(im2),left2-8+x,y-8+328,1,1,0,make_color_rgb(255,0,0),1)
    draw_sprite(spr_Eyes,2,left2-8+x,y-8+328)
    }
    else{
        if left2 = 240{}else{
            draw_sprite(spr_peg,1,272-8+x,y-8+328)
            draw_sprite(spr_Bpeg,floor(im2),left2-8+x,y-8+328)
        }
        if left2 = 240{
            draw_sprite(spr_peg,2,272-8+x,y-8+328)
            if left < -368{draw_sprite(spr_Bpeg,3,left2-8+x,y-8+328)}
            else{draw_sprite(spr_Bpeg,2,left2-8+x,y-8+328)}
        }
    }
    draw_sprite(spr_Man,8+floor(im),left-8+x,y-8+328)
}
if global.lvl > 5{
    draw_sprite(spr_Man,8+floor(im),left-8+x,y-8+328)
    draw_sprite(spr_Bstitch,floor(im2),left2-8+x,y-8+328)
    draw_sprite(spr_Bexposed,floor(im2),right2-8+x,y-8+328)
}
}

if global.otto = 0{
if global.game = 1{
if clapperboard > 0{draw_sprite(spr_clapperboard,clap,104+x-8,y-8+168); 
    if global.lvl = 2{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("1")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THEY MEET"))}}
    if global.lvl = 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("2")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THE CHASE"))}}
    if global.lvl > 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("3")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("JUNIOR   "))}}
    }
if global.lvl = 2{
    draw_sprite(spr_Man,floor(im),right+x-8,y-8+200); draw_sprite(spr_MsMan,8+floor(im),left+x-8,y-8+376)
    draw_sprite_ext(spr_Ghost,floor(im2),right2+x-8,y-8+200,1,1,0,make_color_rgb(0,255,255),1);draw_sprite_ext(spr_Ghost,floor(im2),left2+x-8,y-8+376,1,1,0,make_color_rgb(255,184,255),1);
    draw_sprite(spr_Eyes,0,right2+x-8,y-8+200); draw_sprite(spr_Eyes,2,left2+x-8,y-8+376)
    if right3<224{draw_sprite(spr_Man,8+floor(im),left3+x-8,y-8+280); draw_sprite(spr_MsMan,floor(im),right3+x-8,y-8+280)}
    else{
        if up>184{draw_sprite(spr_MsMan,4+floor(im),224+x-8,y-8+up);draw_sprite(spr_Man,4+floor(im),256+x-8,y-8+up)}
        else{draw_sprite(spr_MsMan,1,224+x-8,y-8+184);draw_sprite(spr_Man,8+1,256+x-8,y-8+184);draw_sprite(spr_heart,0,240+x-8,y-8+152)}
    }
    if up>184{
        if right4<224{
            draw_sprite_ext(spr_Ghost,floor(im2),right4+x-8,y-8+280,1,1,0,make_color_rgb(255,184,255),1);draw_sprite_ext(spr_Ghost,floor(im2),left4+x-8,y-8+280,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite(spr_Eyes,0,right4+x-8,y-8+280); draw_sprite(spr_Eyes,2,left4+x-8,y-8+280)
        }
        else{
            draw_sprite_ext(spr_Ghost,floor(im2),bump+x-8,y-8+280-bounce,1,1,0,make_color_rgb(255,184,255),1);draw_sprite_ext(spr_Ghost,floor(im2),bump2+x-8,y-8+280-bounce,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite(spr_Eyes,0,bump+x-8,y-8+280-bounce); draw_sprite(spr_Eyes,2,bump2+x-8,y-8+280-bounce)
        }
    }
}
if global.lvl = 5{
    draw_sprite(spr_Man,floor(im),right+x-8,y-8+136); draw_sprite(spr_MsMan,floor(im),right2+x-8,y-8+136)
    draw_sprite(spr_MsMan,8+floor(im),left+x-8,y-8+328); draw_sprite(spr_Man,8+floor(im),left2+x-8,y-8+328)
    draw_sprite(spr_Man,floor(im),right3+x-8,y-8+280); draw_sprite(spr_MsMan,floor(im),right4+x-8,y-8+280)
    draw_sprite(spr_MsMan,8+floor(im),left3+x-8,y-8+168); draw_sprite(spr_Man,8+floor(im),left4+x-8,y-8+168)
    draw_sprite(spr_Man,floor(im),right5+x-8,y-8+400); draw_sprite(spr_MsMan,floor(im),right6+x-8,y-8+400)
}
if global.lvl > 5{
    if clapperboard = 0{draw_sprite(spr_Man,1,72+x-8,y-8+424); draw_sprite(spr_MsMan,1,104+x-8,y-8+424)}
    if left>168{
        if falling<424{draw_sprite(spr_jr,0,left+x-8,y-8+falling)}
        else{draw_sprite(spr_jr,0,left+x-8,y-8+424-bounce)}
    }
    else{draw_sprite(spr_jr,1,168+x-8,y-8+424)}
    if left>312{
        draw_sprite(spr_stork,floor(im2),left+x-8,y-8+200)
    }
    else{
        draw_sprite(spr_stork,floor(im2),left2+x-8,y-8+200)
    }
}
}
}

if global.otto = 1{
if global.game = 1{
if clapperboard > 0{draw_sprite(spr_clapperboard,clap,104+x-8,y-8+168); 
    if global.lvl = 2{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("1")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THEY MEET"))}}
    if global.lvl = 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("2")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THE CHASE"))}}
    if global.lvl > 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("3")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("JUNIOR   "))}}
    }
if global.lvl = 2{
    draw_sprite(spr_OttoMan,floor(im),right+x-8,y-8+200); draw_sprite(spr_Anna,8+floor(im),left+x-8,y-8+376)
    draw_sprite_ext(spr_OttoMon,floor(im2),right2+x-8,y-8+200,1,1,0,make_color_rgb(0,255,255),1);
    draw_sprite_ext(spr_OttoMon,floor(im2)+4,left2+x-8,y-8+376,1,1,0,make_color_rgb(255,184,255),1);
    draw_sprite_ext(spr_OttoMon,floor(im2)+8,right2+x-8,y-8+200,1,1,0,c_white,1);
    draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,left2+x-8,y-8+376,1,1,0,c_white,1);
    draw_sprite(spr_Eyes,0,right2+x-8,y-8+200); draw_sprite(spr_Eyes,2,left2+x-8,y-8+376)
    if right3<224{draw_sprite(spr_OttoMan,8+floor(im),left3+x-8,y-8+280); draw_sprite(spr_Anna,floor(im),right3+x-8,y-8+280)}
    else{
        if up>184{draw_sprite(spr_Anna,4+floor(im),224+x-8,y-8+up);draw_sprite(spr_OttoMan,4+floor(im),256+x-8,y-8+up)}
        else{draw_sprite(spr_Anna,0,224+x-8,y-8+184);draw_sprite(spr_OttoMan,8,256+x-8,y-8+184);draw_sprite(spr_heart,0,240+x-8,y-8+152)}
    }
    if up>184{
        if right4<224{
            draw_sprite_ext(spr_OttoMon,floor(im2),right4+x-8,y-8+280,1,1,0,make_color_rgb(255,184,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4,left4+x-8,y-8+280,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+8,right4+x-8,y-8+280,1,1,0,c_white,1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,left4+x-8,y-8+280,1,1,0,c_white,1);
            draw_sprite(spr_Eyes,0,right4+x-8,y-8+280); draw_sprite(spr_Eyes,2,left4+x-8,y-8+280)
        }
        else{
            draw_sprite_ext(spr_OttoMon,floor(im2),bump+x-8,y-8+280-bounce,1,1,0,make_color_rgb(255,184,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4,bump2+x-8,y-8+280-bounce,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+8,bump+x-8,y-8+280-bounce,1,1,0,c_white,1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,bump2+x-8,y-8+280-bounce,1,1,0,c_white,1);
            draw_sprite(spr_Eyes,0,bump+x-8,y-8+280-bounce); draw_sprite(spr_Eyes,2,bump2+x-8,y-8+280-bounce)
        }
    }
}
if global.lvl = 5{
    draw_sprite(spr_OttoMan,floor(im),right+x-8,y-8+136); draw_sprite(spr_Anna,floor(im),right2+x-8,y-8+136)
    draw_sprite(spr_Anna,8+floor(im),left+x-8,y-8+328); draw_sprite(spr_OttoMan,8+floor(im),left2+x-8,y-8+328)
    draw_sprite(spr_OttoMan,floor(im),right3+x-8,y-8+280); draw_sprite(spr_Anna,floor(im),right4+x-8,y-8+280)
    draw_sprite(spr_Anna,8+floor(im),left3+x-8,y-8+168); draw_sprite(spr_OttoMan,8+floor(im),left4+x-8,y-8+168)
    draw_sprite(spr_OttoMan,floor(im),right5+x-8,y-8+400); draw_sprite(spr_Anna,floor(im),right6+x-8,y-8+400)
}
if global.lvl > 5{
    if clapperboard = 0{draw_sprite(spr_OttoMan,0,72+x-8,y-8+424); draw_sprite(spr_Anna,0,104+x-8,y-8+424)}
    if left>168{
        if falling<424{draw_sprite(spr_jr,0,left+x-8,y-8+falling)}
        else{draw_sprite(spr_jr,0,left+x-8,y-8+424-bounce)}
    }
    else{draw_sprite(spr_jr,2,168+x-8,y-8+424)}
    if left>312{
        draw_sprite(spr_stork,floor(im2),left+x-8,y-8+200)
    }
    else{
        draw_sprite(spr_stork,floor(im2),left2+x-8,y-8+200)
    }
}
}
}

if global.game = 2{
if global.lvl = 1{ ///FIRST CUTSCENE
if jrpacstate = 0 and jrpacx < 48{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(360+x,352+y,string_hash_to_newline("JR MEETS YUM-YUM"));}
///background
draw_sprite(spr_bkgd,0,0-8+x,y-8+64);draw_sprite(spr_bkgd,0,64-8+x,y-8+64);draw_sprite(spr_bkgd,0,128-8+x,y-8+64);draw_sprite(spr_bkgd,0,192-8+x,y-8+64);
draw_sprite(spr_bkgd,0,256-8+x,y-8+64);draw_sprite(spr_bkgd,0,320-8+x,y-8+64);draw_sprite(spr_bkgd,0,384-8+x,y-8+64);draw_sprite(spr_bkgd,0,448-8+x,y-8+64);
///dots
draw_sprite(spr_dot,1&2,456-8+x,y-8+152);draw_sprite(spr_middot,0,456-8+x,y-8+136);draw_sprite(spr_dot,1&2,456-8+x,y-8+120);
if floor(im2)=0{draw_sprite(spr_powerpellet,1,440-8+x,y-8+152)}; draw_sprite(spr_dot,1&2,440-8+x,y-8+136); draw_sprite(spr_middot,0,440-8+x,y-8+120);
draw_sprite(spr_middot,0,424-8+x,y-8+152);draw_sprite(spr_dot,1&2,424-8+x,y-8+136);draw_sprite(spr_middot,0,424-8+x,y-8+120);
draw_sprite(spr_dot,1&2,408-8+x,y-8+152);if floor(im2)=1{draw_sprite(spr_powerpellet,1,408-8+x,y-8+136)};draw_sprite(spr_dot,1&2,408-8+x,y-8+120)
draw_sprite(spr_dot,1&2,392-8+x,y-8+152);draw_sprite(spr_middot,0,392-8+x,y-8+136);
if floor(im2)=0{if blue=false{draw_sprite(spr_powerpellet,1,376-8+x,y-8+152);}}
///Ms. Pac-Man
if mspacstate < 2{
    if mspacx = 56{draw_sprite(spr_MsMan,1,mspacx-8+x,y-8+mspacy)}
    else{draw_sprite(spr_MsMan,floor(im),mspacx-8+x,y-8+mspacy)}
}
else{draw_sprite(spr_MsMan,floor(im)+8,mspacx-8+x,y-8+mspacy)}
///Jr. Pac-Man (behind house)
if jrpacstate = 0{draw_sprite(spr_JrMan,floor(im),jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 8{draw_sprite(spr_JrMan,floor(im)+8,jrpacx-8+x,y-8+jrpacy)}
///house
draw_sprite(spr_house,0,96+16-8+x,y-8+152)
///Jr. Pac-Man (in front of house)
if jrpacstate = 1 or jrpacstate = 2{draw_sprite(spr_JrMan,floor(im)+8,jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 3 and jrpacx < 208{draw_sprite(spr_JrMan,floor(im),jrpacx-8+x,y-8+jrpacy)}
///bushes and fence
draw_sprite(spr_bush,0,16-8+x,y-8+304);draw_sprite(spr_bush,0,112-8+x,y-8+304);
draw_sprite(spr_fence,0,0-8+x,y-8+304);draw_sprite(spr_fence,0,32-8+x,y-8+304);draw_sprite(spr_fence,0,64-8+x,y-8+304);draw_sprite(spr_fence,0,96-8+x,y-8+304);
draw_sprite(spr_fence,0,128-8+x,y-8+304);draw_sprite(spr_fence,1,160-8+x,y-8+304);
if jrpacstate = 7{draw_sprite(spr_JrMan,floor(im),jrpacx-8+x,y-8+jrpacy)}
draw_sprite(spr_bush,0,240-8+x,y-8+304);draw_sprite(spr_bush,0,272-8+x,y-8+304);draw_sprite(spr_bush,1,420-8+x,y-8+304);draw_sprite(spr_bush,0,432-8+x,y-8+304);
draw_sprite(spr_fence,0,224-8+x,y-8+304);draw_sprite(spr_fence,0,256-8+x,y-8+304);draw_sprite(spr_fence,0,288-8+x,y-8+304);draw_sprite(spr_fence,0,320-8+x,y-8+304);
draw_sprite(spr_fence,0,352-8+x,y-8+304);draw_sprite(spr_fence,0,384-8+x,y-8+304);draw_sprite(spr_fence,0,416-8+x,y-8+304);draw_sprite(spr_fence,0,448-8+x,y-8+304);
///Jr. Pac-Man (in front of fence)
if jrpacstate = 3 and jrpacx = 208{draw_sprite(spr_JrMan,floor(im),jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 4 or jrpacstate = 6{draw_sprite(spr_JrMan,floor(im)+8,jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 5{
    if blinkygo = false{draw_sprite(spr_JrMan,floor(im)+8,jrpacx-8+x,y-8+jrpacy - bounce)}
    else{draw_sprite(spr_JrMan,floor(im),jrpacx-8+x,y-8+jrpacy)}}
///Yum-Yum ///80
if global.plus = true and blue = true{draw_sprite(spr_Ghost,(floor(im2))+4,yumyumx-8+x,y-8+yumyumy)};
if blue = false{
draw_sprite_ext(spr_Ghost,floor(im2)+6,yumyumx-8+x,y-8+yumyumy,1,1,0,c_red,1)
if yumyumx < 96{
    draw_sprite(spr_Eyes,0,yumyumx-8+x,y-8+yumyumy+6)}
else{
    if yumyumsprite = 0{draw_sprite(spr_Eyes,1,yumyumx-8+x,y-8+yumyumy+6)}
    else{draw_sprite(spr_Eyes,0,yumyumx-8+x,y-8+yumyumy+6)
    }
}
///Blinky
if blinkygo = false{
    draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1)
    if blinkyx < 240{draw_sprite(spr_Eyes,0,blinkyx-8+x,y-8+blinkyy)}
    else{if blinkyx < 272{draw_sprite(spr_Eyes,1,blinkyx-8+x,y-8+blinkyy)}
    else{draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy)}
}}
else{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy)}
}
else{draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(0,0,255),1);if global.plus = true{draw_sprite(spr_Ghost,(floor(im2))+4,blinkyx-8+x,y-8+blinkyy)};draw_sprite(spr_Eyes,4,blinkyx-8+x,y-8+blinkyy+(global.plus*3));
draw_sprite_ext(spr_Ghost,floor(im2)+6+(global.plus*2),yumyumx-8+x,y-8+yumyumy,1,1,0,c_blue,1);draw_sprite(spr_Eyes,4,yumyumx-8+x,y-8+yumyumy+4);
}
draw_sprite(spr_Ghost,floor(im2)+10,yumyumx-8+x,y-8+yumyumy);
///mud
draw_sprite(spr_mud,0,0-8+x,y-8+544)
}
if global.lvl = 3{ ///SECOND CUTSCENE
if jrpacstate < 2 and jrpacx < 120{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(-160+scroll+x,256+y,string_hash_to_newline("THE GIFT"));}
///background
draw_sprite(spr_bkgd,0,0+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,64+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,128+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,192+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,256+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,320+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,384+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,448+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,-64+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-128+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-192+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-256+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,-320+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-384+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-448+scroll-8+x,y-8+336);
///Blinky
if jrpacstate < 5{draw_sprite_ext(spr_Ghost,0,blinkyx+scroll-8+x,y-8+400,1,1,0,make_color_rgb(255,0,0),1)}
if jrpacstate = 5{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx+scroll-8+x,y-8+400,1,1,0,make_color_rgb(255,0,0),1)}
if jrpacstate = 3{draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+400);}
if jrpacstate = 4{draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+400);}
if jrpacstate = 5{draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+400);}
///bushes
draw_sprite(spr_bush,1,128+scroll-8+x,y-8+416);draw_sprite(spr_bush,0,160+scroll-8+x,y-8+416);
draw_sprite(spr_bush,1,320+scroll-8+x,y-8+400);draw_sprite(spr_bush,0,304+scroll-8+x,y-8+400);
///clouds
draw_sprite(spr_clouds,0,192+scroll-8+x,y-8+64);
draw_sprite(spr_clouds,1,-272+scroll-8+x,y-8+64); 
///balloon
if jrpacstate<4{draw_sprite(spr_balloon,image_index,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate>3{draw_sprite(spr_balloon,image_index,balloonx-8+x,y-8+jrpacy-bounce);}
///Jr. Pac-Man
if jrpacstate = 1{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 2{draw_sprite(spr_JrMan,8+sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and scroll > 0{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);} 
if jrpacstate = 3 and scroll < 0{draw_sprite(spr_JrMan,1,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 4{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 5{draw_sprite(spr_JrMan,1,jrpacx-8+x,y-8+jrpacy-bounce);}
///house
draw_sprite(spr_house,0,scroll-392+16-8+x,y-8+424);
///Yum-Yum
if jrpacstate = 4{draw_sprite_ext(spr_Ghost,floor(im2)+6,256+scroll-8+x,y-8+464,1,1,0,c_red,1);draw_sprite(spr_Ghost,floor(im2)+10,256+scroll-8+x,y-8+464);}
if jrpacstate = 3{draw_sprite_ext(spr_Ghost,6,256+scroll-8+x,y-8+464,1,1,0,c_red,1);draw_sprite(spr_Ghost,10,256+scroll-8+x,y-8+464);}
if jrpacstate = 5{draw_sprite_ext(spr_Ghost,6,256+scroll-8+x,y-8+464,1,1,0,c_red,1);draw_sprite(spr_Ghost,10,256+scroll-8+x,y-8+464);}
if jrpacstate > 2{draw_sprite(spr_Eyes,2,256+scroll-8+x,y-8+464+6)}
///river
draw_sprite(spr_river,image_index,240+scroll-8+x,y-8+464)
}
if global.lvl > 3{ ///THIRD CUTSCENE
if vis = true{
if jrpacstate > 3 and rep < 2{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(336+x,490+y,string_hash_to_newline("THEY ESCAPE "));
draw_sprite_ext(spr_Exc,0,336+x-16,490+y,1,1,0,c_yellow,1)
}
///background
draw_sprite(spr_bkgd,0,0+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,64+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,128+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,192+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,256+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,320+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,384+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,448+scroll-8+x,y-8+336);
///Ms. Pac-Man
if chase = false{draw_sprite(spr_MsMan,sprspeed,mspacx+scroll-8+x,y-8+480);}
else{if blinkyx > 152{draw_sprite(spr_MsMan,sprspeed,mspacx+scroll-8+x,y-8+480);}
if blinkyx < 153{draw_sprite(spr_MsMan,8+sprspeed,mspacx+scroll-8+x,y-8+480);}
}
///Blinky
if jrpacstate = 1{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy);}
if jrpacstate = 2{
if blinkyx > 96{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy);}
else{if blinkyy < 480{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,3,blinkyx-8+x,y-8+blinkyy);}
if blinkyy = 480{draw_sprite_ext(spr_Ghost,0,blinkyx+bounce-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,0,blinkyx+bounce-8+x,y-8+blinkyy);}
}}
if jrpacstate = 3{
if blinkyx = 96 and chase = false{
draw_sprite_ext(spr_Ghost,0,blinkyx+scroll-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,0,blinkyx+scroll-8+x,y-8+blinkyy);}
if blinkyx > 96{
if chase = false{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx+scroll-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,0,blinkyx+scroll-8+x,y-8+blinkyy);}
if chase = true{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx+scroll-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,0,0),1);draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+blinkyy);}
}
}
///bushes
draw_sprite(spr_bush,1,128+scroll-8+x,y-8+416);draw_sprite(spr_bush,0,160+scroll-8+x,y-8+416);
draw_sprite(spr_bush,1,320+scroll-8+x,y-8+400);draw_sprite(spr_bush,0,304+scroll-8+x,y-8+400);
///balloon
if balloony > 132{draw_sprite(spr_balloon,image_index,256+scroll-8+x,y-8+balloony);}
///cloud
draw_sprite(spr_clouds,0,192+scroll-8+x,y-8+64);
///Jr. Pac-Man
if jrpacstate = 0{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 1{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 2 and blinkyx > 96{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 2 and blinkyx = 96{draw_sprite(spr_JrMan, 8+sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and mspacx > 32 and chase = false{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and mspacx < 32 and chase = false{draw_sprite(spr_JrMan,8+sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and chase = true{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 4{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 5 and rep < 4{draw_sprite(spr_JrMan,1,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 5 and rep = 4{draw_sprite(spr_JrMan,sprspeed,jrpacx-8+x,y-8+jrpacy);}
///Yum-Yum
if jrpacstate < 3{draw_sprite_ext(spr_Ghost,floor(im2)+6,256-8+x,y-8+464,1,1,0,c_red,1);draw_sprite(spr_Ghost,floor(im2)+10,256-8+x,y-8+464)}
else{draw_sprite_ext(spr_Ghost,floor(im2)+6,256-8+x,y-8+yumyumy,1,1,0,c_red,1);draw_sprite(spr_Ghost,floor(im2)+10,256-8+x,y-8+yumyumy)}
if jrpacstate = 0{draw_sprite(spr_Eyes,2,256-8+x,y-8+464+6)}
if jrpacstate = 1 and blinkyx > 176{draw_sprite(spr_Eyes,2,256-8+x,y-8+464+6)}///left
if jrpacstate = 1 and blinkyx < 177{draw_sprite(spr_Eyes,1,256-8+x,y-8+464+6)}///up
if jrpacstate = 2 and blinkyx > 96{draw_sprite(spr_Eyes,1,256-8+x,y-8+464+6)}///up
if jrpacstate = 2 and blinkyx = 96{draw_sprite(spr_Eyes,2,256-8+x,y-8+464+6)}///left
if jrpacstate = 3 and mspacx > 32 and chase = false{draw_sprite(spr_Eyes,0,256-8+x,y-8+yumyumy+6)}///right
if jrpacstate = 3 and mspacx < 32 and chase = false{draw_sprite(spr_Eyes,2,256-8+x,y-8+yumyumy+6);}///left
if jrpacstate = 3 and chase = true{draw_sprite(spr_Eyes,0,256-8+x,y-8+yumyumy+6)}///right
if jrpacstate = 4{draw_sprite(spr_Eyes,1,256-8+x,y-8+yumyumy+6);}///up
if jrpacstate = 5 and rep < 4{draw_sprite(spr_Eyes,2,256-8+x,y-8+yumyumy+6);}///left
if jrpacstate = 5 and rep = 4{draw_sprite(spr_Eyes,2,256-8+x,y-8+yumyumy+6);}///left
///river
draw_sprite(spr_river,image_index,240+scroll-8+x,y-8+464)
///hearts
if jrpacstate = 5{
draw_sprite(spr_heart2,hsprspeed,heart1x-8+x,y-8+176);
draw_sprite(spr_heart2,hsprspeed+3,160-8+x,y-8+heart2y);
draw_sprite(spr_heart2,hsprspeed+6,heart3x-8+x,y-8+336);
draw_sprite(spr_heart2,hsprspeed+9,320-8+x,y-8+heart4y);
}
}
}
}

}
}
__b__ = action_if_variable(scorey, 2, 0);
if __b__
{
{
if global.game = 0{
if global.lvl = 2{
    draw_sprite(spr_Man2,8+floor(im),left-8+x,y-8+328)
    draw_sprite_ext(spr_Ghost,floor(im2),left2-8+x,y-8+328,1,1,0,make_color_rgb(255,0,0),1)
    draw_sprite(spr_Eyes,2,left2-8+x,y-8+328)
    draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),right-8+x,y-8+328,1,1,0,make_color_rgb(0,0,255),1)
    if global.plus = true{draw_sprite(spr_Ghost,(floor(im2))+4,right-8+x,y-8+328)}
    draw_sprite(spr_Eyes,4,right-8+x,y-8+328+(global.plus*3))
    draw_sprite_ext(spr_bigpac,floor(im),right2-16-8+x,y-8+328-16,1,1,0,c_lime,1)
}
if global.lvl = 5{
    if left2 > 272{
    draw_sprite(spr_peg,0,272-8+x,y-8+328)
    draw_sprite_ext(spr_Ghost,floor(im2),left2-8+x,y-8+328,1,1,0,make_color_rgb(255,0,0),1)
    draw_sprite(spr_Eyes,2,left2-8+x,y-8+328)
    }
    else{
        if left2 = 240{}else{
            draw_sprite(spr_peg,1,272-8+x,y-8+328)
            draw_sprite(spr_Bpeg,floor(im2),left2-8+x,y-8+328)
        }
        if left2 = 240{
            draw_sprite(spr_peg,2,272-8+x,y-8+328)
            if left < -368{draw_sprite(spr_Bpeg,3,left2-8+x,y-8+328)}
            else{draw_sprite(spr_Bpeg,2,left2-8+x,y-8+328)}
        }
    }
    draw_sprite(spr_Man2,8+floor(im),left-8+x,y-8+328)
}
if global.lvl > 5{
    draw_sprite(spr_Man2,8+floor(im),left-8+x,y-8+328)
    draw_sprite(spr_Bstitch,floor(im2),left2-8+x,y-8+328)
    draw_sprite(spr_Bexposed,floor(im2),right2-8+x,y-8+328)
}
}

if global.otto = 0{
if global.game = 1{
if clapperboard > 0{draw_sprite(spr_clapperboard,clap,104+x-8,y-8+168); 
    if global.lvl = 2{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("1")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THEY MEET"))}}
    if global.lvl = 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("2")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THE CHASE"))}}
    if global.lvl > 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("3")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("JUNIOR   "))}}
    }
if global.lvl = 2{
    draw_sprite(spr_Man2,floor(im),right+x-8,y-8+200); draw_sprite(spr_MsMan2,8+floor(im),left+x-8,y-8+376)
    draw_sprite_ext(spr_Ghost,floor(im2),right2+x-8,y-8+200,1,1,0,make_color_rgb(0,255,255),1);draw_sprite_ext(spr_Ghost,floor(im2),left2+x-8,y-8+376,1,1,0,make_color_rgb(255,184,255),1);
    draw_sprite(spr_Eyes,0,right2+x-8,y-8+200); draw_sprite(spr_Eyes,2,left2+x-8,y-8+376)
    if right3<224{draw_sprite(spr_Man2,8+floor(im),left3+x-8,y-8+280); draw_sprite(spr_MsMan2,floor(im),right3+x-8,y-8+280)}
    else{
        if up>184{draw_sprite(spr_MsMan2,4+floor(im),224+x-8,y-8+up);draw_sprite(spr_Man2,4+floor(im),256+x-8,y-8+up)}
        else{draw_sprite(spr_MsMan2,1,224+x-8,y-8+184);draw_sprite(spr_Man2,8+1,256+x-8,y-8+184);draw_sprite(spr_heart,0,240+x-8,y-8+152)}
    }
    if up>184{
        if right4<224{
            draw_sprite_ext(spr_Ghost,floor(im2),right4+x-8,y-8+280,1,1,0,make_color_rgb(255,184,255),1);draw_sprite_ext(spr_Ghost,floor(im2),left4+x-8,y-8+280,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite(spr_Eyes,0,right4+x-8,y-8+280); draw_sprite(spr_Eyes,2,left4+x-8,y-8+280)
        }
        else{
            draw_sprite_ext(spr_Ghost,floor(im2),bump+x-8,y-8+280-bounce,1,1,0,make_color_rgb(255,184,255),1);draw_sprite_ext(spr_Ghost,floor(im2),bump2+x-8,y-8+280-bounce,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite(spr_Eyes,0,bump+x-8,y-8+280-bounce); draw_sprite(spr_Eyes,2,bump2+x-8,y-8+280-bounce)
        }
    }
}
if global.lvl = 5{
    draw_sprite(spr_Man2,floor(im),right+x-8,y-8+136); draw_sprite(spr_MsMan2,floor(im),right2+x-8,y-8+136)
    draw_sprite(spr_MsMan2,8+floor(im),left+x-8,y-8+328); draw_sprite(spr_Man2,8+floor(im),left2+x-8,y-8+328)
    draw_sprite(spr_Man2,floor(im),right3+x-8,y-8+280); draw_sprite(spr_MsMan2,floor(im),right4+x-8,y-8+280)
    draw_sprite(spr_MsMan2,8+floor(im),left3+x-8,y-8+168); draw_sprite(spr_Man2,8+floor(im),left4+x-8,y-8+168)
    draw_sprite(spr_Man2,floor(im),right5+x-8,y-8+400); draw_sprite(spr_MsMan2,floor(im),right6+x-8,y-8+400)
}
if global.lvl > 5{
    if clapperboard = 0{draw_sprite(spr_Man2,1,72+x-8,y-8+424); draw_sprite(spr_MsMan2,1,104+x-8,y-8+424)}
    if left>168{
        if falling<424{draw_sprite(spr_jr,0,left+x-8,y-8+falling)}
        else{draw_sprite(spr_jr,0,left+x-8,y-8+424-bounce)}
    }
    else{draw_sprite(spr_jr,3,168+x-8,y-8+424)}
    if left>312{
        draw_sprite(spr_stork,floor(im2),left+x-8,y-8+200)
    }
    else{
        draw_sprite(spr_stork,floor(im2),left2+x-8,y-8+200)
    }
}
}
}

if global.otto = 1{
if global.game = 1{
if clapperboard > 0{draw_sprite(spr_clapperboard,clap,104+x-8,y-8+168); 
    if global.lvl = 2{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("1")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THEY MEET"))}}
    if global.lvl = 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("2")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("THE CHASE"))}}
    if global.lvl > 5{draw_set_font(font0); draw_set_color(c_white); draw_text(166+x,y+214,string_hash_to_newline("3")); if clap<6{draw_text(328+x,y+196,string_hash_to_newline("JUNIOR   "))}}
    }
if global.lvl = 2{
    draw_sprite(spr_OttoMan2,floor(im),right+x-8,y-8+200); draw_sprite(spr_Anna2,8+floor(im),left+x-8,y-8+376)
    draw_sprite_ext(spr_OttoMon,floor(im2),right2+x-8,y-8+200,1,1,0,make_color_rgb(0,255,255),1);
    draw_sprite_ext(spr_OttoMon,floor(im2)+4,left2+x-8,y-8+376,1,1,0,make_color_rgb(255,184,255),1);
    draw_sprite_ext(spr_OttoMon,floor(im2)+8,right2+x-8,y-8+200,1,1,0,c_white,1);
    draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,left2+x-8,y-8+376,1,1,0,c_white,1);
    draw_sprite(spr_Eyes,0,right2+x-8,y-8+200); draw_sprite(spr_Eyes,2,left2+x-8,y-8+376)
    if right3<224{draw_sprite(spr_OttoMan2,8+floor(im),left3+x-8,y-8+280); draw_sprite(spr_Anna2,floor(im),right3+x-8,y-8+280)}
    else{
        if up>184{draw_sprite(spr_Anna2,4+floor(im),224+x-8,y-8+up);draw_sprite(spr_OttoMan2,4+floor(im),256+x-8,y-8+up)}
        else{draw_sprite(spr_Anna2,0,224+x-8,y-8+184);draw_sprite(spr_OttoMan2,8,256+x-8,y-8+184);draw_sprite(spr_heart,0,240+x-8,y-8+152)}
    }
    if up>184{
        if right4<224{
            draw_sprite_ext(spr_OttoMon,floor(im2),right4+x-8,y-8+280,1,1,0,make_color_rgb(255,184,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4,left4+x-8,y-8+280,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+8,right4+x-8,y-8+280,1,1,0,c_white,1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,left4+x-8,y-8+280,1,1,0,c_white,1);
            draw_sprite(spr_Eyes,0,right4+x-8,y-8+280); draw_sprite(spr_Eyes,2,left4+x-8,y-8+280)
        }
        else{
            draw_sprite_ext(spr_OttoMon,floor(im2),bump+x-8,y-8+280-bounce,1,1,0,make_color_rgb(255,184,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4,bump2+x-8,y-8+280-bounce,1,1,0,make_color_rgb(0,255,255),1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+8,bump+x-8,y-8+280-bounce,1,1,0,c_white,1);
            draw_sprite_ext(spr_OttoMon,floor(im2)+4+8,bump2+x-8,y-8+280-bounce,1,1,0,c_white,1);
            draw_sprite(spr_Eyes,0,bump+x-8,y-8+280-bounce); draw_sprite(spr_Eyes,2,bump2+x-8,y-8+280-bounce)
        }
    }
}
if global.lvl = 5{
    draw_sprite(spr_OttoMan2,floor(im),right+x-8,y-8+136); draw_sprite(spr_Anna2,floor(im),right2+x-8,y-8+136)
    draw_sprite(spr_Anna2,8+floor(im),left+x-8,y-8+328); draw_sprite(spr_OttoMan2,8+floor(im),left2+x-8,y-8+328)
    draw_sprite(spr_OttoMan2,floor(im),right3+x-8,y-8+280); draw_sprite(spr_Anna2,floor(im),right4+x-8,y-8+280)
    draw_sprite(spr_Anna2,8+floor(im),left3+x-8,y-8+168); draw_sprite(spr_OttoMan2,8+floor(im),left4+x-8,y-8+168)
    draw_sprite(spr_OttoMan2,floor(im),right5+x-8,y-8+400); draw_sprite(spr_Anna2,floor(im),right6+x-8,y-8+400)
}
if global.lvl > 5{
    if clapperboard = 0{draw_sprite(spr_OttoMan2,0,72+x-8,y-8+424); draw_sprite(spr_Anna2,0,104+x-8,y-8+424)}
    if left>168{
        if falling<424{draw_sprite(spr_jr,0,left+x-8,y-8+falling)}
        else{draw_sprite(spr_jr,0,left+x-8,y-8+424-bounce)}
    }
    else{draw_sprite(spr_jr,4,168+x-8,y-8+424)}
    if left>312{
        draw_sprite(spr_stork,floor(im2),left+x-8,y-8+200)
    }
    else{
        draw_sprite(spr_stork,floor(im2),left2+x-8,y-8+200)
    }
}
}
}

if global.game = 2{
if global.lvl = 1{ ///FIRST CUTSCENE
if jrpacstate = 0 and jrpacx < 48{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(360+x,352+y,string_hash_to_newline("JR MEETS YUM-YUM"));}
///background
draw_sprite(spr_bkgd,0,0-8+x,y-8+64);draw_sprite(spr_bkgd,0,64-8+x,y-8+64);draw_sprite(spr_bkgd,0,128-8+x,y-8+64);draw_sprite(spr_bkgd,0,192-8+x,y-8+64);
draw_sprite(spr_bkgd,0,256-8+x,y-8+64);draw_sprite(spr_bkgd,0,320-8+x,y-8+64);draw_sprite(spr_bkgd,0,384-8+x,y-8+64);draw_sprite(spr_bkgd,0,448-8+x,y-8+64);
///dots
draw_sprite(spr_dot,1&2,456-8+x,y-8+152);draw_sprite(spr_middot,0,456-8+x,y-8+136);draw_sprite(spr_dot,1&2,456-8+x,y-8+120);
if floor(im2)=0{draw_sprite(spr_powerpellet,1,440-8+x,y-8+152)}; draw_sprite(spr_dot,1&2,440-8+x,y-8+136); draw_sprite(spr_middot,0,440-8+x,y-8+120);
draw_sprite(spr_middot,0,424-8+x,y-8+152);draw_sprite(spr_dot,1&2,424-8+x,y-8+136);draw_sprite(spr_middot,0,424-8+x,y-8+120);
draw_sprite(spr_dot,1&2,408-8+x,y-8+152);if floor(im2)=1{draw_sprite(spr_powerpellet,1,408-8+x,y-8+136)};draw_sprite(spr_dot,1&2,408-8+x,y-8+120)
draw_sprite(spr_dot,1&2,392-8+x,y-8+152);draw_sprite(spr_middot,0,392-8+x,y-8+136);
if floor(im2)=0{if blue=false{draw_sprite(spr_powerpellet,1,376-8+x,y-8+152);}}
///Ms. Pac-Man2
if mspacstate < 2{
    if mspacx = 56{draw_sprite(spr_MsMan2,1,mspacx-8+x,y-8+mspacy)}
    else{draw_sprite(spr_MsMan2,floor(im),mspacx-8+x,y-8+mspacy)}
}
else{draw_sprite(spr_MsMan2,floor(im)+8,mspacx-8+x,y-8+mspacy)}
///Jr. Pac-Man2 (behind house)
if jrpacstate = 0{draw_sprite(spr_JrMan2,floor(im),jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 8{draw_sprite(spr_JrMan2,floor(im)+8,jrpacx-8+x,y-8+jrpacy)}
///house
draw_sprite(spr_house,0,96+16-8+x,y-8+152)
///Jr. Pac-Man2 (in front of house)
if jrpacstate = 1 or jrpacstate = 2{draw_sprite(spr_JrMan2,floor(im)+8,jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 3 and jrpacx < 208{draw_sprite(spr_JrMan2,floor(im),jrpacx-8+x,y-8+jrpacy)}
///bushes and fence
draw_sprite(spr_bush,0,16-8+x,y-8+304);draw_sprite(spr_bush,0,112-8+x,y-8+304);
draw_sprite(spr_fence,0,0-8+x,y-8+304);draw_sprite(spr_fence,0,32-8+x,y-8+304);draw_sprite(spr_fence,0,64-8+x,y-8+304);draw_sprite(spr_fence,0,96-8+x,y-8+304);
draw_sprite(spr_fence,0,128-8+x,y-8+304);draw_sprite(spr_fence,1,160-8+x,y-8+304);
if jrpacstate = 7{draw_sprite(spr_JrMan2,floor(im),jrpacx-8+x,y-8+jrpacy)}
draw_sprite(spr_bush,0,240-8+x,y-8+304);draw_sprite(spr_bush,0,272-8+x,y-8+304);draw_sprite(spr_bush,1,420-8+x,y-8+304);draw_sprite(spr_bush,0,432-8+x,y-8+304);
draw_sprite(spr_fence,0,224-8+x,y-8+304);draw_sprite(spr_fence,0,256-8+x,y-8+304);draw_sprite(spr_fence,0,288-8+x,y-8+304);draw_sprite(spr_fence,0,320-8+x,y-8+304);
draw_sprite(spr_fence,0,352-8+x,y-8+304);draw_sprite(spr_fence,0,384-8+x,y-8+304);draw_sprite(spr_fence,0,416-8+x,y-8+304);draw_sprite(spr_fence,0,448-8+x,y-8+304);
///Jr. Pac-Man2 (in front of fence)
if jrpacstate = 3 and jrpacx = 208{draw_sprite(spr_JrMan2,floor(im),jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 4 or jrpacstate = 6{draw_sprite(spr_JrMan2,floor(im)+8,jrpacx-8+x,y-8+jrpacy)}
if jrpacstate = 5{
    if blinkygo = false{draw_sprite(spr_JrMan2,floor(im)+8,jrpacx-8+x,y-8+jrpacy - bounce)}
    else{draw_sprite(spr_JrMan2,floor(im),jrpacx-8+x,y-8+jrpacy)}}
///Yum-Yum ///80
if global.plus = true and blue = true{draw_sprite(spr_Ghost,(floor(im2))+4,yumyumx-8+x,y-8+yumyumy)};
if blue = false{
draw_sprite_ext(spr_Ghost,floor(im2)+6,yumyumx-8+x,y-8+yumyumy,1,1,0,make_color_rgb(255,184,82),1)
if yumyumx < 96{
    draw_sprite(spr_Eyes,0,yumyumx-8+x,y-8+yumyumy+6)}
else{
    if yumyumsprite = 0{draw_sprite(spr_Eyes,1,yumyumx-8+x,y-8+yumyumy+6)}
    else{draw_sprite(spr_Eyes,0,yumyumx-8+x,y-8+yumyumy+6)
    }
}
///Blinky
if blinkygo = false{
    draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1)
    if blinkyx < 240{draw_sprite(spr_Eyes,0,blinkyx-8+x,y-8+blinkyy)}
    else{if blinkyx < 272{draw_sprite(spr_Eyes,1,blinkyx-8+x,y-8+blinkyy)}
    else{draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy)}
}}
else{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy)}
}
else{draw_sprite_ext(spr_Ghost,floor(im2)+(global.plus*2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(0,0,255),1);if global.plus = true{draw_sprite(spr_Ghost,(floor(im2))+4,blinkyx-8+x,y-8+blinkyy)};draw_sprite(spr_Eyes,4,blinkyx-8+x,y-8+blinkyy+(global.plus*3));
draw_sprite_ext(spr_Ghost,floor(im2)+6+(global.plus*2),yumyumx-8+x,y-8+yumyumy,1,1,0,c_blue,1);draw_sprite(spr_Eyes,4,yumyumx-8+x,y-8+yumyumy+4);
}
draw_sprite(spr_Ghost,floor(im2)+10,yumyumx-8+x,y-8+yumyumy);
///mud
draw_sprite(spr_mud,0,0-8+x,y-8+544)
}
if global.lvl = 3{ ///SECOND CUTSCENE
if jrpacstate < 2 and jrpacx < 120{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(-160+scroll+x,256+y,string_hash_to_newline("THE GIFT"));}
///background
draw_sprite(spr_bkgd,0,0+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,64+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,128+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,192+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,256+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,320+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,384+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,448+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,-64+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-128+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-192+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-256+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,-320+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-384+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,-448+scroll-8+x,y-8+336);
///Blinky
if jrpacstate < 5{draw_sprite_ext(spr_Ghost,0,blinkyx+scroll-8+x,y-8+400,1,1,0,make_color_rgb(255,184,82),1)}
if jrpacstate = 5{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx+scroll-8+x,y-8+400,1,1,0,make_color_rgb(255,184,82),1)}
if jrpacstate = 3{draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+400);}
if jrpacstate = 4{draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+400);}
if jrpacstate = 5{draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+400);}
///bushes
draw_sprite(spr_bush,1,128+scroll-8+x,y-8+416);draw_sprite(spr_bush,0,160+scroll-8+x,y-8+416);
draw_sprite(spr_bush,1,320+scroll-8+x,y-8+400);draw_sprite(spr_bush,0,304+scroll-8+x,y-8+400);
///clouds
draw_sprite(spr_clouds,0,192+scroll-8+x,y-8+64);
draw_sprite(spr_clouds,1,-272+scroll-8+x,y-8+64); 
///balloon
if jrpacstate<4{draw_sprite(spr_balloon,image_index,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate>3{draw_sprite(spr_balloon,image_index,balloonx-8+x,y-8+jrpacy-bounce);}
///Jr. Pac-Man2
if jrpacstate = 1{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 2{draw_sprite(spr_JrMan2,8+sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and scroll > 0{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);} 
if jrpacstate = 3 and scroll < 0{draw_sprite(spr_JrMan2,1,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 4{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 5{draw_sprite(spr_JrMan2,1,jrpacx-8+x,y-8+jrpacy-bounce);}
///house
draw_sprite(spr_house,0,scroll-392+16-8+x,y-8+424);
///Yum-Yum
if jrpacstate = 4{draw_sprite_ext(spr_Ghost,floor(im2)+6,256+scroll-8+x,y-8+464,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Ghost,floor(im2)+10,256+scroll-8+x,y-8+464);}
if jrpacstate = 3{draw_sprite_ext(spr_Ghost,6,256+scroll-8+x,y-8+464,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Ghost,10,256+scroll-8+x,y-8+464);}
if jrpacstate = 5{draw_sprite_ext(spr_Ghost,6,256+scroll-8+x,y-8+464,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Ghost,10,256+scroll-8+x,y-8+464);}
if jrpacstate > 2{draw_sprite(spr_Eyes,2,256+scroll-8+x,y-8+464+6)}
///river
draw_sprite(spr_river,image_index,240+scroll-8+x,y-8+464)
}
if global.lvl > 3{ ///THIRD CUTSCENE
if vis = true{
if jrpacstate > 3 and rep < 2{draw_set_font(font0); draw_set_color(make_color_rgb(255,255,0)); draw_text(336+x,490+y,string_hash_to_newline("THEY ESCAPE "));
draw_sprite_ext(spr_Exc,0,336+x-16,490+y,1,1,0,c_yellow,1)
}
///background
draw_sprite(spr_bkgd,0,0+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,64+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,128+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,192+scroll-8+x,y-8+336);
draw_sprite(spr_bkgd,0,256+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,320+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,384+scroll-8+x,y-8+336);draw_sprite(spr_bkgd,0,448+scroll-8+x,y-8+336);
///Ms. Pac-Man2
if chase = false{draw_sprite(spr_MsMan2,sprspeed,mspacx+scroll-8+x,y-8+480);}
else{if blinkyx > 152{draw_sprite(spr_MsMan2,sprspeed,mspacx+scroll-8+x,y-8+480);}
if blinkyx < 153{draw_sprite(spr_MsMan2,8+sprspeed,mspacx+scroll-8+x,y-8+480);}
}
///Blinky
if jrpacstate = 1{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy);}
if jrpacstate = 2{
if blinkyx > 96{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,blinkyx-8+x,y-8+blinkyy);}
else{if blinkyy < 480{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,3,blinkyx-8+x,y-8+blinkyy);}
if blinkyy = 480{draw_sprite_ext(spr_Ghost,0,blinkyx+bounce-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,0,blinkyx+bounce-8+x,y-8+blinkyy);}
}}
if jrpacstate = 3{
if blinkyx = 96 and chase = false{
draw_sprite_ext(spr_Ghost,0,blinkyx+scroll-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,0,blinkyx+scroll-8+x,y-8+blinkyy);}
if blinkyx > 96{
if chase = false{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx+scroll-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,0,blinkyx+scroll-8+x,y-8+blinkyy);}
if chase = true{draw_sprite_ext(spr_Ghost,floor(im2),blinkyx+scroll-8+x,y-8+blinkyy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Eyes,2,blinkyx+scroll-8+x,y-8+blinkyy);}
}
}
///bushes
draw_sprite(spr_bush,1,128+scroll-8+x,y-8+416);draw_sprite(spr_bush,0,160+scroll-8+x,y-8+416);
draw_sprite(spr_bush,1,320+scroll-8+x,y-8+400);draw_sprite(spr_bush,0,304+scroll-8+x,y-8+400);
///balloon
if balloony > 132{draw_sprite(spr_balloon,image_index,256+scroll-8+x,y-8+balloony);}
///cloud
draw_sprite(spr_clouds,0,192+scroll-8+x,y-8+64);
///Jr. Pac-Man2
if jrpacstate = 0{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 1{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy-bounce);}
if jrpacstate = 2 and blinkyx > 96{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 2 and blinkyx = 96{draw_sprite(spr_JrMan2, 8+sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and mspacx > 32 and chase = false{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and mspacx < 32 and chase = false{draw_sprite(spr_JrMan2,8+sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 3 and chase = true{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 4{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 5 and rep < 4{draw_sprite(spr_JrMan2,1,jrpacx-8+x,y-8+jrpacy);}
if jrpacstate = 5 and rep = 4{draw_sprite(spr_JrMan2,sprspeed,jrpacx-8+x,y-8+jrpacy);}
///Yum-Yum
if jrpacstate < 3{draw_sprite_ext(spr_Ghost,floor(im2)+6,256-8+x,y-8+464,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Ghost,floor(im2)+10,256-8+x,y-8+464)}
else{draw_sprite_ext(spr_Ghost,floor(im2)+6,256-8+x,y-8+yumyumy,1,1,0,make_color_rgb(255,184,82),1);draw_sprite(spr_Ghost,floor(im2)+10,256-8+x,y-8+yumyumy)}
if jrpacstate = 0{draw_sprite(spr_Eyes,2,256-8+x,y-8+464+6)}
if jrpacstate = 1 and blinkyx > 176{draw_sprite(spr_Eyes,2,256-8+x,y-8+464+6)}///left
if jrpacstate = 1 and blinkyx < 177{draw_sprite(spr_Eyes,1,256-8+x,y-8+464+6)}///up
if jrpacstate = 2 and blinkyx > 96{draw_sprite(spr_Eyes,1,256-8+x,y-8+464+6)}///up
if jrpacstate = 2 and blinkyx = 96{draw_sprite(spr_Eyes,2,256-8+x,y-8+464+6)}///left
if jrpacstate = 3 and mspacx > 32 and chase = false{draw_sprite(spr_Eyes,0,256-8+x,y-8+yumyumy+6)}///right
if jrpacstate = 3 and mspacx < 32 and chase = false{draw_sprite(spr_Eyes,2,256-8+x,y-8+yumyumy+6);}///left
if jrpacstate = 3 and chase = true{draw_sprite(spr_Eyes,0,256-8+x,y-8+yumyumy+6)}///right
if jrpacstate = 4{draw_sprite(spr_Eyes,1,256-8+x,y-8+yumyumy+6);}///up
if jrpacstate = 5 and rep < 4{draw_sprite(spr_Eyes,2,256-8+x,y-8+yumyumy+6);}///left
if jrpacstate = 5 and rep = 4{draw_sprite(spr_Eyes,2,256-8+x,y-8+yumyumy+6);}///left
///river
draw_sprite(spr_river,image_index,240+scroll-8+x,y-8+464)
///hearts
if jrpacstate = 5{
draw_sprite(spr_heart2,hsprspeed,heart1x-8+x,y-8+176);
draw_sprite(spr_heart2,hsprspeed+3,160-8+x,y-8+heart2y);
draw_sprite(spr_heart2,hsprspeed+6,heart3x-8+x,y-8+336);
draw_sprite(spr_heart2,hsprspeed+9,320-8+x,y-8+heart4y);
}
}
}
}

}
}
if global.lvl > 0{
if global.game = 0{
if global.plus = 0{
if global.lvl < 8{
    draw_sprite(spr_Fruit,0,408-16,-16+568)
    if global.lvl > 1{draw_sprite(spr_Fruit,1,376-16,-16+568)}
    if global.lvl > 2{draw_sprite(spr_Fruit,2,344-16,-16+568)}
    if global.lvl > 3{draw_sprite(spr_Fruit,2,312-16,-16+568)}
    if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,-16+568)}
    if global.lvl > 5{draw_sprite(spr_Fruit,3,248-16,-16+568)}
    if global.lvl = 7{draw_sprite(spr_Fruit,4,216-16,-16+568)}
}
if global.lvl = 8{
    draw_sprite(spr_Fruit,1,408-16,-16+568)
    draw_sprite(spr_Fruit,2,376-16,-16+568)
    draw_sprite(spr_Fruit,2,344-16,-16+568)
    draw_sprite(spr_Fruit,3,312-16,-16+568)
    draw_sprite(spr_Fruit,3,280-16,-16+568)
    draw_sprite(spr_Fruit,4,248-16,-16+568)
    draw_sprite(spr_Fruit,4,216-16,-16+568)
}
if global.lvl = 9{
    draw_sprite(spr_Fruit,2,408-16,-16+568)
    draw_sprite(spr_Fruit,2,376-16,-16+568)
    draw_sprite(spr_Fruit,3,344-16,-16+568)
    draw_sprite(spr_Fruit,3,312-16,-16+568)
    draw_sprite(spr_Fruit,4,280-16,-16+568)
    draw_sprite(spr_Fruit,4,248-16,-16+568)
    draw_sprite(spr_Fruit,5,216-16,-16+568)
}
if global.lvl = 10{
    draw_sprite(spr_Fruit,2,408-16,-16+568)
    draw_sprite(spr_Fruit,3,376-16,-16+568)
    draw_sprite(spr_Fruit,3,344-16,-16+568)
    draw_sprite(spr_Fruit,4,312-16,-16+568)
    draw_sprite(spr_Fruit,4,280-16,-16+568)
    draw_sprite(spr_Fruit,5,248-16,-16+568)
    draw_sprite(spr_Fruit,5,216-16,-16+568)
}
if global.lvl = 11{
    draw_sprite(spr_Fruit,3,408-16,-16+568)
    draw_sprite(spr_Fruit,3,376-16,-16+568)
    draw_sprite(spr_Fruit,4,344-16,-16+568)
    draw_sprite(spr_Fruit,4,312-16,-16+568)
    draw_sprite(spr_Fruit,5,280-16,-16+568)
    draw_sprite(spr_Fruit,5,248-16,-16+568)
    draw_sprite(spr_Fruit,6,216-16,-16+568)
}
if global.lvl = 12{
    draw_sprite(spr_Fruit,3,408-16,-16+568)
    draw_sprite(spr_Fruit,4,376-16,-16+568)
    draw_sprite(spr_Fruit,4,344-16,-16+568)
    draw_sprite(spr_Fruit,5,312-16,-16+568)
    draw_sprite(spr_Fruit,5,280-16,-16+568)
    draw_sprite(spr_Fruit,6,248-16,-16+568)
    draw_sprite(spr_Fruit,6,216-16,-16+568)
}
if global.lvl = 13{
    draw_sprite(spr_Fruit,4,408-16,-16+568)
    draw_sprite(spr_Fruit,4,376-16,-16+568)
    draw_sprite(spr_Fruit,5,344-16,-16+568)
    draw_sprite(spr_Fruit,5,312-16,-16+568)
    draw_sprite(spr_Fruit,6,280-16,-16+568)
    draw_sprite(spr_Fruit,6,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
if global.lvl = 14{
    draw_sprite(spr_Fruit,4,408-16,-16+568)
    draw_sprite(spr_Fruit,5,376-16,-16+568)
    draw_sprite(spr_Fruit,5,344-16,-16+568)
    draw_sprite(spr_Fruit,6,312-16,-16+568)
    draw_sprite(spr_Fruit,6,280-16,-16+568)
    draw_sprite(spr_Fruit,7,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
if global.lvl = 15{
    draw_sprite(spr_Fruit,5,408-16,-16+568)
    draw_sprite(spr_Fruit,5,376-16,-16+568)
    draw_sprite(spr_Fruit,6,344-16,-16+568)
    draw_sprite(spr_Fruit,6,312-16,-16+568)
    draw_sprite(spr_Fruit,7,280-16,-16+568)
    draw_sprite(spr_Fruit,7,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
if global.lvl = 16{
    draw_sprite(spr_Fruit,5,408-16,-16+568)
    draw_sprite(spr_Fruit,6,376-16,-16+568)
    draw_sprite(spr_Fruit,6,344-16,-16+568)
    draw_sprite(spr_Fruit,7,312-16,-16+568)
    draw_sprite(spr_Fruit,7,280-16,-16+568)
    draw_sprite(spr_Fruit,7,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
if global.lvl = 17{
    draw_sprite(spr_Fruit,6,408-16,-16+568)
    draw_sprite(spr_Fruit,6,376-16,-16+568)
    draw_sprite(spr_Fruit,7,344-16,-16+568)
    draw_sprite(spr_Fruit,7,312-16,-16+568)
    draw_sprite(spr_Fruit,7,280-16,-16+568)
    draw_sprite(spr_Fruit,7,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
if global.lvl = 18{
    draw_sprite(spr_Fruit,6,408-16,-16+568)
    draw_sprite(spr_Fruit,7,376-16,-16+568)
    draw_sprite(spr_Fruit,7,344-16,-16+568)
    draw_sprite(spr_Fruit,7,312-16,-16+568)
    draw_sprite(spr_Fruit,7,280-16,-16+568)
    draw_sprite(spr_Fruit,7,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
if global.lvl > 18{
    draw_sprite(spr_Fruit,7,408-16,-16+568)
    draw_sprite(spr_Fruit,7,376-16,-16+568)
    draw_sprite(spr_Fruit,7,344-16,-16+568)
    draw_sprite(spr_Fruit,7,312-16,-16+568)
    draw_sprite(spr_Fruit,7,280-16,-16+568)
    draw_sprite(spr_Fruit,7,248-16,-16+568)
    draw_sprite(spr_Fruit,7,216-16,-16+568)
}
}
else{
if global.lvl < 8{
    draw_sprite(spr_Fruit,11,408-16,-16+568)
    if global.lvl > 1{draw_sprite(spr_Fruit,12,376-16,-16+568)}
    if global.lvl > 2{draw_sprite(spr_Fruit,13,344-16,-16+568)}
    if global.lvl > 3{draw_sprite(spr_Fruit,13,312-16,-16+568)}
    if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,-16+568)}
    if global.lvl > 5{draw_sprite(spr_Fruit,3,248-16,-16+568)}
    if global.lvl = 7{draw_sprite(spr_Fruit,14,216-16,-16+568)}
}
if global.lvl = 8{
    draw_sprite(spr_Fruit,12,408-16,-16+568)
    draw_sprite(spr_Fruit,13,376-16,-16+568)
    draw_sprite(spr_Fruit,13,344-16,-16+568)
    draw_sprite(spr_Fruit,3,312-16,-16+568)
    draw_sprite(spr_Fruit,3,280-16,-16+568)
    draw_sprite(spr_Fruit,14,248-16,-16+568)
    draw_sprite(spr_Fruit,14,216-16,-16+568)
}
if global.lvl = 9{
    draw_sprite(spr_Fruit,13,408-16,-16+568)
    draw_sprite(spr_Fruit,13,376-16,-16+568)
    draw_sprite(spr_Fruit,3,344-16,-16+568)
    draw_sprite(spr_Fruit,3,312-16,-16+568)
    draw_sprite(spr_Fruit,14,280-16,-16+568)
    draw_sprite(spr_Fruit,14,248-16,-16+568)
    draw_sprite(spr_Fruit,5,216-16,-16+568)
}
if global.lvl = 10{
    draw_sprite(spr_Fruit,13,408-16,-16+568)
    draw_sprite(spr_Fruit,3,376-16,-16+568)
    draw_sprite(spr_Fruit,3,344-16,-16+568)
    draw_sprite(spr_Fruit,14,312-16,-16+568)
    draw_sprite(spr_Fruit,14,280-16,-16+568)
    draw_sprite(spr_Fruit,5,248-16,-16+568)
    draw_sprite(spr_Fruit,5,216-16,-16+568)
}
if global.lvl = 11{
    draw_sprite(spr_Fruit,3,408-16,-16+568)
    draw_sprite(spr_Fruit,3,376-16,-16+568)
    draw_sprite(spr_Fruit,14,344-16,-16+568)
    draw_sprite(spr_Fruit,14,312-16,-16+568)
    draw_sprite(spr_Fruit,5,280-16,-16+568)
    draw_sprite(spr_Fruit,5,248-16,-16+568)
    draw_sprite(spr_Fruit,15,216-16,-16+568)
}
if global.lvl = 12{
    draw_sprite(spr_Fruit,3,408-16,-16+568)
    draw_sprite(spr_Fruit,14,376-16,-16+568)
    draw_sprite(spr_Fruit,14,344-16,-16+568)
    draw_sprite(spr_Fruit,5,312-16,-16+568)
    draw_sprite(spr_Fruit,5,280-16,-16+568)
    draw_sprite(spr_Fruit,15,248-16,-16+568)
    draw_sprite(spr_Fruit,15,216-16,-16+568)
}
if global.lvl = 13{
    draw_sprite(spr_Fruit,14,408-16,-16+568)
    draw_sprite(spr_Fruit,14,376-16,-16+568)
    draw_sprite(spr_Fruit,5,344-16,-16+568)
    draw_sprite(spr_Fruit,5,312-16,-16+568)
    draw_sprite(spr_Fruit,15,280-16,-16+568)
    draw_sprite(spr_Fruit,15,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
if global.lvl = 14{
    draw_sprite(spr_Fruit,14,408-16,-16+568)
    draw_sprite(spr_Fruit,5,376-16,-16+568)
    draw_sprite(spr_Fruit,5,344-16,-16+568)
    draw_sprite(spr_Fruit,15,312-16,-16+568)
    draw_sprite(spr_Fruit,15,280-16,-16+568)
    draw_sprite(spr_Fruit,16,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
if global.lvl = 15{
    draw_sprite(spr_Fruit,5,408-16,-16+568)
    draw_sprite(spr_Fruit,5,376-16,-16+568)
    draw_sprite(spr_Fruit,15,344-16,-16+568)
    draw_sprite(spr_Fruit,15,312-16,-16+568)
    draw_sprite(spr_Fruit,16,280-16,-16+568)
    draw_sprite(spr_Fruit,16,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
if global.lvl = 16{
    draw_sprite(spr_Fruit,5,408-16,-16+568)
    draw_sprite(spr_Fruit,15,376-16,-16+568)
    draw_sprite(spr_Fruit,15,344-16,-16+568)
    draw_sprite(spr_Fruit,16,312-16,-16+568)
    draw_sprite(spr_Fruit,16,280-16,-16+568)
    draw_sprite(spr_Fruit,16,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
if global.lvl = 17{
    draw_sprite(spr_Fruit,15,408-16,-16+568)
    draw_sprite(spr_Fruit,15,376-16,-16+568)
    draw_sprite(spr_Fruit,16,344-16,-16+568)
    draw_sprite(spr_Fruit,16,312-16,-16+568)
    draw_sprite(spr_Fruit,16,280-16,-16+568)
    draw_sprite(spr_Fruit,16,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
if global.lvl = 18{
    draw_sprite(spr_Fruit,15,408-16,-16+568)
    draw_sprite(spr_Fruit,16,376-16,-16+568)
    draw_sprite(spr_Fruit,16,344-16,-16+568)
    draw_sprite(spr_Fruit,16,312-16,-16+568)
    draw_sprite(spr_Fruit,16,280-16,-16+568)
    draw_sprite(spr_Fruit,16,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
if global.lvl > 18{
    draw_sprite(spr_Fruit,16,408-16,-16+568)
    draw_sprite(spr_Fruit,16,376-16,-16+568)
    draw_sprite(spr_Fruit,16,344-16,-16+568)
    draw_sprite(spr_Fruit,16,312-16,-16+568)
    draw_sprite(spr_Fruit,16,280-16,-16+568)
    draw_sprite(spr_Fruit,16,248-16,-16+568)
    draw_sprite(spr_Fruit,16,216-16,-16+568)
}
}
}
if global.game = 1{
if global.plus = 0{
draw_sprite(spr_Fruit,0,408-16,-16+568)
if global.lvl > 1{draw_sprite(spr_Fruit,1,376-16,-16+568)}
if global.lvl > 2{draw_sprite(spr_Fruit,2,344-16,-16+568)}
if global.lvl > 3{draw_sprite(spr_Fruit,8,312-16,-16+568)}
if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,-16+568)}
if global.lvl > 5{draw_sprite(spr_Fruit,9,248-16,-16+568)}
if global.lvl > 6{draw_sprite(spr_Fruit,10,216-16,-16+568)}
}
else{
draw_sprite(spr_Fruit,24,408-16,-16+568)
if global.lvl > 1{draw_sprite(spr_Fruit,25,376-16,-16+568)}
if global.lvl > 2{draw_sprite(spr_Fruit,26,344-16,-16+568)}
if global.lvl > 3{draw_sprite(spr_Fruit,27,312-16,-16+568)}
if global.lvl > 4{draw_sprite(spr_Fruit,28,280-16,-16+568)}
if global.lvl > 5{draw_sprite(spr_Fruit,29,248-16,-16+568)}
if global.lvl > 6{draw_sprite(spr_Fruit,30,216-16,-16+568)}
}
}
if global.game = 2{
if global.plus = 0{
draw_sprite(spr_Fruit,17,__view_get( e__VW.XView, 0 ) + 408-16,-16+568)
if global.lvl > 1{draw_sprite(spr_Fruit,18,__view_get( e__VW.XView, 0 ) + 376-16,-16+568)}
if global.lvl > 2{draw_sprite(spr_Fruit,19,__view_get( e__VW.XView, 0 ) + 344-16,-16+568)}
if global.lvl > 3{draw_sprite(spr_Fruit,20,__view_get( e__VW.XView, 0 ) + 312-16,-16+568)}
if global.lvl > 4{draw_sprite(spr_Fruit,21,__view_get( e__VW.XView, 0 ) + 280-16,-16+568)}
if global.lvl > 5{draw_sprite(spr_Fruit,22,__view_get( e__VW.XView, 0 ) + 248-16,-16+568)}
if global.lvl > 6{draw_sprite(spr_Fruit,23,__view_get( e__VW.XView, 0 ) + 216-16,-16+568)}
}
else{
draw_sprite(spr_Fruit,31,__view_get( e__VW.XView, 0 ) + 408-16,-16+568)
if global.lvl > 1{draw_sprite(spr_Fruit,32,__view_get( e__VW.XView, 0 ) + 376-16,-16+568)}
if global.lvl > 2{draw_sprite(spr_Fruit,33,__view_get( e__VW.XView, 0 ) + 344-16,-16+568)}
if global.lvl > 3{draw_sprite(spr_Fruit,34,__view_get( e__VW.XView, 0 ) + 312-16,-16+568)}
if global.lvl > 4{draw_sprite(spr_Fruit,35,__view_get( e__VW.XView, 0 ) + 280-16,-16+568)}
if global.lvl > 5{draw_sprite(spr_Fruit,36,__view_get( e__VW.XView, 0 ) + 248-16,-16+568)}
if global.lvl > 6{draw_sprite(spr_Fruit,37,__view_get( e__VW.XView, 0 ) + 216-16,-16+568)}
}
}
}

