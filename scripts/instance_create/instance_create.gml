/// ===============================================================================
/// instance_create() - CREATE INSTANCE AT DEPTH
/// ===============================================================================
/// Purpose: Create an object instance at a position with automatic depth assignment
/// Called: Throughout the game when creating objects
/// Parameters:
///   - argument0: X position to create at
///   - argument1: Y position to create at
///   - argument2: Object index to create
/// Returns: Instance ID
///
/// Responsibilities:
/// 1. Get object's default depth
/// 2. Create instance at that depth
/// 3. Return instance ID for further manipulation
///
/// Usage Examples:
///   var dot = instance_create(x, y, Dot);
///   var fruit = instance_create(224, 320, Fruit);
/// ===============================================================================

/// @description Creates an instance of a given object at a given position.
/// @param x The x position the object will be created at.
/// @param y The y position the object will be created at.
/// @param obj The object to create an instance of.
function instance_create(argument0, argument1, argument2) {
    /// Get the default depth for this object type
    /// This ensures objects are created at the correct layer
    var myDepth = object_get_depth(argument2);
    
    /// Create instance at specified position and depth
    /// Returns instance ID for further manipulation
    return instance_create_depth(argument0, argument1, myDepth, argument2);
}
