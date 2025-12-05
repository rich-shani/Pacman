__background_set( e__BG.Index, 0, background_create_from_screen(0,0,448,576,false,false) ); __background_set( e__BG.Alpha, 0, 0.25 );
with Drawless{
///
with Wall{
if image_index = 18 and ((y = room_height - 48) or (room_height = 960 and y = room_height - 64)){
tile_set_alpha(tile_layer_find(depth-1,x,y+8),0);
tile_set_alpha(tile_layer_find(depth,x,y),0);
}
else{
if global.game = 2 and y = Blinky.ystart + 16 and x > Blinky.xstart - 17 and x < Blinky.xstart + 17{}else{
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{}else{
tile_set_alpha(tile_layer_find(depth-1,x+(extra*8),y),0);
}}
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{tile_set_alpha(tile_layer_find(depth,x,y),0)}
else{tile_set_alpha(tile_layer_find(depth,x,y),0)}}
}
with Dot{tile_layer_hide(depth);
tile_layer_hide(depth+1);
tile_layer_hide(depth-1);
}
with Power{tile_set_alpha(tile_layer_find(depth,x,y),0)}
///
}
pressed = 0;
instance_deactivate_all(true)
sound_stop(Start);
sound_stop(MsStart);
sound_stop(JrStart);
sound_stop(Ghost1);
sound_stop(Ghost2);
sound_stop(Ghost3);
sound_stop(Ghost4);
sound_stop(Ghost5);
sound_stop(Blue);
sound_stop(Flee);
sound_stop(MsGhost1);
sound_stop(MsGhost2);
sound_stop(MsGhost3);
sound_stop(MsGhost4);
sound_stop(MsGhost5);
sound_stop(MsBlue);
sound_stop(MsFlee);
sound_stop(JrGhost1);
sound_stop(JrGhost2);
sound_stop(JrGhost3);
sound_stop(JrGhost4);
sound_stop(JrGhost5);
sound_stop(JrBlue);
sound_stop(JrFlee);

