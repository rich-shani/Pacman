/// ===============================================================================
/// PAC STEP_0 - DIRECTION SYNCHRONIZATION & ANIMATION SETUP
/// ===============================================================================
/// Purpose: Synchronize visual facing direction with movement velocity
/// Called: FIRST each frame (before input/collision in Step_1)
///
/// This event updates the cardinal direction (dir/dir2) variables based on
/// the current horizontal/vertical speeds. This ensures Pac's sprite is
/// facing the direction he's actually moving.
///
/// Direction mapping:
/// - dir = 0: Moving RIGHT (hspeed > 0, vspeed = 0)
/// - dir = 1: Moving UP (hspeed = 0, vspeed < 0)
/// - dir = 2: Moving LEFT (hspeed < 0, vspeed = 0)
/// - dir = 3: Moving DOWN (hspeed = 0, vspeed > 0)
///
/// Note: Corners can have diagonal velocity, but those are handled separately
/// ===============================================================================

// Execute any external step script (if defined)
script_execute(step);

// Only update direction if level is in progress (not in menu/cutscene)
if (global.lvl > 0) {

    // ===== PLAYER 1 DIRECTION SYNCHRONIZATION =====
    /// Update Pac's cardinal direction based on velocity
    /// This keeps sprite facing correct direction as he moves

    // Moving right
    if (hspeed > 0 && vspeed == 0) {
        dir = PAC_DIRECTION.RIGHT;
    }

    // Moving left
    if (hspeed < 0 && vspeed == 0) {
        dir = PAC_DIRECTION.LEFT;
    }

    // Moving down
    if (hspeed == 0 && vspeed > 0) {
        dir = PAC_DIRECTION.DOWN;
    }

    // Moving up
    if (hspeed == 0 && vspeed < 0) {
        dir = PAC_DIRECTION.UP;
    }

    // ===== PLAYER 2 DIRECTION SYNCHRONIZATION =====
    /// Update Mac's cardinal direction (if Player 2 active)
    /// Mirrors Player 1 logic for consistency

    // Player 2 moving right
    if (hspeed2 > 0 && vspeed2 == 0) {
        dir2 = PAC_DIRECTION.RIGHT;
    }

    // Player 2 moving left
    if (hspeed2 < 0 && vspeed2 == 0) {
        dir2 = PAC_DIRECTION.LEFT;
    }

    // Player 2 moving down
    if (hspeed2 == 0 && vspeed2 > 0) {
        dir2 = PAC_DIRECTION.DOWN;
    }

    // Player 2 moving up
    if (hspeed2 == 0 && vspeed2 < 0) {
        dir2 = PAC_DIRECTION.UP;
    }
}

/// ===============================================================================
/// END PAC STEP_0 EVENT
/// ===============================================================================


