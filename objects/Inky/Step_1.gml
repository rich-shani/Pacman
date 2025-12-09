/// ===============================================================================
/// INKY GHOST - STEP_1 EVENT (TARGET CALCULATION - GEOMETRIC AMBUSH)
/// ===============================================================================
/// Purpose: Calculate Inky's target position using geometric "double vector" strategy
/// Called: Every frame (second step event, after Step_0 animation)
/// Parent: oGhost (inherits base ghost behavior)
///
/// Inky's Personality: "Bashful" - Geometric Ambusher
/// Strategy: Inky uses Blinky's position to calculate a geometric "double vector"
/// Creates triangle geometry: Pac -> Blinky -> Target (extension beyond Blinky)
///
/// Two-Player Support:
/// Inky chooses between Player 1 (Pac) and Player 2 (Mac) based on which
/// target produces a shorter distance from Inky's current position
/// If distances are equal, randomly chooses between players
///
/// Algorithm:
/// 1. Calculate vector from Pac to Blinky (for Player 1)
/// 2. Calculate vector from Mac to Blinky (for Player 2)
/// 3. Extend vector from Blinky in same direction (double the vector)
/// 4. Compare Manhattan distances from Inky to each extended target
/// 5. Choose closer target (or random if equal)
/// 6. Set pursuex/pursuey to chosen target
///
/// Visual Explanation:
///     Pac/Mac -----> Blinky -----> Target (2x vector extension)
///                      ^
///                      |
///                    Inky (calculates which target is closer)
/// ===============================================================================

// ===== ANIMATION UPDATE =====
/// Increment animation frame counter
/// Cycles 0-15 continuously for walking animation
im = im + 1;
if (im == 16) {
    im = 0;  // Wrap back to 0 after reaching 15
}

// ===== FRIGHTENED MODE FLASHING EFFECT =====
/// Handle flashing effect when power pellet is active
/// Flash timing matches original arcade behavior
if (Pac.alarm[0] > 120) {
    flash = 0;  // No flashing when plenty of time remains
}
if (Pac.alarm[0] == 120) {
    flash = 1;  // Start flashing
}
if (Pac.alarm[0] == 106) {
    flash = 0;
}
if (Pac.alarm[0] == 92) {
    flash = 1;
}
if (Pac.alarm[0] == 78) {
    flash = 0;
}
if (Pac.alarm[0] == 64) {
    flash = 1;
}
if (Pac.alarm[0] == 60) {
    flash = 1;
}
if (Pac.alarm[0] == 50) {
    flash = 0;
}
if (Pac.alarm[0] == 36) {
    flash = 1;
}
if (Pac.alarm[0] == 22) {
    flash = 0;
}
if (Pac.alarm[0] == 8) {
    flash = 1;
}
if (Pac.alarm[0] == 0) {
    flash = 0;  // Stop flashing when power pellet expires
}

// ===== TARGET CALCULATION - GEOMETRIC DOUBLE VECTOR =====
/// Calculate target positions using geometric "double vector" algorithm
/// Inky uses Blinky's position as a reference point

/// Calculate Player 1 (Pac) geometric target:
/// 1. Vector from Pac to Blinky: (Blinky.tilex - Pac.tilex, Blinky.tiley - Pac.tiley)
/// 2. Extend vector from Blinky: Blinky + 2 * (Pac -> Blinky vector)
/// This creates a target that is "beyond" Blinky in the direction from Pac to Blinky
var _pac_vec_x = (16 * (round(Pac.x / 16)) + Pac.xdir) - Blinky.tilex;
var _pac_vec_y = (16 * (round(Pac.y / 16)) + Pac.ydir) - Blinky.tiley;
var _pac_target_x = Blinky.tilex + (_pac_vec_x * 2);
var _pac_target_y = Blinky.tiley + (_pac_vec_y * 2);

/// Calculate Player 2 (Mac) geometric target:
/// Same algorithm but using Mac's position instead of Pac's
var _mac_vec_x = (16 * (round(Pac.x2 / 16)) + Pac.xdir2) - Blinky.tilex;
var _mac_vec_y = (16 * (round(Pac.y2 / 16)) + Pac.ydir2) - Blinky.tiley;
var _mac_target_x = Blinky.tilex + (_mac_vec_x * 2);
var _mac_target_y = Blinky.tiley + (_mac_vec_y * 2);

