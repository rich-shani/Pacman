/// ===============================================================================
/// tile_add() - ADD TILE TO ROOM
/// ===============================================================================
/// Purpose: Create a new tile at a specific position and depth
/// Called: When tiles need to be added dynamically (dot destruction, effects, etc.)
/// Parameters:
///   - argument0: Background asset (sprite/tileset) to use for tile
///   - argument1: Left coordinate in background (source X)
///   - argument2: Top coordinate in background (source Y)
///   - argument3: Width of tile
///   - argument4: Height of tile
///   - argument5: X position in room to place tile
///   - argument6: Y position in room to place tile
///   - argument7: Depth layer for tile
/// Returns: Tile element ID (for later manipulation)
///
/// Responsibilities:
/// 1. Find or create layer at specified depth
/// 2. Create tile element from background asset
/// 3. Place tile at specified room coordinates
/// 4. Return tile ID for future operations
///
/// Usage Examples:
///   var tile = tile_add(background, 0, 0, 16, 16, x, y, depth);
///   tile_set_blend(tile, c_red);  // Modify tile after creation
/// ===============================================================================

/// @description Adds a new tile to the room, allowing customisation of its attributes, and returning its index.
/// @param background The background asset from which the new tile will be extracted.
/// @param left The x coordinate of the left of the new tile, relative to the background asset's top left corner.
/// @param top The y coordinate of the top of the new tile, relative to the background assets top left corner.
/// @param width The width of the tile.
/// @param height The height of the tile.
/// @param x The x position in the room to place the tile.
/// @param y The y position in the room to place the tile.
/// @param depth The depth at which to place the tile.
/// @returns {number} resource name for the new tile
function tile_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
    // ===== PARAMETER ASSIGNMENT =====
    /// Extract parameters into local variables for clarity
    var __back = argument0;    // Background asset
    var __left = argument1;    // Source X coordinate
    var __top = argument2;      // Source Y coordinate
    var __width = argument3;   // Tile width
    var __height = argument4;  // Tile height
    var __x = argument5;       // Room X position
    var __y = argument6;       // Room Y position
    var __depth = argument7;   // Depth layer
    
    // ===== FIND OR CREATE LAYER =====
    /// Get all layers in the room
    var __layers = layer_get_all();
    var __numlayers = array_length_1d(__layers);
    
    /// Search for existing layer at specified depth
    var __layertouse = -1;  // Layer ID (-1 = not found)
    var __i;
    for (__i = 0; __i < __numlayers; __i++) {
        /// Check if this layer has the correct depth
        if (layer_get_depth(__layers[__i]) == __depth) {
            /// Found matching layer - use it
            /// Note: We don't check layer names, just use first matching depth
            __layertouse = __layers[__i];
            break;
        }
    }
    
    /// Create new layer if none found at specified depth
    if (__layertouse == -1) {
        /// No layer exists at this depth - create one
        __layertouse = layer_create(__depth);
    }
    
    // ===== CREATE TILE ELEMENT =====
    /// Create new tile element and add it to the layer
    /// This extracts a portion of the background asset and places it as a tile
    var __tile = layer_tile_create(__layertouse, __x, __y, __back, __left, __top, __width, __height);
    
    /// Return tile ID for future manipulation
    return __tile;
}
