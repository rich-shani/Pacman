/// ===============================================================================
/// FRUIT OBJECT - STEP_2 EVENT (MOVEMENT & COLLISION)
/// ===============================================================================
/// Purpose: Handle fruit movement, turning, and power pellet collision
/// Called: Every frame (third step event)
///
/// Responsibilities:
/// 1. Apply movement speed based on game variant
/// 2. Handle direction changes at intersections
/// 3. Detect collision with power pellets (Ms. Pacman mode)
/// 4. Handle screen wrapping (vertical wrap-around)
/// 5. Update scale animation
/// ===============================================================================

// ===== MOVEMENT SPEED =====
/// Apply movement speed when fruit is active and not prevented from moving
if (state > -1 && nomove == 0 && Pac.dead == 0) {
    /// Stop movement when level is finished
    if (Pac.finish > 0) {
        speed = 0;
    } else {
        /// Set speed based on game variant
        if (global.game == 1) {
            speed = 1.00001;  // Ms. Pacman speed
        }
        if (global.game == 2) {
            speed = 0.75001;  // Jr. Pacman speed (slower)
        }
    }
}

// ===== DIRECTION CHANGES AT INTERSECTIONS =====
/// Handle smooth direction changes when fruit reaches tile-aligned positions
/// Only process when not in chomp state
if (Pac.chomp == 0) {
    /// Check if fruit has reached a new tile
    if (newtile == 1) {
        /// Store direction at intersection markers (for pathfinding)
        /// These markers help fruit remember which way to turn
        if (tilex == c1x && tiley == c1y && c1dir == -1) { c1dir = dir; }
        if (tilex == c2x && tiley == c2y && c2dir == -1) { c2dir = dir; }
        if (tilex == c3x && tiley == c3y && c3dir == -1) { c3dir = dir; }
        if (tilex == c4x && tiley == c4y && c4dir == -1) { c4dir = dir; }
        if (tilex == c5x && tiley == c5y && c5dir == -1) { c5dir = dir; }
        if (tilex == c6x && tiley == c6y && c6dir == -1) { c6dir = dir; }
        if (tilex == c7x && tiley == c7y && c7dir == -1) { c7dir = dir; }
        if (tilex == c8x && tiley == c8y && c8dir == -1) { c8dir = dir; }
        
        // ===== DIRECTION = RIGHT (0) =====
        /// Change direction to right
        if (dir == 0) {
            /// Already moving right - continue
            if (direction == 0 && x > tilex) {
                direction = 0;
                newtile = 0;
                exit;
            }
            /// Moving up - turn right (adjust position to align)
            if (direction == 90 && y < tiley) {
                direction = 0;
                x = tilex + (tiley - y);  // Preserve horizontal offset
                y = tiley;  // Align to tile
                newtile = 0;
                exit;
            }
            /// Moving left - turn right (snap to tile)
            if (direction == 180 && x < tilex) {
                x = tilex;
                direction = 0;
                newtile = 0;
                exit;
            }
            /// Moving down - turn right (adjust position to align)
            if (direction == 270 && y > tiley) {
                direction = 0;
                x = tilex + (y - tiley);  // Preserve horizontal offset
                y = tiley;  // Align to tile
                newtile = 0;
                exit;
            }
        }
        
        // ===== DIRECTION = UP (1) =====
        /// Change direction to up
        if (dir == 1) {
            /// Moving right - turn up (adjust position to align)
            if (direction == 0 && x > tilex) {
                direction = 90;
                y = tiley - (x - tilex);  // Preserve vertical offset
                x = tilex;  // Align to tile
                newtile = 0;
                exit;
            }
            /// Already moving up - continue
            if (direction == 90 && y < tiley) {
                direction = 90;
                newtile = 0;
                exit;
            }
            /// Moving left - turn up (adjust position to align)
            if (direction == 180 && x < tilex) {
                direction = 90;
                y = tiley - (tilex - x);  // Preserve vertical offset
                x = tilex;  // Align to tile
                newtile = 0;
                exit;
            }
            /// Moving down - turn up (snap to tile)
            if (direction == 270 && y > tiley) {
                y = tiley;
                direction = 90;
                newtile = 0;
                exit;
            }
        }
        
        // ===== DIRECTION = LEFT (2) =====
        /// Change direction to left
        if (dir == 2) {
            /// Moving right - turn left (snap to tile)
            if (direction == 0 && x > tilex) {
                x = tilex;
                direction = 180;
                newtile = 0;
                exit;
            }
            /// Moving up - turn left (adjust position to align)
            if (direction == 90 && y < tiley) {
                direction = 180;
                x = tilex - (tiley - y);  // Preserve horizontal offset
                y = tiley;  // Align to tile
                newtile = 0;
                exit;
            }
            /// Already moving left - continue
            if (direction == 180 && x < tilex) {
                direction = 180;
                newtile = 0;
                exit;
            }
            /// Moving down - turn left (adjust position to align)
            if (direction == 270 && y > tiley) {
                direction = 180;
                x = tilex - (y - tiley);  // Preserve horizontal offset
                y = tiley;  // Align to tile
                newtile = 0;
                exit;
            }
        }
        
        // ===== DIRECTION = DOWN (3) =====
        /// Change direction to down
        if (dir == 3) {
            /// Moving right - turn down (adjust position to align)
            if (direction == 0 && x > tilex) {
                direction = 270;
                y = tiley + (x - tilex);  // Preserve vertical offset
                x = tilex;  // Align to tile
                newtile = 0;
                exit;
            }
            /// Moving up - turn down (snap to tile)
            if (direction == 90 && y < tiley) {
                y = tiley;
                direction = 270;
                newtile = 0;
                exit;
            }
            /// Moving left - turn down (adjust position to align)
            if (direction == 180 && x < tilex) {
                direction = 270;
                y = tiley + (tilex - x);  // Preserve vertical offset
                x = tilex;  // Align to tile
                newtile = 0;
                exit;
            }
            /// Already moving down - continue
            if (direction == 270 && y > tiley) {
                direction = 270;
                newtile = 0;
                exit;
            }
        }
    }
}

