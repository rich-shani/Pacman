if ((global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0)){}else{if ignore = 0 and pressed = 0{
if quit = 1{
sound_play(snd_Fruit);
ini_open("highscores.ini");
ini_write_real("highscores", "pacscore", global.pacscore);
ini_write_real("highscores", "mspacscore", global.mspacscore);
ini_write_real("highscores", "jrpacscore", global.jrpacscore);
ini_write_real("highscores", "pacplusscore", global.pacplusscore);
ini_write_real("highscores", "mspacplusscore", global.mspacplusscore);
ini_write_real("highscores", "jrpacplusscore", global.jrpacplusscore);
ini_write_real("highscores", "pacrandscore", global.pacrandscore);
ini_write_real("highscores", "mspacrandscore", global.mspacrandscore);
ini_write_real("highscores", "jrpacrandscore", global.jrpacrandscore);
ini_write_real("highscores", "pacplusrandscore", global.pacplusrandscore);
ini_write_real("highscores", "mspacplusrandscore", global.mspacplusrandscore);
ini_write_real("highscores", "jrpacplusrandscore", global.jrpacplusrandscore);
ini_write_real("highscores", "hanglyscore", global.hanglyscore);
ini_write_real("highscores", "newscore", global.newscore);
ini_write_real("highscores", "ultrascore", global.ultrascore);
ini_write_real("highscores", "mspmpscore", global.mspmpscore);
ini_write_real("highscores", "pacjrscore", global.pacjrscore);
ini_write_real("highscores", "strangescore", global.strangescore);
ini_write_real("highscores", "hanglyplusscore", global.hanglyplusscore);
ini_write_real("highscores", "newplusscore", global.newplusscore);
ini_write_real("highscores", "ultraplusscore", global.ultraplusscore);
ini_write_real("highscores", "mspmpplusscore", global.mspmpplusscore);
ini_write_real("highscores", "pacjrplusscore", global.pacjrplusscore);
ini_write_real("highscores", "strangeplusscore", global.strangeplusscore);
ini_write_real("highscores", "extendedscore", global.extendedscore);
ini_write_real("highscores", "c64score", global.c64score);
ini_write_real("highscores", "a2600score", global.a2600score);
ini_write_real("highscores", "extendedplusscore", global.extendedplusscore);
ini_write_real("highscores", "c64plusscore", global.c64plusscore);
ini_write_real("highscores", "a2600plusscore", global.a2600plusscore);
ini_write_real("highscores", "champscore", global.champscore);
ini_write_real("highscores", "champplusscore", global.champplusscore);
ini_write_real("highscores", "arrscore", global.arrscore);
ini_write_real("highscores", "arrplusscore", global.arrplusscore);
ini_write_real("highscores", "bleachscore", global.bleachscore);
ini_write_real("highscores", "bleachplusscore", global.bleachplusscore);
ini_close();
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
if global.credit = 0{global.lvl = 0; global.p1lives = 0; room_goto(rm_Title)};
else{room_goto(rm_Menu);}
}
if global.lvl > 0{
if quit = 0{
pause = pause + 1; if pause = 2{pause = 0}
if pause = 1{
pressed = 1; alarm[0] = 1;
}
if pause = 0{
__background_set( e__BG.Alpha, 0, 0 );
instance_activate_all()
ambience = -1;
with Wall{
if image_index = 18 and ((y = room_height - 48) or (room_height = 960 and y = room_height - 64)){
tile_set_alpha(tile_layer_find(depth-1,x,y+8),1);
tile_set_alpha(tile_layer_find(depth,x,y),1);
}
else{
if global.game = 2 and y = Blinky.ystart + 16 and x > Blinky.xstart - 17 and x < Blinky.xstart + 17{}else{
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{}else{
tile_set_alpha(tile_layer_find(depth-1,x+(extra*8),y),1);
}}
if global.game < 2 and y = (Blinky.ystart - 224)+240 and x > (Blinky.xstart - 216)+207 and x < (Blinky.xstart - 216)+225{tile_set_alpha(tile_layer_find(depth,x,y),1)}
else{tile_set_alpha(tile_layer_find(depth,x,y),1)}}
}
with Dot{tile_layer_show(depth);
tile_layer_show(depth+1);
tile_layer_show(depth-1);
}
with Power{tile_set_alpha(tile_layer_find(depth,x,y),1)}
}}}
}}

