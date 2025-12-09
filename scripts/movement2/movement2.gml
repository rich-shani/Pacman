/// ===============================================================================
/// movement2() - PLAYER 2 INPUT HANDLING & CORNER MECHANICS
/// ===============================================================================
/// Purpose: Handle Player 2 keyboard input and smooth corner turning
/// Called: Every frame from Pac Step_1 event
///
/// Responsibilities:
/// 1. Remove players from board when game over
/// 2. Track tile position for corner detection
/// 3. Process keyboard input (WASD keys)
/// 4. Handle smooth corner transitions
/// 5. Handle corner re-entry during transitions
/// ===============================================================================

/// @description /removing one player from board when game overed
function movement2() {
    // ===== GAME OVER POSITION RESET =====
    /// Move players off-screen when game over
    /// Prevents visual glitches and ensures clean state
    if (global.p1gameover == 1) {
        x = -5000;
        y = -5000;
    }
    if (global.p2gameover == 1) {
        x2 = -5000;
        y2 = -5000;
    }
    
    // ===== TILE POSITION TRACKING =====
    /// Update tile coordinates for corner detection
    /// Only track when level is active
    if (global.lvl > 0) {
        /// Normal movement - update tile coordinates
        if (corner2 == 0) {
            tilex2 = 16 * (round(x2 / 16));
            tiley2 = 16 * (round(y2 / 16));
        }
        /// Corner transition - check if tile changed
        else {
            /// Check if X tile changed
            if (tilex2 == 16 * (round(x2 / 16))) {
                // Still on same X tile
            } else {
                corner2check = corner2check + 1;  // Increment corner check counter
            }
            /// Check if Y tile changed
            if (tiley2 == 16 * (round(y2 / 16))) {
                // Still on same Y tile
            } else {
                corner2check = corner2check + 1;  // Increment corner check counter
            }
        }
    }
    
    // ===== KEYBOARD INPUT PROCESSING =====
    /// Process keyboard input for Player 2 movement
    /// Only process when Player 2 is active and game is running
    if (dead == 0 && global.start == 0 && Pac.finish == 0 && 
        stoppy2 == 0 && bonked2 == 0) {
        if (global.lvl > 0) {
            /// Only process input when not in corner transition and not eating ghost
            if (corner2 == 0 && chomp == 0) {
                // ===== DIRECTION = RIGHT (D KEY) =====
                /// Check if Player 2 pressed D key
                if (y2 > 48 && y2 < room_height - 48) {
                    if (keyboard_check(ord("D")) == true && 
                        keyboard_check(ord("W")) == false && 
                        keyboard_check(ord("A")) == false && 
                        keyboard_check(ord("S")) == false) {
                        /// Check if path to right is clear
                        if (!collision_point(16 * (round((x2) / 16)) + 17, 
                                            16 * (round((y2) / 16)), 
                                            Wall, false, true)) {
                            dir2 = 0;  // Set direction to right
                            park2 = -1;  // Clear buffered input
                            
                            /// Handle corner turning if currently moving vertically
                            if (direction2 == 90) {
                                /// Currently moving UP, turning RIGHT
                                if (y2 > 16 * round((y2) / 16)) {
                                    corner2 = 1;  // Pre-turn (before grid alignment)
                                    hspeed2 = sp;
                                    vspeed2 = -sp;  // Continue up momentum while moving right
                                    exit;
                                } else {
                                    corner2 = 2;  // Post-turn (after grid alignment)
                                    hspeed2 = sp;
                                    vspeed2 = sp;  // Reverse up momentum, continue down
                                    exit;
                                }
                            } else {
                                if (direction2 == 270) {
                                    /// Currently moving DOWN, turning RIGHT
                                    if (y2 < 16 * round((y2) / 16)) {
                                        corner2 = 2;  // Pre-turn
                                        hspeed2 = sp;
                                        vspeed2 = sp;  // Continue down momentum while moving right
                                        exit;
                                    } else {
                                        corner2 = 1;  // Post-turn
                                        hspeed2 = sp;
                                        vspeed2 = -sp;  // Reverse down momentum, continue up
                                        exit;
                                    }
                                } else {
                                    /// Not moving vertically - just continue/start right
                                    hspeed2 = sp;
                                    vspeed2 = 0;
                                }
                            }
                        } else {
                            /// Wall in the way - buffer direction for later
                            if (hspeed2 == 0 && vspeed2 == 0) {
                                // Already stopped - no need to buffer
                            } else {
                                park2 = 0;  // Buffer right direction
                            }
                        }
                    }
                }
                
                // ===== DIRECTION = UP (W KEY) =====
                /// Check if Player 2 pressed W key
                if (x2 > 8 && x2 < (room_width - 8)) {
                    if (keyboard_check(ord("W")) == true && 
                        keyboard_check(ord("D")) == false && 
                        keyboard_check(ord("A")) == false && 
                        keyboard_check(ord("S")) == false) {
                        /// Check if path upward is clear
                        if (!collision_point(16 * (round((x2) / 16)), 
                                            16 * (round((y2) / 16)) - 1 - 0, 
                                            Wall, false, true)) {
                            dir2 = 1;  // Set direction to up
                            park2 = -1;  // Clear buffered input
                            
                            /// Handle corner turning if currently moving horizontally
                            if (direction2 == 0 && !hspeed2 == 0) {
                                /// Currently moving RIGHT, turning UP
                                if (x2 < 16 * round((x2) / 16)) {
                                    corner2 = 3;  // Pre-turn
                                    hspeed2 = sp;
                                    vspeed2 = -sp;  // Continue right momentum while moving up
                                    exit;
                                } else {
                                    corner2 = 4;  // Post-turn
                                    hspeed2 = -sp;  // Reverse right momentum, continue left
                                    vspeed2 = -sp;
                                    exit;
                                }
                            } else {
                                if (direction2 == 180) {
                                    /// Currently moving LEFT, turning UP
                                    if (x2 > 16 * round((x2) / 16)) {
                                        corner2 = 4;  // Pre-turn
                                        hspeed2 = -sp;  // Continue left momentum while moving up
                                        vspeed2 = -sp;
                                        exit;
                                    } else {
                                        corner2 = 3;  // Post-turn
                                        hspeed2 = sp;  // Reverse left momentum, continue right
                                        vspeed2 = -sp;
                                        exit;
                                    }
                                } else {
                                    /// Not moving horizontally - just continue/start up
                                    hspeed2 = 0;
                                    vspeed2 = -sp;
                                }
                            }
                        } else {
                            /// Wall in the way - buffer direction
                            if (hspeed2 == 0 && vspeed2 == 0) {
                                // Already stopped
                            } else {
                                park2 = 1;  // Buffer up direction
                            }
                        }
                    }
                }
                
                // ===== DIRECTION = LEFT (A KEY) =====
                /// Check if Player 2 pressed A key
                if (y2 > 48 && y2 < room_height - 48) {
                    if (keyboard_check(ord("A")) == true && 
                        keyboard_check(ord("W")) == false && 
                        keyboard_check(ord("D")) == false && 
                        keyboard_check(ord("S")) == false) {
                        /// Check if path to left is clear
                        if (!collision_point(16 * (round((x2) / 16)) - 1 - 0, 
                                            16 * (round((y2) / 16)), 
                                            Wall, false, true)) {
                            dir2 = 2;  // Set direction to left
                            park2 = -1;  // Clear buffered input
                            
                            /// Handle corner turning if currently moving vertically
                            if (direction2 == 90) {
                                /// Currently moving UP, turning LEFT
                                if (y2 > 16 * round((y2) / 16)) {
                                    corner2 = 5;  // Pre-turn
                                    hspeed2 = -sp;
                                    vspeed2 = -sp;  // Continue up momentum while moving left
                                    exit;
                                } else {
                                    corner2 = 6;  // Post-turn
                                    hspeed2 = -sp;
                                    vspeed2 = sp;  // Reverse up momentum, continue down
                                    exit;
                                }
                            } else {
                                if (direction2 == 270) {
                                    /// Currently moving DOWN, turning LEFT
                                    if (y2 < 16 * round((y2) / 16)) {
                                        corner2 = 6;  // Pre-turn
                                        hspeed2 = -sp;
                                        vspeed2 = sp;  // Continue down momentum while moving left
                                        exit;
                                    } else {
                                        corner2 = 5;  // Post-turn
                                        hspeed2 = -sp;
                                        vspeed2 = -sp;  // Reverse down momentum, continue up
                                        exit;
                                    }
                                } else {
                                    /// Not moving vertically - just continue/start left
                                    hspeed2 = -sp;
                                    vspeed2 = 0;
                                }
                            }
                        } else {
                            /// Wall in the way - buffer direction
                            if (hspeed2 == 0 && vspeed2 == 0) {
                                // Already stopped
                            } else {
                                park2 = 2;  // Buffer left direction
                            }
                        }
                    }
                }
                
                // ===== DIRECTION = DOWN (S KEY) =====
                /// Check if Player 2 pressed S key
                if (x2 > 8 && x2 < (room_width - 8)) {
                    if (keyboard_check(ord("S")) == true && 
                        keyboard_check(ord("D")) == false && 
                        keyboard_check(ord("A")) == false && 
                        keyboard_check(ord("W")) == false) {
                        /// Check if path downward is clear
                        if (!collision_point(16 * (round((x2) / 16)), 
                                            16 * (round((y2) / 16)) + 17, 
                                            Wall, false, true)) {
                            dir2 = 3;  // Set direction to down
                            park2 = -1;  // Clear buffered input
                            
                            /// Handle corner turning if currently moving horizontally
                            if (direction2 == 0 && !hspeed2 == 0) {
                                /// Currently moving RIGHT, turning DOWN
                                if (x2 < 16 * round((x2) / 16)) {
                                    corner2 = 7;  // Pre-turn
                                    hspeed2 = sp;
                                    vspeed2 = sp;  // Continue right momentum while moving down
                                    exit;
                                } else {
                                    corner2 = 8;  // Post-turn
                                    hspeed2 = -sp;  // Reverse right momentum, continue left
                                    vspeed2 = sp;
                                    exit;
                                }
                            } else {
                                if (direction2 == 180) {
                                    /// Currently moving LEFT, turning DOWN
                                    if (x2 > 16 * round((x2) / 16)) {
                                        corner2 = 8;  // Pre-turn
                                        hspeed2 = -sp;  // Continue left momentum while moving down
                                        vspeed2 = sp;
                                        exit;
                                    } else {
                                        corner2 = 7;  // Post-turn
                                        hspeed2 = sp;  // Reverse left momentum, continue right
                                        vspeed2 = sp;
                                        exit;
                                    }
                                } else {
                                    /// Not moving horizontally - just continue/start down
                                    hspeed2 = 0;
                                    vspeed2 = sp;
                                }
                            }
                        } else {
                            /// Wall in the way - buffer direction
                            if (hspeed2 == 0 && vspeed2 == 0) {
                                // Already stopped
                            } else {
                                park2 = 3;  // Buffer down direction
                            }
                        }
                    }
                }
            }
        }
    }
    
    // ===== CORNER RE-ENTRY HANDLING =====
    /// Allow direction changes during corner transition (first 2 frames only)
    /// This enables responsive input even during smooth corner turns
    if (corner2 == 0) {
        // Not in corner - no re-entry needed
    } else {
        if (chomp == 0) {
            /// Only allow re-entry for first 2 frames of corner transition
            if (corner2check < 2) {
                // ===== RE-ENTRY: RIGHT (D KEY) =====
                if (keyboard_check(ord("D")) == true && 
                    keyboard_check(ord("W")) == false && 
                    keyboard_check(ord("A")) == false && 
                    keyboard_check(ord("S")) == false) {
                    /// Check if path to right is clear
                    if (!collision_point(16 * (round((Mac.x) / 16)) + 17, 
                                        16 * (round((Mac.y) / 16)), 
                                        Wall, false, true)) {
                        /// Transition between corner states
                        if (corner2 == 8) { corner2 = 1; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 0; exit; }
                        if (corner2 == 4) { corner2 = 2; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 0; exit; }
                        if (corner2 == 7) { corner2 = 1; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 0; exit; }
                        if (corner2 == 3) { corner2 = 2; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 0; exit; }
                        if (corner2 == 5) { corner2 = 1; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 0; exit; }
                        if (corner2 == 6) { corner2 = 2; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 0; exit; }
                    }
                }
                
                // ===== RE-ENTRY: UP (W KEY) =====
                if (keyboard_check(ord("W")) == true && 
                    keyboard_check(ord("D")) == false && 
                    keyboard_check(ord("A")) == false && 
                    keyboard_check(ord("S")) == false) {
                    /// Check if path upward is clear
                    if (!collision_point(16 * (round((Mac.x) / 16)), 
                                        16 * (round((Mac.y) / 16)) - 1, 
                                        Wall, false, true)) {
                        /// Transition between corner states
                        if (corner2 == 6) { corner2 = 3; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 1; exit; }
                        if (corner2 == 2) { corner2 = 4; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 1; exit; }
                        if (corner2 == 5) { corner2 = 3; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 1; exit; }
                        if (corner2 == 1) { corner2 = 4; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 1; exit; }
                        if (corner2 == 7) { corner2 = 3; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 1; exit; }
                        if (corner2 == 8) { corner2 = 4; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 1; exit; }
                    }
                }
                
                // ===== RE-ENTRY: LEFT (A KEY) =====
                if (keyboard_check(ord("A")) == true && 
                    keyboard_check(ord("W")) == false && 
                    keyboard_check(ord("D")) == false && 
                    keyboard_check(ord("S")) == false) {
                    /// Check if path to left is clear
                    if (!collision_point(16 * (round((Mac.x) / 16)) - 1, 
                                        16 * (round((Mac.y) / 16)), 
                                        Wall, false, true)) {
                        /// Transition between corner states
                        if (corner2 == 7) { corner2 = 5; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 2; exit; }
                        if (corner2 == 3) { corner2 = 6; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 2; exit; }
                        if (corner2 == 8) { corner2 = 5; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 2; exit; }
                        if (corner2 == 4) { corner2 = 6; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 2; exit; }
                        if (corner2 == 1) { corner2 = 5; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 2; exit; }
                        if (corner2 == 2) { corner2 = 6; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 2; exit; }
                    }
                }
                
                // ===== RE-ENTRY: DOWN (S KEY) =====
                if (keyboard_check(ord("S")) == true && 
                    keyboard_check(ord("D")) == false && 
                    keyboard_check(ord("A")) == false && 
                    keyboard_check(ord("W")) == false) {
                    /// Check if path downward is clear
                    if (!collision_point(16 * (round((Mac.x) / 16)), 
                                        16 * (round((Mac.y) / 16)) + 17, 
                                        Wall, false, true)) {
                        /// Transition between corner states
                        if (corner2 == 5) { corner2 = 7; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 3; exit; }
                        if (corner2 == 1) { corner2 = 8; hspeed2 = -hspeed2; vspeed2 = -vspeed2; dir2 = 3; exit; }
                        if (corner2 == 6) { corner2 = 7; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 3; exit; }
                        if (corner2 == 2) { corner2 = 8; hspeed2 = -hspeed2; vspeed2 = vspeed2; dir2 = 3; exit; }
                        if (corner2 == 3) { corner2 = 7; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 3; exit; }
                        if (corner2 == 4) { corner2 = 8; hspeed2 = hspeed2; vspeed2 = -vspeed2; dir2 = 3; exit; }
                    }
                }
            }
        }
    }
}
