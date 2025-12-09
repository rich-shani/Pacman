/// ===============================================================================
/// beginstep() - PLAYER 1 ANIMATION UPDATES
/// ===============================================================================
/// Purpose: Update animation frames for Player 1 (Pac)
/// Called: Every frame from Pac Step_1 event (first step script)
///
/// Responsibilities:
/// 1. Reset death animation when not dying
/// 2. Update mouth animation frames based on movement state
/// 3. Handle death animation progression
/// 4. Update secondary animation counter
///
/// Animation Logic:
/// - i2m: Main animation frame (0-7) for mouth opening/closing
/// - deadani2m: Death animation frame counter
/// - i2m2: Secondary animation counter (for alternating effects)
/// ===============================================================================

/// @description /animation
function beginstep() {
    // ===== RESET DEATH ANIMATION =====
    /// Reset death animation counter when Pac is not dead or level is not finished
    /// dead < 2 means Pac is alive or dying (not fully dead)
    /// Pac.finish < 0 means level is still in progress
    if (dead < 2 || Pac.finish < 0) {
        deadani2m = 0;
        
        // ===== LEVEL START ANIMATION =====
        /// Set animation frame based on game variant during level start
        if (global.start == 1) {
            if (global.game == 0) {
                i2m = 0;  // Standard Pacman - closed mouth
            } else {
                i2m = 1;  // Ms. Pacman/Jr. Pacman - slightly open mouth
            }
        }
        // ===== MOVEMENT ANIMATION =====
        else {
            /// Only animate when Pac is moving or eating
            /// Check if Pac is stationary and not eating
            if ((hspeed2 == 0 && vspeed2 == 0) || 
                (chomp == 1) || 
                (hspeed2 == 0 && vspeed2 == 0 && chomp == 1)) {
                // Pac is stationary - no animation update needed
            } else {
                /// Increment animation frame
                /// Boost mode doubles animation speed (i2m+2 instead of i2m+1)
                if (global.boost == 0) {
                    i2m = i2m + 1;  // Normal speed
                } else {
                    i2m = i2m + 2;  // Boost mode - faster animation
                }
                
                /// Wrap animation frame (0-7 cycle)
                if (i2m > 7) {
                    i2m = 0;
                }
            }
        }
    }
    
    // ===== DEATH ANIMATION =====
    /// Progress death animation when Pac is dead (dead == 2)
    /// Animation progresses slowly (0.125 per frame) for smooth dissolve effect
    if (dead == 2) {
        if (deadani2m < 12) {
            deadani2m = deadani2m + 0.125;  // Slow progression for smooth animation
        }
    }
    
    // ===== SECONDARY ANIMATION COUNTER =====
    /// Update secondary animation counter for alternating effects
    /// Only active during gameplay (not during start or finish)
    if (global.start == 0 && Pac.finish == 0) {
        i2m2 = i2m2 + 0.5;  // Increment by 0.5 per frame
        
        /// Wrap counter every 4 frames (0-4 cycle)
        if (i2m2 == 4) {
            i2m2 = 0;
        }
    }
}
