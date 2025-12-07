cycling = 0

mh = 0

ms = 0

mv = 0

mh2 = 0

ms2 = 0

mv2 = 0

extra = 0

c64 = 0;
extend = 0;


alarm[0] = 1

image_speed=0

check = 0

if image_index = 0{

if collision_point(x+16,y,Wall,false,true){check=check+1}///right

if collision_point(x,y-16,Wall,false,true){check=check+3}///up

if collision_point(x-16,y,Wall,false,true){check=check+5}///left

if collision_point(x,y+16,Wall,false,true){check=check+11}///down

if collision_point(x+16,y+16,Wall,false,true){check=check+33}///right and down

if collision_point(x+16,y-16,Wall,false,true){check=check+55}///right and up

if collision_point(x-16,y-16,Wall,false,true){check=check+111}///left and up

if collision_point(x-16,y+16,Wall,false,true){check=check+333}///left and down

if check = 3{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 11{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 14{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 47{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 69{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 125{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 347{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 458{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 102{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 402{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 158{if place_empty(x-16,y){image_index=1};else{image_index=3}}

if check = 1{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 5{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 6{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 39{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 61{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 117{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 339{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 172{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 372{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 150{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 394{if place_empty(x,y-16){image_index=2};else{image_index=4}}

if check = 4{if x=0 or y = room_height - 48{image_index=8};else{image_index=37}}

if check = 8{if x=room_width-16 or y = room_height - 48{image_index=5};else{image_index=38}}

if check = 16{if x=room_width-16 or y=48{image_index=6};else{image_index=39}}

if check = 12{if x=0 or y=48{image_index=7};else{image_index=36}}

if check = 63{if x=room_width-16{image_index=5};else{if x=200 and y=256{image_index=5};else{if x=184 and y=264{image_index=5};else{image_index=23}}}}

if check = 345{if x=0{image_index=7};else{if x=80 and y=24{image_index=7};else{image_index=21}}}

if check = 49{if x=room_width-16{image_index=6};else{if x=136 and y=24{image_index=6};else{image_index=24}}}

if check = 115{if x=0{image_index=8};else{if x=16 and y=256{image_index=8};else{if x=32 and y=264{image_index=8};else{image_index=22}}}}

///9,19,17,15,20 are obsolete options for this type of wall connection

if check = 64{image_index=9}

if check = 352{image_index=10}

if check = 130{image_index=11}

if check = 50{image_index=12}

if check = 70{image_index=13}

if check = 350{image_index=14}

if check = 48{image_index=15}

if check = 120{image_index=16}

if check = 103{image_index=17}

if check = 214{image_index=17}

if check = 436{image_index=17}

if check = 463{image_index=19}

if check = 518{image_index=19}

if check = 496{image_index=19}

if check = 175{image_index=18}

if check = 208{image_index=18}

if check = 508{image_index=18}

if check = 383{image_index=20}

if check = 438{image_index=20}

if check = 494{image_index=20}

if check = 45{if x>0{image_index=21};else{image_index=39}}

if check = 378{image_index=21}

if check = 59{if x=0{image_index=18};else{image_index=22}}

if check = 170{image_index=22}

if check = 119{if x=room_width-16{image_index=18};else{image_index=23}}

if check = 174{image_index=23}

if check = 349{if x<room_width-16{image_index=24};else{image_index=39}}

if check = 382{image_index=24}

if check = 460{image_index=24}

if check = 519{image_index=25}

if check = 433{image_index=21}///

if check = 100{image_index=21}///

if check = 497{image_index=26}

if check = 203{image_index=22}///

if check = 92{image_index=22}///

if check = 441{image_index=27}

if check = 507{image_index=23}///

if check = 452{image_index=23}///

if check = 219{image_index=28}

if check = 493{image_index=24}///

if check = 552{image_index=29}

///ghost house

if room = Menu{}else{

if room_height = 960{

if y=480 and x>176 and x<304{image_index=2}

if y=480 and x=176{image_index=31}

if y=480 and x=304{image_index=32}

if x=176 and y>416 and y<480{image_index=3}

if x=176 and y=416{image_index=30}

if x=304 and y>416 and y<480{image_index=1}

if x>191 and x<289 and y=416{image_index=4}

if x=304 and y=416{image_index=33}

if x=208 and y=416{image_index=34}

if x=272 and y=416{image_index=35}

}

else{

if room_width = 448 and instance_exists(Blinky){

if y=(Blinky.ystart - 224)+304 and x>(Blinky.xstart - 216)+160 and x<(Blinky.xstart - 216)+272{image_index=2}

if y=(Blinky.ystart - 224)+304 and x=(Blinky.xstart - 216)+160{image_index=31}

if y=(Blinky.ystart - 224)+304 and x=(Blinky.xstart - 216)+272{image_index=32}

if x=(Blinky.xstart - 216)+160 and y>(Blinky.ystart - 224)+240 and y<(Blinky.ystart - 224)+304{image_index=3}

if x=(Blinky.xstart - 216)+160 and y=(Blinky.ystart - 224)+240{image_index=30}

if x=(Blinky.xstart - 216)+272 and y>(Blinky.ystart - 224)+240 and y<(Blinky.ystart - 224)+304{image_index=1}

if x=(Blinky.xstart - 216)+176 and y=(Blinky.ystart - 224)+240{image_index=4}

if x=(Blinky.xstart - 216)+256 and y=(Blinky.ystart - 224)+240{image_index=4}

if x=(Blinky.xstart - 216)+272 and y=(Blinky.ystart - 224)+240{image_index=33}

if x=(Blinky.xstart - 216)+192 and y=(Blinky.ystart - 224)+240{image_index=34}

if x=(Blinky.xstart - 216)+240 and y=(Blinky.ystart - 224)+240{image_index=35}

}

else{

if y=288+(extend*16) and x>368-(c64*144) and x<480-(c64*144){image_index=2}

if y=288+(extend*16) and x=368-(c64*144){image_index=31}

if y=288+(extend*16) and x=480-(c64*144){image_index=32}

if x=368-(c64*144) and y>224+(extend*16) and y<288+(extend*16){image_index=3}

if x=368-(c64*144) and y=224+(extend*16){image_index=30}

if x=480-(c64*144) and y>224+(extend*16) and y<288+(extend*16){image_index=1}

if x=384-(c64*144) and y=224+(extend*16){image_index=4}

if x=464-(c64*144) and y=224+(extend*16){image_index=4}

if x=480-(c64*144) and y=224+(extend*16){image_index=33}

if x=400-(c64*144) and y=224+(extend*16){image_index=34}

if x=448-(c64*144) and y=224+(extend*16){image_index=35}

}

}

}

///fixing short tunnel walls

if image_index=1 and !collision_point(x,y-16,Wall,false,true) and !collision_point(x+16,y,Wall,false,true) and !place_empty(x,y-16){image_index=24}

if image_index=1 and !collision_point(x,y+16,Wall,false,true) and !collision_point(x+16,y,Wall,false,true) and !place_empty(x,y+16){image_index=23}

if image_index=3 and !collision_point(x,y-16,Wall,false,true) and !collision_point(x-16,y,Wall,false,true) and !place_empty(x,y-16){image_index=21}

if image_index=3 and !collision_point(x,y+16,Wall,false,true) and !collision_point(x-16,y,Wall,false,true) and !place_empty(x,y+16){image_index=22}

if image_index=39{if x = 0 or x = (room_width-16){image_index=20}}

///fixing imcomplete wall tiles

if room_height = 576 or room_height = 960{

if x = 0 and image_index = 17{image_index = 29; extra = -1}

if x = room_width - 16 and image_index = 19{image_index = 29; extra = 1}

}

}

///fixing the edge corners

if x = 0{

if image_index = 23{image_index=38}

if image_index = 24{image_index=39}

if image_index = 20 and collision_point(x,y+32,Wall,false,true){image_index=44}

if image_index = 18 and collision_point(x,y-32,Wall,false,true){image_index=48}

}

if x = room_width-16{

if image_index = 22{image_index=37}

if image_index = 21{image_index=36}

if image_index = 20 and collision_point(x,y+32,Wall,false,true){image_index=45}

if image_index = 18 and collision_point(x,y-32,Wall,false,true){image_index=49}

}


if cycling = 0{

    mh = color_get_hue(make_color_rgb(global.mr,global.mg,global.mb))

    ms = color_get_saturation(make_color_rgb(global.mr,global.mg,global.mb))

    if global.rand = 0{mv = color_get_value(make_color_rgb(global.mr,global.mg,global.mb));}else{mv = 255}

    //

    mh2 = color_get_hue(make_color_rgb(global.mr2,global.mg2,global.mb2))

    ms2 = color_get_saturation(make_color_rgb(global.mr2,global.mg2,global.mb2))

    mv2 = color_get_value(make_color_rgb(global.mr2,global.mg2,global.mb2))

    }

if cycling = 1{

    mh = color_get_hue(make_color_rgb(global.mr2,global.mg2,global.mb2))

    ms = color_get_saturation(make_color_rgb(global.mr2,global.mg2,global.mb2))

    mv = color_get_value(make_color_rgb(global.mr2,global.mg2,global.mb2))

    //

    mh2 = color_get_hue(make_color_rgb(255,255,255))

    ms2 = color_get_saturation(make_color_rgb(255,255,255))

    mv2 = color_get_value(make_color_rgb(255,255,255))

    }

if cycling = 2{

    mh = color_get_hue(make_color_rgb(255,255,255))

    ms = color_get_saturation(make_color_rgb(255,255,255))

    mv = color_get_value(make_color_rgb(255,255,255))

    //

    mh2 = color_get_hue(make_color_rgb(global.mr,global.mg,global.mb))

    ms2 = color_get_saturation(make_color_rgb(global.mr,global.mg,global.mb))

    if global.rand = 0{mv2 = color_get_value(make_color_rgb(global.mr,global.mg,global.mb));}else{mv2 = 255}

}




