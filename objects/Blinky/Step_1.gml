event_inherited();

///// ===== ANIMATION =====
//// Cycle animation frames: 0 → 15 → 0 (loop over 16 frames for sprite animation)
//im = im + 1;
//if (im >= 16) {
//    im = 0;
//}

///// ===== FRIGHTENED STATE FLASHING =====
//// When Pac eats a power pellet, Blinky flashes in a specific pattern
//// The flash effect creates visibility on/off cycles during the frightened duration
//var alarm_time = Pac.alarm[0];

//if (alarm_time > 120) {
//    flash = 0;  // Solid (first phase of frightened mode)
//} else if (alarm_time <= 120 && alarm_time > 106) {
//    flash = 1;  // Transparent
//} else if (alarm_time <= 106 && alarm_time > 92) {
//    flash = 0;
//} else if (alarm_time <= 92 && alarm_time > 78) {
//    flash = 1;
//} else if (alarm_time <= 78 && alarm_time > 64) {
//    flash = 0;
//} else if (alarm_time <= 64 && alarm_time > 50) {
//    flash = 1;  // Flash frequency increases
//} else if (alarm_time <= 50 && alarm_time > 36) {
//    flash = 0;
//} else if (alarm_time <= 36 && alarm_time > 22) {
//    flash = 1;
//} else if (alarm_time <= 22 && alarm_time > 8) {
//    flash = 0;
//} else if (alarm_time <= 8) {
//    flash = 1;  // Rapid flashing near the end
//}

///// ===== PAC PURSUIT TARGET SELECTION =====
//// Blinky tracks both Pac's current position and "Pac2" position
//// (Pac2 may be Pac's position from previous frame or another tracked position)
//// Select the closer target for pursuit, or randomize if equally distant

//// Convert Pac positions to tile coordinates (16-pixel grid aligned)
//var pac1_tilex = 16 * round(Pac.x / 16);
//var pac1_tiley = 16 * round(Pac.y / 16);
//var pac2_tilex = 16 * round(Pac.x2 / 16);
//var pac2_tiley = 16 * round(Pac.y2 / 16);

//// Calculate Manhattan distances from Blinky's current tile
//var dist_to_pac1 = abs(pac1_tilex - tilex) + abs(pac1_tiley - tiley);
//var dist_to_pac2 = abs(pac2_tilex - tilex) + abs(pac2_tiley - tiley);

//// Choose pursuit target based on distance
//if (dist_to_pac1 == dist_to_pac2) {
//    // Equal distance: randomly choose one to avoid predictability
//    if (irandom(1) == 1) {
//        pursuex = pac2_tilex;
//        pursuey = pac2_tiley;
//    } else {
//        pursuex = pac1_tilex;
//        pursuey = pac1_tiley;
//    }
//} else if (dist_to_pac2 < dist_to_pac1) {
//    // Pac2 is closer
//    pursuex = pac2_tilex;
//    pursuey = pac2_tiley;
//} else {
//    // Pac1 is closer
//    pursuex = pac1_tilex;
//    pursuey = pac1_tiley;
//}

//if (y > 48 and y < room_height - 48) or room = VS7 or room = Piranha{
//if house = 0{
//if Pac.chomp = 0 or state = 2{
//    if newtile = 0{
//        if tilex = (16*(round(x/16))) and tiley = (16*(round(y/16))){}
//        else{
//            newtile = 1; tilex = (16*(round(x/16))); tiley = (16*(round(y/16)));
//            if aboutface = 0{
//                if state = 0{
//                if Pac.scatter = 1{
//                    if Pac.dotcount >= elroydots and (Pac.dotcount >= Pac.csig or Clyde.house = 0){script_execute(chase_object,tilex,tiley,pursuex,pursuey);}
//                    else{
//                        if global.ex1 = 0 and room_width = 448{script_execute(chase_object,tilex,tiley,cornerx,cornery);}
//                        else{script_execute(random_direction);}
//                    }   
//                }
//                else{script_execute(chase_object,tilex,tiley,pursuex,pursuey);}
//                }
//                if state = 1{script_execute(random_direction);}
//                if state = 2{
//                    script_execute(chase_object,tilex,tiley,(xstart-216)+208,(ystart-224)+224);
//                }
//            }
//            else{
//                dir = (direction/90)+2; if dir>3{dir = dir-4}; aboutface = 0;
//            }
//        }
//    }
//}
//}
//}

