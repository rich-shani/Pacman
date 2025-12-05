global.p1lives = 4; if global.players = 0{global.credit = global.credit - 1; global.p2gameover = 1};else{global.p2lives = 4; global.credit = global.credit - 2}
if global.rand = 0{
if global.game = 0{
    script_execute(mazer)
}
if global.game = 1{
    if keyboard_check(vk_down) = true{global.otto = 1};
    script_execute(mazer)
}
if global.game = 2{
    script_execute(mazer)
}
}
else{
if global.game = 1 and keyboard_check(vk_down) = true{global.otto = 1};
script_execute(maze_picker);
}

