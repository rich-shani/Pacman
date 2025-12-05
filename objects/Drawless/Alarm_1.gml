alarm[1] = 10

cycling = cycling + 1; if cycling = 3{cycling = 0}


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




instance_activate_region(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+448,__view_get( e__VW.YView, 0 )+576,true);

if blink = 0{

with Wall{

if instance_exists(Blinky) and global.game = 2 and y = Blinky.y + 16 and x > Blinky.x - 17 and x < Blinky.x + 17{}else{

if instance_exists(Blinky) and global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{}else{

tile_set_blend(tile_layer_find(depth-1,x,y),make_color_hsv(Drawless.mh,Drawless.ms,Drawless.mv));

}} 

if instance_exists(Blinky) and global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{tile_set_blend(tile_layer_find(depth,x,y),make_color_rgb(255,183,255))}

else{tile_set_blend(tile_layer_find(depth,x,y),make_color_hsv(Drawless.mh2,Drawless.ms2,Drawless.mv2))}

}

}

//wall_depth = 199;

//wall_depth (2) = 200;


