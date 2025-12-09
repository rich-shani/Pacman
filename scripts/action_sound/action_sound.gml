/// ===============================================================================
/// action_sound() - PLAY SOUND EFFECT (DnD COMPATIBILITY)
/// ===============================================================================
/// Purpose: Play a sound effect (Drag-and-Drop action compatibility)
/// Called: From converted DnD actions or legacy code
/// Parameters:
///   - argument0: Sound resource index to play
///   - argument1: Loop flag (true = loop, false = play once)
/// Returns: Nothing
///
/// Responsibilities:
/// 1. Play sound at volume 1 (10% volume)
/// 2. Support both looping and one-shot sounds
///
/// Note: This function maintains compatibility with old Drag-and-Drop actions
/// ===============================================================================

/// @description (Old DnD) - play sound
/// @param index sound index
/// @param loop true if playing a loop
function action_sound(argument0, argument1) {
    /// Play sound at volume 1 (10% volume) with optional looping
    /// Volume range: 0-100 (1 = 1% volume)
    /// Looping: argument1 determines if sound loops
    audio_play_sound(argument0, 1, argument1);
}
