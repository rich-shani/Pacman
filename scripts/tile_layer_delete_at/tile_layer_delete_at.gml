/// ===============================================================================
/// tile_layer_delete_at() - DELETE TILE AT POSITION
/// ===============================================================================
/// Purpose: Remove a tile at a specific position and depth
/// Called: When tiles need to be removed at specific locations (dot collection, etc.)
/// Parameters:
///   - argument0: Depth layer to search
///   - argument1: X position of tile to delete
///   - argument2: Y position of tile to delete
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Find tile at specified position and depth
/// 2. Delete tile if found
/// 3. Handle case where no tile exists (gracefully ignore)
///
/// Usage Examples:
///   tile_layer_delete_at(depth, x, y);  // Remove tile at position
/// ===============================================================================

/// @description Deletes the tile(s) at a given depth and position.
/// @param depth The depth of a tile to be deleted.
/// @param x The x position at which to delete a tile.
/// @param y The y position at which to delete a tile.
/// @returns 
function tile_layer_delete_at(argument0, argument1, argument2) {
    /// Extract parameters
    var __depth = argument0;  // Depth layer to search
    var __x = argument1;      // X position to delete
    var __y = argument2;     // Y position to delete
    
    /// Find tile at specified position and depth
    /// Returns tile element ID or -1 if not found
    var __tile_el = tile_layer_find(__depth, __x, __y);
    
    /// Delete tile if found
    if (__tile_el != -1) {
        /// Destroy the tile element
        /// This removes it from the layer and frees its resources
        layer_tile_destroy(__tile_el);
    }
    /// If tile not found, silently ignore (no error)
}
