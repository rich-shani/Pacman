/// ===============================================================================
/// action_color() - SET DRAW COLOR (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Set the base color for drawing functions (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Color value to set
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Set global drawing color
/// 2. Affects all subsequent draw operations
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - Sets the base color for the draw functions
/// @param col The color to set for drawing.
function action_color(argument0) {
    /// Set the drawing color for all subsequent draw operations
    /// This affects draw_text, draw_sprite, draw_rectangle, etc.
    draw_set_color(argument0);
}
