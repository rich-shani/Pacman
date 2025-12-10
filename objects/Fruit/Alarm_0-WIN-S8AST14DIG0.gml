/// ===============================================================================
/// FRUIT OBJECT - ALARM_0 EVENT (DESPAWN TIMER)
/// ===============================================================================
/// Purpose: Handle fruit despawn and movement state changes
/// Called: When alarm[0] timer expires
///
/// Responsibilities:
/// 1. Despawn fruit in standard Pacman mode
/// 2. Initialize movement state for Ms. Pacman/Jr. Pacman modes
/// 3. Set up pathfinding variables and target calculation
/// ===============================================================================

// ===== STANDARD PACMAN DESPAWN =====
/// Remove fruit from screen (standard Pacman mode)
if (global.ex1 == 0 && room_width == 448) {
    x = -32;
    y = -32;
}
// ===== MS. PACMAN / JR. PACMAN MOVEMENT START =====
else {
    /// Activate movement state
    state = 1;
    
    /// Randomly choose exit option (0-3) for pathfinding
    exopt = irandom(3);
    
    // ===== INITIALIZE PATHFINDING MARKERS =====
    /// Reset close point markers (used for debug display)
    closex = 1000;
    closey = 1000;
    close2x = 1000;
    close2y = 1000;
    close3x = 1000;
    close3y = 1000;
    close4x = 1000;
    close4y = 1000;
    
    /// Reset direction marker positions
    c1x = 0; c2x = 0; c3x = 0; c4x = 0;
    c5x = 0; c6x = 0; c7x = 0; c8x = 0;
    c1y = 0; c2y = 0; c3y = 0; c4y = 0;
    c5y = 0; c6y = 0; c7y = 0; c8y = 0;
    
    /// Reset direction marker values (-1 = unset)
    c1dir = -1; c2dir = -1; c3dir = -1; c4dir = -1;
    c5dir = -1; c6dir = -1; c7dir = -1; c8dir = -1;
    
    // ===== TARGET CALCULATION (MS. PACMAN MODE) =====
    /// Calculate initial target position for fruit to chase
    /// Only applies to non-standard rooms
    if (room_width == 448) {
        // Standard Pacman - no target calculation
    } else {
        /// Check if power pellets exist
        if (instance_number(Power) == 0) {
            // No power pellets - no target
        } else {
            /// Randomly choose between player 1 and player 2
            if (irandom(2) == 1) {
                chasex = global.p1x;
                chasey = global.p1y;
            } else {
                /// Randomly choose player 2 or mirror position
                if (irandom(1) == 1) {
                    chasex = global.p2x;
                    chasey = global.p2y;
                } else {
                    /// Check if mirror positions are safe (no power pellets nearby)
                    if (!collision_point(global.p1x, global.p1y, Power, false, true) &&
                        !collision_point(848 - global.p1x, global.p1y, Power, false, true) &&
                        !collision_point(global.p2x, global.p2y, Power, false, true) &&
                        !collision_point(848 - global.p2x, global.p2y, Power, false, true)) {
                        /// Use mirror position (p3)
                        chasex = global.p3x;
                        chasey = global.p3y;
                    } else {
                        /// Fallback to random player position
                        if (irandom(1) == 1) {
                            chasex = global.p1x;
                            chasey = global.p1y;
                        } else {
                            chasex = global.p2x;
                            chasey = global.p2y;
                        }
                    }
                }
            }
            
            /// Randomly mirror target horizontally (50% chance)
            /// This adds variety to fruit movement patterns
            if (irandom(1) == 1) {
                chasex = 848 - chasex;
            }
        }
    }
}
