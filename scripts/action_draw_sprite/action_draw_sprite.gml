/// ===============================================================================
/// action_draw_sprite() - DRAW SPRITE (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Draw a sprite at a position (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Sprite index to draw
///   - argument1: X position (or offset if relative)
///   - argument2: Y position (or offset if relative)
///   - argument3: Subimage/frame number (-1 = use current image_index)
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Handle relative vs absolute positioning
/// 2. Draw sprite at specified position
/// 3. Use current image_index if subimage is negative
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - draw sprite
/// @param index	sprite index
/// @param x	x position 
/// @param y	y position 
/// @param subimg	sub image number
function action_draw_sprite(argument0, argument1, argument2, argument3) {
    /// Extract parameters
    var index = argument0;   // Sprite index
    var xx = argument1;      // X position
    var yy = argument2;      // Y position
    var subimg = argument3;  // Subimage/frame number
    
    /// Check if coordinates should be relative to calling instance
    if (global.__argument_relative) {
        /// Add caller's position to coordinates (relative positioning)
        xx += x;
        yy += y;
    }
    
    /// Use current image_index if subimage is negative
    if (subimg < 0) {
        subimg = image_index;
    }
    
    /// Draw sprite at calculated position
    draw_sprite(index, subimg, xx, yy);
}
