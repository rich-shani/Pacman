if global.game = 0{
sound_loop(Int)
}
if global.game = 1{
if global.lvl = 2{sound_play(MsInt1)}
if global.lvl = 5{sound_play(MsInt2)}
if global.lvl > 5{sound_play(MsInt3)}
}
if global.game = 2{
if global.lvl = 1{sound_play(JrInt1)}
if global.lvl = 3{sound_play(JrInt2)}
if global.lvl > 3{sound_play(JrInt3)}
}

