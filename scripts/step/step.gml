/// ===============================================================================
/// step() - PLAYER 2 MOVEMENT AND WRAPPING
/// ===============================================================================
/// Purpose: Handle Player 2 (Mac) movement, screen wrapping, and grid alignment
/// Called: Every frame from Mac object Step event
///
/// Responsibilities:
/// 1. Apply movement speed to Player 2 position
/// 2. Handle screen wrapping (left/right and top/bottom)
/// 3. Restore speed after wrapping
/// 4. Align Player 2 to grid when moving straight
/// 5. Update Mac sprite position
/// ===============================================================================

/// @description /programming speed for Player 2
function step() {
    // ===== APPLY MOVEMENT =====
    /// Move Player 2 based on current speed values
    /// Only move when alive, not paused, and not eating ghost
    if (dead == 0 && pause2 == 0 && chomp == 0) {
        x2 = x2 + hspeed2;
        y2 = y2 + vspeed2;
    }
    
    // ===== SCREEN WRAPPING =====
    /// Handle wrapping when Player 2 moves off screen edges
    /// Wrapping allows continuous movement across screen boundaries
    
    // ===== WRAP LEFT TO RIGHT =====
    /// When moving left and exiting left edge, wrap to right side
    if (direction2 == 180 && x2 < -24) {
        /// Calculate wrapped position
        x2 = (room_width + 24) - (x2 + 24);
        tilex2 = 16 * (round(x2 / 16));
        bonked2 = 0;  // Reset collision flag
        
        /// Restore speed based on fright mode
        if (fright == 1) {
            /// Fright mode speeds
            if (dir2 == 0) { hspeed2 = spfright; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -spfright; }
            if (dir2 == 2) { hspeed2 = -spfright; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = spfright; }
        } else {
            /// Normal speeds
            if (dir2 == 0) { hspeed2 = sp; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -sp; }
            if (dir2 == 2) { hspeed2 = -sp; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = sp; }
        }
    }
    
    // ===== WRAP RIGHT TO LEFT =====
    /// When moving right and exiting right edge, wrap to left side
    if (direction2 == 0 && x2 > (room_width + 24)) {
        /// Calculate wrapped position
        x2 = -24 + (x2 - (room_width + 24));
        tilex2 = 16 * (round(x2 / 16));
        bonked2 = 0;  // Reset collision flag
        
        /// Restore speed based on fright mode
        if (fright == 1) {
            /// Fright mode speeds
            if (dir2 == 0) { hspeed2 = spfright; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -spfright; }
            if (dir2 == 2) { hspeed2 = -spfright; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = spfright; }
        } else {
            /// Normal speeds
            if (dir2 == 0) { hspeed2 = sp; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -sp; }
            if (dir2 == 2) { hspeed2 = -sp; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = sp; }
        }
    }
    
    // ===== WRAP TOP TO BOTTOM =====
    /// When moving up and exiting top edge, wrap to bottom
    if (direction2 == 90 && y2 < 32) {
        y2 = 544;
        tiley2 = 16 * (round(y2 / 16));
        bonked2 = 0;  // Reset collision flag
        
        /// Restore speed based on fright mode
        if (fright == 1) {
            /// Fright mode speeds
            if (dir2 == 0) { hspeed2 = spfright; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -spfright; }
            if (dir2 == 2) { hspeed2 = -spfright; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = spfright; }
        } else {
            /// Normal speeds
            if (dir2 == 0) { hspeed2 = sp; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -sp; }
            if (dir2 == 2) { hspeed2 = -sp; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = sp; }
        }
    }
    
    // ===== WRAP BOTTOM TO TOP =====
    /// When moving down and exiting bottom edge, wrap to top
    if (direction2 == 270 && y2 > room_height - 32) {
        y2 = 32;
        tiley2 = 16 * (round(y2 / 16));
        bonked2 = 0;  // Reset collision flag
        
        /// Restore speed based on fright mode
        if (fright == 1) {
            /// Fright mode speeds
            if (dir2 == 0) { hspeed2 = spfright; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -spfright; }
            if (dir2 == 2) { hspeed2 = -spfright; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = spfright; }
        } else {
            /// Normal speeds
            if (dir2 == 0) { hspeed2 = sp; vspeed2 = 0; }
            if (dir2 == 1) { hspeed2 = 0; vspeed2 = -sp; }
            if (dir2 == 2) { hspeed2 = -sp; vspeed2 = 0; }
            if (dir2 == 3) { hspeed2 = 0; vspeed2 = sp; }
        }
    }
    
    // ===== GRID ALIGNMENT =====
    /// Snap Player 2 to grid when moving straight (not in corner transition)
    /// This ensures precise grid alignment for collision detection
    if (corner2 == 0 && eatdir2 == -1 && Pac.finish == 0 && 
        dead == 0 && chomp == 0) {
        /// Align Y coordinate when moving horizontally
        if (!hspeed2 == 0) {
            if (vspeed2 == 0) {
                y2 = 16 * (round(y2 / 16));
            }
        }
        /// Align X coordinate when moving vertically
        if (!vspeed2 == 0) {
            if (hspeed2 == 0) {
                x2 = 16 * (round(x2 / 16));
            }
        }
    }
    
    // ===== UPDATE MAC SPRITE POSITION =====
    /// Sync Mac sprite object position with Player 2 position
    /// Mac is the visual representation of Player 2
    if (instance_exists(Mac)) {
        Mac.x = x2;
        Mac.y = y2;
    }
}
