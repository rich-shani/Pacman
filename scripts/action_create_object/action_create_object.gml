/// ===============================================================================
/// action_create_object() - CREATE OBJECT INSTANCE (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Create an object instance at a position (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Object index to create
///   - argument1: X position (or offset if relative)
///   - argument2: Y position (or offset if relative)
/// Returns: 0 on error, instance ID on success
///
/// Responsibilities:
/// 1. Validate object exists
/// 2. Handle relative vs absolute positioning
/// 3. Create instance at specified position
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - creates an instance of an object at a position
/// @param objInd object to create
/// @param xPos		X position to create at
/// @param yPos		Y position to create at
function action_create_object(argument0, argument1, argument2) {
    /// Validate object exists before creating
    if (!object_exists(argument0)) {
        /// Show error message if object doesn't exist
        show_message("creating instance for non-existent object" + string(id));
        return 0;  // Return error code
    }
    
    /// Check if coordinates should be relative to calling instance
    if (global.__argument_relative) {
        /// Create instance at relative position (offset from caller)
        instance_create(x + argument1, y + argument2, argument0);
    } else {
        /// Create instance at absolute position
        instance_create(argument1, argument2, argument0);
    }
}
