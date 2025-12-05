global.mode = 0; global.rand = 0; global.plus = 0; global.players = 0;

global.start = false; global.boost = 0;

scale = 1;

scaleup = 1;

show = 0;

x = -16

y = -8

room_speed = 67.5

im = 0;

im2 = 0;

im3 = 0;

im4 = 2;

press = 0;

if global.game = 0 or global.otto = 1{

    line = 0

    left = 496

    right = 72

    right2 = 72+32

    alarm[0] = 34

    pause = 0

    pausenum = 0

    op = 1

    next = false

    chomp = 0

}

if global.game = 1 and global.otto = 0{

    sprite_index = spr_board; image_speed = 1

    intro = 0;

    alarm[1] = 67.5

    alarm[10] = 1350

    left = 496

    up = 312

}

if global.game = 2{

    sprite_index = spr_river; image_speed = 0.125;

    intro = 0;

    posit = 496

    lefty = true

    up = 400

    left = 496

    scroll = 0

    falling = 128

    bounce = 0

    bounceup = true

    alarm[1] = 67.5

    alarm[10] = 2565

}


