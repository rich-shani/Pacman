if state > -1 and Pac.chomp = 0 and Pac.dead = 0 and oGameManager.finish = 0 and oGameManager.start = 0{

    if up = 1{

        if bounce < 2{if global.game = 1{bounce = bounce + (3/4)}; if global.game = 2{bounce = bounce + (1/3)}}

        else{up = 0; bounce = 2; if global.lvl > 0{sound_play(Bump)}}

    }

    if up = 0{

        if bounce > -2{if global.game = 1{bounce = bounce - (1/2)}; if global.game = 2{bounce = bounce - (1/3)}}

        else{up = 1}

    }

}

im = im+1; if im = 16{im = 0}




if state > -1{

if room_width = 448{}else{

    if !collision_point(chasex,chasey,Power,false,true){

        if instance_number(Power) = 0{}else{

            if irandom(2) = 1{chasex = global.p1x; chasey = global.p1y}

            else{

                if irandom(1) = 1{chasex = global.p2x; chasey = global.p2y}

                else{

                    if !collision_point(global.p1x,global.p1y,Power,false,true)

                    and !collision_point((room_width - 16) - global.p1x,global.p1y,Power,false,true)

                    and !collision_point(global.p2x,global.p2y,Power,false,true)

                    and !collision_point((room_width - 16) - global.p2x,global.p2y,Power,false,true){chasex = global.p3x; chasey = global.p3y}

                    else{

                        if irandom(1) = 1{chasex = global.p1x; chasey = global.p1y}

                        else{chasex = global.p2x; chasey = global.p2y}

                    }

                }

            }

            if irandom(1) = 1{chasex = (room_width - 16) - chasex}

        }

    }

}

}


if oGameManager.finish = 0{

if state > -1{

if Pac.chomp = 0{

codir = 0;

if (y > 48 and y < room_height - 48) {

    if newtile = 0{

        if tilex = (16*(round(x/16))) and tiley = (16*(round(y/16))){}

        else{

            newtile = 1; tilex = (16*(round(x/16))); tiley = (16*(round(y/16)));

                if state = 0{

                    if room_width = 448{

                    if room = Strange4{script_execute(chase_object,tilex,tiley,192,512,)};else{

                    if tiley = (Blinky.ystart-224)+224 and tilex>144-1 and tilex<288{script_execute(chase_object,tilex,tiley,288,(Blinky.ystart-224)+224)};

                    else{if tilex = 288 and tiley>(Blinky.ystart-224)+224-1 and tiley<(Blinky.ystart-224)+320{script_execute(chase_object,tilex,tiley,288,(Blinky.ystart-224)+320)};

                    else{if tiley = (Blinky.ystart-224)+320 and tilex>144 and tilex<288+1{script_execute(chase_object,tilex,tiley,144,(Blinky.ystart-224)+320)};

                    else{if tilex = 144 and tiley>(Blinky.ystart-224)+224 and tiley<(Blinky.ystart-224)+320+1{script_execute(chase_object,tilex,tiley,144,(Blinky.ystart-224)+224)};

                    else{script_execute(chase_object,tilex,tiley,216,(Blinky.ystart-224)+272)};

                    }}}}}

                    else{script_execute(random_direction);}

                }

                if state = 1{

                if tilex = c1x and tiley = c1y and !c1dir = dir + 2 and !c1dir = dir - 2{dir = c1dir;}

                else{if tilex = c2x and tiley = c2y and !c2dir = dir + 2 and !c2dir = dir - 2{dir = c2dir;}

                else{if tilex = c3x and tiley = c3y and !c3dir = dir + 2 and !c3dir = dir - 2{dir = c3dir;}

                else{if tilex = c4x and tiley = c4y and !c4dir = dir + 2 and !c4dir = dir - 2{dir = c4dir;}

                else{if tilex = c5x and tiley = c5y and !c5dir = dir + 2 and !c5dir = dir - 2{dir = c5dir;}

                else{if tilex = c6x and tiley = c6y and !c6dir = dir + 2 and !c6dir = dir - 2{dir = c6dir;}

                else{if tilex = c7x and tiley = c7y and !c7dir = dir + 2 and !c7dir = dir - 2{dir = c7dir;}

                else{if tilex = c8x and tiley = c8y and !c8dir = dir + 2 and !c8dir = dir - 2{dir = c8dir;}

                else{

                    script_execute(codir_script)

                    if room_width = 448{

                        if room = JoyMan{if exopt < 2{script_execute(chase_object,tilex,tiley,80,272); exit}; else{script_execute(chase_object,tilex,tiley,352,272); exit}} ///JoyMan Fix

                        if exopt=0{if room = Strange3{script_execute(chase_object,tilex,tiley,-320,208);}

                        else{if room = Champ1{script_execute(chase_object,tilex,tiley,176,32);}

                        else{script_execute(chase_object,tilex,tiley,0,global.ex1);}}}

                        if exopt=1{if room = Strange3{script_execute(chase_object,tilex,tiley,0,304);}

                        else{if room = Champ1{script_execute(chase_object,tilex,tiley,0,352);}

                        else{script_execute(chase_object,tilex,tiley,0,global.ex2);}}}

                        if exopt=2{if room = Strange3{script_execute(chase_object,tilex,tiley,432+320,208);}

                        else{if room = Champ1{script_execute(chase_object,tilex,tiley,256,32);}

                        else{script_execute(chase_object,tilex,tiley,432,global.ex1);}}}

                        if exopt=3{if room = Strange3{script_execute(chase_object,tilex,tiley,432,304);}

                        else{if room = Champ1{script_execute(chase_object,tilex,tiley,432,352);}

                        else{script_execute(chase_object,tilex,tiley,432,global.ex2);}}}

                    }

                    else{

                        if instance_number(Power) = 0{script_execute(random_direction);}

                        else{script_execute(chase_object,tilex,tiley,chasex,chasey);}

                    }

                }}}}}}}}}

            }

        }

    }

}

}

}


