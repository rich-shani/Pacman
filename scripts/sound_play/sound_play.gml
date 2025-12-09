/// ===============================================================================
/// sound_play() - PLAY SOUND EFFECT ONCE
/// ===============================================================================
/// Purpose: Play a sound effect one time (non-looping)
/// Called: Throughout the game for various sound effects
/// Parameters:
///   - argument0: Sound resource index to play
///
/// Responsibilities:
/// 1. Play sound at default volume (10)
/// 2. Play once (not looping)
///
/// Usage Examples:
///   sound_play(Dot0);      // Play dot collection sound
///   sound_play(Chomp);     // Play ghost eating sound
///   sound_play(snd_Fruit); // Play fruit collection sound
/// ===============================================================================

function sound_play(argument0) {
    // ------------------------------------------------------------
    /// @description Plays the indicated sound once.
    /// @param index The index of the sound to play
    
    /// Play sound at volume 10 (default) without looping
    /// Volume range: 0-100 (10 = 10% volume)
    audio_play_sound(argument0, 10, false);
}
