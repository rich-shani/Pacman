/// ===============================================================================
/// KEYPRESS_13 (ENTER KEY) - ADD CREDIT & CONTINUE GAME
/// ===============================================================================
/// Purpose: Allow player to add credit/coin to continue playing after life loss
/// Called: When Enter/Return key is pressed
///
/// Triggers:
/// - Only active if level exists, game not over, and Pac.countdown  not finished
/// - Requires available credit to continue
/// - Restores lives to dead player and resumes gameplay
/// ===============================================================================

/// Check if a player is out of lives and game can still continue
if (((global.p1lives == 0 && global.p1gameover == 0) ||
     (global.p2lives == 0 && global.p2gameover == 0)) &&
    global.lvl > 0 && Pac.countdown  > -1) {

    /// Check if player has credits available
    if (global.credit > 0) {
        /// Restore lives for dead players
        if (global.p1lives == 0 && global.p1gameover == 0) {
            global.p1lives = 4;
            global.p1score = 0;
        }
        if (global.p2lives == 0 && global.p2gameover == 0) {
            global.p2lives = 4;
            global.p2score = 0;
        }

        /// Deduct credit and trigger life recovery
        alarm[11] = 1;
        global.credit = global.credit - 1;
        Pac.countdown  = 10;

        /// Reset Player 2 state
        hspeed2 = 0;
        vspeed2 = 0;
        dir = PAC_DIRECTION.LEFT;
        dir2 = PAC_DIRECTION.RIGHT;
        newtile = 0;
        newtile2 = 0;
        bonked = 0;
        bonked2 = 0;

        /// Reposition players based on player count
        if (global.players > 0 && global.players < 3 && global.p1lives > 0 && global.p2lives > 0) {
            /// Both players alive: position apart
            x = xstart - 16;
            y = ystart;
            x2 = xstart + 16;
            y2 = ystart;
        } else {
            /// Single player or one dead
            if (global.p1lives > 0) {
                x = xstart;
                y = ystart;
                x2 = -5000;
                y2 = ystart;
            } else {
                x2 = xstart;
                y2 = ystart;
                x = -5000;
                y = ystart;
            }
        }

        /// Reset Pac.blink animation and pause handler
        Pac.blink = 0;
        alarm[8] = 14;
        Pauser.ignore = 1;
    } else {
        /// No credits - trigger game over
        alarm[11] = 1;
    }
}


