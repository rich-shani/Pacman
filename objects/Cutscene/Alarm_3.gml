if global.lvl = 1{
    yumyumsprite = 1
}
if global.lvl = 3{
    jrpacstate = jrpacstate + 1
    if jrpacstate = 3{
        balloonx = 222
        alarm[3] = 316
        exit
    }
    if jrpacstate = 4{
        alarm[3] = 105
        exit
    }
}
if global.lvl > 3{
    if vis = false{
    if jrpacstate = 5{}else{
        vis = true
        alarm[3] = 85
        exit
    }}
    if vis = true{
    if jrpacstate = 5{}else{
        blinkygo = true
        jrpacstate = 1
        alarm[3] = 1220
    }}
    if jrpacstate = 5{
        vis = false
    }
}

