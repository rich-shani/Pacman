/// ===============================================================================
/// tile_delete() - DELETE TILE BY ID
/// ===============================================================================
/// Purpose: Remove a tile from the room using its tile ID
/// Called: When tiles need to be removed dynamically
/// Parameters:
///   - argument0: Tile element ID to delete
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Destroy the specified tile element
/// 2. Remove tile from its layer
///
/// Usage Examples:
///   tile_delete(tile_id);  // Remove tile by ID
/// ===============================================================================

/// @description Deletes a given tile in the room.
/// @param index The index of the tile to delete.
/// @returns
function tile_delete(argument0) {
    /// Extract tile ID from parameter
    var __index = argument0;
    
    /// Destroy the tile element
    /// This removes it from the layer and frees its resources
    layer_tile_destroy(__index);
}
