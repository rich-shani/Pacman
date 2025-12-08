/// ===============================================================================
/// PAC STEP_2 - CORNER COMPLETION, MOVEMENT UPDATES, & MISC LOGIC (REFACTORED)
/// ===============================================================================
/// Purpose: Complete corner transitions, handle pause states, manage depth/direction
/// Called: THIRD each frame (after Step_0 and Step_1)
///
/// Responsibilities:
/// 1. Execute support scripts (endstep)
/// 2. Complete corner transitions (8 different corner types)
/// 3. Apply appropriate speed to exiting corners (normal vs fright)
/// 4. Handle pause/suspension states and eating direction
/// 5. Manage level-specific rules (speed, turning, grid snapping)
/// 6. Control instance visibility and deactivation for performance
/// 7. Update game state based on level completion
/// 8. Manage audio playback for ambience
/// 9. Handle plus mode visibility toggling
/// 10. Manage viewport/camera positioning for 2-player modes
/// 11. Update depth and direction target helpers
/// 12. Handle ghost release timing and cycle progression
/// ===============================================================================

script_execute(endstep);

// ===== CORNER COMPLETION LOGIC =====
/// When in a corner transition, snap to grid and apply appropriate speed
if (fright == PAC_FRIGHT.ACTIVE) {
    /// During fright mode - use faster speed
    if (corner == PAC_CORNER.UP_TO_RIGHT_PRE) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.UP_TO_RIGHT_POST) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_UP_PRE) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_UP_POST) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_LEFT_PRE) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_LEFT_POST) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_DOWN_PRE) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_DOWN_POST) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_RIGHT_PRE) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_RIGHT_POST) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_DOWN_PRE) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_DOWN_POST) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.UP_TO_LEFT_PRE) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.UP_TO_LEFT_POST) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -spfright;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_UP_PRE) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_UP_POST) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -spfright;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
}
else {
    /// Normal mode - use standard speed
    if (corner == PAC_CORNER.UP_TO_RIGHT_PRE) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.UP_TO_RIGHT_POST) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_UP_PRE) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_UP_POST) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_LEFT_PRE) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_LEFT_POST) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_DOWN_PRE) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_DOWN_POST) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_RIGHT_PRE) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.DOWN_TO_RIGHT_POST) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_DOWN_PRE) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.RIGHT_TO_DOWN_POST) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.UP_TO_LEFT_PRE) {
        if (y < 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.UP_TO_LEFT_POST) {
        if (y > 16 * (round(y / 16))) {
            y = 16 * (round(y / 16));
            hspeed = -sp;
            vspeed = 0;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_UP_PRE) {
        if (x < 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
    if (corner == PAC_CORNER.LEFT_TO_UP_POST) {
        if (x > 16 * (round(x / 16))) {
            x = 16 * (round(x / 16));
            hspeed = 0;
            vspeed = -sp;
            corner = PAC_CORNER.NONE;
            cornercheck = 0;
            exit;
        }
    }
}

// ===== EATING DIRECTION RECOVERY =====
/// After eating a dot, resume movement in the direction Pac was facing
if (chomp == 0) {
    if (fright == PAC_FRIGHT.ACTIVE) {
        if (pause == 0) {
            if (eatdir == 0) { hspeed = spfright; vspeed = 0; eatdir = -1; }
            if (eatdir == 1) { hspeed = spfright; vspeed = -spfright; eatdir = -1; }
            if (eatdir == 2) { hspeed = 0; vspeed = -spfright; eatdir = -1; }
            if (eatdir == 3) { hspeed = -spfright; vspeed = -spfright; eatdir = -1; }
            if (eatdir == 4) { hspeed = -spfright; vspeed = 0; eatdir = -1; }
            if (eatdir == 5) { hspeed = -spfright; vspeed = spfright; eatdir = -1; }
            if (eatdir == 6) { hspeed = 0; vspeed = spfright; eatdir = -1; }
            if (eatdir == 7) { hspeed = spfright; vspeed = spfright; eatdir = -1; }
            stoppy = 0;
        }
        else {
            pause = pause - 1;
        }
    }
    else {
        if (pause == 0) {
            if (eatdir == 0) { hspeed = sp; vspeed = 0; eatdir = -1; }
            if (eatdir == 1) { hspeed = sp; vspeed = -sp; eatdir = -1; }
            if (eatdir == 2) { hspeed = 0; vspeed = -sp; eatdir = -1; }
            if (eatdir == 3) { hspeed = -sp; vspeed = -sp; eatdir = -1; }
            if (eatdir == 4) { hspeed = -sp; vspeed = 0; eatdir = -1; }
            if (eatdir == 5) { hspeed = -sp; vspeed = sp; eatdir = -1; }
            if (eatdir == 6) { hspeed = 0; vspeed = sp; eatdir = -1; }
            if (eatdir == 7) { hspeed = sp; vspeed = sp; eatdir = -1; }
            stoppy = 0;
        }
        else {
            pause = pause - 1;
        }
    }
}

// ===== INSTANCE ACTIVATION (PERFORMANCE OPTIMIZATION) =====
/// Only activate instances near Pac to improve performance
if (Pauser.pause == 0 && Pac.finish < 1) {

    instance_deactivate_all(true);
    instance_activate_region(Pac.tilex - 32, Pac.tiley - 32, 80, 80, true);
    instance_activate_region(Pac.tilex2 - 32, Pac.tiley2 - 32, 80, 80, true);

    instance_activate_object(Power);
    instance_activate_object(Pauser);
    instance_activate_object(Scroller);
    instance_activate_object(Drawless);

    instance_activate_object(Blinky);
    instance_activate_region(Blinky.tilex - 32, Blinky.tiley - 32, 80, 80, true);

    instance_activate_object(Pinky);
    instance_activate_region(Pinky.tilex - 32, Pinky.tiley - 32, 80, 80, true);

    instance_activate_object(Inky);
    instance_activate_region(Inky.tilex - 32, Inky.tiley - 32, 80, 80, true);

    instance_activate_object(Clyde);
    instance_activate_region(Clyde.tilex - 32, Clyde.tiley - 32, 80, 80, true);

    instance_activate_object(Fruit);
    instance_activate_region(16 * (round(Fruit.x / 16)) - 32, 16 * (round(Fruit.y / 16)) - 32, 80, 80, true);
}
else {
    instance_activate_all();
}

// ===== MENU MOVEMENT LOGIC =====
/// Handle turning and speed in menu/title screen
if (dead == 0) {
    if (global.lvl == 0) {
        if (Pac.chomp == 0) {

            /// Speed management
            if (speed > 0) {
                if (fright == 0) {
                    speed = sp;
                }
                else {
                    speed = spfright;
                }
            }

            /// Menu turning logic
            if (pause == 0 && speed > 0) {
                if (newtile == 1) {

                    if (dir == 0) {
                        if (direction == 0 && x > tilex) { direction = 0; newtile = 0; exit; }
                        if (direction == 90 && y < tiley) { direction = 0; x = tilex + (tiley - y); y = tiley; newtile = 0; exit; }
                        if (direction == 180 && x < tilex) { x = tilex; direction = 0; newtile = 0; exit; }
                        if (direction == 270 && y > tiley) { direction = 0; x = tilex + (y - tiley); y = tiley; newtile = 0; exit; }
                    }

                    if (dir == 1) {
                        if (direction == 0 && x > tilex) { direction = 90; y = tiley - (x - tilex); x = tilex; newtile = 0; exit; }
                        if (direction == 90 && y < tiley) { direction = 90; newtile = 0; exit; }
                        if (direction == 180 && x < tilex) { direction = 90; y = tiley - (tilex - x); x = tilex; newtile = 0; exit; }
                        if (direction == 270 && y > tiley) { y = tiley; direction = 90; newtile = 0; exit; }
                    }

                    if (dir == 2) {
                        if (direction == 0 && x > tilex) { x = tilex; direction = 180; newtile = 0; exit; }
                        if (direction == 90 && y < tiley) { direction = 180; x = tilex - (tiley - y); y = tiley; newtile = 0; exit; }
                        if (direction == 180 && x < tilex) { direction = 180; newtile = 0; exit; }
                        if (direction == 270 && y > tiley) { direction = 180; x = tilex - (y - tiley); y = tiley; newtile = 0; exit; }
                    }

                    if (dir == 3) {
                        if (direction == 0 && x > tilex) { direction = 270; y = tiley + (x - tilex); x = tilex; newtile = 0; exit; }
                        if (direction == 90 && y < tiley) { y = tiley; direction = 270; newtile = 0; exit; }
                        if (direction == 180 && x < tilex) { direction = 270; y = tiley + (tilex - x); x = tilex; newtile = 0; exit; }
                        if (direction == 270 && y > tiley) { direction = 270; newtile = 0; exit; }
                    }

                }
            }

        }
    }
}

// ===== TALL ROOM CAMERA PANNING =====
/// For large rooms, pan camera to game over position
if (dead == 3 && room_width > 448 && ((global.p1lives == 0 && global.p1gameover == 0) || (global.p2lives == 0 && global.p2gameover == 0))) {
    if (room_height == 576) {
        __view_set(e__VW.XView, 0, 2 * round(__view_get(e__VW.XView, 0) / 2));
        x = (__view_get(e__VW.XView, 0) + 224);
        if (__view_get(e__VW.XView, 0) < 208 - (Drawless.c64 * 144)) {
            __view_set(e__VW.XView, 0, __view_get(e__VW.XView, 0) + 2);
        }
        if (__view_get(e__VW.XView, 0) > 208 - (Drawless.c64 * 144)) {
            __view_set(e__VW.XView, 0, __view_get(e__VW.XView, 0) - 2);
        }
    }
}

// ===== LEVEL COMPLETION FREEZE =====
/// When level complete, freeze all movement
if (finish > 0) {
    hspeed = 0;
    vspeed = 0;
    alarm[0] = alarm[0] + 1;
    plus2 = 0;

    with (Blinky) { hspeed = 0; vspeed = 0; }
    with (Pinky) { hspeed = 0; vspeed = 0; }
    with (Inky) { hspeed = 0; vspeed = 0; }
    with (Clyde) { hspeed = 0; vspeed = 0; }
    with (Fruit) { hspeed = 0; vspeed = 0; }
}

// ===== AUDIO MANAGEMENT =====
/// Stop and start audio based on game state
if (global.lvl > 0) {
    if (dead > 0 || finish > 0 || start == 1) {
        sound_stop(Ghost1); sound_stop(Ghost2); sound_stop(Ghost3); sound_stop(Ghost4); sound_stop(Ghost5);
        sound_stop(Blue); sound_stop(Flee);
        sound_stop(MsGhost1); sound_stop(MsGhost2); sound_stop(MsGhost3); sound_stop(MsGhost4); sound_stop(MsGhost5);
        sound_stop(MsBlue); sound_stop(MsFlee);
        sound_stop(JrGhost1); sound_stop(JrGhost2); sound_stop(JrGhost3); sound_stop(JrGhost4); sound_stop(JrGhost5);
        sound_stop(JrBlue); sound_stop(JrFlee);
    }

    if (dead == 0 && finish == 0 && start == 0) {

        /// Update siren level based on dot collection
        if (room_width == 448) {
            /// Classic Pacman room size
            if (siren == 0 && dotcount > 111) { siren = 1; }
            if (siren == 1 && dotcount > 179) { siren = 2; }
            if (siren == 2 && dotcount > 211) { siren = 3; }
            if (siren == 3 && dotcount > 227) { siren = 4; }
        }
        else {
            /// Large room size
            if (siren == 0 && dotcount > 229) { siren = 1; }
            if (siren == 1 && dotcount > 357) { siren = 2; }
            if (siren == 2 && dotcount > 421) { siren = 3; }
            if (siren == 3 && dotcount > 453) { siren = 4; }
        }

        /// Play appropriate audio track
        if (global.game == 0) {
            /// Standard Pacman
            if (Blinky.state == GHOST_STATE.EYES || Pinky.state == GHOST_STATE.EYES || Inky.state == GHOST_STATE.EYES || Clyde.state == GHOST_STATE.EYES) {
                if (ambience != 6) { sound_loop(Flee); ambience = 6; exit; }
            }
            else {
                if (fright == 1) {
                    if (ambience != 5) { sound_loop(Blue); ambience = 5; exit; }
                }
                else {
                    if (siren == 4) { if (ambience != 4) { sound_loop(Ghost5); ambience = 4; exit; } }
                    else if (siren == 3) { if (ambience != 3) { sound_loop(Ghost4); ambience = 3; exit; } }
                    else if (siren == 2) { if (ambience != 2) { sound_loop(Ghost3); ambience = 2; exit; } }
                    else if (siren == 1) { if (ambience != 1) { sound_loop(Ghost2); ambience = 1; exit; } }
                    else { if (ambience != 0) { sound_loop(Ghost1); ambience = 0; exit; } }
                }
            }
        }

        if (global.game == 1) {
            /// Ms. Pacman
            if (global.otto == 0 && (Blinky.state == GHOST_STATE.EYES || Pinky.state == GHOST_STATE.EYES || Inky.state == GHOST_STATE.EYES || Clyde.state == GHOST_STATE.EYES)) {
                if (ambience != 6) { sound_loop(MsFlee); ambience = 6; exit; }
            }
            else {
                if (fright == 1) {
                    if (ambience != 5) { sound_loop(MsBlue); ambience = 5; exit; }
                }
                else {
                    if (siren == 4) { if (ambience != 4) { sound_loop(MsGhost5); ambience = 4; exit; } }
                    else if (siren == 3) { if (ambience != 3) { sound_loop(MsGhost4); ambience = 3; exit; } }
                    else if (siren == 2) { if (ambience != 2) { sound_loop(MsGhost3); ambience = 2; exit; } }
                    else if (siren == 1) { if (ambience != 1) { sound_loop(MsGhost2); ambience = 1; exit; } }
                    else { if (ambience != 0) { sound_loop(MsGhost1); ambience = 0; exit; } }
                }
            }
        }

        if (global.game == 2) {
            /// Jr. Pacman
            if (Blinky.state == GHOST_STATE.EYES || Pinky.state == GHOST_STATE.EYES || Inky.state == GHOST_STATE.EYES || Clyde.state == GHOST_STATE.EYES) {
                if (ambience != 6) { sound_loop(JrFlee); ambience = 6; exit; }
            }
            else {
                if (fright == 1) {
                    if (ambience != 5) { sound_loop(JrBlue); ambience = 5; exit; }
                }
                else {
                    if (siren == 4) { if (ambience != 4) { sound_loop(JrGhost5); ambience = 4; exit; } }
                    else if (siren == 3) { if (ambience != 3) { sound_loop(JrGhost4); ambience = 3; exit; } }
                    else if (siren == 2) { if (ambience != 2) { sound_loop(JrGhost3); ambience = 2; exit; } }
                    else if (siren == 1) { if (ambience != 1) { sound_loop(JrGhost2); ambience = 1; exit; } }
                    else { if (ambience != 0) { sound_loop(JrGhost1); ambience = 0; exit; } }
                }
            }
        }
    }
}

// ===== PLUS MODE VISIBILITY =====
if (plus2 == 1 && Drawless.plus2 == 0) {
    instance_activate_object(Wall);
    instance_activate_object(Dot);
    tile_layer_hide(Wall.depth);
    tile_layer_hide(Wall.depth - 1);
    tile_layer_hide(Dot.depth);
    tile_layer_hide(Dot.depth - 1);
    tile_layer_hide(Dot.depth + 1);
    Drawless.plus2 = 1;
}

if (plus2 == 0 && Drawless.plus2 == 1) {
    instance_activate_object(Wall);
    instance_activate_object(Dot);
    tile_layer_show(Wall.depth);
    tile_layer_show(Wall.depth - 1);
    tile_layer_show(Dot.depth);
    tile_layer_show(Dot.depth - 1);
    tile_layer_show(Dot.depth + 1);
    Drawless.plus2 = 0;
}

// ===== DEPTH & TARGET HELPERS =====
if (fright == 1) { depth = 99; }
else { depth = 104; }

/// Target display position for debugging
if (dir == 0) { xdir = 32; ydir = 0; }
if (dir == 1) { xdir = -32; ydir = -32; }
if (dir == 2) { xdir = -32; ydir = 0; }
if (dir == 3) { xdir = 0; ydir = 32; }

// ===== GHOST RELEASE TIMING =====
if (dead == 0 && start == 0) {
    if (timer > 0) { timer = timer - 1; }

    if (timer == 0) {
        if (Pinky.housestate == 1) {
            with (Pinky) {
                if (y > (ystart - 272) + 270 && y < (ystart - 272) + 274) {
                    y = (ystart - 272) + 272;
                    housestate = 2;
                    Pac.psig = 0;
                    Pac.timer = Pac.timerstart;
                }
            }
        }
        else {
            if (Inky.housestate == 2) {
                with (Inky) {
                    if (y > (ystart - 272) + 270 && y < (ystart - 272) + 274) {
                        y = (ystart - 272) + 272;
                        housestate = 3;
                        Pac.isig = 0;
                        Pac.timer = Pac.timerstart;
                    }
                }
            }
            else {
                if (Clyde.housestate == 2) {
                    with (Clyde) {
                        if (y > (ystart - 272) + 270 && y < (ystart - 272) + 274) {
                            y = (ystart - 272) + 272;
                            housestate = 3;
                            Pac.csig = 0;
                            Pac.timer = Pac.timerstart;
                        }
                    }
                }
            }
        }
    }
}

/// Pause fright cycle timer during fright mode
if (fright == 1) { alarm[1] = alarm[1] + 1; }
