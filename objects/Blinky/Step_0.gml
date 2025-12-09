/// ===============================================================================
/// BLINKY GHOST - STEP_0 EVENT (TARGET CALCULATION - DIRECT CHASE)
/// ===============================================================================
/// Purpose: Calculate Blinky's target position using direct chase strategy
/// Called: Every frame (second step event, after Begin_Step animation)
/// Parent: oGhost (inherits base ghost behavior)
///
/// Blinky's Personality: "Shadow" - Direct Chaser (Fearless Leader)
/// Strategy: Blinky directly chases Pac's current position (no prediction)
/// This makes Blinky the most straightforward threat - he's always coming straight at you
///
/// Two-Player Support:
/// Blinky chooses between Player 1 (Pac) and Player 2 (Mac) based on which
/// target is closer to Blinky's current position (Manhattan distance)
/// If distances are equal, randomly chooses between players
///
/// Algorithm:
/// 1. Calculate Player 1 (Pac) grid position
/// 2. Calculate Player 2 (Mac) grid position
/// 3. Compare Manhattan distances from Blinky to each player
/// 4. Choose closer player (or random if equal)
/// 5. Set pursuex/pursuey to chosen player's grid position
///
/// This is the simplest ghost AI - just "go toward Pac"
/// ===============================================================================

/// ===== INHERIT BASE GHOST BEHAVIOR =====
/// Call parent Step_0 event to handle animation, flashing, and tile tracking
/// This ensures Blinky gets all the base ghost functionality
event_inherited();

/// ===== CHASE MODE TARGET CALCULATION =====
/// Blinky's chase strategy: Direct pursuit to Pac's current position
/// No prediction, no ambush - just straight-line pursuit
if (state == GHOST_STATE.CHASE) {
    /// CHASE MODE: Hunt Pac using direct chase strategy
    
    /// Calculate Player 1 (Pac) grid position
    /// Snap to 16-pixel grid for pathfinding accuracy
    var _pac_tile_x = 16 * round(Pac.x / 16);
    var _pac_tile_y = 16 * round(Pac.y / 16);
    
    /// Calculate Player 2 (Mac) grid position (if two-player mode)
    var _mac_tile_x = 16 * round(Pac.x2 / 16);
    var _mac_tile_y = 16 * round(Pac.y2 / 16);
    
    /// Calculate Manhattan distances from Blinky to each player
    /// Manhattan distance = |x1 - x2| + |y1 - y2|
    var _dist_to_pac = abs(_pac_tile_x - tilex) + abs(_pac_tile_y - tiley);
    var _dist_to_mac = abs(_mac_tile_x - tilex) + abs(_mac_tile_y - tiley);
    
    /// Choose target player based on distance
    if (_dist_to_pac == _dist_to_mac) {
        /// Equal distances: randomly choose between players
        /// This adds unpredictability when both players are equidistant
        if (irandom(1) == 1) {
            /// Choose Player 2 (Mac)
            pursuex = _mac_tile_x;
            pursuey = _mac_tile_y;
        } else {
            /// Choose Player 1 (Pac)
            pursuex = _pac_tile_x;
            pursuey = _pac_tile_y;
        }
    } else {
        /// Different distances: choose closer player
        if (_dist_to_mac < _dist_to_pac) {
            /// Player 2 (Mac) is closer: target Mac
            pursuex = _mac_tile_x;
            pursuey = _mac_tile_y;
        } else {
            /// Player 1 (Pac) is closer: target Pac
            pursuex = _pac_tile_x;
            pursuey = _pac_tile_y;
        }
    }
    
    /// Note: In scatter mode (when Pac.scatter == 1), the pathfinding script
    /// in Step_2 will override this target and chase the scatter corner instead.
    /// This direct chase target is only used during normal chase mode.
}

/// ===============================================================================
/// BLINKY'S BEHAVIOR NOTES
/// ===============================================================================
/// Blinky is the "leader" ghost - he directly chases Pac without prediction.
/// This makes Blinky the most straightforward threat:
/// - No ambush tactics (unlike Pinky)
/// - No geometric calculations (unlike Inky)
/// - No distance-based switching (unlike Clyde)
/// - Just pure, direct pursuit
///
/// Blinky's behavior in other states:
/// - FRIGHTENED mode: Random movement (handled by parent Step_1)
/// - EYES mode: Target house entrance (handled by parent Step_1)
/// - IN_HOUSE mode: House exit sequence (handled by parent Step_2)
///
/// ===============================================================================
/// END BLINKY STEP_0 EVENT
/// ===============================================================================
