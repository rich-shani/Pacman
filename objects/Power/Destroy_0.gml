/// ===============================================================================
/// POWER PELLET OBJECT - DESTROY EVENT (CLEANUP)
/// ===============================================================================
/// Purpose: Clean up power pellet object and update game state
/// Called: When power pellet object is destroyed
///
/// Responsibilities:
/// 1. Increment dot collection counter (power pellets count as dots)
/// 2. Remove power pellet tile from tile layer
/// ===============================================================================

// ===== INCREMENT DOT COUNTER =====
/// Power pellets count toward dot collection total
/// Only increment counter if level is not finished
/// Prevents counting dots after level completion
if (Pac.finish == 0) {
    Pac.dotcount = Pac.dotcount + 1;
}

// ===== REMOVE POWER PELLET TILE =====
/// Delete power pellet tile from tile layer
/// Power pellets are rendered as tiles, so we need to remove them when collected
tile_layer_delete_at(depth, x, y);
