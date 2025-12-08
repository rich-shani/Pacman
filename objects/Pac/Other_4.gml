/// ===============================================================================
/// OTHER_4 - ROOM INITIALIZATION ON ENTRY
/// ===============================================================================
/// Purpose: Initialize all Pac variables and ghost configurations when entering a room/level
/// Called: Room Start event (once per level)
///
/// Major Sections:
/// 1. Level Progression & Dot Totals
/// 2. Player Positioning (Single vs Two-Player)
/// 3. Speed Configuration (Level & Game Variant)
/// 4. Fright Mode Timing Tables
/// 5. Ghost Release & Cycle Timings
/// 6. Animation & State Initialization
/// 7. Game Mode & Visibility Handling
/// ===============================================================================

/// ===============================================================================
/// SECTION 1: LEVEL PROGRESSION & DOT TOTALS
/// ===============================================================================
/// Increment level number if player(s) still have lives
if (global.p1lives > 0 || global.p2lives > 0) {
    global.lvl = global.lvl + 1;
}

/// Calculate total dots/pellets in this level for completion detection
/// For non-extended mazes (Standard/Ms.Pac below 672px height) and Jr.Pac specific sizes,
/// count actual dots. Otherwise use predefined totals
if ((global.game < 2 && room_height < 672 && collision_point(208, 528, Wall, false, true)) ||
    (global.game == 2 && ((room_width == 864 || room_width == 496) && room_height == 576))) {
    global.dottotal = (instance_number(Dot) + instance_number(Power));
} else {
    /// Use predefined dot counts for extended mazes
    if (global.game < 2) {
        /// Standard Pac-Man and Ms. Pac-Man
        global.dottotal = 244;
        dotcount = 244 - (instance_number(Dot) + instance_number(Power));
    } else {
        /// Jr. Pac-Man (more dots in extended maze)
        global.dottotal = 554;
        dotcount = 554 - (instance_number(Dot) + instance_number(Power));
    }
}

/// ===============================================================================
/// SECTION 2: PLAYER POSITIONING (SINGLE VS TWO-PLAYER)
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
/// SECTION 3: ANIMATION & STATE INITIALIZATION
/// ===============================================================================
/// Countdown timer for level intro pause
countdown = 10;

/// Reset last player indicator
global.last = 0;

/// Create pause manager instance
instance_create(0, 0, Pauser);

/// Reset corner transition state
cornercheck = 0;

/// Initialize blink animation (for level transition effects)
blink = 0;
alarm[8] = 14;

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

/// Level completion flag
finish = 0;

/// Siren level (for ghost vulnerability sound effects)
siren = 0;

/// Ambient sound state
ambience = 0;

/// Plus mode eating state
pluseat = 0;

/// Stop flag for collisions
stoppy = 0;

/// ===============================================================================
/// SECTION 4: SPEED CONFIGURATION (LEVEL & GAME VARIANT)
/// ===============================================================================

/// PLUS MODE SPEEDS (Ms. Pac-Man Plus / Jr. Pac-Man)
if (global.plus == PAC_PLUS_MODE.ACTIVE) {
    /// Base speeds for Plus mode
    sp = 2.5;
    spfright = 2.5;

    /// Speed adjustment for higher levels
    if (global.game < 2 && global.lvl > 15) {
        sp = 2.25;
        spfright = 2.375;
    }
    if (global.game == 2 && global.lvl > 12) {
        sp = 2.25;
        spfright = 2.375;
    }
} else {
    /// STANDARD MODE SPEEDS (Pac-Man / Ms. Pac-Man)
    if (global.game < 2) {
        /// Standard and Ms. Pac-Man in normal mode
        sp = 2.00001;
        spfright = 2.25;

        /// Level-based speed increases
        if (global.lvl > 1) {
            sp = 2.25;
            spfright = 2.375;
        }
        if (global.lvl > 4) {
            sp = 2.5;
            spfright = 2.5;
        }
        if (global.lvl > 20) {
            /// Speed reduction in later levels
            sp = 2.25;
            spfright = 2.375;
        }
    } else {
        /// Jr. Pac-Man standard mode
        sp = 2.25;
        spfright = 2.375;

        if (global.lvl > 2) {
            sp = 2.5;
            spfright = 2.5;
        }
        if (global.lvl > 15) {
            sp = 2.25;
            spfright = 2.375;
        }
    }
}

