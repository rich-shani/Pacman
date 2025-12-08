if alarm[9] = -1{

if dead > 1{

    if deader = 1{

    if room_width = 448{

        if global.ex1 = 0{draw_sprite(spr_Dead,floor(deadanim),x,y)}

        else{if global.otto = 0{draw_sprite(spr_MsDead,floor(deadanim),x,y)}else{draw_sprite(spr_OttoDead,floor(deadanim),x,y)}}

    }

    else{if dead < 3{draw_sprite(spr_JrDead,floor(deadanim),round(x),round(y))}}

}}

else{

if oGameManager.prohibit = 1{

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,16,x,y,1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,16,x,y,1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,16,x,y,1,1,0,c_white,1)}}

        }

        else{draw_sprite_ext(spr_JrMan,16,round(x),round(y),1,1,0,c_white,1)}

    }

else{

if chomp = 0 or chomper = 2{

    if oGameManager.start = false{

    if global.boost > 0{

    if global.otto = 1{if dir = 1{draw_sprite_ext(spr_boostlines,5,x,y,1,1,0,c_yellow,1)};else{if dir = 3{draw_sprite_ext(spr_boostlines,6,x,y,1,1,0,c_yellow,1)};else{draw_sprite_ext(spr_boostlines,dir,x,y,1,1,0,c_yellow,1)}}}

    else{

    if global.game = 2 and dir = 1{draw_sprite_ext(spr_boostlines,4,x,y,1,1,0,c_yellow,1)}else{draw_sprite_ext(spr_boostlines,dir,x,y,1,1,0,c_yellow,1)}

    }}

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,(floor(im/2))+(4*dir),x,y,1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,(floor(im/2))+(4*dir),x,y,1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,(floor(im/2))+(4*dir),x,y,1,1,0,c_white,1)}}

    }

    else{draw_sprite_ext(spr_JrMan,(floor(im/2))+(4*dir),round(x),round(y),1,1,0,c_white,1)}

    }

    else{

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,8,x,y,1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,9,x,y,1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,8,x,y,1,1,0,c_white,1)}}

    }

    else{draw_sprite_ext(spr_JrMan,9,round(x),round(y),1,1,0,c_white,1)}

    }

}

else{

    if global.plus = 0{draw_sprite_ext(spr_Chomp,oGameManager.chompcount-1+oGameManager.pluseat,round(x)-(8*(scale-1)),round(y)-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1)}

    else{draw_sprite_ext(spr_Chomp,oGameManager.chompcount-1+oGameManager.pluseat,round(x)-(8*(scale-1)),round(y)-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1)}

}

}

}

}


var __b__;
__b__ = action_if_variable(room_height, 576, 0);
if __b__
{
{
if alarm[9] = -1{

if dead > 1{

    if deader = 1{

    if room_width = 448{

        if global.ex1 = 0{draw_sprite(spr_Dead,floor(deadanim),x,(y-512))}

        else{if global.otto = 0{draw_sprite(spr_MsDead,floor(deadanim),x,(y-512))}else{draw_sprite(spr_OttoDead,floor(deadanim),x,(y-512))}}

    }

    else{if dead < 3{draw_sprite(spr_JrDead,floor(deadanim),round(x),round(y-512))}}

}}

else{

if oGameManager.prohibit = 1{

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,16,x,(y-512),1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,16,x,(y-512),1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,16,x,(y-512),1,1,0,c_white,1)}}

        }

        else{draw_sprite_ext(spr_JrMan,16,round(x),round(y-512),1,1,0,c_white,1)}

    }

