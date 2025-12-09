/// ===============================================================================
/// sound_stop() - STOP SOUND EFFECT
/// ===============================================================================
/// Purpose: Stop a currently playing sound effect
/// Called: When sound needs to be stopped (state changes, level end, etc.)
/// Parameters:
///   - argument0: Sound resource index to stop
///
/// Responsibilities:
/// 1. Stop the specified sound immediately
/// 2. Works for both looping and non-looping sounds
///
/// Usage Examples:
///   sound_stop(Ghost1);   // Stop ghost siren
///   sound_stop(Credit);   // Stop credit sound
/// ===============================================================================

function sound_stop(argument0) {
    // ------------------------------------------------------------
    /// @description Stops a given sound.
    /// @param index The index of the sound to stop
    
    /// Stop the specified sound immediately
    /// Works for both looping and one-shot sounds
    audio_stop_sound(argument0);
}
