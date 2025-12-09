/// ===============================================================================
/// action_if_number() - COMPARE INSTANCE COUNT (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Compare number of instances of an object type (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Object index to count instances of
///   - argument1: Value to compare count against
///   - argument2: Comparison type (1=<, 2=>, else==)
/// Returns: Boolean result of comparison
///
/// Responsibilities:
/// 1. Count instances of specified object type
/// 2. Compare count with target value
/// 3. Return boolean result for conditional logic
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - if number evauation
/// @param index  instance index to check against
/// @param value value to compare against
/// @param type	type of check (1==<, 2==>, anything else is ==)
function action_if_number(argument0, argument1, argument2) {
    /// Initialize return value
    var ret = false;
    
    /// Count instances of the specified object type
    var n = instance_number(argument0);
    
    /// Perform comparison based on operator type
    switch (argument2) {
        case 1:
            /// Less than (<)
            ret = (n < argument1);
            break;
        
        case 2:
            /// Greater than (>)
            ret = (n > argument1);
            break;
        
        default:
            /// Equal (==) - default comparison
            ret = (n == argument1);
            break;
    }
    
    /// Return comparison result
    return ret;
}
