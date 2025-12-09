/// ===============================================================================
/// tile_set_blend() - SET TILE COLOR BLENDING
/// ===============================================================================
/// Purpose: Change the color blend/tint of a tile
/// Called: For color effects and visual styling
/// Parameters:
///   - argument0: Tile element ID
///   - argument1: Color value to blend with tile
/// Returns: Success status
///
/// Responsibilities:
/// 1. Apply color tinting to tile
/// 2. Enable dynamic color changes
///
/// Usage Examples:
///   tile_set_blend(tile_id, c_red);           // Tint tile red
///   tile_set_blend(tile_id, make_color_rgb(255, 0, 0));  // Tint tile red (RGB)
/// ===============================================================================

/// @description Sets a tile's blending.
/// @param index The index of the tile.
/// @param colour The colour to blend the tile with.
/// @returns 
function tile_set_blend(argument0, argument1) {
    /// Extract parameters
    var __index = argument0;    // Tile element ID
    var __colour = argument1;   // Color to blend with
    
    /// Set tile color blend/tint
    /// Returns success status
    return layer_tile_blend(__index, __colour);
}
