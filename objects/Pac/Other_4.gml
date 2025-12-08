/// ===============================================================================
/// PAC OBJECT - ROOM INITIALIZATION (PLAYER-SPECIFIC)
/// ===============================================================================
/// Purpose: Initialize Pacman character variables when entering a room/level
/// Called: Room Start event (once per level)
///
/// Note: Game-wide state management (level progression, speed configuration,
/// fright timings, ghost AI cycles, etc.) is now handled by oGameManager
///
/// This event only handles Pacman character-specific initialization
/// ===============================================================================

/// ===============================================================================
/// SECTION 1: PLAYER POSITIONING (SINGLE VS TWO-PLAYER)
/// ===============================================================================
/// In two-player mode with both players alive, position them apart
if (global.players > 0 && global.players < 3 && global.p1lives > 0 && global.p2lives > 0) {
    /// Both players alive: position Player 1 left, Player 2 right
    x = xstart - 16;
    y = ystart;

    x2 = xstart + 16;
    y2 = ystart;
} else {
    /// Single player or one player dead
    if (global.p1lives > 0 || global.lvl == 0) {
        /// Player 1 takes center, Player 2 off-screen
        x = xstart;
        y = ystart;
        x2 = -5000;
        y2 = ystart;
    } else {
        /// Player 1 dead, Player 2 takes center
        x2 = xstart;
        y2 = ystart;
        x = -5000;
        y = ystart;
    }
}

/// ===============================================================================
/// SECTION 2: ANIMATION & STATE INITIALIZATION
/// ===============================================================================
/// Reset last player indicator
global.last = 0;

/// Create pause manager instance
instance_create(0, 0, Pauser);

/// Reset corner transition state
cornercheck = 0;

/// Animation scaling
scale = 1;
scaleup = 1;

/// Initial direction (LEFT = 2)
dir = PAC_DIRECTION.LEFT;

/// Park position tracking
park = -1;

/// Eating animation direction
eatdir = -1;

/// Corner state (0 = no corner transition)
corner = 0;

/// Game start flag
started = 0;

/// Stop flag for collisions
stoppy = 0;

/// ===============================================================================
/// SECTION 3: ANIMATION FRAME INITIALIZATION
/// ===============================================================================
/// Animation frame counters
im = 0;     /// Image index for Player 1
im2 = 0;    /// Image index for Player 2

/// Pause state
pause = 0;

/// Chomp sound counter
chomp = 0;

/// ===============================================================================
/// SECTION 4: MOVEMENT INITIALIZATION
/// ===============================================================================
/// Direction tracking for movement
xdir = -32;
ydir = 0;

/// Initial movement (LEFT at normal speed)
/// Note: Speed values (oGameManager.sp, spfright) are managed by oGameManager
hspeed = -oGameManager.sp;
vspeed = 0;

/// ===============================================================================
/// SECTION 5: TILE & DEATH STATE INITIALIZATION
/// ===============================================================================
test = 0;

/// Tile-based position tracking (16x16 grid alignment)
newtile = 0;
tilex = 16 * (round(x / 16));
tiley = 16 * (round(y / 16));

/// Death state tracking
dead = PAC_STATE.ALIVE;
deadanim = 0;

/// Start delay flag
start = 1;

/// Set up level initialization timing
alarm[10] = 90;

/// Play game start sound and setup timing based on game variant
if (global.start == true) {
    alarm[9] = 120;

    /// Play appropriate start sound for game variant
    if (global.game == 0) {
        sound_play(Start);
        alarm[10] = 250;
    }
    if (global.game == 1) {
        sound_play(MsStart);
        alarm[10] = 250;
    }
    if (global.game == 2) {
        sound_play(JrStart);
        alarm[10] = 275;
    }

    global.start = false;
}
