if global.game = 0 or global.otto = 1{if pause = 0{

    if line > 22{

        left = left - 2;

        if left < 72{

            right = right + 2;

            right2 = right2 + 1.111111;

        }

    }

}

if right > right2 and chomp = 0{chomp = 1; right = right2}

if right > right2 + 32 and chomp = 1{chomp = 2; right = right2 + 32}

if right > right2 + 64 and chomp = 2{chomp = 3; right = right2 + 64}

if right > right2 + 96 and chomp = 3{chomp = 4; right = right2 + 96}

if right = right2{

    if pausenum = 0 and pause <= 60{

        pause = pause + 1; op = 0;

        if pause = 60{pausenum = 1; pause = 0; op = 1;}

    }

}

if right = right2 + 32{

    if pausenum = 1 and pause <= 60{

        pause = pause + 1; op = 0;

        if pause = 60{pausenum = 2; pause = 0; op = 1;}

    }

}

if right = right2 + 64{

    if pausenum = 2 and pause <= 60{

        pause = pause + 1; op = 0;

        if pause = 60{pausenum = 3; pause = 0; op = 1;}

    }

}

if right = right2 + 96{

    if pausenum = 3 and pause <= 60{

        pause = pause + 1; op = 0;

        if pause = 60{pausenum = 4; pause = 0; op = 1; next = true}

    }

}}


exit

if scaleup = 1{

    scale = scale + 0.05; if scale = 1.50{scaleup = 0; exit}

}

if scaleup = 0{

    scale = scale - 0.05; if scale = 1.00{scaleup = 1; exit}

}


if global.game = 0 or global.otto = 1{if next = true{

    show = 1; next = false;

    alarm[10] = 360;

}}


