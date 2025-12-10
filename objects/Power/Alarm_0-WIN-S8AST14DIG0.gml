/// ===============================================================================
/// POWER PELLET OBJECT - ALARM_0 EVENT (BLINKING ANIMATION)
/// ===============================================================================
/// Purpose: Handle power pellet blinking animation
/// Called: When alarm[0] timer expires (every 10 frames)
///
/// Responsibilities:
/// 1. Toggle power pellet visibility (blinking effect)
/// 2. Reset timer for next blink cycle
/// ===============================================================================

// ===== BLINKING ANIMATION =====
/// Set power pellet tile to visible color (restore normal appearance)
/// Uses dot color from Drawless object for consistent coloring
tile_set_blend(tile_layer_find(depth, x, y), 
               make_color_hsv(Drawless.dh, Drawless.ds, Drawless.dv));

/// Reset timer for next blink cycle (10 frames = ~0.17 seconds at 60 FPS)
alarm[0] = 10;
