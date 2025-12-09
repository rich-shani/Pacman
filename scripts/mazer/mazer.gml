/// ===============================================================================
/// mazer() - SELECT MAZE BASED ON GAME MODE AND LEVEL
/// ===============================================================================
/// Purpose: Navigate to the appropriate room/maze based on game variant, mode, and level
/// Called: When starting a new level or transitioning between levels
///
/// Algorithm:
/// This function selects the correct maze/room based on:
/// - global.game: 0=Pac-Man, 1=Ms. Pac-Man, 2=Jr. Pac-Man
/// - global.mode: Game mode variant (0=standard, 1-4=special modes)
/// - global.lvl: Current level number
///
/// Responsibilities:
/// 1. Select room for Jr. Pac-Man variants
/// 2. Select room for standard Pac-Man variants
/// 3. Select room for Ms. Pac-Man variants
/// 4. Handle level looping and special level sequences
/// ===============================================================================

function mazer() {
    // ===== STANDARD PACMAN (global.game == 0) =====
    if (global.game == 0) {
        /// Always use standard Pacman maze
        room_goto(PacMan);
    }
    
    // ===== MS. PACMAN (global.game == 1) =====
    if (global.game == 1) {
        /// Reset loop counter at level 21
        if (global.lvl == 21) {
            room_goto(MsPacMan3);
            global.loop = 0;
        } else {
            /// Handle levels beyond 21 with looping
            if (global.lvl > 21) {
                global.loopcount = global.loopcount + 1;
                if (global.loopcount == 8) {
                    global.loopcount = 0;
                    global.loop = global.loop + 1;
                    if (global.loop == 2) {
                        global.loop = 0;
                    }
                }
                /// Alternate between two mazes
                if (global.loopcount < 4) {
                    room_goto(MsPacMan3);
                } else {
                    room_goto(MsPacMan4);
                }
            } else {
                /// Standard level progression
                if (global.lvl < 2) { room_goto(MsPacMan1); }
                if (global.lvl > 1 && global.lvl < 5) { room_goto(MsPacMan2); }
                if (global.lvl > 4 && global.lvl < 9) { room_goto(MsPacMan3); }
                if (global.lvl > 8 && global.lvl < 13) { room_goto(MsPacMan4); }
                if (global.lvl > 12 && global.lvl < 17) { room_goto(MsPacMan3); }
                if (global.lvl > 16 && global.lvl < 22) { room_goto(MsPacMan4); }
            }
        }
    }
}
