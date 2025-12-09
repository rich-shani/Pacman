/// ===============================================================================
/// action_set_alarm() - SET ALARM (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Set an alarm value (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Alarm index (0-11)
///   - argument1: Value to set alarm to (in steps)
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Set alarm timer to specified value
/// 2. Alarm will trigger when it counts down to 0
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - set alarm
/// @param index alarm index
/// @param val value to set to
function action_set_alarm(argument0, argument1) {
    /// Set alarm timer
    /// Note: GameMaker's alarm_set uses (alarm_index, value) order
    alarm_set(argument1, argument0);
}