/// BOOST MODE OVERRIDE (temporary speed enhancement)
if (global.boost > 0) {
    sp = 4;
    spfright = 4;
}

/// ===============================================================================
/// SECTION 5: FRIGHT MODE TIMING TABLES
/// ===============================================================================
/// Initialize fright mode disabled
fright = PAC_FRIGHT.OFF;

/// STANDARD AND MS. PAC-MAN FRIGHT TIMINGS (global.plus = 0)
if (global.plus == PAC_PLUS_MODE.INACTIVE) {
    if (global.game < 2) {
        /// Standard / Ms. Pac-Man - Base fright duration = 360 frames (6 seconds)
        frighttime = 360;

        /// Level-specific adjustments
        if (global.lvl == 2) frighttime = 300;
        if (global.lvl == 3) frighttime = 240;
        if (global.lvl == 4) frighttime = 180;
        if (global.lvl == 5) frighttime = 120;
        if (global.lvl == 6) frighttime = 300;
        if (global.lvl == 7) frighttime = 120;
        if (global.lvl == 8) frighttime = 120;
        if (global.lvl == 9) frighttime = 60;
        if (global.lvl == 10) frighttime = 300;
        if (global.lvl == 11) frighttime = 120;
        if (global.lvl == 12) frighttime = 60;
        if (global.lvl == 13) frighttime = 60;
        if (global.lvl == 14) frighttime = 180;
        if (global.lvl == 15) frighttime = 60;
        if (global.lvl == 16) frighttime = 60;
        if (global.lvl == 17) frighttime = 0;     /// Ghosts no longer frightened
        if (global.lvl == 18) frighttime = 60;
        if (global.lvl > 18) frighttime = 0;
    } else {
        /// Jr. Pac-Man - Base fright duration = 360 frames
        frighttime = 360;

        /// Level-specific adjustments
        if (global.lvl == 2) frighttime = 180;
        if (global.lvl == 3) frighttime = 120;
        if (global.lvl == 4) frighttime = 120;
        if (global.lvl == 5) frighttime = 120;
        if (global.lvl == 6) frighttime = 60;
        if (global.lvl == 7) frighttime = 60;
        if (global.lvl == 8) frighttime = 120;
        if (global.lvl == 9) frighttime = 60;
        if (global.lvl == 10) frighttime = 60;
        if (global.lvl == 11) frighttime = 60;
        if (global.lvl == 12) frighttime = 60;
        if (global.lvl == 13) frighttime = 60;
        if (global.lvl == 14) frighttime = 0;
        if (global.lvl == 15) frighttime = 60;
        if (global.lvl > 15) frighttime = 0;
    }
}

/// PLUS MODE FRIGHT TIMINGS (global.plus = 1)
if (global.plus == PAC_PLUS_MODE.ACTIVE) {
    if (global.game < 2) {
        /// Ms. Pac-Man Plus - Base fright = 240, bonus = 360
        frighttime = 240;
        bonustime = 360;

        /// Level-specific adjustments
        if (global.lvl == 2) { frighttime = 180; bonustime = 360; }
        if (global.lvl == 3) { frighttime = 120; bonustime = 300; }
        if (global.lvl == 4) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 5) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 6) { frighttime = 240; bonustime = 300; }
        if (global.lvl == 7) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 8) { frighttime = 60; bonustime = 180; }
        if (global.lvl == 9) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 10) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 11) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 12) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 13) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 14) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 15) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 16) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 17) { frighttime = 0; bonustime = 120; }
        if (global.lvl == 18) { frighttime = 120; bonustime = 120; }
        if (global.lvl == 19) { frighttime = 0; bonustime = 60; }
        if (global.lvl > 19) { frighttime = 0; bonustime = 0; }
    } else {
        /// Jr. Pac-Man Plus - Base fright = 240, bonus = 360
        frighttime = 240;
        bonustime = 360;

        /// Level-specific adjustments
        if (global.lvl == 2) { frighttime = 120; bonustime = 240; }
        if (global.lvl == 3) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 4) { frighttime = 120; bonustime = 180; }
        if (global.lvl == 5) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 6) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 7) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 8) { frighttime = 0; bonustime = 60; }
        if (global.lvl == 9) { frighttime = 0; bonustime = 60; }
        if (global.lvl == 10) { frighttime = 60; bonustime = 120; }
        if (global.lvl == 11) { frighttime = 60; bonustime = 60; }
        if (global.lvl == 12) { frighttime = 0; bonustime = 60; }
        if (global.lvl > 12) { frighttime = 0; bonustime = 0; }
    }
}

