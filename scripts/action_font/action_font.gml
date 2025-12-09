/// ===============================================================================
/// action_font() - SET DRAW FONT & ALIGNMENT (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Set font and horizontal alignment for drawing (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Font resource index
///   - argument1: Horizontal alignment (fa_left, fa_center, fa_right)
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Set font for all subsequent text drawing
/// 2. Set horizontal text alignment
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - set the font and horizontal alignment
/// @param fontid	font id
/// @param haligh   horizontal alignment
function action_font(argument0, argument1) {
    /// Set font for all subsequent draw_text calls
    draw_set_font(argument0);
    
    /// Set horizontal text alignment
    /// fa_left: Left-aligned text
    /// fa_center: Center-aligned text
    /// fa_right: Right-aligned text
    draw_set_halign(argument1);
}