// ===== POWER PELLET COLLISION (MS. PACMAN MODE) =====
/// Handle fruit collision with power pellets
/// When fruit reaches a power pellet, it explodes and removes the pellet
if (Pac.dead == 0) {
    /// Only check collision in non-standard rooms
    if (room_width == 448) {
        // Standard Pacman - no power pellet collision
    } else {
        /// Check if power pellets exist
        if (instance_number(Power) == 0) {
            // No power pellets - skip collision check
        } else {
            /// Check if fruit is at target position (power pellet location)
            if (x > chasex - 1 && x < chasex + 1 && 
                y > chasey - 1 && y < chasey + 1 && 
                state == 1) {
                /// Fruit reached power pellet - align position
                x = chasex;
                y = chasey;
                bounce = 0;
                
                /// Check if position is within viewport
                if (x > __view_get(e__VW.XView, 0) + 8 && 
                    x < __view_get(e__VW.XView, 0) + 440 - 16 && 
                    y > __view_get(e__VW.YView, 0) + 8 + 32 && 
                    y < __view_get(e__VW.YView, 0) + 568 - 48) {
                    
                    /// Trigger explosion animation
                    explosion = 1;
                    
                    /// Play credit sound effect (if level > 0)
                    if (global.lvl > 0) {
                        sound_loop(Credit);
                    }
                    
                    /// Set explosion timer
                    alarm[2] = 90;
                    newtile = 0;
                    
                    /// Store spawn position for respawn
                    if (state > -1) {
                        xstart = x;
                        ystart = y;
                    }
                    
                    /// Reset fruit state
                    state = -1;
                    x = -32;
                    y = -32;
                    speed = 0;
                    dir = -1;
                    
                    /// Update tile coordinates
                    tilex = 16 * (round(x / 16));
                    tiley = 16 * (round(y / 16));
                    
                    /// Store explosion position
                    expx = chasex;
                    expy = chasey;
                    
                    /// Destroy power pellet at collision point
                    with (Power) {
                        if (x == Fruit.chasex && y == Fruit.chasey) {
                            instance_destroy();
                        }
                    }
                }
            }
        }
    }
}

// ===== SCALE ANIMATION =====
/// Animate fruit scale (pulsing effect)
/// Only process if not in collision state
exit;

/// Scale up animation
if (scaleup == 1) {
    scale = scale + 0.05;
    if (scale == 1.50) {
        scaleup = 0;  // Switch to scale down
        exit;
    }
}

/// Scale down animation
if (scaleup == 0) {
    scale = scale - 0.05;
    if (scale == 1.00) {
        scaleup = 1;  // Switch to scale up
        exit;
    }
}

// ===== SCREEN WRAPPING =====
/// Handle vertical screen wrapping (for wrap-around mazes)
/// Only active when fruit is moving
if (state > -1) {
    /// Wrap from top to bottom
    if (direction == 90 && y < 32) {
        y = 544;
        tiley = 16 * (round(y / 16));
    }
    
    /// Wrap from bottom to top
    if (direction == 270 && y > room_height - 32) {
        y = 32;
        tiley = 16 * (round(y / 16));
    }
}
