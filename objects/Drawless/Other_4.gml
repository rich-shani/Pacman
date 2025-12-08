cycling = 0;

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

dh = color_get_hue(make_color_rgb(global.dr,global.dg,global.db))

ds = color_get_saturation(make_color_rgb(global.dr,global.dg,global.db))

if global.rand = 0{dv = color_get_value(make_color_rgb(global.dr,global.dg,global.db))}else{dv = 255}

if instance_number(Menu) = 0{

mh = mh -(global.plus*48)

mh2 = mh2 -(global.plus*48)

dh = dh -(global.plus*48)

}


with Wall{

if id = 314469{

tile_add(tile1,20*16,0,16,16,x,y-8,depth-1); tile_set_blend(tile_layer_find(depth-1,x,y-8),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));

tile_add(tile2,29*16,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2));

}

else{

if image_index = 18 and ((y = room_height - 48) or (room_height = 960 and y = room_height - 64)){

tile_add(tile1,18*16,0,16,16,x,y+8,depth-1); tile_set_blend(tile_layer_find(depth-1,x,y+8),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));

tile_add(tile2,29*16,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2));

}

else{

if y = 48 and image_index = 20{

tile_add(tile1,20*16,0,16,16,x,y-8,depth-1); tile_set_blend(tile_layer_find(depth-1,x,y-8),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));

tile_add(tile2,29*16,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2));

}

else{

if instance_exists(Blinky) and global.game = 2 and y = Blinky.ystart + 16 and x > Blinky.xstart - 17 and x < Blinky.xstart + 17{}else{

if instance_exists(Blinky) and global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{}else{

tile_add(tile1,((image_index*16)-(abs(extra*16)*11)+(extra*16)),0,16,16,x+(extra*8),y,depth-1); tile_set_blend(tile_layer_find(depth-1,x+(extra*8),y),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));

}}

tile_add(tile2,image_index*16,0,16,16,x,y,depth); 

if instance_exists(Blinky) and global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{tile_set_blend(tile_layer_find(depth,x,y),make_color_rgb(255,183,255))}

else{tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2))}}

}

}

}

with Dot{tile_add(tile3,0,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.dh,Drawless.ds,Drawless.dv))

}

with Power{

tile_add(tile3,16,0,16,16,x,y,depth); tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.dh,Drawless.ds,Drawless.dv))

}

//wall_depth = 199;

//wall_depth (2) = 200;

//dot_depth = 201;


