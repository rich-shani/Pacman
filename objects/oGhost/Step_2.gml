/// ===============================================================================
/// oGHOST - BASE GHOST OBJECT - STEP_2 EVENT (MOVEMENT & TURNING)
/// ===============================================================================
/// Purpose: Handle movement, turning, house logic, and speed management
/// Called: Every frame (third step event, after Step_0 and Step_1)
/// Parent: oGhost
///
/// This is the MOST COMPLEX event, handling:
/// 1. House state machine (getting out of ghost house)
/// 2. Speed determination (based on state and position)
/// 3. Turning at intersections (pathfinding to target)
/// 4. Wraparound handling (tunnel teleport)
/// 5. Elroy mode (faster pursuit when dots low)
/// 6. Direction reversal (for power pellet)
///
/// Structure: House logic → Speed → Turning → Special checks → Visibility
/// ===============================================================================

// ===== HOUSE STATE MACHINE =====
/// Handle ghost inside house (bouncing/moving to exit)
/// Different ghosts have different house exit logic
/// Blinky: Simple vertical bounce
/// Pinky: Dot-counting before exit
/// Inky: Complex multi-state exit (housestate 0-4)
/// Clyde: Complex multi-state exit (housestate 0-4)

if Pac.dead == 0 and Pac.finish == 0 {

    // ===== HOUSE: UPDATE TILE POSITION WHEN INSIDE =====
    if (house == 1) {
        // Ghost is in house: update tile position to grid align
        tilex = (xstart - 216) + 224;
        tiley = (ystart - 224) + 224;
    }

    // ===== HOUSE: TRANSITION FROM EYES TO HOUSE =====
    /// When ghost eyes reach house entrance, enter house
    if (house == 0 && state == GHOST_STATE.EYES &&
        x > (xstart - 216) + 212 && x < (xstart - 216) + 220 &&
        y == (ystart - 224) + 224) {
        // Eyes reached house entrance, entering house
        housestate = 0;
        x = (xstart - 216) + 216;
        y = (ystart - 224) + 224;
        hspeed = 0;
        vspeed = speyes;
        house = 1;
        dir = GHOST_DIRECTION.DOWN;  // Face down in house
    }

    // ===== HOUSE: PHASE 1 (Bounce down) =====
    /// Ghost bounces down inside house
    if (house == 1 && state == GHOST_STATE.EYES &&
        x == (xstart - 216) + 216 && y > (ystart - 224) + 272 + 8) {
        // Reached bottom of house bounce
        housestate = 1;
        x = (xstart - 216) + 216;
        y = (ystart - 224) + 272 + 8;
        hspeed = 0;
        vspeed = -spslow;
        state = GHOST_STATE.CHASE;  // Resume normal behavior
        dir = GHOST_DIRECTION.UP;   // Face up to exit
    }

    // ===== HOUSE: PHASE 2 (Move up to exit) =====
    /// Ghost moves up through house to reach exit
    if (housestate == 1) {
        hspeed = 0;
        vspeed = -spslow;
    }

    // ===== HOUSE: COMPLETE EXIT =====
    /// Ghost reaches top of house and exits
    if (house == 1 && state < GHOST_STATE.EYES &&  // Eyes are still transitioning
        x == (xstart - 216) + 216 && y < (ystart - 224) + 224) {
        // Fully exited house
        housestate = 0;
        x = (xstart - 216) + 216;
        y = (ystart - 224) + 224;
        hspeed = -sp;
        vspeed = 0;
        house = 0;  // Now free to roam
        newtile = 0;
        dir = GHOST_DIRECTION.LEFT;  // Face left to start moving
    }

}  // End Pac alive check

// ===== SPEED DETERMINATION =====
/// Calculate movement speed based on state and location
if Pac.dead == 0 and Pac.finish == 0 {

    if (house == 0) {
        /// Ghost is free (not in house)

        // Check if in slow area (tunnel or special zone)
        var _in_slow_area = collision_point(tilex, tiley, Slow, false, true);

        if (state == GHOST_STATE.CHASE) {
            /// Chase mode: normal speed or Elroy (faster when dots low)
            if (_in_slow_area) {
                speed = spslow;
            } else {
                // Check Elroy thresholds (dots remaining)
                if (Pac.dotcount >= elroydots2 && (Pac.dotcount >= Pac.csig || Clyde.house == 0)) {
                    speed = spelroy2;  // Elroy mode 2 (fastest)
                } else if (Pac.dotcount >= elroydots && (Pac.dotcount >= Pac.csig || Clyde.house == 0)) {
                    speed = spelroy;   // Elroy mode 1 (faster)
                } else {
                    speed = sp;        // Normal speed
                }
            }
        }
        else if (state == GHOST_STATE.FRIGHTENED) {
            /// Frightened mode: slower speed
            if (_in_slow_area) {
                speed = spslow;
            } else {
                speed = spfright;
            }
        }
        else if (state == GHOST_STATE.EYES) {
            /// Eyes mode: very fast return speed
            speed = speyes;
        }
    }

}  // End Pac alive check

// ===== TURNING AT INTERSECTIONS =====
/// When ghost reaches new tile, decide which direction to turn
/// This is pathfinding logic that uses chase_object() script
///
/// Chase script determines best direction based on:
/// - Target position (pursuex, pursuey)
/// - Current position (tilex, tiley)
/// - Distance to target
/// - Available directions (checking walls)

