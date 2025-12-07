/// ===== GHOST HOUSE LOGIC =====
// Handles Blinky's behavior when in the ghost house and respawning

if (Pac.dead == 0 && Pac.finish == 0) {
    // When in house (state = 2 is eyes returning mode)
    if (house == 1) {
        newtile = 0;
        tilex = (xstart - 216) + 224;
        tiley = (ystart - 224) + 224;
    }

    // Step 1: Eyes reach door and enter house
    if (house == 0 && state == 2) {
        var door_x = (xstart - 216) + 216;
        var door_y = (ystart - 224) + 224;

        if (x > (xstart - 216) + 212 && x < (xstart - 216) + 220 && y == door_y) {
            housestate = 0;
            x = door_x;
            y = door_y;
            hspeed = 0;
            vspeed = speyes;
            house = 1;
            dir = 3;  // Face down
        }
    }

    // Step 2: Blinky moves down inside house until reaching bottom
    if (house == 1 && state == 2) {
        var house_bottom = (ystart - 224) + 272 + 8;
        var house_center_x = (xstart - 216) + 216;

        if (x == house_center_x && y >= house_bottom) {
            housestate = 1;
            x = house_center_x;
            y = house_bottom;
            hspeed = 0;
            vspeed = -spslow;
            state = 0;  // Return to chase mode
            dir = 1;    // Face up
        }
    }

    // Step 3: While housestate = 1, slowly move up
    if (housestate == 1) {
        hspeed = 0;
        vspeed = -spslow;
    }

    // Step 4: Exit house when ready (state < 2 means chase/scatter mode)
    var house_door_y = (ystart - 224) + 224;
    if (house == 1 && state < 2 && x == (xstart - 216) + 216 && y < house_door_y) {
        housestate = 0;
        x = (xstart - 216) + 216;
        y = house_door_y;
        hspeed = -sp;     // Start moving left
        vspeed = 0;
        house = 0;        // Released to maze
        newtile = 0;
        dir = 2;          // Face left
    }
}

/// ===== SPEED & MOVEMENT CONTROL =====

if (Pac.dead == 0 && Pac.finish == 0) {
    // Only adjust speed when ghost is free (not in house)
    if (house == 0) {
        if (state == 0) {
            // Chase/Scatter mode speed
            if (collision_point(tilex, tiley, Slow, false, true)) {
                speed = spslow;  // Slow tunnel area
            } else {
                // Check for Elroy mode (speed boost when dots are low)
                if (Pac.dotcount >= elroydots2 && (Pac.dotcount >= Pac.csig || Clyde.house == 0)) {
                    speed = spelroy2;  // Maximum elroy speed
                } else if (Pac.dotcount >= elroydots && (Pac.dotcount >= Pac.csig || Clyde.house == 0)) {
                    speed = spelroy;   // Standard elroy speed
                } else {
                    speed = sp;        // Normal pursuit speed
                }
            }
        } else if (state == 1) {
            // Frightened mode speed
            if (collision_point(tilex, tiley, Slow, false, true)) {
                speed = spslow;
            } else {
                speed = spfright;
            }
        } else if (state == 2) {
            // Eyes returning to house
            speed = speyes;
        }
    }

    /// ===== DIRECTION TURNING LOGIC =====
    // When ghost reaches a new tile, pathfinding script sets the desired direction (dir)
    // This code turns the ghost toward that direction if it's possible

    if (Pac.chomp == 0 || state == 2) {
        if (newtile == 1) {
            // Handle turn toward each cardinal direction
            // (dir: 0=right, 1=up, 2=left, 3=down)

            if (dir == 0) {
                // TURN RIGHT (0°)
                if (direction == 0 && x > tilex) {
                    direction = 0;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    direction = 0;
                    x = tilex + (tiley - y);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    x = tilex;
                    direction = 0;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    direction = 0;
                    x = tilex + (y - tiley);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
            }

            if (dir == 1) {
                // TURN UP (90°)
                if (direction == 0 && x > tilex) {
                    direction = 90;
                    y = tiley - (x - tilex);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    direction = 90;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    direction = 90;
                    y = tiley - (tilex - x);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    y = tiley;
                    direction = 90;
                    newtile = 0;
                    exit;
                }
            }

            if (dir == 2) {
                // TURN LEFT (180°)
                if (direction == 0 && x > tilex) {
                    x = tilex;
                    direction = 180;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    direction = 180;
                    x = tilex - (tiley - y);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    direction = 180;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    direction = 180;
                    x = tilex - (y - tiley);
                    y = tiley;
                    newtile = 0;
                    exit;
                }
            }

            if (dir == 3) {
                // TURN DOWN (270°)
                if (direction == 0 && x > tilex) {
                    direction = 270;
                    y = tiley + (x - tilex);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 90 && y < tiley) {
                    y = tiley;
                    direction = 270;
                    newtile = 0;
                    exit;
                }
                if (direction == 180 && x < tilex) {
                    direction = 270;
                    y = tiley + (tilex - x);
                    x = tilex;
                    newtile = 0;
                    exit;
                }
                if (direction == 270 && y > tiley) {
                    direction = 270;
                    newtile = 0;
                    exit;
                }
            }
        }
    }
}

/// ===== TUNNEL WRAPPING & EDGE DETECTION =====

// For larger rooms with scrolling (scrolling stages)
if (room_width > 448) {
    if (house == 0) {
        // Force about-face when Blinky reaches left edge while moving left
        var view_x = __view_get(e__VW.XView, 0);
        if (x < view_x - 32 && x > view_x - 40 && dir == 2) {
            aboutface = 1;
        }
        // Force about-face when Blinky reaches right edge while moving right
        if (x > view_x + 480 && x < view_x + 488 && dir == 0) {
            aboutface = 1;
        }
    }
}

// For tall rooms (double height stages)
if (room_height == 960) {
    if (house == 0) {
        // Force about-face at top edge while moving up
        var view_y = __view_get(e__VW.YView, 0);
        if (y < view_y + 16 && y > view_y + 8 && dir == 1) {
            aboutface = 1;
        }
        // Force about-face at bottom edge while moving down
        if (y > view_y + 560 - 32 && y < view_y + 568 - 32 && dir == 3) {
            aboutface = 1;
        }
    }
}

/// ===== ELROY MODE STATE TRACKING =====
// Track which Elroy level the ghost is in for visual/audio feedback
if (Pac.dotcount >= elroydots2 && Pac.dotcount >= Pac.csig) {
    elroy = 2;  // Maximum elroy
} else if (Pac.dotcount >= elroydots && Pac.dotcount >= Pac.csig) {
    elroy = 1;  // Standard elroy
} else {
    elroy = 0;  // Normal mode
}

/// ===== VISIBILITY IN FRIGHTENED MODE =====
// Keep ghost visible except during the flashing effect near end of frightened mode
if (state == 1) {
    // When < 121 frames remain in frightened mode, apply flash visibility
    if (Pac.alarm[0] < 121) {
        visible = true;  // Will be toggled by flash variable in Draw_0
    }
} else {
    visible = true;
}

/// ===== VERTICAL TUNNEL WRAPPING =====
// Handle wrapping through top/bottom of maze
if (direction == 90 && y < 32) {
    // Moving up and went past top: wrap to bottom
    y = 544;
    tiley = 16 * round(y / 16);
}
if (direction == 270 && y > room_height - 32) {
    // Moving down and went past bottom: wrap to top
    y = 32;
    tiley = 16 * round(y / 16);
}
