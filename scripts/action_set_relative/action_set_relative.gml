/// ===============================================================================
/// action_set_relative() - SET RELATIVE POSITIONING FLAG (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Enable/disable relative positioning for DnD actions (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Boolean value (true = relative, false = absolute)
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Set global flag for relative positioning
/// 2. Affects all subsequent DnD action calls
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - set argument relative
/// @param val value to set argument relative variable
function action_set_relative(argument0) {
    /// Set global flag for relative positioning
    /// When true, all DnD action coordinates are relative to calling instance
    /// When false, coordinates are absolute (room coordinates)
    global.__argument_relative = argument0;
}
