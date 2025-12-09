/// ===============================================================================
/// sound_loop() - LOOP SOUND EFFECT
/// ===============================================================================
/// Purpose: Play a sound effect continuously (looping)
/// Called: For background music and ambient sounds
/// Parameters:
///   - argument0: Sound resource index to loop
///
/// Responsibilities:
/// 1. Play sound at default volume (10)
/// 2. Loop continuously until stopped
///
/// Usage Examples:
///   sound_loop(Ghost1);   // Loop ghost siren sound
///   sound_loop(Credit);   // Loop credit sound
/// ===============================================================================

function sound_loop(argument0) {
    // ------------------------------------------------------------
    /// @description Loops the indicated sound
    /// @param index The index of the sound to loop
    
    /// Play sound at volume 10 (default) with looping enabled
    /// Volume range: 0-100 (10 = 10% volume)
    /// Looping: true = sound repeats indefinitely
    audio_play_sound(argument0, 10, true);
}