else{

if chomp = 0 or chomper = 2{

    if oGameManager.start = false{

    if global.boost = 1{

    if global.otto = 1{if dir = 1{draw_sprite_ext(spr_boostlines,5,x,(y-512),1,1,0,c_yellow,1)};else{if dir = 3{draw_sprite_ext(spr_boostlines,6,x,(y-512),1,1,0,c_yellow,1)};else{draw_sprite_ext(spr_boostlines,dir,x,(y-512),1,1,0,c_yellow,1)}}}

    else{

    if global.game = 2 and dir = 1{draw_sprite_ext(spr_boostlines,4,x,(y-512),1,1,0,c_yellow,1)}else{draw_sprite_ext(spr_boostlines,dir,x,(y-512),1,1,0,c_yellow,1)}

    }}

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,(floor(im/2))+(4*dir),x,(y-512),1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,(floor(im/2))+(4*dir),x,(y-512),1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,(floor(im/2))+(4*dir),x,(y-512),1,1,0,c_white,1)}}

    }

    else{draw_sprite_ext(spr_JrMan,(floor(im/2))+(4*dir),round(x),round(y-512),1,1,0,c_white,1)}

    }

    else{

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,8,x,(y-512),1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,9,x,(y-512),1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,8,x,(y-512),1,1,0,c_white,1)}}

    }

    else{draw_sprite_ext(spr_JrMan,9,round(x),round(y-512),1,1,0,c_white,1)}

    }

}

else{

    if global.plus = 0{draw_sprite_ext(spr_Chomp,chompcount-1+pluseat,round(x)-(8*(scale-1)),round(y-512)-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1)}

    else{draw_sprite_ext(spr_Chomp,chompcount-1+pluseat,round(x)-(8*(scale-1)),round(y-512)-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1)}

}

}

}

}


if alarm[9] = -1{

if dead > 1{

    if deader = 1{

    if room_width = 448{

        if global.ex1 = 0{draw_sprite(spr_Dead,floor(deadanim),x,(y+512))}

        else{if global.otto = 0{draw_sprite(spr_MsDead,floor(deadanim),x,(y+512))}else{draw_sprite(spr_OttoDead,floor(deadanim),x,(y+512))}}

    }

    else{if dead < 3{draw_sprite(spr_JrDead,floor(deadanim),round(x),round(y+512))}}

}}

else{

if oGameManager.prohibit = 1{

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,16,x,(y+512),1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,16,x,(y+512),1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,16,x,(y+512),1,1,0,c_white,1)}}

        }

        else{draw_sprite_ext(spr_JrMan,16,round(x),round(y+512),1,1,0,c_white,1)}

    }

else{

if chomp = 0 or chomper = 2{

    if oGameManager.start = false{

    if global.boost = 1{

    if global.otto = 1{if dir = 1{draw_sprite_ext(spr_boostlines,5,x,(y+512),1,1,0,c_yellow,1)};else{if dir = 3{draw_sprite_ext(spr_boostlines,6,x,(y+512),1,1,0,c_yellow,1)};else{draw_sprite_ext(spr_boostlines,dir,x,(y+512),1,1,0,c_yellow,1)}}}

    else{

    if global.game = 2 and dir = 1{draw_sprite_ext(spr_boostlines,4,x,(y+512),1,1,0,c_yellow,1)}else{draw_sprite_ext(spr_boostlines,dir,x,(y+512),1,1,0,c_yellow,1)}

    }}

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,(floor(im/2))+(4*dir),x,(y+512),1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,(floor(im/2))+(4*dir),x,(y+512),1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,(floor(im/2))+(4*dir),x,(y+512),1,1,0,c_white,1)}}

    }

    else{draw_sprite_ext(spr_JrMan,(floor(im/2))+(4*dir),round(x),round(y+512),1,1,0,c_white,1)}

    }

    else{

    if room_width = 448{

        if global.ex1=0{draw_sprite_ext(spr_Man,8,x,(y+512),1,1,0,c_white,1)}

        else{if global.otto = 0{draw_sprite_ext(spr_MsMan,9,x,(y+512),1,1,0,c_white,1)}

        else{draw_sprite_ext(spr_OttoMan,8,x,(y+512),1,1,0,c_white,1)}}

    }

    else{draw_sprite_ext(spr_JrMan,9,round(x),round(y+512),1,1,0,c_white,1)}

    }

}

