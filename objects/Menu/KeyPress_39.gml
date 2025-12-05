if set = 0{
global.game = global.game + 1; if global.game = 3{global.game = 0}
if global.game = 0{sound_play(Dot0)}
if global.game = 1{sound_play(MsDot)}
if global.game = 2{sound_play(JrDot)}
global.mode = 0; global.rand = 0; global.lvl = 0;
}
if set = 1{
if global.plus = 0{global.plus = 1; sound_play(JrDot2)}else{global.plus = 0; sound_play(JrDot2)}
}
if set = 2{
if global.rand = 1{global.mode = 0; global.rand = 0; sound_play(JrDot2);}
else{
global.mode = global.mode + 1; 
if global.mode = 5{global.mode = 0; global.rand = 1;}///
sound_play(JrDot2);}
}
if set = 3{
if global.game = 0{
if global.lvl < 12{if global.lvl < 2{global.lvl = global.lvl + 1};else{global.lvl = global.lvl + 2}; sound_play(JrDot2)}
else{global.lvl = 0; sound_play(JrDot2)}
}
if global.game > 0{if (global.game = 1 and global.lvl < 7) or (global.game = 2 and global.lvl < 6){global.lvl = global.lvl + 1; sound_play(JrDot2)}
else{global.lvl = 0; sound_play(JrDot2)}
}
}
if set = 4{
///if global.boost = 2{global.boost = 0; sound_play(JrDot2)}else{global.boost = global.boost + 1; sound_play(JrDot2)}
if global.boost = 0{global.boost = 1; sound_play(JrDot2)}; else{global.boost = 0; sound_play(JrDot2)};
}
if set = 5{
if global.players < 2{global.players = global.players + 1; sound_play(Bonk)}else{global.players = 0; sound_play(Bonk)}///CHANGE TO 3 WHEN IMPLEMENTING TURNS
}

