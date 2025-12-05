/// ===============================================================================
/// oGHOST - BASE GHOST OBJECT - ALARM_0 EVENT
/// ===============================================================================
/// Purpose: Handle response when Pac eats a power pellet
/// Triggered: When Pac.alarm[0] is set (in Pac object)
/// Logic: Reverse direction for all non-in-house ghosts
///
/// When Pac eats a power pellet:
/// 1. Alarm_0 is triggered for all ghosts
/// 2. Ghosts not in house (house=0) reverse direction (180°)
/// 3. Ghosts in states CHASE or FRIGHTENED are affected
/// 4. Eyes and IN_HOUSE ghosts are NOT affected (already fleeing/returning)
///
/// The reversal creates the illusion of ghosts being "startled" by power pellet
/// and is a key part of Pac-Man AI behavior
/// ===============================================================================

/// ===== REVERSE DIRECTION WHEN POWER PELLET EATEN =====
/// Trigger: Pac eats power pellet, Pac.alarm[0] is set
/// Effect: All free ghosts reverse direction
/// Reason: Gameplay mechanic - makes ghosts appear to react to danger

if (house == 0 && state < GHOST_STATE.EYES) {
    /// Ghost is free (not in house) and not already dead
    /// CHASE (0) and FRIGHTENED (1) states are affected
    /// EYES (2) and higher are NOT affected

    /// Reverse direction by 180°
    direction = resdir * 90;
    /// resdir starts at 2 (LEFT), multiplied by 90 = 180
    /// This flips direction exactly 180°

    /// Also reset newtile to force immediate pathfinding update
    /// This allows ghosts to pick new target right away
    newtile = 0;
}

/// Note: This event is called for every ghost instance when Pac eats power pellet
/// See Pac object for the trigger: "with oGhost { alarm[0] = <value>; }"

/// ===============================================================================
/// END oGHOST ALARM_0 EVENT
/// ===============================================================================