else{

    if global.plus = 0{draw_sprite_ext(spr_Chomp,chompcount-1+pluseat,round(x)-(8*(scale-1)),round(y+512)-(8*(scale-1)),scale,scale,0,make_color_rgb(0,255,255),1)}

    else{draw_sprite_ext(spr_Chomp,chompcount-1+pluseat,round(x)-(8*(scale-1)),round(y+512)-(8*(scale-1)),scale,scale,0,make_color_rgb(255,255,0),1)}

}

}

}

}


}
}
script_execute(draw2,x2,y2);

if room_height = 576{

script_execute(draw2,x2,y2-512);

script_execute(draw2,x2,y2+512);

}


//{
//exit

//if (test = 0 and dead = 3) or (global.p1lives = 0){

//draw_set_font(font0)

//draw_set_halign(fa_left)

//if room_width = 448{draw_set_color(c_white);}

//else{draw_set_color(c_yellow);}

//draw_text(__view_get( e__VW.XView, 0 )+32,__view_get( e__VW.YView, 0 )+560,string_hash_to_newline("CREDIT "))

//draw_text(__view_get( e__VW.XView, 0 )+144,__view_get( e__VW.YView, 0 )+560,string_hash_to_newline(global.credit))

//}


//exit

//if global.lvl = 0{

//draw_set_font(font0)

//draw_set_halign(fa_left)

//draw_set_color(make_color_hsv(global.color-40,240,120))

//draw_text(0-2+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+2+8,string_hash_to_newline("     PAC-MAN COLLECTION     "))//224

//draw_set_color(make_color_hsv(global.color,240,180))

//draw_text(0+__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+0+8, string_hash_to_newline("     PAC-MAN COLLECTION     "))//224

//draw_text(0,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(""))

//if global.game = 0{

//draw_sprite_ext(spr_Man,2,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)

//draw_sprite_ext(spr_Man,10,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)

//}

//if global.game = 1{

//draw_sprite_ext(spr_MsMan,2,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)

//draw_sprite_ext(spr_MsMan,10,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)

//}

//if global.game = 2{

//draw_sprite_ext(spr_JrMan,2,__view_get( e__VW.XView, 0 )+64,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)

//draw_sprite_ext(spr_JrMan,10,__view_get( e__VW.XView, 0 )+368,__view_get( e__VW.YView, 0 )+8,1,1,0,c_white,1)

//}

//}


//exit

//if global.lvl > 0{

//if Pauser.pause = 0{

//if test = 0{

//draw_set_font(font0)

//draw_set_halign(fa_right)

//draw_set_color(c_white)

//if global.rand = 0{

//if global.game = 0{

//if blink = 0{draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

//draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

//draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))

//if global.mode = 0{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusscore))}

//}

//if global.mode = 1{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.hanglyscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.hanglyplusscore))}

//}

//if global.mode = 2{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.newscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.newplusscore))}

//}

//if global.mode = 3{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.ultrascore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.ultraplusscore))}

//}

//}

//if global.game = 1{

//if blink = 0{draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

//draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

//draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))

//if global.mode = 0{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusscore))}

//}

//if global.mode = 1{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspmpscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspmpplusscore))}

//}

//if global.mode = 2{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacjrscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacjrplusscore))}

//}

//if global.mode = 3{

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.strangescore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.strangeplusscore))}

//}

//}

//if global.game = 2{

//draw_set_color(c_yellow)

//if blink = 0{draw_text(80+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("1UP"))}

//draw_text(96+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.p1score))

//draw_text(288+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("HIGH SCORE"))

//if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacscore))}

//else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacplusscore))}

//}

//}

//else{

//if global.game = 0{

//if blink = 0{draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

//draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

//draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacrandscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.pacplusrandscore))}

//}

//if global.game = 1{

//if blink = 0{draw_text(80+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("1UP"))}

//draw_text(96+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.p1score))

//draw_text(288+16,__view_get( e__VW.YView, 0 )+0,string_hash_to_newline("HIGH SCORE"))

//if global.plus = 0{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacrandscore))}

//else{draw_text(256+16,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(global.mspacplusrandscore))}

//}

//if global.game = 2{

//draw_set_color(c_yellow)

//if blink = 0{draw_text(80+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("1UP"))}

//draw_text(96+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.p1score))