/// ===============================================================================
/// SECTION 6: DOT COLLECTION & GAME STATE
/// ===============================================================================
/// Animation frame counters
im = 0;     /// Image index for Player 1
im2 = 0;    /// Image index for Player 2

/// Dot collection state
dot = 0;
offset = 0;

/// Pause state
pause = 0;

/// Chomp sound counter
chomp = 0;

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

/// ===============================================================================
/// SECTION 7: GHOST RELEASE & MOVEMENT INITIALIZATION
/// ===============================================================================
/// Chomp counter for ghost eating tracking
chompcount = 0;

/// Direction tracking for movement
xdir = -32;
ydir = 0;

/// Ghost release signatures (used by alarm[10] for ghost exit timing)
psig = 244;    /// Pinky release signature
isig = 244;    /// Inky release signature
csig = 244;    /// Clyde release signature

/// Direction change timer
timerstart = 240;
timer = timerstart;

/// Initial movement (LEFT at normal speed)
hspeed = -sp;
vspeed = 0;

/// Scatter/Chase mode cycle tracking (0-7, resets at 8)
cycle = 0;

/// Start in scatter mode
scatter = 1;

/// ===============================================================================
/// SECTION 8: SCATTER/CHASE TIMING CONFIGURATION
/// ===============================================================================
/// Timing values vary by game variant and level

if (global.game < 2) {
    /// STANDARD PAC-MAN & MS. PAC-MAN (game < 2)
    scatter1 = 7;
    chase1 = 20;
    scatter2 = 7;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 20;
    scatter4 = 5;

    /// Level 2+ adjustments: Longer chase phase
    if (global.lvl > 1) {
        scatter1 = 7;
        chase1 = 20;
        scatter2 = 7;
        chase2 = 20;
        scatter3 = 5;
        chase3 = 1033;  /// Effectively infinite
        scatter4 = 1 / 60;
    }

    /// Level 5+ or Plus Mode: Shorter scatter phases
    if (global.lvl > 4 || global.plus == PAC_PLUS_MODE.ACTIVE) {
        scatter1 = 5;
        chase1 = 20;
        scatter2 = 5;
        chase2 = 20;
        scatter3 = 5;
        chase3 = 1037;  /// Effectively infinite
        scatter4 = 1 / 60;
    }
} else {
    /// JR. PAC-MAN (game == 2)
    scatter1 = 7;
    chase1 = 20;
    scatter2 = 7;
    chase2 = 20;
    scatter3 = 5;
    chase3 = 1033;  /// Effectively infinite from start
    scatter4 = 1 / 60;

    /// Level 3+ or Plus Mode: Shorter scatter phases
    if (global.lvl > 2 || global.plus == PAC_PLUS_MODE.ACTIVE) {
        scatter1 = 5;
        chase1 = 20;
        scatter2 = 5;
        chase2 = 20;
        scatter3 = 5;
        chase3 = 1037;  /// Effectively infinite
        scatter4 = 1 / 60;
    }
}

/// ===============================================================================
/// SECTION 9: TILE & DEATH STATE INITIALIZATION
/// ===============================================================================
test = 0;

/// Tile-based position tracking (16x16 grid alignment)
newtile = 0;
tilex = 16 * (round(x / 16));
tiley = 16 * (round(y / 16));

/// Death state tracking
dead = PAC_STATE.ALIVE;
deadanim = 0;

/// Plus mode active state
plus = -1;
plus2 = 0;

/// ===============================================================================
/// SECTION 10: GAME MODE VISIBILITY HANDLING
/// ===============================================================================
/// Atari 2600 mode visibility (tall room 960px = 2600 version)
if (room_height == 960) {
    if (global.lvl > 0) {
        if (room == A2600_4) {
            /// Keep visible in A2600_4 room
        } else {
            /// In other 2600 rooms, hide Pac until level starts
            if (start == 1) {
                visible = false;
            } else {
                visible = true;
            }
        }
    }
}

/// Commodore 64 mode visibility (when c64 filter is active)
if (global.lvl > 0) {
    if (Drawless.c64 == 1) {
        /// Hide Pac during startup countdown, show during play
        if (start == 1) {
            visible = false;
        } else {
            visible = true;
        }
    }
}
