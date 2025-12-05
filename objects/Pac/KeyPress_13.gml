if ((global.p1lives = 0 and global.p1gameover = 0) or (global.p2lives = 0 and global.p2gameover = 0)) and global.lvl > 0 and countdown > -1{
    if global.credit > 0{
    if global.p1lives = 0 and global.p1gameover = 0{global.p1lives = 4; global.p1score = 0;}; if global.p2lives = 0 and global.p2gameover = 0{global.p2lives = 4; global.p2score = 0;}; alarm[11] = 1; global.credit = global.credit - 1; countdown = 10;
    ////trying to fix that starting bug
        hspeed2 = 0; vspeed2 = 0; dir = 2; dir2 = 0; newtile = 0; newtile2 = 0; bonked = 0; bonked2 = 0;
        if global.players > 0 and global.players < 3 and global.p1lives > 0 and global.p2lives > 0{
        x = xstart - 16; y = ystart;
        x2 = xstart + 16; y2 = ystart;
        }
        else{
            if global.p1lives > 0{x = xstart; y = ystart; x2 = -5000; y2 = ystart}
            else{x2 = xstart; y2 = ystart; x = -5000; y = ystart}
        }
    blink = 0; alarm[8] = 14; Pauser.ignore = 1;
    }
    else{
    alarm[11] = 1;
    }
}