/// Calculate Manhattan distances from Inky to each target
/// Manhattan distance = |x1 - x2| + |y1 - y2|
var _dist_to_pac = abs(_pac_target_x - tilex) + abs(_pac_target_y - tiley);
var _dist_to_mac = abs(_mac_target_x - tilex) + abs(_mac_target_y - tiley);

/// Choose target based on distance
if (_dist_to_pac == _dist_to_mac) {
    /// Equal distances: randomly choose between players
    /// This adds unpredictability when both players produce equidistant targets
    if (irandom(1) == 1) {
        /// Choose Player 2 (Mac) target
        pursuex = _mac_target_x;
        pursuey = _mac_target_y;
    } else {
        /// Choose Player 1 (Pac) target
        pursuex = _pac_target_x;
        pursuey = _pac_target_y;
    }
} else {
    /// Different distances: choose closer target
    if (_dist_to_mac < _dist_to_pac) {
        /// Player 2 (Mac) target is closer: use Mac's geometric target
        pursuex = _mac_target_x;
        pursuey = _mac_target_y;
    } else {
        /// Player 1 (Pac) target is closer: use Pac's geometric target
        pursuex = _pac_target_x;
        pursuey = _pac_target_y;
    }
}

// ===== PATHFINDING AT INTERSECTIONS =====
/// Handle pathfinding when ghost reaches a new tile
/// This logic determines which direction Inky should turn
if (y > 48 && y < room_height - 48) {
    /// Keep ghost in vertical bounds (avoids room edges where wrapping occurs)
    
    if (house == 0) {
        /// Only pathfind when ghost is FREE (not in house bouncing)
        
        if (Pac.chomp == 0 || state == 2) {
            /// Only turn when Pac is moving (chomp==0) OR in eyes mode (always pathfind)
            
            if (newtile == 0) {
                /// newtile=0 means ghost has NOT reached intersection yet
                /// Check if we're aligned to grid
                
                if (tilex == (16 * (round(x / 16))) && tiley == (16 * (round(y / 16)))) {
                    /// Already aligned: no action needed
                } else {
                    /// Ghost has JUST reached a new tile (position changed since last frame)
                    /// Update newtile flag and calculate new tile coordinates
                    
                    newtile = 1;  // Mark that we hit intersection
                    tilex = (16 * (round(x / 16)));
                    tiley = (16 * (round(y / 16)));
                    
                    /// ===== DIRECTION DECISION LOGIC =====
                    /// Now decide which direction to turn based on state and behavior
                    
                    if (aboutface == 0) {
                        /// No reversal needed: make normal pathfinding decision
                        
                        if (state == 0) {
                            /// CHASE MODE: Hunt target using Inky's geometric strategy
                            
                            if (Pac.scatter == 1) {
                                /// Scatter mode active: ghosts avoid Pac, go to corners
                                
                                if (room_width == 448) {
                                    /// Standard mode: Chase to scatter corner
                                    script_execute(chase_object, tilex, tiley, cornerx, cornery);
                                } else {
                                    /// Large maze mode: Random movement
                                    script_execute(random_direction);
                                }
                            } else {
                                /// Normal chase: Hunt target using Inky's geometric strategy
                                /// pursuex/pursuey already set above (geometric double vector)
                                script_execute(chase_object, tilex, tiley, pursuex, pursuey);
                            }
                        }
                        
                        if (state == 1) {
                            /// FRIGHTENED MODE: Random movement (power pellet active)
                            script_execute(random_direction);
                        }
                        
                        if (state == 2) {
                            /// EYES MODE: Chase house entrance to resurrect
                            /// Target is always house entrance (xstart, ystart)
                            script_execute(chase_object, tilex, tiley, (xstart - 184) + 208, (ystart - 272) + 224);
                        }
                    } else {
                        /// ABOUT-FACE: Ghost needs to reverse direction (power pellet eaten)
                        /// Convert current direction (angle) to cardinal direction
                        dir = (direction / 90) + 2;  // Rotate 180 degrees
                        if (dir > 3) {
                            dir = dir - 4;  // Wrap around (0-3 range)
                        }
                        aboutface = 0;  // Clear flag, reversal complete
                    }
                }
            }
        }
    }
}

/// ===============================================================================
/// END INKY STEP_1 EVENT
/// ===============================================================================
