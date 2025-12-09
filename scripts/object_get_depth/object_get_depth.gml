/// ===============================================================================
/// object_get_depth() - GET OBJECT DEFAULT DEPTH
/// ===============================================================================
/// Purpose: Retrieve the default depth value for an object type
/// Called: When creating instances to determine correct depth
/// Parameters:
///   - argument0: Object index to check
/// Returns: Depth value (0 if invalid or not found)
///
/// Responsibilities:
/// 1. Look up object's depth in global depth array
/// 2. Return depth value or 0 if invalid
///
/// Note: Depths are stored in global.__objectID2Depth array
/// ===============================================================================

/// @description Returns the depth of the specified object.
/// @param {Number} obj The index of the object to check
/// @return {Number} depth of the object
function object_get_depth(argument0) {
    /// Extract object ID
    var objID = argument0;
    var ret = 0;  // Default return value
    
    /// Check if object ID is valid and within array bounds
    if (objID >= 0) && (objID < array_length_1d(global.__objectID2Depth)) {
        /// Get depth from global depth array
        ret = global.__objectID2Depth[objID];
    }
    
    /// Return depth value (0 if invalid)
    return ret;
}