if Pac.dead == 0 and Pac.finish == 0 {

    if (Pac.chomp == 0 || state == GHOST_STATE.EYES) {
        /// Turn only when Pac is not eating (not paused) OR in eyes mode
        /// This keeps ghost movement smooth when Pac is moving

        if (newtile == 1) {
            /// Ghost reached a new tile: time to make turning decision

            /// ===== DIRECTION-SPECIFIC TURNING LOGIC =====
            /// For each cardinal direction (0-3), determine if ghost
            /// can continue straight or should turn
            ///
            /// Pattern for each direction:
            /// - Check if current movement direction is aligned
            /// - If yes, continue straight (no turn needed)
            /// - If no, check perpendicular directions
            /// - Apply offsets to keep ghost on grid

            if (dir == GHOST_DIRECTION.RIGHT) {
                /// Moving right (dir=0)
                if (direction == 0 && x > tilex) {
                    // Continue right
                    direction = 0;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    // Turn up
                    direction = 0;
                    x = tilex + (tiley - y);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    // Turn left
                    x = tilex;
                    direction = 0;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    // Turn down
                    direction = 0;
                    x = tilex + (y - tiley);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
            }

            if (dir == GHOST_DIRECTION.UP) {
                /// Moving up (dir=1)
                if (direction == 0 && x > tilex) {
                    // Turn right
                    direction = 90;
                    y = tiley - (x - tilex);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    // Continue up
                    direction = 90;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    // Turn left
                    direction = 90;
                    y = tiley - (tilex - x);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    // Turn down
                    y = tiley;
                    direction = 90;
                    newtile = 0;
                    exit;
                }
            }

            if (dir == GHOST_DIRECTION.LEFT) {
                /// Moving left (dir=2)
                if (direction == 0 && x > tilex) {
                    // Turn right
                    x = tilex;
                    direction = 180;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    // Turn up
                    direction = 180;
                    x = tilex - (tiley - y);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    // Continue left
                    direction = 180;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    // Turn down
                    direction = 180;
                    x = tilex - (y - tiley);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
            }

            if (dir == GHOST_DIRECTION.DOWN) {
                /// Moving down (dir=3)
                if (direction == 0 && x > tilex) {
                    // Turn right
                    direction = 270;
                    y = tiley + (x - tilex);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    // Turn up
                    y = tiley;
                    direction = 270;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    // Turn left
                    direction = 270;
                    y = tiley + (tilex - x);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    // Continue down
                    direction = 270;
                    newtile = 0;
                    exit;
                }
            }
        }
    }
}  // End Pac alive check

// ===== SPECIAL WRAPAROUND FOR EXTENDED ROOMS =====
/// Some rooms have special boundaries that trigger about-face
/// This is different from tunnel wraparound (Other_0 event)

if (room_width > 448) {
    if (house == 0) {
        // Extended room: check for forced turnaround at edges
        if (x < __view_get(e__VW.XView, 0) - 32 && x > __view_get(e__VW.XView, 0) - 40 && dir == GHOST_DIRECTION.LEFT) {
            aboutface = 1;  // Force turnaround when reaching left edge
        }
        if (x > __view_get(e__VW.XView, 0) + 480 && x < __view_get(e__VW.XView, 0) + 488 && dir == GHOST_DIRECTION.RIGHT) {
            aboutface = 1;  // Force turnaround when reaching right edge
        }
    }
}

if (room_height == 960) {
    if (house == 0) {
        // Extended tall room: check for forced turnaround at edges
        if (y < __view_get(e__VW.YView, 0) + 16 && y > __view_get(e__VW.YView, 0) + 8 && dir == GHOST_DIRECTION.UP) {
            aboutface = 1;  // Force turnaround when reaching top edge
        }
        if (y > __view_get(e__VW.YView, 0) + 560 - 32 && y < __view_get(e__VW.YView, 0) + 568 - 32 && dir == GHOST_DIRECTION.DOWN) {
            aboutface = 1;  // Force turnaround when reaching bottom edge
        }
    }
}

// ===== ELROY INDICATOR =====
/// Update elroy variable for visual display (red eyes in fast mode)
if (Pac.dotcount >= elroydots2 && Pac.dotcount >= Pac.csig) {
    elroy = 2;  // Elroy mode 2 (fastest)
} else if (Pac.dotcount >= elroydots && Pac.dotcount >= Pac.csig) {
    elroy = 1;  // Elroy mode 1 (faster)
} else {
    elroy = 0;  // Normal speed
}

// ===== VISIBILITY FLASHING (FRIGHTENED MODE) =====
/// Set visibility based on power pellet state
/// Flashing effect is handled in Step_0 event
if (state == GHOST_STATE.FRIGHTENED) {
    if (Pac.alarm[0] < 121) {
        // Near end of power pellet: visible
        visible = true;
    }
} else {
    // Normal state: always visible
    visible = true;
}

// ===== VERTICAL WRAPAROUND =====
/// Rooms can have wraparound at top/bottom (in addition to tunnel wraparound)
if (direction == 90 && y < 32) {
    y = 544;
    tiley = 16 * (round(y / 16));
}
if (direction == 270 && y > room_height - 32) {
    y = 32;
    tiley = 16 * (round(y / 16));
}

/// ===============================================================================
/// END oGHOST STEP_2 EVENT
/// ===============================================================================