//draw_text(288+__view_get( e__VW.XView, 0 )+16,0,string_hash_to_newline("HIGH SCORE"))

//if global.plus = 0{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacrandscore))}

//else{draw_text(256+__view_get( e__VW.XView, 0 )+16,16,string_hash_to_newline(global.jrpacplusrandscore))}

//}

//}

//}

//}

//}


//if Pauser.pause = 0{

//if test = 0{

//if global.lvl > 0{

//if global.game = 0{

//if global.p1lives>3{draw_sprite(spr_Man,9,136-16-8,__view_get( e__VW.YView, 0 )+552)}

//if global.p1lives>2{draw_sprite(spr_Man,9,104-16-8,__view_get( e__VW.YView, 0 )+552)}

//if global.p1lives>1{draw_sprite(spr_Man,9,72-16-8,__view_get( e__VW.YView, 0 )+552)}

/////if Pac.alarm[9] = -1{}else{draw_sprite(spr_Man,9,136-16-8,view_yview[0]+552)}

//if global.plus = 0{

//if global.lvl < 8{

//    draw_sprite(spr_Fruit,0,408-16,__view_get( e__VW.YView, 0 )+552)

//    if global.lvl > 1{draw_sprite(spr_Fruit,1,376-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 2{draw_sprite(spr_Fruit,2,344-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 3{draw_sprite(spr_Fruit,2,312-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 5{draw_sprite(spr_Fruit,3,248-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl = 7{draw_sprite(spr_Fruit,4,216-16,__view_get( e__VW.YView, 0 )+552)}

//}

//if global.lvl = 8{

//    draw_sprite(spr_Fruit,1,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,2,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,2,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 9{

//    draw_sprite(spr_Fruit,2,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,2,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 10{

//    draw_sprite(spr_Fruit,2,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 11{

//    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 12{

//    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 13{

//    draw_sprite(spr_Fruit,4,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,4,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 14{

//    draw_sprite(spr_Fruit,4,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 15{

//    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 16{

//    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 17{

//    draw_sprite(spr_Fruit,6,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,6,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 18{

//    draw_sprite(spr_Fruit,6,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl > 18{

//    draw_sprite(spr_Fruit,7,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,7,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//}

//else{

//if global.lvl < 8{

//    draw_sprite(spr_Fruit,11,408-16,__view_get( e__VW.YView, 0 )+552)

//    if global.lvl > 1{draw_sprite(spr_Fruit,12,376-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 2{draw_sprite(spr_Fruit,13,344-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 3{draw_sprite(spr_Fruit,13,312-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl > 5{draw_sprite(spr_Fruit,3,248-16,__view_get( e__VW.YView, 0 )+552)}

//    if global.lvl = 7{draw_sprite(spr_Fruit,14,216-16,__view_get( e__VW.YView, 0 )+552)}

//}

//if global.lvl = 8{

//    draw_sprite(spr_Fruit,12,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,13,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,13,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 9{

//    draw_sprite(spr_Fruit,13,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,13,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 10{

//    draw_sprite(spr_Fruit,13,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 11{

//    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,3,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 12{

//    draw_sprite(spr_Fruit,3,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 13{

//    draw_sprite(spr_Fruit,14,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,14,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 14{

//    draw_sprite(spr_Fruit,14,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 15{

//    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,5,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 16{

//    draw_sprite(spr_Fruit,5,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 17{

//    draw_sprite(spr_Fruit,15,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,15,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl = 18{

//    draw_sprite(spr_Fruit,15,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//if global.lvl > 18{

//    draw_sprite(spr_Fruit,16,408-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,376-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,344-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,312-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,280-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,248-16,__view_get( e__VW.YView, 0 )+552)

//    draw_sprite(spr_Fruit,16,216-16,__view_get( e__VW.YView, 0 )+552)

//}

//}

//}

//if global.game = 1{

//if global.p1lives>3{draw_sprite(spr_MsMan,1,136-16-8,__view_get( e__VW.YView, 0 )+552)}

//if global.p1lives>2{draw_sprite(spr_MsMan,1,104-16-8,__view_get( e__VW.YView, 0 )+552)}

