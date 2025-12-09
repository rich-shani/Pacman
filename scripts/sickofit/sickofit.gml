/// ===============================================================================
/// sickofit() - RESTORE MOVEMENT AFTER GHOST EATING
/// ===============================================================================
/// Purpose: Restore Player 1 and Player 2 movement speed after eating a ghost
/// Called: When a ghost is eaten (from beginstep2 or Pac Step_1)
/// ===============================================================================
/// Responsibilities:
/// 1. Clear pause flags for both players
/// 2. Restore movement speed based on eating direction
/// 3. Handle both normal and fright mode speeds
/// 4. Clear suspension flags
///
/// This function is called "sickofit" as a reference to the classic Pacman
/// eating sound effect and the satisfaction of eating ghosts.
/// ===============================================================================

function sickofit() {
    /// Clear pause flags for both players
    pause = 0;   // Player 1 pause cleared
    
    // ===== FRIGHT MODE SPEED RESTORATION =====
    /// Restore speed when in fright mode (power pellet active)
    if (fright == true) {
        // ===== PLAYER 1 SPEED RESTORATION =====
        /// Restore Player 1 speed based on eating direction (8-way)
        /// eatdir: 0=right, 1=up-right, 2=up, 3=up-left, 4=left, 5=down-left, 6=down, 7=down-right
        if (eatdir == 0) { hspeed = spfright; vspeed = 0; eatdir = -1; }
        if (eatdir == 1) { hspeed = spfright; vspeed = -spfright; eatdir = -1; }
        if (eatdir == 2) { hspeed = 0; vspeed = -spfright; eatdir = -1; }
        if (eatdir == 3) { hspeed = -spfright; vspeed = -spfright; eatdir = -1; }
        if (eatdir == 4) { hspeed = -spfright; vspeed = 0; eatdir = -1; }
        if (eatdir == 5) { hspeed = -spfright; vspeed = spfright; eatdir = -1; }
        if (eatdir == 6) { hspeed = 0; vspeed = spfright; eatdir = -1; }
        if (eatdir == 7) { hspeed = spfright; vspeed = spfright; eatdir = -1; }
        stoppy = 0;  // Clear Player 1 suspension flag
     
    }
    // ===== NORMAL MODE SPEED RESTORATION =====
    /// Restore speed when in normal mode (no power pellet)
    else {
        // ===== PLAYER 1 SPEED RESTORATION =====
        /// Restore Player 1 speed based on eating direction (8-way)
        if (eatdir == 0) { hspeed = sp; vspeed = 0; eatdir = -1; }
        if (eatdir == 1) { hspeed = sp; vspeed = -sp; eatdir = -1; }
        if (eatdir == 2) { hspeed = 0; vspeed = -sp; eatdir = -1; }
        if (eatdir == 3) { hspeed = -sp; vspeed = -sp; eatdir = -1; }
        if (eatdir == 4) { hspeed = -sp; vspeed = 0; eatdir = -1; }
        if (eatdir == 5) { hspeed = -sp; vspeed = sp; eatdir = -1; }
        if (eatdir == 6) { hspeed = 0; vspeed = sp; eatdir = -1; }
        if (eatdir == 7) { hspeed = sp; vspeed = sp; eatdir = -1; }
        stoppy = 0;  // Clear Player 1 suspension flag
        
    }
}
