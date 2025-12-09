/// ===============================================================================
/// tile_layer_hide() - HIDE ALL TILES AT DEPTH
/// ===============================================================================
/// Purpose: Hide all tiles at a specific depth layer
/// Called: For visual effects and layer management
/// Parameters:
///   - argument0: Depth layer to hide
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Find all layers at specified depth
/// 2. Hide all tile elements in those layers
/// 3. Tiles remain in memory but are not rendered
///
/// Usage Examples:
///   tile_layer_hide(depth);  // Hide all tiles at depth
/// ===============================================================================

/// @description Hides all tiles at the indicated depth layer.
/// @param depth The depth of tiles which is to be hidden.
/// @returns 
function tile_layer_hide(argument0) {
    /// Extract depth parameter
    var __depth = argument0;
    
    // ===== SEARCH ALL LAYERS =====
    /// Scan through all layers looking for tiles at specified depth
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
                /// Hide the tile (make invisible)
                /// Tile still exists but won't be rendered
                layer_tile_visible(__els[__j], false);
            }
        }
    }
}
