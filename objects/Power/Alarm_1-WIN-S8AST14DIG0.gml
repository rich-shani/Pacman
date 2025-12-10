/// ===============================================================================
/// POWER PELLET OBJECT - ALARM_1 EVENT (BLINKING ANIMATION)
/// ===============================================================================
/// Purpose: Handle power pellet blinking animation (off state)
/// Called: When alarm[1] timer expires (every 10 frames)
///
/// Responsibilities:
/// 1. Hide power pellet (make it black/invisible)
/// 2. Reset timer for next blink cycle
/// ===============================================================================

// ===== BLINKING ANIMATION (OFF STATE) =====
/// Set power pellet tile to black (invisible/hidden state)
/// Creates blinking effect by alternating between visible and invisible
tile_set_blend(tile_layer_find(depth, x, y), c_black);

/// Reset timer for next blink cycle (10 frames = ~0.17 seconds at 60 FPS)
alarm[1] = 10;