//if global.p1lives>1{draw_sprite(spr_MsMan,1,72-16-8,__view_get( e__VW.YView, 0 )+552)}

/////if Pac.alarm[9] = -1{}else{draw_sprite(spr_MsMan,1,136-16-8,view_yview[0]+552)}

//if global.plus = 0{

//draw_sprite(spr_Fruit,0,408-16,__view_get( e__VW.YView, 0 )+552)

//if global.lvl > 1{draw_sprite(spr_Fruit,1,376-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 2{draw_sprite(spr_Fruit,2,344-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 3{draw_sprite(spr_Fruit,8,312-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 4{draw_sprite(spr_Fruit,3,280-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 5{draw_sprite(spr_Fruit,9,248-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 6{draw_sprite(spr_Fruit,10,216-16,__view_get( e__VW.YView, 0 )+552)}

//}

//else{

//draw_sprite(spr_Fruit,24,408-16,__view_get( e__VW.YView, 0 )+552)

//if global.lvl > 1{draw_sprite(spr_Fruit,25,376-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 2{draw_sprite(spr_Fruit,26,344-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 3{draw_sprite(spr_Fruit,27,312-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 4{draw_sprite(spr_Fruit,28,280-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 5{draw_sprite(spr_Fruit,29,248-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 6{draw_sprite(spr_Fruit,30,216-16,__view_get( e__VW.YView, 0 )+552)}

//}

//}

//if global.game = 2{

//if start = 1{

//if global.p1lives>3{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 136-24-16,-24+568)}

//if global.p1lives>2{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 104-24-16,-24+568)}

//if global.p1lives>1{draw_sprite(spr_Jrlife,0,__view_get( e__VW.XView, 0 ) + 72-24-16,-24+568)}

/////if Pac.alarm[9] = -1{}else{draw_sprite(spr_Jrlife,0,view_xview[0]+136-24-16,-24+568)}

//}

//else{

//if global.p1lives>3{draw_sprite(spr_Jrlife,floor(im2)+2,__view_get( e__VW.XView, 0 ) + 136-24-16,-24+568)}

//if global.p1lives>2{draw_sprite(spr_Jrlife,floor(im2)+1,__view_get( e__VW.XView, 0 ) + 104-24-16,-24+568)}

//if global.p1lives>1{draw_sprite(spr_Jrlife,floor(im2),__view_get( e__VW.XView, 0 ) + 72-24-16,-24+568)}

//}

//if global.plus = 0{

//draw_sprite(spr_Fruit,17,__view_get( e__VW.XView, 0 ) + 408-16,__view_get( e__VW.YView, 0 )+552)

//if global.lvl > 1{draw_sprite(spr_Fruit,18,__view_get( e__VW.XView, 0 ) + 376-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 2{draw_sprite(spr_Fruit,19,__view_get( e__VW.XView, 0 ) + 344-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 3{draw_sprite(spr_Fruit,20,__view_get( e__VW.XView, 0 ) + 312-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 4{draw_sprite(spr_Fruit,21,__view_get( e__VW.XView, 0 ) + 280-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 5{draw_sprite(spr_Fruit,22,__view_get( e__VW.XView, 0 ) + 248-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 6{draw_sprite(spr_Fruit,23,__view_get( e__VW.XView, 0 ) + 216-16,__view_get( e__VW.YView, 0 )+552)}

//}

//else{

//draw_sprite(spr_Fruit,31,__view_get( e__VW.XView, 0 ) + 408-16,__view_get( e__VW.YView, 0 )+552)

//if global.lvl > 1{draw_sprite(spr_Fruit,32,__view_get( e__VW.XView, 0 ) + 376-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 2{draw_sprite(spr_Fruit,33,__view_get( e__VW.XView, 0 ) + 344-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 3{draw_sprite(spr_Fruit,34,__view_get( e__VW.XView, 0 ) + 312-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 4{draw_sprite(spr_Fruit,35,__view_get( e__VW.XView, 0 ) + 280-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 5{draw_sprite(spr_Fruit,36,__view_get( e__VW.XView, 0 ) + 248-16,__view_get( e__VW.YView, 0 )+552)}

