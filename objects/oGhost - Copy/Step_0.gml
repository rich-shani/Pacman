/// ===============================================================================
/// oGHOST - BASE GHOST OBJECT - STEP_0 EVENT
/// ===============================================================================
/// Purpose: Handle animation updates and common state management
/// Called: Every frame (first step event for ghosts)
/// Parent: oGhost
/// Dependencies: GHOST_STATE enum, flash counter from parent
///
/// This event handles:
/// 1. Animation frame updates (cycling through sprite frames)
/// 2. Frightened mode flashing effect
/// 3. Tile coordinate tracking
/// 4. Visibility management (for flashing effect)
///
/// This event runs BEFORE Step_1 and Step_2, so animation is always in sync
/// ===============================================================================

// ===== ANIMATION FRAME UPDATE =====
/// Animate sprite by cycling through frames 0-15
/// Frame 16 resets to 0, creating smooth looping animation
/// Speed: Completes cycle every 16 frames
///
/// Note: image_speed is set to 0 in Create event, so we control animation manually
if state != GHOST_STATE.EYES {
    /// Normal animation: cycle through frames
    im = (im + 1) % 16;
}
/// Eyes mode: keep animation frozen (only eye sprites, no body animation)

// ===== FRIGHTENED MODE FLASHING EFFECT =====
/// When power pellet is active, ghost flashes white and blue near end
/// This creates a visual warning that power pellet is about to expire
///
/// Flash pattern:
/// - flash 0-14: Dark blue (frightened color)
/// - flash 15-29: White (flashing effect)
/// - flash 30+: Cycles back to 0
/// - Creates flashing effect: approximately every 30 frames
///
/// Note: Ghost is always visible during chase and eyes mode
/// Only visible becomes false during frightened flashing (flash > 15)

if state == GHOST_STATE.FRIGHTENED {
    /// Increment flash counter (used by Draw event for white flashing)
    flash = (flash + 1) % 30;

    /// Visibility toggling: flash white near end of power pellet
    /// When Pac.alarm[0] gets low (near power pellet expiration),
    /// ghost flashes white to warn it's running out of time
    if Pac.alarm[0] < 121 {
        /// Near end of power pellet: flash effect
        visible = (flash < 15);  /// Invisible when flash >= 15
    } else {
        /// Early in power pellet: always visible
        visible = true;
    }
} else {
    /// Non-frightened states: always visible
    visible = true;
    flash = 0;  /// Reset flash counter when state changes
}

// ===== TILE COORDINATE TRACKING =====
/// Update tile position every frame for pathfinding
/// Converts pixel position to 16-pixel grid coordinates
/// Used by pathfinding scripts to check valid moves
tilex = 16 * round(x / 16);
tiley = 16 * round(y / 16);

// ===== WRAPAROUND CHECK FOR VERTICAL (Not tunnel wraparound) =====
/// Some rooms have wraparound at top/bottom (not just left/right tunnel)
/// This handles vertical wraparound for tall rooms
/// Different from Other_0 event which handles horizontal tunnel wraparound

if direction == 90 and y < 32 {
    /// Moving up out of top: wrap to bottom
    y = 544;
    tiley = 16 * (round(y / 16));
}

if direction == 270 and y > room_height - 32 {
    /// Moving down out of bottom: wrap to top
    y = 32;
    tiley = 16 * (round(y / 16));
}

/// ===============================================================================
/// END oGHOST STEP_0 EVENT
/// ===============================================================================
