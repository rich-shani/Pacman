sound_stop(Int)

sound_stop(MsInt1)

sound_stop(MsInt2)

sound_stop(MsInt3)

sound_stop(JrInt1)

sound_stop(JrInt2)

sound_stop(JrInt3)

if global.rand = 0{

if global.game = 0{

    script_execute(mazer)

}

if global.game = 1{

    script_execute(mazer)

}

if global.game = 2{

    script_execute(mazer)

}

}

else{

if global.game = 0{

script_execute(maze_picker);

}

if global.game = 1{

script_execute(maze_picker);

}

if global.game = 2{

script_execute(maze_picker);

}

}


