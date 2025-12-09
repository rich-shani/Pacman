/// ===============================================================================
/// DOT OBJECT - DESTROY EVENT (CLEANUP)
/// ===============================================================================
/// Purpose: Clean up dot object and update game state
/// Called: When dot object is destroyed
///
/// Responsibilities:
/// 1. Increment dot collection counter
/// 2. Remove dot tiles from tile layers
/// 3. Handle special dot regeneration (Jr. Pacman random mode)
/// ===============================================================================

// ===== INCREMENT DOT COUNTER =====
/// Only increment counter if level is not finished
/// Prevents counting dots after level completion
if (Pac.finish == 0) {
    Pac.dotcount = Pac.dotcount + 1;
}

// ===== REMOVE DOT TILES =====
/// Delete dot tiles from all tile layers
/// Dots are rendered as tiles, so we need to remove them when collected
tile_layer_delete_at(depth, x, y);        // Main dot tile
tile_layer_delete_at(depth + 1, x, y);    // Upper layer
tile_layer_delete_at(depth - 1, x, y);    // Lower layer

// ===== SPECIAL DOT REGENERATION (JR. PACMAN RANDOM MODE) =====
/// In Jr. Pacman random mode, dots can regenerate at specific positions
/// This creates dynamic maze changes during gameplay
if (global.game == 2 && global.rand == 1 && global.lvl > 4) {
    /// Check if dot is at regeneration position
    /// Regeneration occurs at center positions or specific horizontal ranges
    if ((x == 240 && room_height == 960) || 
        (x > 192 && x < 656 && room_height < 960)) {
        
        /// Create new dot at same position
        instance_create(x, y, Dot);
        
        /// Reset mirror position (used for pathfinding)
        global.p3x = 0;
        global.p3y = 0;
        
        /// Destroy this instance (will be replaced by new one)
        instance_destroy();
        
        /// Decrement dot count (since we're replacing, not collecting)
        Pac.dotcount = Pac.dotcount - 1;
    }
}
