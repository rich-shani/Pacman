/// ===============================================================================
/// POWER PELLET OBJECT - CREATE EVENT (INITIALIZATION)
/// ===============================================================================
/// Purpose: Initialize power pellet object variables
/// Called: When power pellet object is created
///
/// Responsibilities:
/// 1. Initialize animation variables
/// 2. Calculate color values for rendering
/// ===============================================================================

// ===== INITIALIZE VARIABLES =====
/// Sprite animation speed (0 = static sprite)
image_speed = 0;

// ===== COLOR VARIABLES (INITIALIZE TO ZERO) =====
/// Color hue, saturation, value (calculated in Draw event)
dh = 0;
ds = 0;
dv = 0;

// ===== SPECIAL DOT REGENERATION (JR. PACMAN RANDOM MODE) =====
/// In Jr. Pacman random mode, power pellets can regenerate at specific positions
/// This creates dynamic maze changes during gameplay
if (global.game == 2 && global.rand == 1 && global.lvl > 4) {
    /// Check if power pellet is at regeneration position
    /// Regeneration occurs at center positions or specific horizontal ranges
    if ((x == 240 && room_height == 960) || 
        (x > 192 && x < 656 && room_height < 960)) {
        
        /// Create new power pellet at same position
        instance_create(x, y, Dot);
        
        /// Destroy this instance (will be replaced by new one)
        instance_destroy();
    }
}
