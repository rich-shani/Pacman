if global.game = 0{
    left = left - 2
    if global.lvl = 2{
        left2 = left2 - 2.15
        right = right + 1.5
        right2 = right2 + 2.5
    }
    if global.lvl = 5{
        if left2 > 272{
            left2 = left2 -2
        }
        else{
            if left2 = 240{}else{
                left2 = left2 - 0.25
            }
        }
    }
    if global.lvl > 5{
        left2 = left2 - 2
        right2 = right2 + 2.5
    }
}