//if global.lvl > 6{draw_sprite(spr_Fruit,37,__view_get( e__VW.XView, 0 ) + 216-16,__view_get( e__VW.YView, 0 )+552)}

//}

//}

//}

//}

//}


//}
/////Blinky.xstart-74, ///Blinky.ystart+96

//if global.game < 2{

//if ((global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0)) and global.lvl > 0 and countdown > -1{

//draw_set_font(font0); draw_set_halign(fa_left); draw_set_color(c_yellow);

//if global.credit = 0{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline("ADD  COINS"))}

//else{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+224,string_hash_to_newline("PUSH START"))}

//if test = 0{draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+320-48,string_hash_to_newline("    TO    "))}

//draw_text((Blinky.xstart - 216)+144,(Blinky.ystart - 224)+320,string_hash_to_newline(" CONTINUE "))

//if countdown = 10{draw_text(208,ystart,string_hash_to_newline(countdown-1))}

//else{draw_text(208,ystart,string_hash_to_newline(countdown))}

//}

//}

//else{

//if ((global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0)) and global.lvl > 0 and countdown > -1{

//draw_set_font(font0); draw_set_halign(fa_left); draw_set_color(make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2));

//if global.credit = 0{draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline("ADD  COINS"))}

//else{draw_text(Blinky.xstart-74,Blinky.ystart+2,string_hash_to_newline("PUSH START"))}

//if test = 0{draw_text(Blinky.xstart-74,Blinky.ystart+48+2,string_hash_to_newline("    TO    "))}

//draw_text(Blinky.xstart-74,Blinky.ystart+96+2,string_hash_to_newline(" CONTINUE "))

//if (room_height < 960 and Drawless.c64 = 0) or room = A2600_4{

//if countdown = 10{draw_text(xstart-10,ystart+2,string_hash_to_newline(countdown-1))}

//else{draw_text(xstart-10,ystart+2,string_hash_to_newline(countdown))}

//}

//else{

//if room = C64_01 or room = C64_02 or room = C64_03 or room = C64_06 or room = A2600_2 or room = A2600_6 or room = A2600_7{

//if countdown = 10{draw_text(xstart-10,ystart+2+48,string_hash_to_newline(countdown-1))}

//else{draw_text(xstart-10,ystart+2+48,string_hash_to_newline(countdown))}

//}

//else{

//if countdown = 10{draw_text(xstart-10,ystart+2+96,string_hash_to_newline(countdown-1))}

//else{draw_text(xstart-10,ystart+2+96,string_hash_to_newline(countdown))}

//}

//}

//draw_set_font(font0); draw_set_halign(fa_left); draw_set_color(make_color_hsv(Drawless.dh,Drawless.ds,Drawless.dv));

//if global.credit = 0{draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline("ADD  COINS"))}

//else{draw_text(Blinky.xstart-72,Blinky.ystart,string_hash_to_newline("PUSH START"))}

//if test = 0{draw_text(Blinky.xstart-72,Blinky.ystart+48,string_hash_to_newline("    TO    "))}

//draw_text(Blinky.xstart-72,Blinky.ystart+96,string_hash_to_newline(" CONTINUE "))

//if (room_height < 960 and Drawless.c64 = 0) or room = A2600_4{

//if countdown = 10{draw_text(xstart-8,ystart,string_hash_to_newline(countdown-1))}

//else{draw_text(xstart-8,ystart,string_hash_to_newline(countdown))}

//}

//else{

//if room = C64_01 or room = C64_02 or room = C64_03 or room = C64_06 or room = A2600_2 or room = A2600_6 or room = A2600_7{

//if countdown = 10{draw_text(xstart-8,ystart+48,string_hash_to_newline(countdown-1))}

//else{draw_text(xstart-8,ystart+48,string_hash_to_newline(countdown))}

//}

//else{

//if countdown = 10{draw_text(xstart-8,ystart+96,string_hash_to_newline(countdown-1))}

//else{draw_text(xstart-8,ystart+96,string_hash_to_newline(countdown))}

//}

//}

//}

//}


