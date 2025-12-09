/// ===============================================================================
/// action_draw_variable() - DRAW VARIABLE VALUE (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Draw a variable's value as text (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Variable value to display
///   - argument1: X position (or offset if relative)
///   - argument2: Y position (or offset if relative)
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Handle relative vs absolute positioning
/// 2. Convert variable to string and draw it
/// 3. Support newline conversion in strings
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - draw variable
/// @param v    variable to display
/// @param x	x position 
/// @param y	y position 
function action_draw_variable(argument0, argument1, argument2) {
    /// Extract position parameters
    var xx = argument1;  // X position
    var yy = argument2;  // Y position
    
    /// Check if coordinates should be relative to calling instance
    if (global.__argument_relative) {
        /// Add caller's position to coordinates (relative positioning)
        xx += x;
        yy += y;
    }
    
    /// Draw variable value as text
    /// Convert variable to string, process newlines, and draw
    /// string_hash_to_newline() converts hash characters (#) to newlines
    draw_text(xx, yy, string_hash_to_newline(string(argument0)));
}
