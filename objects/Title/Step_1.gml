if global.game = 2{

    if intro > 0 and intro < 5{

        if lefty = true{

            if posit>288{

            posit = posit - 1.5

            if posit < 392 and posit > 360{up = up + 0.75}

            }

            else{

            posit = posit - 1

            if posit < 232{lefty = false}

            }

        }

        if lefty = false{

            if posit>288{

            posit = posit + 1.5

            if posit < 392 and posit > 360 and intro < 4{up = up - 0.75}

            if posit > 496{lefty = true; intro = intro + 1}

            }

            else{posit = posit + 1}

        }

    }

    if intro = 4 and lefty = false and posit > 250{left = left - 1}

    if intro > 4{

        if left > 240{left = left - 1}

        else{

            if scroll < 416{

                scroll = scroll + 1

                if scroll > 172 and falling < 336{falling = falling + 1}

                if falling < 336{}else{

                    if bounce = 0{bounceup = true}

                    if bounce = 9{bounceup = false}

                    if bounceup = true{bounce = bounce + 1}

                    else{bounce = bounce - 1}

                }

            }

            else{

                left = left - 1

                if left < 113{

                    if left = 112{bounce = bounce + 4; bounceup = true}

                    if bounce = 0{bounceup = true}

                    if bounce = 8{bounceup = false}

                    if bounceup = true{bounce = bounce + 1}

                    else{bounce = bounce - 1}

                }

            }

        }

    }

}


im = im + 0.4444444444; if im >= 4{im = 0}

im2 = im2 + 0.1111111111; if im2 >= 2{im2 = 0}

im3 = im3 + 0.8888888889; if im3 >= 16{im3 = 0}

im4 = im4 + 0.4444444444; if im4 >= 4{im4 = 0}

global.color = global.color + (16/9); if global.color > 239{global.color = 0};




