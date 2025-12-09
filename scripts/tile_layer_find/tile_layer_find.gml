/// ===============================================================================
/// tile_layer_find() - FIND TILE AT POSITION
/// ===============================================================================
/// Purpose: Find a tile element at a specific position and depth
/// Called: When checking for tiles at a location (collision, replacement, etc.)
/// Parameters:
///   - argument0: Depth layer to search
///   - argument1: X position to check
///   - argument2: Y position to check
/// Returns: Tile element ID, or -1 if not found
///
/// Responsibilities:
/// 1. Search all layers at specified depth
/// 2. Check if position intersects with any tile
/// 3. Return tile ID if found, -1 if not found
///
/// Performance Note:
/// This function scans through all layers and tiles, which can be slow.
/// Consider caching results if called frequently.
///
/// Usage Examples:
///   var tile = tile_layer_find(depth, x, y);
///   if (tile != -1) {
///       tile_set_blend(tile, c_red);  // Modify found tile
///   }
/// ===============================================================================

/// @description Returns the id of a tile at a given depth and position.
/// @param depth The depth of the tile to be found.
/// @param x The x position to check.
/// @param y The y position to check.
/// @returns 
function tile_layer_find(argument0, argument1, argument2) {
    /// Extract parameters
    var __depth = argument0;  // Depth layer to search
    var __x = argument1;     // X position to check
    var __y = argument2;     // Y position to check
    
    // ===== SEARCH ALL LAYERS =====
    /// Scan through all layers looking for tiles
    /// This is going to be slow - consider optimization if performance is critical
    var __layers = layer_get_all();
    var __numlayers = array_length_1d(__layers);
    
    var __i;
    /// Iterate through all layers
    for (__i = 0; __i < __numlayers; __i++) {
        /// Skip layers that don't match the target depth
        if (layer_get_depth(__layers[__i]) != __depth) {
            continue;
        }
        
        /// Get all elements in this layer
        var __els = layer_get_all_elements(__layers[__i]);
        var __numels = array_length_1d(__els);
        
        var __j;
        /// Iterate through all elements in layer
        for (__j = 0; __j < __numels; __j++) {
            /// Check if element is a tile
            var __eltype = layer_get_element_type(__els[__j]);
            if (__eltype == layerelementtype_tile) {
                /// Get tile scale values
                var __tileXscale = layer_tile_get_xscale(__els[__j]);
                var __tileYscale = layer_tile_get_yscale(__els[__j]);
                
                // ===== FAST PATH (POSITIVE SCALE) =====
                /// Optimized path for normal (non-flipped) tiles
                if ((__tileXscale >= 0) && (__tileYscale >= 0)) {
                    /// Get tile position
                    var __tileX = layer_tile_get_x(__els[__j]);
                    /// Early exit if position is before tile
                    if (__x < __tileX) {
                        continue;
                    }
                    
                    var __tileY = layer_tile_get_y(__els[__j]);
                    /// Early exit if position is above tile
                    if (__y < __tileY) {
                        continue;
                    }
                    
                    /// Get tile region (size)
                    var __tileReg = layer_tile_get_region(__els[__j]);
                    /// Calculate right edge of tile
                    var __tileRight = __tileX + (__tileXscale * __tileReg[2]);
                    /// Early exit if position is after tile
                    if (__x >= __tileRight) {
                        continue;
                    }
                    
                    /// Calculate bottom edge of tile
                    var __tileBottom = __tileY + (__tileYscale * __tileReg[3]);
                    /// Early exit if position is below tile
                    if (__y >= __tileBottom) {
                        continue;
                    }
                    
                    /// Position is within tile bounds - return this tile
                    return __els[__j];
                }
                // ===== SLOW PATH (NEGATIVE SCALE / FLIPPED) =====
                /// Handle flipped tiles (negative scale)
                else {
                    /// Get tile region
                    var __tileReg = layer_tile_get_region(__els[__j]);
                    
                    /// Calculate X bounds (handle negative scale)
                    var __minx = layer_tile_get_x(__els[__j]);
                    var __maxx = __minx + (__tileXscale * __tileReg[2]);
                    /// Swap if min > max (negative scale)
                    if (__minx > __maxx) {
                        var __temp = __minx;
                        __minx = __maxx;
                        __maxx = __temp;
                    }
                    
                    /// Early exit if position is outside X bounds
                    if (__x < __minx) {
                        continue;
                    }
                    if (__x >= __maxx) {
                        continue;
                    }
                    
                    /// Calculate Y bounds (handle negative scale)
                    var __miny = layer_tile_get_y(__els[__j]);
                    var __maxy = __miny + (__tileYscale * __tileReg[3]);
                    /// Swap if min > max (negative scale)
                    if (__miny > __maxy) {
                        var __temp = __miny;
                        __miny = __maxy;
                        __maxy = __temp;
                    }
                    
                    /// Early exit if position is outside Y bounds
                    if (__y < __miny) {
                        continue;
                    }
                    if (__y >= __maxy) {
                        continue;
                    }
                    
                    /// Position is within tile bounds - return this tile
                    return __els[__j];
                }
            }
        }
    }
    
    /// No tile found at specified position and depth
    return -1;
}
