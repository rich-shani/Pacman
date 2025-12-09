/// ===============================================================================
/// FRUIT OBJECT - ALARM_2 EVENT (EXPLOSION ANIMATION TIMER)
/// ===============================================================================
/// Purpose: End explosion animation and stop sound effect
/// Called: When alarm[2] timer expires (after explosion animation)
///
/// Responsibilities:
/// 1. Hide explosion sprite
/// 2. Stop explosion sound effect
/// ===============================================================================

// ===== END EXPLOSION ANIMATION =====
/// Hide explosion sprite
explosion = 0;

/// Stop credit sound effect (explosion sound)
sound_stop(Credit);
