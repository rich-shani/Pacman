image_speed = 0;
smashed = 0;
mh = 0;
ms = 0;
mv = 0;
mh2 = 0;
ms2 = 0;
mv2 = 0;
dh = 0;
ds = 0;
dv = 0;

exit;
mh = color_get_hue(make_color_rgb(global.mr,global.mg,global.mb))
ms = color_get_saturation(make_color_rgb(global.mr,global.mg,global.mb))
if global.rand = 0{mv = color_get_value(make_color_rgb(global.mr,global.mg,global.mb));}else{mv = 255}
//
mh2 = color_get_hue(make_color_rgb(global.mr2,global.mg2,global.mb2))
ms2 = color_get_saturation(make_color_rgb(global.mr2,global.mg2,global.mb2))
mv2 = color_get_value(make_color_rgb(global.mr2,global.mg2,global.mb2))
//
dh = color_get_hue(make_color_rgb(global.dr,global.dg,global.db))
ds = color_get_saturation(make_color_rgb(global.dr,global.dg,global.db))
if global.rand = 0{dv = color_get_value(make_color_rgb(global.dr,global.dg,global.db))}else{dv = 255}

if instance_number(Menu) = 1{
if smashed = 0{draw_sprite_ext(spr_dot,0,x,y,1,1,0,make_color_hsv(dh,ds,dv),1)}
else{
draw_sprite_ext(spr_dot,1,x,y,1,1,0,make_color_hsv(mh,ms,mv),1)
draw_sprite_ext(spr_dot,2,x,y,1,1,0,make_color_hsv(mh2,ms2,mv2),1)
}
}

if instance_number(Menu) = 0{
if smashed = 0{draw_sprite_ext(spr_dot,0,x,y,1,1,0,make_color_hsv(dh-(global.plus*40),ds,dv),1)}
else{
draw_sprite_ext(spr_dot,1,x,y,1,1,0,make_color_hsv(mh-(global.plus*40),ms,mv),1)
draw_sprite_ext(spr_dot,2,x,y,1,1,0,make_color_hsv(mh2-(global.plus*40),ms2,mv2),1)
}
}

