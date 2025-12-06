/// ===============================================================================
/// oGHOST - BASE GHOST OBJECT - STEP_1 EVENT
/// ===============================================================================
/// Purpose: Determine target for ghost behavior based on state
/// Called: Every frame (second step event, after Step_0)
/// Parent: oGhost
/// Children: Blinky, Pinky, Inky, Clyde (override this event with unique behavior)
///
/// State Logic:
/// - CHASE: Calculate target based on ghost personality (overridden by children)
/// - FRIGHTENED: Random movement (same for all ghosts)
/// - EYES: Chase ghost house entrance (same for all ghosts)
/// - IN_HOUSE: No target calculation (handled by Step_2)
///
/// This event is overridden by each child ghost to implement their unique
/// chase behavior (Blinky: direct, Pinky: 4-ahead, Inky: double vector, Clyde: distance-based)
/// ===============================================================================

// ===== CHASE MODE TARGET CALCULATION =====
/// Calculate what the ghost is chasing based on state
if state == GHOST_STATE.CHASE {
    /// DEFAULT BEHAVIOR: Direct chase (Blinky's strategy)
    /// Child ghosts override this event with their own calculation
    /// - Blinky: Current position
    /// - Pinky: 4 tiles ahead
    /// - Inky: Double vector from Blinky
    /// - Clyde: Distance-dependent

    pursuex = 16 * round(Pac.x / 16);
    pursuey = 16 * round(Pac.y / 16);

    /// In scatter mode (when Pac is in specific areas), chase scatter corner instead
    /// This behavior is GLOBAL but can be overridden by child ghosts
    /// Some rooms trigger "scatter mode" where ghosts ignore Pac
    /// This is handled by scripts that modify pursuex/pursuey
}

// ===== FRIGHTENED MODE =====
/// Power pellet active: ghost moves randomly
/// Uses random_direction script (same for all ghosts, no override needed)
else if state == GHOST_STATE.FRIGHTENED {
    /// Random movement with weighted probabilities
    /// See scripts/random_direction/random_direction.gml for implementation
    script_execute(random_direction);
}

// ===== EYES MODE (Ghost Eaten) =====
/// Ghost was eaten, now just eyes returning to house
/// Eyes always chase the house entrance
else if state == GHOST_STATE.EYES {
    /// Target the ghost house entrance
    /// This is the same for all ghosts
    /// House entrance is at (216, 240) in standard layout
    pursuex = 216;
    pursuey = 240;
}

// ===== IN_HOUSE MODE =====
/// Ghost is inside house, bouncing to exit
/// No target calculation needed (Step_2 handles house exit logic)
else if state == GHOST_STATE.IN_HOUSE {
    /// House state machine handled entirely in Step_2
    /// No pursuex/pursuey needed
}

// ===== HOUSE_READY MODE =====
/// Ghost waiting in house
/// No target calculation needed (waiting for release condition)
else if state == GHOST_STATE.HOUSE_READY {
    /// Waiting in house, will transition to IN_HOUSE when ready
    /// No movement until state changes
}

/// ===============================================================================
/// HOW CHILD GHOSTS OVERRIDE THIS EVENT
/// ===============================================================================
/// Each child ghost (Blinky, Pinky, Inky, Clyde) overrides this entire event
/// with their own implementation of CHASE mode target calculation.
///
/// Example - Pinky's override:
/// ────────────────────────────────────────────────────────────────────
/// if state == GHOST_STATE.CHASE {
///     // Pinky's behavior: Target 4 tiles ahead of Pac (anticipation)
///     pursuex = 16 * round(Pac.x / 16) + (2 * Pac.xdir);
///     pursuey = 16 * round(Pac.y / 16) + (2 * Pac.ydir);
/// }
/// else if state == GHOST_STATE.FRIGHTENED {
///     script_execute(random_direction);  // Same as all ghosts
/// }
/// else if state == GHOST_STATE.EYES {
///     pursuex = 216;  // Same as all ghosts
///     pursuey = 240;
/// }
///
/// Example - Clyde's override:
/// ────────────────────────────────────────────────────────────────────
/// if state == GHOST_STATE.CHASE {
///     // Clyde's behavior: Distance-dependent
///     var _dist = point_distance(x, y, Pac.x, Pac.y);
///     if (_dist < 128) {
///         // Too close! Flee to scatter corner
///         pursuex = cornerx;
///         pursuey = cornery;
///     } else {
///         // Chase normally
///         pursuex = 16 * round(Pac.x / 16);
///         pursuey = 16 * round(Pac.y / 16);
///     }
/// }
/// else if state == GHOST_STATE.FRIGHTENED {
///     script_execute(random_direction);
/// }
/// else if state == GHOST_STATE.EYES {
///     pursuex = 216;
///     pursuey = 240;
/// }
///
/// ===============================================================================

/// ===============================================================================
/// END oGHOST STEP_1 EVENT
/// ===============================================================================
