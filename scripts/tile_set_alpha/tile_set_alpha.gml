/// ===============================================================================
/// tile_set_alpha() - SET TILE TRANSPARENCY
/// ===============================================================================
/// Purpose: Change the alpha (transparency) of a tile
/// Called: For visual effects and fading
/// Parameters:
///   - argument0: Tile element ID
///   - argument1: Alpha value (0.0 = fully transparent, 1.0 = fully opaque)
/// Returns: Success status
///
/// Responsibilities:
/// 1. Set tile transparency level
/// 2. Enable fade effects and visual transitions
///
/// Usage Examples:
///   tile_set_alpha(tile_id, 0.5);  // Make tile 50% transparent
///   tile_set_alpha(tile_id, 0.0);  // Make tile invisible
/// ===============================================================================

/// @description Sets a tile's alpha (transparency).
/// @param index The index of the tile.
/// @param alpha The transparency of the tile.
/// @returns 
function tile_set_alpha(argument0, argument1) {
    /// Extract parameters
    var __index = argument0;   // Tile element ID
    var __alpha = argument1;   // Alpha value (0.0-1.0)
    
    /// Set tile alpha/transparency
    /// Returns success status
    return layer_tile_alpha(__index, __alpha);
}
