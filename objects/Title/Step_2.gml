if global.game = 1{

    if intro > 0{

        left = left - 2

        if left < 104{up = up - 2}

        if intro = 1{

            if up < 184{intro = intro + 1; left = 496; up = 312;}

        }

    }

    if intro = 2{

        if up < 216{intro = intro + 1; left = 496; up = 312;}

    }

    if intro = 3{

        if up < 248{intro = intro + 1; left = 496; up = 312;}

    }

    if intro = 4{

        if up < 280{intro = intro + 1; left = 496; up = 312;}

    }

    if intro = 5{

        if left < 256{left = 256}

    }

}


