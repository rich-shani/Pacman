/// ===============================================================================
/// endstep() - PLAYER 2 CORNER COMPLETION & POST-MOVEMENT LOGIC
/// ===============================================================================
/// Purpose: Handle Player 2 corner transitions, speed restoration, and scoring
/// Called: Every frame after movement (last step event)
///
/// Responsibilities:
/// 1. Complete corner transitions by snapping to grid
/// 2. Restore movement speed after dot/power pellet collection
/// 3. Update direction offset variables
/// 4. Track high scores for all game variants
/// 5. Award extra lives
/// ===============================================================================

/// @description /snapping back to grid after cornering 
function endstep() {
    // ===== CORNER TRANSITION COMPLETION =====
    /// Snap Player 2 to grid when corner transition completes
    /// Different speeds used based on fright mode
    
    // ===== FRIGHT MODE CORNER COMPLETION =====
    if (fright == 1) {
        /// Corner 1: Up to Right (pre-turn) - snap Y to grid, move right
        if (corner2 == 1) {
            if (y2 < 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = spfright;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 2: Up to Right (post-turn) - snap Y to grid, move right
        if (corner2 == 2) {
            if (y2 > 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = spfright;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 3: Right to Up (pre-turn) - snap X to grid, move up
        if (corner2 == 3) {
            if (x2 > 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = -spfright;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 4: Right to Up (post-turn) - snap X to grid, move up
        if (corner2 == 4) {
            if (x2 < 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = -spfright;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 5: Up to Left (pre-turn) - snap Y to grid, move left
        if (corner2 == 5) {
            if (y2 < 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = -spfright;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 6: Up to Left (post-turn) - snap Y to grid, move left
        if (corner2 == 6) {
            if (y2 > 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = -spfright;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 7: Right to Down (pre-turn) - snap X to grid, move down
        if (corner2 == 7) {
            if (x2 > 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = spfright;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 8: Right to Down (post-turn) - snap X to grid, move down
        if (corner2 == 8) {
            if (x2 < 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = spfright;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
    }
    // ===== NORMAL MODE CORNER COMPLETION =====
    else {
        /// Corner 1: Up to Right (pre-turn)
        if (corner2 == 1) {
            if (y2 < 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = sp;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 2: Up to Right (post-turn)
        if (corner2 == 2) {
            if (y2 > 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = sp;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 3: Right to Up (pre-turn)
        if (corner2 == 3) {
            if (x2 > 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = -sp;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 4: Right to Up (post-turn)
        if (corner2 == 4) {
            if (x2 < 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = -sp;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 5: Up to Left (pre-turn)
        if (corner2 == 5) {
            if (y2 < 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = -sp;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 6: Up to Left (post-turn)
        if (corner2 == 6) {
            if (y2 > 16 * (round(y2 / 16))) {
                y2 = 16 * (round(y2 / 16));
                hspeed2 = -sp;
                vspeed2 = 0;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 7: Right to Down (pre-turn)
        if (corner2 == 7) {
            if (x2 > 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = sp;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
        /// Corner 8: Right to Down (post-turn)
        if (corner2 == 8) {
            if (x2 < 16 * (round(x2 / 16))) {
                x2 = 16 * (round(x2 / 16));
                hspeed2 = 0;
                vspeed2 = sp;
                corner2 = 0;
                corner2check = 0;
                exit;
            }
        }
    }
    
    // ===== RESTORE SPEED AFTER DOT/POWER PELLET COLLECTION =====
    /// Restore movement speed after brief pause during collection
    /// Only restore when not eating ghost
    if (chomp == 0) {
        // ===== FRIGHT MODE SPEED RESTORATION =====
        if (fright == true) {
            /// Restore speed when pause timer expires
            if (pause2 == 0) {
                /// Restore speed based on eating direction (8-way)
                /// eatdir2: 0=right, 1=up-right, 2=up, 3=up-left, 4=left, 5=down-left, 6=down, 7=down-right
                if (eatdir2 == 0) { hspeed2 = spfright; vspeed2 = 0; eatdir2 = -1; }
                if (eatdir2 == 1) { hspeed2 = spfright; vspeed2 = -spfright; eatdir2 = -1; }
                if (eatdir2 == 2) { hspeed2 = 0; vspeed2 = -spfright; eatdir2 = -1; }
                if (eatdir2 == 3) { hspeed2 = -spfright; vspeed2 = -spfright; eatdir2 = -1; }
                if (eatdir2 == 4) { hspeed2 = -spfright; vspeed2 = 0; eatdir2 = -1; }
                if (eatdir2 == 5) { hspeed2 = -spfright; vspeed2 = spfright; eatdir2 = -1; }
                if (eatdir2 == 6) { hspeed2 = 0; vspeed2 = spfright; eatdir2 = -1; }
                if (eatdir2 == 7) { hspeed2 = spfright; vspeed2 = spfright; eatdir2 = -1; }
                stoppy2 = 0;  // Clear suspension flag
            } else {
                pause2 = pause2 - 1;  // Decrement pause timer
            }
        }
        // ===== NORMAL MODE SPEED RESTORATION =====
        else {
            /// Restore speed when pause timer expires
            if (pause2 == 0) {
                /// Restore speed based on eating direction (8-way)
                if (eatdir2 == 0) { hspeed2 = sp; vspeed2 = 0; eatdir2 = -1; }
                if (eatdir2 == 1) { hspeed2 = sp; vspeed2 = -sp; eatdir2 = -1; }
                if (eatdir2 == 2) { hspeed2 = 0; vspeed2 = -sp; eatdir2 = -1; }
                if (eatdir2 == 3) { hspeed2 = -sp; vspeed2 = -sp; eatdir2 = -1; }
                if (eatdir2 == 4) { hspeed2 = -sp; vspeed2 = 0; eatdir2 = -1; }
                if (eatdir2 == 5) { hspeed2 = -sp; vspeed2 = sp; eatdir2 = -1; }
                if (eatdir2 == 6) { hspeed2 = 0; vspeed2 = sp; eatdir2 = -1; }
                if (eatdir2 == 7) { hspeed2 = sp; vspeed2 = sp; eatdir2 = -1; }
                stoppy2 = 0;  // Clear suspension flag
            } else {
                pause2 = pause2 - 1;  // Decrement pause timer
            }
        }
    }
    
    // ===== DIRECTION OFFSET VARIABLES =====
    /// Update direction offset for rendering/animation
    /// These offsets are used for visual effects
    if (dir2 == 0) { xdir2 = 32; ydir2 = 0; }      // Right
    if (dir2 == 1) { xdir2 = -32; ydir2 = -32; }  // Up
    if (dir2 == 2) { xdir2 = -32; ydir2 = 0; }    // Left
    if (dir2 == 3) { xdir2 = 0; ydir2 = 32; }     // Down
    
    // ===== HIGH SCORE TRACKING =====
    /// Update high scores for all game variants and modes
    /// Only track when random mode is disabled
    if (global.rand == 0) {
        // ===== STANDARD PACMAN VARIANTS =====
        if (global.game == 0 && global.plus == 0 && global.mode == 0) {
            if (global.p2score > global.pacscore) { global.pacscore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 1 && global.mode == 0) {
            if (global.p2score > global.pacplusscore) { global.pacplusscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 0 && global.mode == 0) {
            if (global.p2score > global.mspacscore) { global.mspacscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 1 && global.mode == 0) {
            if (global.p2score > global.mspacplusscore) { global.mspacplusscore = global.p2score; }
        }
        
        // ===== HANGLY MODE =====
        if (global.game == 0 && global.plus == 0 && global.mode == 1) {
            if (global.p2score > global.hanglyscore) { global.hanglyscore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 1 && global.mode == 1) {
            if (global.p2score > global.hanglyplusscore) { global.hanglyplusscore = global.p2score; }
        }
        
        // ===== NEW MODE =====
        if (global.game == 0 && global.plus == 0 && global.mode == 2) {
            if (global.p2score > global.newscore) { global.newscore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 1 && global.mode == 2) {
            if (global.p2score > global.newplusscore) { global.newplusscore = global.p2score; }
        }
        
        // ===== ULTRA MODE =====
        if (global.game == 0 && global.plus == 0 && global.mode == 3) {
            if (global.p2score > global.ultrascore) { global.ultrascore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 1 && global.mode == 3) {
            if (global.p2score > global.ultraplusscore) { global.ultraplusscore = global.p2score; }
        }
        
        // ===== MS. PACMAN VARIANTS =====
        if (global.game == 1 && global.plus == 0 && global.mode == 1) {
            if (global.p2score > global.mspmpscore) { global.mspmpscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 1 && global.mode == 1) {
            if (global.p2score > global.mspmpplusscore) { global.mspmpplusscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 0 && global.mode == 2) {
            if (global.p2score > global.pacjrscore) { global.pacjrscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 1 && global.mode == 2) {
            if (global.p2score > global.pacjrplusscore) { global.pacjrplusscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 0 && global.mode == 3) {
            if (global.p2score > global.strangescore) { global.strangescore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 1 && global.mode == 3) {
            if (global.p2score > global.strangeplusscore) { global.strangeplusscore = global.p2score; }
        }
        
        // ===== JR. PACMAN VARIANTS =====
        if (global.game == 2 && global.plus == 0 && global.mode == 0) {
            if (global.p2score > global.jrpacscore) { global.jrpacscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 0 && global.mode == 1) {
            if (global.p2score > global.extendedscore) { global.extendedscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 0 && global.mode == 2) {
            if (global.p2score > global.c64score) { global.c64score = global.p2score; }
        }
        if (global.game == 2 && global.plus == 0 && global.mode == 3) {
            if (global.p2score > global.a2600score) { global.a2600score = global.p2score; }
        }
        if (global.game == 2 && global.plus == 1 && global.mode == 0) {
            if (global.p2score > global.jrpacplusscore) { global.jrpacplusscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 1 && global.mode == 1) {
            if (global.p2score > global.extendedplusscore) { global.extendedplusscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 1 && global.mode == 2) {
            if (global.p2score > global.c64plusscore) { global.c64plusscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 1 && global.mode == 3) {
            if (global.p2score > global.a2600plusscore) { global.a2600plusscore = global.p2score; }
        }
        
        // ===== CHAMPION MODE =====
        if (global.game == 1 && global.plus == 0 && global.mode == 4) {
            if (global.p2score > global.champscore) { global.champscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 1 && global.mode == 4) {
            if (global.p2score > global.champplusscore) { global.champplusscore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 0 && global.mode == 4) {
            if (global.p2score > global.arrscore) { global.arrscore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 1 && global.mode == 4) {
            if (global.p2score > global.arrplusscore) { global.arrplusscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 0 && global.mode == 4) {
            if (global.p2score > global.bleachscore) { global.bleachscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 1 && global.mode == 4) {
            if (global.p2score > global.bleachplusscore) { global.bleachplusscore = global.p2score; }
        }
    }
    
    // ===== RANDOM MODE HIGH SCORES =====
    /// Track high scores for random mode variants
    if (global.rand == 1) {
        if (global.game == 0 && global.plus == 0) {
            if (global.p2score > global.pacrandscore) { global.pacrandscore = global.p2score; }
        }
        if (global.game == 0 && global.plus == 1) {
            if (global.p2score > global.pacplusrandscore) { global.pacplusrandscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 0) {
            if (global.p2score > global.mspacrandscore) { global.mspacrandscore = global.p2score; }
        }
        if (global.game == 1 && global.plus == 1) {
            if (global.p2score > global.mspacplusrandscore) { global.mspacplusrandscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 0) {
            if (global.p2score > global.jrpacrandscore) { global.jrpacrandscore = global.p2score; }
        }
        if (global.game == 2 && global.plus == 1) {
            if (global.p2score > global.jrpacplusrandscore) { global.jrpacplusrandscore = global.p2score; }
        }
    }
    
    // ===== EXTRA LIFE AWARD =====
    /// Award extra life when score reaches 10,000 points
    /// Only awards once per game (extralife2 flag prevents multiple awards)
    if (global.extralife2 == 1 && global.p2score > 9999) {
        global.extralife2 = 0;  // Prevent multiple awards
        global.p2lives = global.p2lives + 1;  // Add extra life
        sound_play(Life);  // Play extra life sound effect
    }
}
