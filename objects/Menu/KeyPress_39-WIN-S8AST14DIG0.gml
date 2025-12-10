if set = 0{
global.game = global.game + 1; if global.game = 2{global.game = 0}
if global.game = 0{sound_play(Dot0)}
if global.game = 1{sound_play(MsDot)}
global.mode = 0; global.rand = 0; global.lvl = 0;
}
if set = 3{
if global.game = 0{
if global.lvl < 12{if global.lvl < 2{global.lvl = global.lvl + 1};else{global.lvl = global.lvl + 2}; sound_play(JrDot2)}
else{global.lvl = 0; sound_play(JrDot2)}
}
if global.game = 1{
if global.lvl < 7{global.lvl = global.lvl + 1; sound_play(JrDot2)}
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

