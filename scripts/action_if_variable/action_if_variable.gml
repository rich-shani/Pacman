/// ===============================================================================
/// action_if_variable() - COMPARE VARIABLE VALUES (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Compare two variable values with various operators (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: First value to compare
///   - argument1: Second value to compare against
///   - argument2: Comparison type (1=<, 2=>, 3=<=, 4=>=, else==)
/// Returns: Boolean result of comparison
///
/// Responsibilities:
/// 1. Perform comparison based on operator type
/// 2. Return boolean result for conditional logic
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - if variable evauation
/// @param val1  value to check against
/// @param val2  value2 to check against
/// @param type	type of check (1=='<', 2=='>', 3=='<=', 4=='>='anything else is ==)
function action_if_variable(argument0, argument1, argument2) {
    /// Initialize return value
    var ret = false;
    
    /// Perform comparison based on operator type
    switch (argument2) {
        case 1:
            /// Less than (<)
            ret = (argument0 < argument1);
            break;
        
        case 2:
            /// Greater than (>)
            ret = (argument0 > argument1);
            break;
        
        case 3:
            /// Less than or equal (<=)
            ret = (argument0 <= argument1);
            break;
        
        case 4:
            /// Greater than or equal (>=)
            ret = (argument0 >= argument1);
            break;
        
        default:
            /// Equal (==) - default comparison
            ret = (argument0 == argument1);
            break;
    }
    
    /// Return comparison result
    return ret;
}
